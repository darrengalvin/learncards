import '/flutter_flow/flutter_flow_util.dart';
import 'developer_debug_mode_widget.dart' show DeveloperDebugModeWidget;
import 'package:flutter/material.dart';

class DeveloperDebugModeModel
    extends FlutterFlowModel<DeveloperDebugModeWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for projectName widget.
  FocusNode? projectNameFocusNode;
  TextEditingController? projectNameController;
  String? Function(BuildContext, String?)? projectNameControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    projectNameFocusNode?.dispose();
    projectNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
