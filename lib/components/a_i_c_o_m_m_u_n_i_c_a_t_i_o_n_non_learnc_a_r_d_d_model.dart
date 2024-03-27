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
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_non_learnc_a_r_d_d_widget.dart'
    show AICOMMUNICATIONNonLearncARDDWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AICOMMUNICATIONNonLearncARDDModel
    extends FlutterFlowModel<AICOMMUNICATIONNonLearncARDDWidget> {
  ///  Local state fields for this component.

  bool questionReady = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Column-chats-scrollable widget.
  ScrollController? columnChatsScrollable;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for AskTheQuestion widget.
  FocusNode? askTheQuestionFocusNode;
  TextEditingController? askTheQuestionController;
  String? Function(BuildContext, String?)? askTheQuestionControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<CompaniesRecord>? companyQueryByCode;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<SessionsRecord>? activeSession;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<CompaniesRecord>? companyQueryByCode1;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<SessionsRecord>? activeSessionNegative;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    columnChatsScrollable = ScrollController();
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnChatsScrollable?.dispose();
    columnController?.dispose();
    askTheQuestionFocusNode?.dispose();
    askTheQuestionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
