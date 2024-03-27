import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/important_not_logged_in_widget.dart';
import '/components/session_checks_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_on_page_widget.dart'
    show AICOMMUNICATIONOnPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AICOMMUNICATIONOnPageModel
    extends FlutterFlowModel<AICOMMUNICATIONOnPageWidget> {
  ///  Local state fields for this component.

  bool questionReady = false;

  bool passwordReady = false;

  int? flowiseChatDocsCount;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Row widget.
  ScrollController? rowController;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FlowiseChatsRecord? initialchatCreated;
  // State field(s) for Column-chats-scrollable widget.
  ScrollController? columnChatsScrollable;
  List<FlowiseChatsRecord>? columnChatsScrollablePreviousSnapshot;
  AudioPlayer? soundPlayer;
  // State field(s) for Column-markdown-scrollable widget.
  ScrollController? columnMarkdownScrollable;
  // State field(s) for AskTheQuestion widget.
  FocusNode? askTheQuestionFocusNode;
  TextEditingController? askTheQuestionController;
  String? Function(BuildContext, String?)? askTheQuestionControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<CompaniesRecord>? companyQueryByCode;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  FlowiseChatsRecord? createdThread;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  SessionsRecord? sessionForFlowise;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<LearnCardsRecord>? learncardsQ;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<CompaniesRecord>? companyQueryByCode1;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  FlowiseChatsRecord? creeatedWelcomeChatDoc;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  SessionsRecord? sessionsQueryForApiCall;
  // Stores action output result for [Backend Call - API (ISP Data Lookup)] action in IconButton widget.
  ApiCallResponse? apiResultpd1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    rowController = ScrollController();
    columnChatsScrollable = ScrollController();
    columnMarkdownScrollable = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    rowController?.dispose();
    columnChatsScrollable?.dispose();
    columnMarkdownScrollable?.dispose();
    askTheQuestionFocusNode?.dispose();
    askTheQuestionController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
