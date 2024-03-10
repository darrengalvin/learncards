import '/components/viewbroadcast_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'view_broadcast_compon_widget.dart' show ViewBroadcastComponWidget;
import 'package:flutter/material.dart';

class ViewBroadcastComponModel
    extends FlutterFlowModel<ViewBroadcastComponWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for viewbroadcast component.
  late ViewbroadcastModel viewbroadcastModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    viewbroadcastModel = createModel(context, () => ViewbroadcastModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    viewbroadcastModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
