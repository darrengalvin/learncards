import '/add_items/add_document_to_tile/add_document_to_tile_widget.dart';
import '/add_items/add_link_in_tile/add_link_in_tile_widget.dart';
import '/add_items/add_text_block_to_tile/add_text_block_to_tile_widget.dart';
import '/add_items/create_new_tilea_inside/create_new_tilea_inside_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/testpage/components/add_video_to_existing_tile/add_video_to_existing_tile_widget.dart';
import 'admin_standard_widget.dart' show AdminStandardWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AdminStandardModel extends FlutterFlowModel<AdminStandardWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for linkplace widget.
  FocusNode? linkplaceFocusNode;
  TextEditingController? linkplaceController;
  String? Function(BuildContext, String?)? linkplaceControllerValidator;
  String currentPageLink = '';
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for Switch widget.
  bool? switchValue4;
  // State field(s) for Switch widget.
  bool? switchValue5;
  // State field(s) for Switch widget.
  bool? switchValue6;
  // State field(s) for Switch widget.
  bool? switchValue7;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    linkplaceFocusNode?.dispose();
    linkplaceController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
