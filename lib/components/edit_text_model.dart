import '/flutter_flow/flutter_flow_util.dart';
import 'edit_text_widget.dart' show EditTextWidget;
import 'package:flutter/material.dart';

class EditTextModel extends FlutterFlowModel<EditTextWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for editTextEntry widget.
  FocusNode? editTextEntryFocusNode;
  TextEditingController? editTextEntryController;
  String? Function(BuildContext, String?)? editTextEntryControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    editTextEntryFocusNode?.dispose();
    editTextEntryController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
