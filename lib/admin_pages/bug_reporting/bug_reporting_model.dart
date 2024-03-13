import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'bug_reporting_widget.dart' show BugReportingWidget;
import 'package:flutter/material.dart';

class BugReportingModel extends FlutterFlowModel<BugReportingWidget> {
  ///  Local state fields for this page.

  bool? selectedfeedback;

  bool? selectedbug;

  bool? selectedfeaturerequest;

  bool? selectedother;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for type widget.
  String? typeValue;
  FormFieldController<String>? typeValueController;
  // State field(s) for whichpage widget.
  FocusNode? whichpageFocusNode;
  TextEditingController? whichpageController;
  String? Function(BuildContext, String?)? whichpageControllerValidator;
  // State field(s) for toreplicate widget.
  FocusNode? toreplicateFocusNode;
  TextEditingController? toreplicateController;
  String? Function(BuildContext, String?)? toreplicateControllerValidator;
  // State field(s) for feedback widget.
  FocusNode? feedbackFocusNode;
  TextEditingController? feedbackController;
  String? Function(BuildContext, String?)? feedbackControllerValidator;
  // State field(s) for improve widget.
  FocusNode? improveFocusNode;
  TextEditingController? improveController;
  String? Function(BuildContext, String?)? improveControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    whichpageFocusNode?.dispose();
    whichpageController?.dispose();

    toreplicateFocusNode?.dispose();
    toreplicateController?.dispose();

    feedbackFocusNode?.dispose();
    feedbackController?.dispose();

    improveFocusNode?.dispose();
    improveController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
