import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_on_page_widget.dart';
import '/components/learning_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'header_container_widget.dart' show HeaderContainerWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HeaderContainerModel extends FlutterFlowModel<HeaderContainerWidget> {
  ///  Local state fields for this component.

  int? historyID;

  double panelSize = 400.0;

  bool hideNews = false;

  ///  State fields for stateful widgets in this component.

  // Model for learningCard component.
  late LearningCardModel learningCardModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  CompaniesRecord? companycheckforbottomchat;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    learningCardModel = createModel(context, () => LearningCardModel());
  }

  @override
  void dispose() {
    learningCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
