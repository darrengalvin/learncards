import '/backend/backend.dart';
import '/components/learning_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'preparing_widget.dart' show PreparingWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PreparingModel extends FlutterFlowModel<PreparingWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for learningCard component.
  late LearningCardModel learningCardModel;

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
