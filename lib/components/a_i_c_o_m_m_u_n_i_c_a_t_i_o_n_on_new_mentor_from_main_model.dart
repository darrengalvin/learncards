import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_on_new_mentor_from_main_widget.dart'
    show AICOMMUNICATIONOnNewMentorFromMainWidget;
import 'package:flutter/material.dart';

class AICOMMUNICATIONOnNewMentorFromMainModel
    extends FlutterFlowModel<AICOMMUNICATIONOnNewMentorFromMainWidget> {
  ///  Local state fields for this component.

  bool questionReady = false;

  bool showMemberDetails = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  SessionsRecord? checkChatCompleted;
  // State field(s) for Column-chats-scrollable widget.
  ScrollController? columnChatsScrollable;
  // State field(s) for Column-markdown-scrollable widget.
  ScrollController? columnMarkdownScrollable;
  // State field(s) for AskTheQuestion widget.
  FocusNode? askTheQuestionFocusNode;
  TextEditingController? askTheQuestionController;
  String? Function(BuildContext, String?)? askTheQuestionControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  FlowiseChatsRecord? createdThread;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  SessionsRecord? sessionForFlowise;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    columnChatsScrollable = ScrollController();
    columnMarkdownScrollable = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    columnChatsScrollable?.dispose();
    columnMarkdownScrollable?.dispose();
    askTheQuestionFocusNode?.dispose();
    askTheQuestionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
