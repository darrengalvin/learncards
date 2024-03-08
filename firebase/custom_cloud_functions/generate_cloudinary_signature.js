const functions = require("firebase-functions");
const crypto = require("crypto");

exports.generateCloudinarySignature = functions.https.onCall(
  (data, context) => {
    // Ensure that you check for user authentication if needed.
    // For example, you might want to only allow authenticated users to generate a signature:
    // if (!context.auth) {
    //   throw new functions.https.HttpsError('failed-precondition', 'The function must be called while authenticated.');
    // }

    // Your Cloudinary API Secret - store this in environment variables or in Firebase config
    const apiSecret = "your-cloudinary-api-secret"; // Replace with your actual API secret

    // Parameters sent from the client
    const { timestamp, eager, public_id } = data;

    // Generate the signature using the parameters provided
    let signatureString = `timestamp=${timestamp}&eager=${eager}&public_id=${public_id}${apiSecret}`;
    // If there are more parameters, you would concatenate them in alphabetical order

    // Create the SHA-1 hash of the string
    const signature = crypto
      .createHash("sha1")
      .update(signatureString)
      .digest("hex");

    return { signature };
  },
);
