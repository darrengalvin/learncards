import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/viewbroadcast_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'view_broadcast_compon_widget.dart' show ViewBroadcastComponWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
