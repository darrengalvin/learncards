import '/components/blockv3_widget.dart';
import '/components/learning_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'body_content_widget.dart' show BodyContentWidget;
import 'package:flutter/material.dart';

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
