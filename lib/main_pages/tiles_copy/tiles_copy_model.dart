import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header_container_widget.dart';
import '/components/main_tile_content_old_widget.dart';
import '/components/no_access_widget.dart';
import '/components/side_menu_copy_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/testpage/components/edit_tile/edit_tile_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'tiles_copy_widget.dart' show TilesCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
