import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/blockv3_widget.dart';
import '/components/chat_widget.dart';
import '/components/drawer_tile_tree_widget.dart';
import '/components/header_container_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/edit_tile_block_copy/edit_tile_block_copy_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'featured_page_widget.dart' show FeaturedPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class FeaturedPageModel extends FlutterFlowModel<FeaturedPageWidget> {
  ///  Local state fields for this page.

  int viewImageIndex = 0;

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

  bool showTileCreate = false;

  bool showBlockCreate = false;

  int loopCounter = 0;

  TileBlocksRecord? tempBlock;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HeaderContainer component.
  late HeaderContainerModel headerContainerModel;
  // State field(s) for mainBody widget.
  ScrollController? mainBody;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // Model for chat component.
  late ChatModel chatModel;
  // State field(s) for Row widget.
  ScrollController? rowController;
  // State field(s) for ListView widget.
  ScrollController? listViewController3;
  // State field(s) for ListViewWeb widget.
  ScrollController? listViewWeb;
  // State field(s) for ListView widget.
  ScrollController? listViewController4;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TileName widget.
  FocusNode? tileNameFocusNode;
  TextEditingController? tileNameController;
  String? Function(BuildContext, String?)? tileNameControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  Tilesv2Record? newChildTile;
  // State field(s) for BlockName widget.
  FocusNode? blockNameFocusNode;
  TextEditingController? blockNameController;
  String? Function(BuildContext, String?)? blockNameControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  TileBlocksRecord? newBlock;
  // State field(s) for NavPath widget.
  ScrollController? navPath1;
  // State field(s) for NavPath widget.
  ScrollController? navPath2;
  // State field(s) for ListViewBlocks widget.
  ScrollController? listViewBlocks;
  // Models for blockv3 dynamic component.
  late FlutterFlowDynamicModels<Blockv3Model> blockv3Models;
  // Model for sideMenu component.
  late SideMenuModel sideMenuModel;
  // Model for drawer_TileTree component.
  late DrawerTileTreeModel drawerTileTreeModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headerContainerModel = createModel(context, () => HeaderContainerModel());
    mainBody = ScrollController();
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
    chatModel = createModel(context, () => ChatModel());
    rowController = ScrollController();
    listViewController3 = ScrollController();
    listViewWeb = ScrollController();
    listViewController4 = ScrollController();
    columnController = ScrollController();
    navPath1 = ScrollController();
    navPath2 = ScrollController();
    listViewBlocks = ScrollController();
    blockv3Models = FlutterFlowDynamicModels(() => Blockv3Model());
    sideMenuModel = createModel(context, () => SideMenuModel());
    drawerTileTreeModel = createModel(context, () => DrawerTileTreeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerContainerModel.dispose();
    mainBody?.dispose();
    listViewController1?.dispose();
    listViewController2?.dispose();
    chatModel.dispose();
    rowController?.dispose();
    listViewController3?.dispose();
    listViewWeb?.dispose();
    listViewController4?.dispose();
    columnController?.dispose();
    tileNameFocusNode?.dispose();
    tileNameController?.dispose();

    blockNameFocusNode?.dispose();
    blockNameController?.dispose();

    navPath1?.dispose();
    navPath2?.dispose();
    listViewBlocks?.dispose();
    blockv3Models.dispose();
    sideMenuModel.dispose();
    drawerTileTreeModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
