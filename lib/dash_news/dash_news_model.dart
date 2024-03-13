import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/drawer_tile_tree_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dash_news_widget.dart' show DashNewsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DashNewsModel extends FlutterFlowModel<DashNewsWidget> {
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
  // Model for sideMenu component.
  late SideMenuModel sideMenuModel;
  // Model for drawer_TileTree component.
  late DrawerTileTreeModel drawerTileTreeModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideMenuModel = createModel(context, () => SideMenuModel());
    drawerTileTreeModel = createModel(context, () => DrawerTileTreeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideMenuModel.dispose();
    drawerTileTreeModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
