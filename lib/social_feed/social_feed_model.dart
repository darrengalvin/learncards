import '/backend/backend.dart';
import '/components/blockv3_widget.dart';
import '/components/drawer_tile_tree_widget.dart';
import '/components/header_container_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/left_pane/desktop_tile_nav_ai_this_week/desktop_tile_nav_ai_this_week_widget.dart';
import '/left_pane/learn_topic_on_page/learn_topic_on_page_widget.dart';
import '/left_pane/main_app_tiles/main_app_tiles_widget.dart';
import '/right_pane/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_deletesoon/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_deletesoon_widget.dart';
import '/right_pane/social_feed_new_componant/social_feed_new_componant_widget.dart';
import 'social_feed_widget.dart' show SocialFeedWidget;
import 'package:flutter/material.dart';

class SocialFeedModel extends FlutterFlowModel<SocialFeedWidget> {
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

  bool featuredTouched = false;

  bool showPanel = false;

  bool showCreateBlock = false;

  TileBlocksRecord? selectedBlock;

  bool askingQuestion = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideMenu component.
  late SideMenuModel sideMenuModel;
  // Model for drawer_TileTree component.
  late DrawerTileTreeModel drawerTileTreeModel;
  // Model for HeaderContainer component.
  late HeaderContainerModel headerContainerModel;
  // Model for DesktopTileNavAi-ThisWeek component.
  late DesktopTileNavAiThisWeekModel desktopTileNavAiThisWeekModel;
  // Model for LearnTopicOnPage component.
  late LearnTopicOnPageModel learnTopicOnPageModel;
  // Model for MainAppTiles component.
  late MainAppTilesModel mainAppTilesModel;
  // Model for socialFeedNewComponant component.
  late SocialFeedNewComponantModel socialFeedNewComponantModel;
  // Models for blockv3 dynamic component.
  late FlutterFlowDynamicModels<Blockv3Model> blockv3Models;
  // Model for AI_COMMUNICATION-deletesoon component.
  late AICOMMUNICATIONDeletesoonModel aICOMMUNICATIONDeletesoonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideMenuModel = createModel(context, () => SideMenuModel());
    drawerTileTreeModel = createModel(context, () => DrawerTileTreeModel());
    headerContainerModel = createModel(context, () => HeaderContainerModel());
    desktopTileNavAiThisWeekModel =
        createModel(context, () => DesktopTileNavAiThisWeekModel());
    learnTopicOnPageModel = createModel(context, () => LearnTopicOnPageModel());
    mainAppTilesModel = createModel(context, () => MainAppTilesModel());
    socialFeedNewComponantModel =
        createModel(context, () => SocialFeedNewComponantModel());
    blockv3Models = FlutterFlowDynamicModels(() => Blockv3Model());
    aICOMMUNICATIONDeletesoonModel =
        createModel(context, () => AICOMMUNICATIONDeletesoonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideMenuModel.dispose();
    drawerTileTreeModel.dispose();
    headerContainerModel.dispose();
    desktopTileNavAiThisWeekModel.dispose();
    learnTopicOnPageModel.dispose();
    mainAppTilesModel.dispose();
    socialFeedNewComponantModel.dispose();
    blockv3Models.dispose();
    aICOMMUNICATIONDeletesoonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
