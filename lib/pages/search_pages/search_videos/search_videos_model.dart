import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/testpage/components/loading/loading_widget.dart';
import 'search_videos_widget.dart' show SearchVideosWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

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
