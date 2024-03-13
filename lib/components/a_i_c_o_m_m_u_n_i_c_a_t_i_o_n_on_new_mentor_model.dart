import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_on_new_mentor_widget.dart'
    show AICOMMUNICATIONOnNewMentorWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AICOMMUNICATIONOnNewMentorModel
    extends FlutterFlowModel<AICOMMUNICATIONOnNewMentorWidget> {
  ///  Local state fields for this component.

  bool questionReady = false;

  bool showMemberDetails = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for Column-chats-scrollable widget.
  ScrollController? columnChatsScrollable;
  // State field(s) for Column-markdown-scrollable widget.
  ScrollController? columnMarkdownScrollable;
  // State field(s) for AskTheQuestion widget.
  FocusNode? askTheQuestionFocusNode1;
  TextEditingController? askTheQuestionController1;
  String? Function(BuildContext, String?)? askTheQuestionController1Validator;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<CompaniesRecord>? companyQueryByCode;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<CompaniesRecord>? companyQueryByCode1;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  FlowiseChatsRecord? creeatedWelcomeChatDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  SessionsRecord? sessionForFlowise;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  FlowiseChatsRecord? createdThread;
  // State field(s) for AskTheQuestion widget.
  FocusNode? askTheQuestionFocusNode2;
  TextEditingController? askTheQuestionController2;
  String? Function(BuildContext, String?)? askTheQuestionController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnChatsScrollable = ScrollController();
    columnMarkdownScrollable = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    columnChatsScrollable?.dispose();
    columnMarkdownScrollable?.dispose();
    askTheQuestionFocusNode1?.dispose();
    askTheQuestionController1?.dispose();

    askTheQuestionFocusNode2?.dispose();
    askTheQuestionController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
