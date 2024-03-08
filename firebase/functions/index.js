const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const kFcmTokensCollection = "fcm_tokens";
const kPushNotificationsCollection = "ff_push_notifications";
const kUserPushNotificationsCollection = "ff_user_push_notifications";
const firestore = admin.firestore();

const kPushNotificationRuntimeOpts = {
  timeoutSeconds: 540,
  memory: "2GB",
};

exports.addFcmToken = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return "Failed: Unauthenticated calls are not allowed.";
  }
  const userDocPath = data.userDocPath;
  const fcmToken = data.fcmToken;
  const deviceType = data.deviceType;
  if (
    typeof userDocPath === "undefined" ||
    typeof fcmToken === "undefined" ||
    typeof deviceType === "undefined" ||
    userDocPath.split("/").length <= 1 ||
    fcmToken.length === 0 ||
    deviceType.length === 0
  ) {
    return "Invalid arguments encoutered when adding FCM token.";
  }
  if (context.auth.uid != userDocPath.split("/")[1]) {
    return "Failed: Authenticated user doesn't match user provided.";
  }
  const existingTokens = await firestore
    .collectionGroup(kFcmTokensCollection)
    .where("fcm_token", "==", fcmToken)
    .get();
  var userAlreadyHasToken = false;
  for (var doc of existingTokens.docs) {
    const user = doc.ref.parent.parent;
    if (user.path != userDocPath) {
      // Should never have the same FCM token associated with multiple users.
      await doc.ref.delete();
    } else {
      userAlreadyHasToken = true;
    }
  }
  if (userAlreadyHasToken) {
    return "FCM token already exists for this user. Ignoring...";
  }
  await getUserFcmTokensCollection(userDocPath).doc().set({
    fcm_token: fcmToken,
    device_type: deviceType,
    created_at: admin.firestore.FieldValue.serverTimestamp(),
  });
  return "Successfully added FCM token!";
});

exports.sendPushNotificationsTrigger = functions
  .runWith(kPushNotificationRuntimeOpts)
  .firestore.document(`${kPushNotificationsCollection}/{id}`)
  .onCreate(async (snapshot, _) => {
    try {
      // Ignore scheduled push notifications on create
      const scheduledTime = snapshot.data().scheduled_time || "";
      if (scheduledTime) {
        return;
      }

      await sendPushNotifications(snapshot);
    } catch (e) {
      console.log(`Error: ${e}`);
      await snapshot.ref.update({ status: "failed", error: `${e}` });
    }
  });

exports.sendUserPushNotificationsTrigger = functions
  .runWith(kPushNotificationRuntimeOpts)
  .firestore.document(`${kUserPushNotificationsCollection}/{id}`)
  .onCreate(async (snapshot, _) => {
    try {
      // Ignore scheduled push notifications on create
      const scheduledTime = snapshot.data().scheduled_time || "";
      if (scheduledTime) {
        return;
      }

      // Don't let user-triggered notifications to be sent to all users.
      const userRefsStr = snapshot.data().user_refs || "";
      if (userRefsStr) {
        await sendPushNotifications(snapshot);
      }
    } catch (e) {
      console.log(`Error: ${e}`);
      await snapshot.ref.update({ status: "failed", error: `${e}` });
    }
  });

async function sendPushNotifications(snapshot) {
  const notificationData = snapshot.data();
  const title = notificationData.notification_title || "";
  const body = notificationData.notification_text || "";
  const imageUrl = notificationData.notification_image_url || "";
  const sound = notificationData.notification_sound || "";
  const parameterData = notificationData.parameter_data || "";
  const targetAudience = notificationData.target_audience || "";
  const initialPageName = notificationData.initial_page_name || "";
  const userRefsStr = notificationData.user_refs || "";
  const batchIndex = notificationData.batch_index || 0;
  const numBatches = notificationData.num_batches || 0;
  const status = notificationData.status || "";

  if (status !== "" && status !== "started") {
    console.log(`Already processed ${snapshot.ref.path}. Skipping...`);
    return;
  }

  if (title === "" || body === "") {
    await snapshot.ref.update({ status: "failed" });
    return;
  }

  const userRefs = userRefsStr === "" ? [] : userRefsStr.trim().split(",");
  var tokens = new Set();
  if (userRefsStr) {
    for (var userRef of userRefs) {
      const userTokens = await firestore
        .doc(userRef)
        .collection(kFcmTokensCollection)
        .get();
      userTokens.docs.forEach((token) => {
        if (typeof token.data().fcm_token !== undefined) {
          tokens.add(token.data().fcm_token);
        }
      });
    }
  } else {
    var userTokensQuery = firestore.collectionGroup(kFcmTokensCollection);
    // Handle batched push notifications by splitting tokens up by document
    // id.
    if (numBatches > 0) {
      userTokensQuery = userTokensQuery
        .orderBy(admin.firestore.FieldPath.documentId())
        .startAt(getDocIdBound(batchIndex, numBatches))
        .endBefore(getDocIdBound(batchIndex + 1, numBatches));
    }
    const userTokens = await userTokensQuery.get();
    userTokens.docs.forEach((token) => {
      const data = token.data();
      const audienceMatches =
        targetAudience === "All" || data.device_type === targetAudience;
      if (audienceMatches || typeof data.fcm_token !== undefined) {
        tokens.add(data.fcm_token);
      }
    });
  }

  const tokensArr = Array.from(tokens);
  var messageBatches = [];
  for (let i = 0; i < tokensArr.length; i += 500) {
    const tokensBatch = tokensArr.slice(i, Math.min(i + 500, tokensArr.length));
    const messages = {
      notification: {
        title,
        body,
        ...(imageUrl && { imageUrl: imageUrl }),
      },
      data: {
        initialPageName,
        parameterData,
      },
      android: {
        notification: {
          ...(sound && { sound: sound }),
        },
      },
      apns: {
        payload: {
          aps: {
            ...(sound && { sound: sound }),
          },
        },
      },
      tokens: tokensBatch,
    };
    messageBatches.push(messages);
  }

  var numSent = 0;
  await Promise.all(
    messageBatches.map(async (messages) => {
      const response = await admin.messaging().sendMulticast(messages);
      numSent += response.successCount;
    }),
  );

  await snapshot.ref.update({ status: "succeeded", num_sent: numSent });
}

function getUserFcmTokensCollection(userDocPath) {
  return firestore.doc(userDocPath).collection(kFcmTokensCollection);
}

function getDocIdBound(index, numBatches) {
  if (index <= 0) {
    return "users/(";
  }
  if (index >= numBatches) {
    return "users/}";
  }
  const numUidChars = 62;
  const twoCharOptions = Math.pow(numUidChars, 2);

  var twoCharIdx = (index * twoCharOptions) / numBatches;
  var firstCharIdx = Math.floor(twoCharIdx / numUidChars);
  var secondCharIdx = Math.floor(twoCharIdx % numUidChars);
  const firstChar = getCharForIndex(firstCharIdx);
  const secondChar = getCharForIndex(secondCharIdx);
  return "users/" + firstChar + secondChar;
}

function getCharForIndex(charIdx) {
  if (charIdx < 10) {
    return String.fromCharCode(charIdx + "0".charCodeAt(0));
  } else if (charIdx < 36) {
    return String.fromCharCode("A".charCodeAt(0) + charIdx - 10);
  } else {
    return String.fromCharCode("a".charCodeAt(0) + charIdx - 36);
  }
}
const stripeModule = require("stripe");

// Credentials
const kStripeProdSecretKey =
  "pk_live_51NgkX4DoYvl8GQAcOnROykzXTCFl5hYUaZgvlXH4ExdyH63rA0ArKxNAfdRfEMmbdgFwVrwWEzYDsRjYl4lEOgV100bK0wyPP4";
const kStripeTestSecretKey =
  "sk_test_51NgkX4DoYvl8GQAc9Zmyz2PR3t3uHcg4O35YjJkD3xILSk66qqjCnT8spURW7VJvRgU6C4VhYrH9FIFBFdXsnOvE00EKhdogCn";

const secretKey = (isProd) =>
  isProd ? kStripeProdSecretKey : kStripeTestSecretKey;

/**
 *
 */
exports.initStripePayment = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return "Unauthenticated calls are not allowed.";
  }
  return await initPayment(data, true);
});

/**
 *
 */
exports.initStripeTestPayment = functions.https.onCall(
  async (data, context) => {
    if (!context.auth) {
      return "Unauthenticated calls are not allowed.";
    }
    return await initPayment(data, false);
  },
);

async function initPayment(data, isProd) {
  try {
    const stripe = new stripeModule.Stripe(secretKey(isProd), {
      apiVersion: "2020-08-27",
    });

    const customers = await stripe.customers.list({
      email: data.email,
      limit: 1,
    });
    var customer = customers.data[0];
    if (!customer) {
      customer = await stripe.customers.create({
        email: data.email,
        ...(data.name && { name: data.name }),
      });
    }

    const ephemeralKey = await stripe.ephemeralKeys.create(
      { customer: customer.id },
      { apiVersion: "2020-08-27" },
    );
    const paymentIntent = await stripe.paymentIntents.create({
      amount: data.amount,
      currency: data.currency,
      customer: customer.id,
      ...(data.description && { description: data.description }),
    });

    return {
      paymentId: paymentIntent.id,
      paymentIntent: paymentIntent.client_secret,
      ephemeralKey: ephemeralKey.secret,
      customer: customer.id,
      success: true,
    };
  } catch (error) {
    console.log(`Error: ${error}`);
    return { success: false, error: userFacingMessage(error) };
  }
}

/**
 * Sanitize the error message for the user.
 */
function userFacingMessage(error) {
  return error.type
    ? error.message
    : "An error occurred, developers have been alerted";
}
const Mux = require("@mux/mux-node");

const kTokenId = "f149f447-a108-4f0b-bb60-a0d653f62678";
const kTokenSecret =
  "ZoGRihvFX0BKOrJq7fl7zCzeGm8gwddoROH2l4Q17wTQx9FXwEl9PAxHsCjxdUWtphg2lzD4W96";

const { Video } = new Mux(kTokenId, kTokenSecret);

exports.createLiveStream = functions.https.onCall(async (data, context) => {
  try {
    const response = await Video.LiveStreams.create({
      latency_mode: data.latency_mode || "standard",
      playback_policy: "public",
      new_asset_settings: { playback_policy: "public" },
    });
    return response;
  } catch (err) {
    console.error(
      `Unable to start the live stream ${context.auth.uid}. 
          Error ${err}`,
    );
    throw new functions.https.HttpsError(
      "aborted",
      "Could not create live stream",
    );
  }
});

exports.retrieveLiveStreams = functions.https.onCall(async (data, context) => {
  try {
    const liveStreams = await Video.LiveStreams.list();
    const responseList = liveStreams.map((liveStream) => ({
      id: liveStream.id,
      status: liveStream.status,
      playback_ids: liveStream.playback_ids,
      created_at: liveStream.created_at,
    }));
    return responseList;
  } catch (err) {
    console.error(
      `Unable to retrieve live streams. 
          Error ${err}`,
    );
    throw new functions.https.HttpsError(
      "aborted",
      "Could not retrieve live streams",
    );
  }
});

exports.retrieveLiveStream = functions.https.onCall(async (data, context) => {
  try {
    const liveStreamId = data.liveStreamId;
    const liveStream = await Video.LiveStreams.get(liveStreamId);
    return liveStream;
  } catch (err) {
    console.error(
      `Unable to retrieve live stream, id: ${data.liveStreamId}. 
          Error ${err}`,
    );
    throw new functions.https.HttpsError(
      "aborted",
      "Could not retrieve live stream",
    );
  }
});

exports.deleteLiveStream = functions.https.onCall(async (data, context) => {
  try {
    const liveStreamId = data.liveStreamId;
    const response = await Video.LiveStreams.del(liveStreamId);
    return response;
  } catch (err) {
    console.error(
      `Unable to delete live stream, id: ${data.liveStreamId}. 
        Error ${err}`,
    );
    throw new functions.https.HttpsError(
      "aborted",
      "Could not delete live stream",
    );
  }
});
const apiManager = require("./api_manager");
exports.ffPrivateApiCal = functions
  .runWith({ minInstances: 1, timeoutSeconds: 120 })
  .https.onCall(async (data, context) => {
    try {
      console.log(`Making API call for ${data["callName"]}`);
      var response = await apiManager.makeApiCall(context, data);
      console.log(`Done making API Call! Status: ${response.statusCode}`);
      return response;
    } catch (err) {
      console.error(`Error performing API call: ${err}`);
      return {
        statusCode: 400,
        error: `${err}`,
      };
    }
  });
exports.onUserDeleted = functions.auth.user().onDelete(async (user) => {
  let firestore = admin.firestore();
  let userRef = firestore.doc("users/" + user.uid);
  await firestore.collection("users").doc(user.uid).delete();
});
