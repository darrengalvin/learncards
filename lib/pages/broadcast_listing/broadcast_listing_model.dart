import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'broadcast_listing_widget.dart' show BroadcastListingWidget;
import 'package:flutter/material.dart';

class BroadcastListingModel extends FlutterFlowModel<BroadcastListingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getLiveStreamId)] action in Card widget.
  ApiCallResponse? liveStreamIdResult;
  // Stores action output result for [Backend Call - API (getPastLiveStream)] action in Card widget.
  ApiCallResponse? pastLiveStreamResult;

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
