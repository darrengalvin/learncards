import '/backend/schema/structs/index.dart';

class GenerateCloudinarySignatureCloudFunctionCallResponse {
  GenerateCloudinarySignatureCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}

class CleanTheJsonCloudCloudFunctionCallResponse {
  CleanTheJsonCloudCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
    this.resultAsString,
    this.data,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
  String? resultAsString;
  dynamic data;
}
