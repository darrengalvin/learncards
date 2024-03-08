import '/components/block_type_setup_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'panel_block_setup_widget.dart' show PanelBlockSetupWidget;
import 'package:flutter/material.dart';

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
