import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_tile_block_copy_widget.dart' show EditTileBlockCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
