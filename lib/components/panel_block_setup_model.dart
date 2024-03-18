import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/block_type_setup_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'panel_block_setup_widget.dart' show PanelBlockSetupWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PanelBlockSetupModel extends FlutterFlowModel<PanelBlockSetupWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for BlockTypeSetup dynamic component.
  late FlutterFlowDynamicModels<BlockTypeSetupModel> blockTypeSetupModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    blockTypeSetupModels =
        FlutterFlowDynamicModels(() => BlockTypeSetupModel());
  }

  @override
  void dispose() {
    blockTypeSetupModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
