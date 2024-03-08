import '/backend/backend.dart';
import '/components/learning_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'header_container_widget.dart' show HeaderContainerWidget;
import 'package:flutter/material.dart';

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
