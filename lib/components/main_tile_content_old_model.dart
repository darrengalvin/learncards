import '/add_items/create_new_tilea_inside/create_new_tilea_inside_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/edit_tile_block/edit_tile_block_widget.dart';
import '/social_feed/social/social_widget.dart';
import '/testpage/components/edit_document_tile/edit_document_tile_widget.dart';
import '/testpage/components/edit_link_in_tile/edit_link_in_tile_widget.dart';
import '/testpage/components/edit_tile/edit_tile_widget.dart';
import '/testpage/components/history_tiles/history_tiles_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'main_tile_content_old_widget.dart' show MainTileContentOldWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MainTileContentOldModel
    extends FlutterFlowModel<MainTileContentOldWidget> {
  ///  Local state fields for this component.

  int? historyID;

  bool? showsubs;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Row widget.
  TileblocksRecord? createdTileBlockCopy;
  // Stores action output result for [Backend Call - Create Document] action in tile widget.
  HistoryRecord? createdHistorydocs;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
