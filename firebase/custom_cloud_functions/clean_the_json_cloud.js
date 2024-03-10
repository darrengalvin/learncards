const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.cleanTheJsonCloud = functions.https.onCall((data, context) => {
  // Extracting request data
  const request = data.request;

  // Check if the payload is wrapped in 'text'
  if (request.hasOwnProperty("text")) {
    // Extract the JSON string from the 'text' field
    let jsonString = request.text.trim();

    // Clean up the JSON string (remove markdown code block syntax if present)
    jsonString = jsonString.replace(/^```json\n/, "").replace(/\n```$/, "");

    try {
      // Parse the JSON string
      const jsonObject = JSON.parse(jsonString);

      // Log the cleaned JSON
      console.log("Cleaned JSON:", jsonObject);

      // Return the cleaned JSON object
      return jsonObject;
    } catch (error) {
      console.error("Error processing JSON:", error);
      throw new functions.https.HttpsError(
        "invalid-argument",
        "Error processing JSON",
      );
    }
  } else {
    console.log("Payload is not wrapped in 'text'");
    throw new functions.https.HttpsError(
      "invalid-argument",
      'Payload is not wrapped in "text"',
    );
  }
});
