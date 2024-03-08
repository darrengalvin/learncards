import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'start_broadcast_widget.dart' show StartBroadcastWidget;
import 'package:flutter/material.dart';

class StartBroadcastModel extends FlutterFlowModel<StartBroadcastWidget> {
  ///  Local state fields for this page.

  bool? islive;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in MuxBroadcast widget.
  SocialpostsRecord? createdSocialPost;
  // Stores action output result for [Backend Call - Create Document] action in MuxBroadcast widget.
  BroadcastsRecord? createdDocLive;

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
