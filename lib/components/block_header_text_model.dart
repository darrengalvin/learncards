import '/flutter_flow/flutter_flow_util.dart';
import 'block_header_text_widget.dart' show BlockHeaderTextWidget;
import 'package:flutter/material.dart';

class BlockHeaderTextModel extends FlutterFlowModel<BlockHeaderTextWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for headertext widget.
  FocusNode? headertextFocusNode;
  TextEditingController? headertextController;
  String? Function(BuildContext, String?)? headertextControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    headertextFocusNode?.dispose();
    headertextController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
