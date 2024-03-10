import '/backend/backend.dart';
import '/components/no_access_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'social_widget.dart' show SocialWidget;
import 'package:flutter/material.dart';

class SocialModel extends FlutterFlowModel<SocialWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for NoAccess component.
  late NoAccessModel noAccessModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SocialpostsRecord? createdpost;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    noAccessModel = createModel(context, () => NoAccessModel());
  }

  @override
  void dispose() {
    noAccessModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
