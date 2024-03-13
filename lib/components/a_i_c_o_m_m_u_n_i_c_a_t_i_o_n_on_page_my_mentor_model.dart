import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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
import 'a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_on_page_my_mentor_widget.dart'
    show AICOMMUNICATIONOnPageMyMentorWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AICOMMUNICATIONOnPageMyMentorModel
    extends FlutterFlowModel<AICOMMUNICATIONOnPageMyMentorWidget> {
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
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FlowiseChatsRecord? initialchatCreated;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FlowiseChatsRecord? initialchatCreated1;
  // State field(s) for Column-chats-scrollable widget.
  ScrollController? columnChatsScrollable;
  // State field(s) for Column-markdown-scrollable widget.
  ScrollController? columnMarkdownScrollable;
  // State field(s) for AskTheQuestion widget.
  FocusNode? askTheQuestionFocusNode;
  TextEditingController? askTheQuestionController;
  String? Function(BuildContext, String?)? askTheQuestionControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<CompaniesRecord>? companyQueryByCode;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<CompaniesRecord>? companyQueryByCode1;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  FlowiseChatsRecord? creeatedWelcomeChatDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<CompaniesRecord>? companyQueryByCode2;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  FlowiseChatsRecord? createdChat;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  FlowiseChatsRecord? showToAllChat;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    columnChatsScrollable = ScrollController();
    columnMarkdownScrollable = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    columnController3?.dispose();
    columnChatsScrollable?.dispose();
    columnMarkdownScrollable?.dispose();
    askTheQuestionFocusNode?.dispose();
    askTheQuestionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
