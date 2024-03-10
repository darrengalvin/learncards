import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_tile_block_copy_widget.dart' show EditTileBlockCopyWidget;
import 'package:flutter/material.dart';

class EditTileBlockCopyModel extends FlutterFlowModel<EditTileBlockCopyWidget> {
  ///  Local state fields for this component.

  bool isPreview = false;

  String? contentType = '';

  TileBlocksRecord? selectedBlock;

  double tileLayoutWidth = 60.0;

  String? selectedTileId = '';

  String? selectedBlockId = '';

  int loopCounter = 0;

  String? blockLayout = '';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  Tilesv2Record? newChildTile;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  TileBlocksRecord? newBlock;
  // State field(s) for BlockType widget.
  String? blockTypeValue;
  FormFieldController<String>? blockTypeValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  Future animateSection(
    BuildContext context, {
    required double? collapsedSize,
    required double? expandedSize,
  }) async {
    if (tileLayoutWidth == collapsedSize) {
      logFirebaseEvent('animateSection_update_component_state');
      tileLayoutWidth = expandedSize!;
    } else {
      logFirebaseEvent('animateSection_update_component_state');
      tileLayoutWidth = collapsedSize!;
    }
  }

  /// Additional helper methods are added here.
}
