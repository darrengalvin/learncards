import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_videos_widget.dart' show SearchVideosWidget;
import 'package:flutter/material.dart';

class SearchVideosModel extends FlutterFlowModel<SearchVideosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldVideos widget.
  FocusNode? textFieldVideosFocusNode;
  TextEditingController? textFieldVideosController;
  String? Function(BuildContext, String?)? textFieldVideosControllerValidator;
  List<VideosRecord> simpleSearchResults = [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldVideosFocusNode?.dispose();
    textFieldVideosController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
