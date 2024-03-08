import '/flutter_flow/flutter_flow_util.dart';
import 'dynamic_text_field_widget.dart' show DynamicTextFieldWidget;
import 'package:flutter/material.dart';

class DynamicTextFieldModel extends FlutterFlowModel<DynamicTextFieldWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for BulletListField widget.
  FocusNode? bulletListFieldFocusNode;
  TextEditingController? bulletListFieldController;
  String? Function(BuildContext, String?)? bulletListFieldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    bulletListFieldFocusNode?.dispose();
    bulletListFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
