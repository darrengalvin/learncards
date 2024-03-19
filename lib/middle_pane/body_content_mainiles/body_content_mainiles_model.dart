import '/backend/backend.dart';
import '/components/noaccesspopup_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'body_content_mainiles_widget.dart' show BodyContentMainilesWidget;
import 'package:flutter/material.dart';

class BodyContentMainilesModel
    extends FlutterFlowModel<BodyContentMainilesWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  VideosRecord? videoWithTitle;
  // Model for noaccesspopup component.
  late NoaccesspopupModel noaccesspopupModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    noaccesspopupModel = createModel(context, () => NoaccesspopupModel());
  }

  @override
  void dispose() {
    noaccesspopupModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
