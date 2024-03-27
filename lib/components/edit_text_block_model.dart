import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_text_block_widget.dart' show EditTextBlockWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditTextBlockModel extends FlutterFlowModel<EditTextBlockWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Header widget.
  FocusNode? headerFocusNode;
  TextEditingController? headerController;
  String? Function(BuildContext, String?)? headerControllerValidator;
  // State field(s) for Paragraph widget.
  FocusNode? paragraphFocusNode;
  TextEditingController? paragraphController;
  String? Function(BuildContext, String?)? paragraphControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    headerFocusNode?.dispose();
    headerController?.dispose();

    paragraphFocusNode?.dispose();
    paragraphController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
