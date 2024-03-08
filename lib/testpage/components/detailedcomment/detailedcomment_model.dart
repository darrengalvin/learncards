import '/flutter_flow/flutter_flow_util.dart';
import 'detailedcomment_widget.dart' show DetailedcommentWidget;
import 'package:flutter/material.dart';

class DetailedcommentModel extends FlutterFlowModel<DetailedcommentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for detailedComment widget.
  FocusNode? detailedCommentFocusNode;
  TextEditingController? detailedCommentController;
  String? Function(BuildContext, String?)? detailedCommentControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    detailedCommentFocusNode?.dispose();
    detailedCommentController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
