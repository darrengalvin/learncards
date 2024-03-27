import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/panel_edit_block_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'blockv3_copy_widget.dart' show Blockv3CopyWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Blockv3CopyModel extends FlutterFlowModel<Blockv3CopyWidget> {
  ///  Local state fields for this component.

  int viewImageIndex = 0;

  bool showEdit = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for PanelEditBlock component.
  late PanelEditBlockModel panelEditBlockModel;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  TileBlocksRecord? newInlineBlockEnd;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    panelEditBlockModel = createModel(context, () => PanelEditBlockModel());
  }

  @override
  void dispose() {
    panelEditBlockModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
