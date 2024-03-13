import '/flutter_flow/flutter_flow_util.dart';
import 'view_broadcast_widget.dart' show ViewBroadcastWidget;
import 'package:flutter/material.dart';

class ViewBroadcastModel extends FlutterFlowModel<ViewBroadcastWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentController;
  String? Function(BuildContext, String?)? commentControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    commentFocusNode?.dispose();
    commentController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
