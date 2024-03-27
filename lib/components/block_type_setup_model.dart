import '/components/radio_buttons_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'block_type_setup_widget.dart' show BlockTypeSetupWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BlockTypeSetupModel extends FlutterFlowModel<BlockTypeSetupWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for RadioButtons component.
  late RadioButtonsModel radioButtonsModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    radioButtonsModel = createModel(context, () => RadioButtonsModel());
  }

  @override
  void dispose() {
    radioButtonsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
