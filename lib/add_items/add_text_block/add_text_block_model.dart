import '/flutter_flow/flutter_flow_util.dart';
import 'add_text_block_widget.dart' show AddTextBlockWidget;
import 'package:flutter/material.dart';

class AddTextBlockModel extends FlutterFlowModel<AddTextBlockWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for headertext widget.
  FocusNode? headertextFocusNode;
  TextEditingController? headertextController;
  String? Function(BuildContext, String?)? headertextControllerValidator;
  // State field(s) for textblock widget.
  FocusNode? textblockFocusNode;
  TextEditingController? textblockController;
  String? Function(BuildContext, String?)? textblockControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    headertextFocusNode?.dispose();
    headertextController?.dispose();

    textblockFocusNode?.dispose();
    textblockController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
