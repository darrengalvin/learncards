import '/flutter_flow/flutter_flow_util.dart';
import 'reels_widget.dart' show ReelsWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ReelsModel extends FlutterFlowModel<ReelsWidget> {
  ///  Local state fields for this page.

  bool? showmenuopen;

  bool? drawerMenu;

  int? historyID;

  bool? isonhistory;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  AudioPlayer? soundPlayer;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
