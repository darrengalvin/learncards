import '/flutter_flow/flutter_flow_util.dart';
import 'video_widget.dart' show VideoWidget;
import 'package:flutter/material.dart';

class VideoModel extends FlutterFlowModel<VideoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
