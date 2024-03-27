import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_document_widget.dart' show AddDocumentWidget;
import 'package:flutter/material.dart';

class AddDocumentModel extends FlutterFlowModel<AddDocumentWidget> {
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
  // State field(s) for id widget.
  FocusNode? idFocusNode;
  TextEditingController? idController;
  String? Function(BuildContext, String?)? idControllerValidator;
  // State field(s) for CheckboxListTile widget.

  Map<CategoriesRecord, bool> checkboxListTileValueMap1 = {};
  List<CategoriesRecord> get checkboxListTileCheckedItems1 =>
      checkboxListTileValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for CheckboxListTile widget.

  Map<TilesRecord, bool> checkboxListTileValueMap2 = {};
  List<TilesRecord> get checkboxListTileCheckedItems2 =>
      checkboxListTileValueMap2.entries
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

    idFocusNode?.dispose();
    idController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
