import '/flutter_flow/flutter_flow_util.dart';
import 'viewbroadcast_widget.dart' show ViewbroadcastWidget;
import 'package:flutter/material.dart';

class ViewbroadcastModel extends FlutterFlowModel<ViewbroadcastWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentController;
  String? Function(BuildContext, String?)? commentControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    commentFocusNode?.dispose();
    commentController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
