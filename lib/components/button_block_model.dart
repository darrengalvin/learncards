import '/flutter_flow/flutter_flow_util.dart';
import 'button_block_widget.dart' show ButtonBlockWidget;
import 'package:flutter/material.dart';

class ButtonBlockModel extends FlutterFlowModel<ButtonBlockWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for linktext widget.
  FocusNode? linktextFocusNode;
  TextEditingController? linktextController;
  String? Function(BuildContext, String?)? linktextControllerValidator;
  // State field(s) for buttonlink widget.
  FocusNode? buttonlinkFocusNode;
  TextEditingController? buttonlinkController;
  String? Function(BuildContext, String?)? buttonlinkControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    linktextFocusNode?.dispose();
    linktextController?.dispose();

    buttonlinkFocusNode?.dispose();
    buttonlinkController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
