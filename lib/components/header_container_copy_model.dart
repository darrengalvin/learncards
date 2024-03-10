import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'header_container_copy_widget.dart' show HeaderContainerCopyWidget;
import 'package:flutter/material.dart';

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
