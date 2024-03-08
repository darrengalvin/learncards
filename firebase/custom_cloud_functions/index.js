const admin = require("firebase-admin/app");
admin.initializeApp();

const generateCloudinarySignature = require("./generate_cloudinary_signature.js");
exports.generateCloudinarySignature =
  generateCloudinarySignature.generateCloudinarySignature;
const cleanTheJsonCloud = require("./clean_the_json_cloud.js");
exports.cleanTheJsonCloud = cleanTheJsonCloud.cleanTheJsonCloud;
