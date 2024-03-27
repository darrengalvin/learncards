import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/blockv3_widget.dart';
import '/components/drawer_empty_list_tiles_widget.dart';
import '/components/edit_text_block_widget.dart';
import '/components/learning_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'body_content_widget.dart' show BodyContentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BodyContentModel extends FlutterFlowModel<BodyContentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for learningCard component.
  late LearningCardModel learningCardModel1;
  // Models for blockv3 dynamic component.
  late FlutterFlowDynamicModels<Blockv3Model> blockv3Models;
  // Model for learningCard component.
  late LearningCardModel learningCardModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    learningCardModel1 = createModel(context, () => LearningCardModel());
    blockv3Models = FlutterFlowDynamicModels(() => Blockv3Model());
    learningCardModel2 = createModel(context, () => LearningCardModel());
  }

  @override
  void dispose() {
    learningCardModel1.dispose();
    blockv3Models.dispose();
    learningCardModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
