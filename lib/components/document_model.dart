import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'document_widget.dart' show DocumentWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DocumentModel extends FlutterFlowModel<DocumentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for doc_title widget.
  FocusNode? docTitleFocusNode;
  TextEditingController? docTitleController;
  String? Function(BuildContext, String?)? docTitleControllerValidator;
  // State field(s) for doc_description widget.
  FocusNode? docDescriptionFocusNode;
  TextEditingController? docDescriptionController;
  String? Function(BuildContext, String?)? docDescriptionControllerValidator;
  // State field(s) for doc_link widget.
  FocusNode? docLinkFocusNode;
  TextEditingController? docLinkController;
  String? Function(BuildContext, String?)? docLinkControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    docTitleFocusNode?.dispose();
    docTitleController?.dispose();

    docDescriptionFocusNode?.dispose();
    docDescriptionController?.dispose();

    docLinkFocusNode?.dispose();
    docLinkController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
