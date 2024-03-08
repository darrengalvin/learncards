import '/backend/backend.dart';
import '/components/panel_block_setup_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_tile_block_copy_copy_widget.dart' show EditTileBlockCopyCopyWidget;
import 'package:flutter/material.dart';

class EditTileBlockCopyCopyModel
    extends FlutterFlowModel<EditTileBlockCopyCopyWidget> {
  ///  Local state fields for this component.

  bool isPreview = false;

  String? contentType = '';

  TileBlocksRecord? selectedBlock;

  double tileLayoutWidth = 60.0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues;
  FormFieldController<List<String>>? checkboxGroupValueController;
  // Model for PanelBlockSetup component.
  late PanelBlockSetupModel panelBlockSetupModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    panelBlockSetupModel = createModel(context, () => PanelBlockSetupModel());
  }

  @override
  void dispose() {
    panelBlockSetupModel.dispose();
  }

  /// Action blocks are added here.

  Future animateSection(
    BuildContext context, {
    required double? collapsedSize,
    required double? expandedSize,
  }) async {
    if (collapsedSize == collapsedSize) {
      logFirebaseEvent('animateSection_update_component_state');
      tileLayoutWidth = expandedSize!;
    } else {
      logFirebaseEvent('animateSection_update_component_state');
      tileLayoutWidth = collapsedSize!;
    }
  }

  /// Additional helper methods are added here.
}
