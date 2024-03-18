import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/testpage/components/loading/loading_widget.dart';
import 'search_tiles_widget.dart' show SearchTilesWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

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
