import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for yourMobileNumber widget.
  FocusNode? yourMobileNumberFocusNode;
  TextEditingController? yourMobileNumberController;
  String? Function(BuildContext, String?)? yourMobileNumberControllerValidator;
  // State field(s) for yourLocation widget.
  FocusNode? yourLocationFocusNode;
  TextEditingController? yourLocationController;
  String? Function(BuildContext, String?)? yourLocationControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();

    yourMobileNumberFocusNode?.dispose();
    yourMobileNumberController?.dispose();

    yourLocationFocusNode?.dispose();
    yourLocationController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
