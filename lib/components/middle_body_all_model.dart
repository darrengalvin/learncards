import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/left_pane/left_column/left_column_widget.dart';
import '/middle_pane/middle_column/middle_column_widget.dart';
import '/right_pane/right_column/right_column_widget.dart';
import 'middle_body_all_widget.dart' show MiddleBodyAllWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MiddleBodyAllModel extends FlutterFlowModel<MiddleBodyAllWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for LeftColumn component.
  late LeftColumnModel leftColumnModel;
  // Model for MiddleColumn component.
  late MiddleColumnModel middleColumnModel;
  // Model for rightColumn component.
  late RightColumnModel rightColumnModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    leftColumnModel = createModel(context, () => LeftColumnModel());
    middleColumnModel = createModel(context, () => MiddleColumnModel());
    rightColumnModel = createModel(context, () => RightColumnModel());
  }

  @override
  void dispose() {
    leftColumnModel.dispose();
    middleColumnModel.dispose();
    rightColumnModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
