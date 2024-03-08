import '/backend/backend.dart';
import '/components/drawer_tile_tree_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dash_news_widget.dart' show DashNewsWidget;
import 'package:flutter/material.dart';

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
