import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'edit_document_tile_widget.dart' show EditDocumentTileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class EditDocumentTileModel extends FlutterFlowModel<EditDocumentTileWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for docTitle widget.
  FocusNode? docTitleFocusNode;
  TextEditingController? docTitleController;
  String? Function(BuildContext, String?)? docTitleControllerValidator;
  // State field(s) for docSummary widget.
  FocusNode? docSummaryFocusNode;
  TextEditingController? docSummaryController;
  String? Function(BuildContext, String?)? docSummaryControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for docURL widget.
  FocusNode? docURLFocusNode;
  TextEditingController? docURLController;
  String? Function(BuildContext, String?)? docURLControllerValidator;
  // State field(s) for CheckboxListTile widget.

  Map<CategoriesRecord, bool> checkboxListTileValueMap = {};
  List<CategoriesRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    docTitleFocusNode?.dispose();
    docTitleController?.dispose();

    docSummaryFocusNode?.dispose();
    docSummaryController?.dispose();

    docURLFocusNode?.dispose();
    docURLController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
