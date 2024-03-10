import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'social_feed_new_componant_widget.dart'
    show SocialFeedNewComponantWidget;
import 'package:flutter/material.dart';

class SocialFeedNewComponantModel
    extends FlutterFlowModel<SocialFeedNewComponantWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for socialPostText widget.
  FocusNode? socialPostTextFocusNode;
  TextEditingController? socialPostTextController;
  String? Function(BuildContext, String?)? socialPostTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in socialPostPost widget.
  SocialpostsRecord? createdpost1;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for clouDinary widget.
  FocusNode? clouDinaryFocusNode;
  TextEditingController? clouDinaryController;
  String? Function(BuildContext, String?)? clouDinaryControllerValidator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for Comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentController;
  String? Function(BuildContext, String?)? commentControllerValidator;
  // Stores action output result for [Backend Call - API (New GetLiveStreamID)] action in Card widget.
  ApiCallResponse? nEWliveStreamIdResult;
  // Stores action output result for [Backend Call - API (New GetPastLiveStream)] action in Card widget.
  ApiCallResponse? nEWpastLiveStreamResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    socialPostTextFocusNode?.dispose();
    socialPostTextController?.dispose();

    clouDinaryFocusNode?.dispose();
    clouDinaryController?.dispose();

    commentFocusNode?.dispose();
    commentController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
