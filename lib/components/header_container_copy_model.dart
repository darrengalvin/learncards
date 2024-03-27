import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'header_container_copy_widget.dart' show HeaderContainerCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HeaderContainerCopyModel
    extends FlutterFlowModel<HeaderContainerCopyWidget> {
  ///  Local state fields for this component.

  int? historyID;

  double panelSize = 400.0;

  bool hideNews = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in AddTile widget.
  int? navTileCount;
  // Stores action output result for [Backend Call - Create Document] action in AddTile widget.
  Tilesv2Record? newQuickTileNav;
  // Stores action output result for [Backend Call - Create Document] action in AddTile widget.
  TileBlocksRecord? firstTileBlock;
  // Stores action output result for [Firestore Query - Query a collection] action in AddTile widget.
  int? childTileCount;
  // Stores action output result for [Backend Call - Create Document] action in AddTile widget.
  Tilesv2Record? newQuickTileContent;
  // Stores action output result for [Backend Call - Create Document] action in AddTile widget.
  TileBlocksRecord? firstTileBlock2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
