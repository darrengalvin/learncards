import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/testpage/components/detailedcomment/detailedcomment_widget.dart';
import 'view_broadcast_widget.dart' show ViewBroadcastWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
