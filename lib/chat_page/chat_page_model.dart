import '/backend/backend.dart';
import '/components/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_on_page_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_page_widget.dart' show ChatPageWidget;
import 'package:flutter/material.dart';

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
