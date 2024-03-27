import '/flutter_flow/flutter_flow_util.dart';
import 'edit_text_block_widget.dart' show EditTextBlockWidget;
import 'package:flutter/material.dart';

class EditTextBlockModel extends FlutterFlowModel<EditTextBlockWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Header widget.
  FocusNode? headerFocusNode;
  TextEditingController? headerController;
  String? Function(BuildContext, String?)? headerControllerValidator;
  // State field(s) for Paragraph widget.
  FocusNode? paragraphFocusNode;
  TextEditingController? paragraphController;
  String? Function(BuildContext, String?)? paragraphControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    headerFocusNode?.dispose();
    headerController?.dispose();

    paragraphFocusNode?.dispose();
    paragraphController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
