import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/drawer_empty_list_tiles_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'drawer_tile_tree_widget.dart' show DrawerTileTreeWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerTileTreeModel extends FlutterFlowModel<DrawerTileTreeWidget> {
  ///  Local state fields for this component.

  String? currentTileId = '';

  bool isEdit = false;

  String? currentBlockId = '';

  TileBlocksRecord? selectedBlock;

  int loopCounter = 0;

  List<Tilesv2Record> tempTileList = [];
  void addToTempTileList(Tilesv2Record item) => tempTileList.add(item);
  void removeFromTempTileList(Tilesv2Record item) => tempTileList.remove(item);
  void removeAtIndexFromTempTileList(int index) => tempTileList.removeAt(index);
  void insertAtIndexInTempTileList(int index, Tilesv2Record item) =>
      tempTileList.insert(index, item);
  void updateTempTileListAtIndex(int index, Function(Tilesv2Record) updateFn) =>
      tempTileList[index] = updateFn(tempTileList[index]);

  List<TileBlocksRecord> tempBlockList = [];
  void addToTempBlockList(TileBlocksRecord item) => tempBlockList.add(item);
  void removeFromTempBlockList(TileBlocksRecord item) =>
      tempBlockList.remove(item);
  void removeAtIndexFromTempBlockList(int index) =>
      tempBlockList.removeAt(index);
  void insertAtIndexInTempBlockList(int index, TileBlocksRecord item) =>
      tempBlockList.insert(index, item);
  void updateTempBlockListAtIndex(
          int index, Function(TileBlocksRecord) updateFn) =>
      tempBlockList[index] = updateFn(tempBlockList[index]);

  bool showCreateTile = false;

  bool isEditTiles = false;

  bool showCreateBlock = false;

  bool isEditBlock = false;

  Tilesv2Record? selectedTileDoc;

  String imageUploaded = 'newlyaddedimage.jpg';

  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField-tilename widget.
  FocusNode? textFieldTilenameFocusNode;
  TextEditingController? textFieldTilenameController;
  String? Function(BuildContext, String?)? textFieldTilenameControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TileName widget.
  FocusNode? tileNameFocusNode;
  TextEditingController? tileNameController;
  String? Function(BuildContext, String?)? tileNameControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  TilesRecord? newChildTileCopyCopy;
  // Model for DrawerEmptyListTiles component.
  late DrawerEmptyListTilesModel drawerEmptyListTilesModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    drawerEmptyListTilesModel =
        createModel(context, () => DrawerEmptyListTilesModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldTilenameFocusNode?.dispose();
    textFieldTilenameController?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    tileNameFocusNode?.dispose();
    tileNameController?.dispose();

    drawerEmptyListTilesModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
