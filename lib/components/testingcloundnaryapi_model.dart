import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'testingcloundnaryapi_widget.dart' show TestingcloundnaryapiWidget;
import 'package:flutter/material.dart';

class TestingcloundnaryapiModel
    extends FlutterFlowModel<TestingcloundnaryapiWidget> {
  ///  Local state fields for this component.

  List<dynamic> jsonResponse = [];
  void addToJsonResponse(dynamic item) => jsonResponse.add(item);
  void removeFromJsonResponse(dynamic item) => jsonResponse.remove(item);
  void removeAtIndexFromJsonResponse(int index) => jsonResponse.removeAt(index);
  void insertAtIndexInJsonResponse(int index, dynamic item) =>
      jsonResponse.insert(index, item);
  void updateJsonResponseAtIndex(int index, Function(dynamic) updateFn) =>
      jsonResponse[index] = updateFn(jsonResponse[index]);

  List<String> transcriptList = [''];
  void addToTranscriptList(String item) => transcriptList.add(item);
  void removeFromTranscriptList(String item) => transcriptList.remove(item);
  void removeAtIndexFromTranscriptList(int index) =>
      transcriptList.removeAt(index);
  void insertAtIndexInTranscriptList(int index, String item) =>
      transcriptList.insert(index, item);
  void updateTranscriptListAtIndex(int index, Function(String) updateFn) =>
      transcriptList[index] = updateFn(transcriptList[index]);

  String transcript = '';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Cloudinary Get Signature )] action in Button widget.
  ApiCallResponse? sign;
  // Stores action output result for [Backend Call - API (Cloudinary Transcribe)] action in Button widget.
  ApiCallResponse? transcribe;
  // Stores action output result for [Backend Call - API (Cloudinary attempt asset )] action in Button widget.
  ApiCallResponse? attemptAsset;
  // Stores action output result for [Backend Call - API (Cloudinary Get Transcription)] action in Button widget.
  ApiCallResponse? getTranscription;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
