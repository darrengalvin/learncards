import '/backend/backend.dart';
import '/components/learn_cards_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'right_column_widget.dart' show RightColumnWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RightColumnModel extends FlutterFlowModel<RightColumnWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for learnCards component.
  late LearnCardsModel learnCardsModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    learnCardsModel = createModel(context, () => LearnCardsModel());
  }

  @override
  void dispose() {
    learnCardsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
