import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_on_page_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'chat_page_widget.dart' show ChatPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ChatPageModel extends FlutterFlowModel<ChatPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AI_COMMUNICATION-OnPage component.
  late AICOMMUNICATIONOnPageModel aICOMMUNICATIONOnPageModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  SessionsRecord? checkingMentorChat;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    aICOMMUNICATIONOnPageModel =
        createModel(context, () => AICOMMUNICATIONOnPageModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    aICOMMUNICATIONOnPageModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
