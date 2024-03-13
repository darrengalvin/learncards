import '/flutter_flow/flutter_flow_util.dart';
import 'document_widget.dart' show DocumentWidget;
import 'package:flutter/material.dart';

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
