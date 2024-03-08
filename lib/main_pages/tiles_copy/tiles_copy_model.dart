import '/backend/backend.dart';
import '/components/header_container_widget.dart';
import '/components/main_tile_content_old_widget.dart';
import '/components/no_access_widget.dart';
import '/components/side_menu_copy_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tiles_copy_widget.dart' show TilesCopyWidget;
import 'package:flutter/material.dart';

class TilesCopyModel extends FlutterFlowModel<TilesCopyWidget> {
  ///  Local state fields for this page.

  int? historyID = 0;

  bool? showsubs;

  DocumentReference? lasttiletouched;

  DocumentReference? secondlasttiletouched;

  bool? isonhistory;

  bool? showsubsubs = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // Model for sideMenuCopy component.
  late SideMenuCopyModel sideMenuCopyModel;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // Model for sideMenu component.
  late SideMenuModel sideMenuModel;
  // Model for HeaderContainer component.
  late HeaderContainerModel headerContainerModel;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  HistoryRecord? createdHistorydocumentrCopy;
  // Stores action output result for [Backend Call - Create Document] action in tile widget.
  HistoryRecord? createdHistorydocumentr;
  // Model for Main_Tile_ContentOld component.
  late MainTileContentOldModel mainTileContentOldModel;
  // Model for NoAccess component.
  late NoAccessModel noAccessModel1;
  // Model for NoAccess component.
  late NoAccessModel noAccessModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideMenuCopyModel = createModel(context, () => SideMenuCopyModel());
    sideMenuModel = createModel(context, () => SideMenuModel());
    headerContainerModel = createModel(context, () => HeaderContainerModel());
    mainTileContentOldModel =
        createModel(context, () => MainTileContentOldModel());
    noAccessModel1 = createModel(context, () => NoAccessModel());
    noAccessModel2 = createModel(context, () => NoAccessModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideMenuCopyModel.dispose();
    sideMenuModel.dispose();
    headerContainerModel.dispose();
    mainTileContentOldModel.dispose();
    noAccessModel1.dispose();
    noAccessModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
