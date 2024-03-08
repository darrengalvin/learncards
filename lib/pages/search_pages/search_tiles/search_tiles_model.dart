import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_tiles_widget.dart' show SearchTilesWidget;
import 'package:flutter/material.dart';

class SearchTilesModel extends FlutterFlowModel<SearchTilesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldTiles widget.
  FocusNode? textFieldTilesFocusNode;
  TextEditingController? textFieldTilesController;
  String? Function(BuildContext, String?)? textFieldTilesControllerValidator;
  List<TilesRecord> simpleSearchResults = [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldTilesFocusNode?.dispose();
    textFieldTilesController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
