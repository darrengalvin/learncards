import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_on_page_my_mentor_widget.dart';
import '/components/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_welcome_widget.dart';
import '/components/drawer_tile_tree_widget.dart';
import '/components/header_container_widget.dart';
import '/components/important_not_logged_in_widget.dart';
import '/components/left_menu_widget.dart';
import '/components/middle_body_all_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'library_fixed_widget.dart' show LibraryFixedWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LibraryFixedModel extends FlutterFlowModel<LibraryFixedWidget> {
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

  bool firstTimeMentorChat = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in Library-fixed widget.
  LogsRecord? userLog;
  // Stores action output result for [Firestore Query - Query a collection] action in Library-fixed widget.
  CompaniesRecord? companyByUrl;
  // Stores action output result for [Backend Call - Create Document] action in Library-fixed widget.
  SessionsRecord? sessionsCreated;
  // Stores action output result for [Firestore Query - Query a collection] action in Library-fixed widget.
  SessionsRecord? sessionQueryOnPageLoad;
  // Stores action output result for [Firestore Query - Query a collection] action in Library-fixed widget.
  CompaniesRecord? companyByUrl2;
  // Stores action output result for [Firestore Query - Query a collection] action in Library-fixed widget.
  MyTeamRecord? loadingcHATmENTOR;
  // Stores action output result for [Firestore Query - Query a collection] action in Library-fixed widget.
  List<FlowiseChatsRecord>? queryFlowiseChats;
  // Stores action output result for [Backend Call - Create Document] action in Library-fixed widget.
  FlowiseChatsRecord? initialchatCreated;
  // Model for drawer_TileTree component.
  late DrawerTileTreeModel drawerTileTreeModel;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Model for HeaderContainer component.
  late HeaderContainerModel headerContainerModel;
  // Model for MiddleBodyAll component.
  late MiddleBodyAllModel middleBodyAllModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  SessionsRecord? checkingMentorChat;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompaniesRecord? createdCompany;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  Tilesv2Record? createdTopTilesVault;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  Tilesv2Record? createdTopTilesEvents;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  Tilesv2Record? createdTopTilesLearning;
  // Stores action output result for [Backend Call - API (getTopics)] action in Button widget.
  ApiCallResponse? apiResult939;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  SessionsRecord? readDocQuery;
  // Model for leftMenu component.
  late LeftMenuModel leftMenuModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    drawerTileTreeModel = createModel(context, () => DrawerTileTreeModel());
    headerContainerModel = createModel(context, () => HeaderContainerModel());
    middleBodyAllModel = createModel(context, () => MiddleBodyAllModel());
    leftMenuModel = createModel(context, () => LeftMenuModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerTileTreeModel.dispose();
    headerContainerModel.dispose();
    middleBodyAllModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    leftMenuModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
