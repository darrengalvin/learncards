import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_documents_widget.dart' show SearchDocumentsWidget;
import 'package:flutter/material.dart';

class SearchDocumentsModel extends FlutterFlowModel<SearchDocumentsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldDocuments widget.
  FocusNode? textFieldDocumentsFocusNode;
  TextEditingController? textFieldDocumentsController;
  String? Function(BuildContext, String?)?
      textFieldDocumentsControllerValidator;
  List<DocumentsRecord> simpleSearchResults = [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldDocumentsFocusNode?.dispose();
    textFieldDocumentsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
