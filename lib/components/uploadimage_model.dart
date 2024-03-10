import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'uploadimage_widget.dart' show UploadimageWidget;
import 'package:flutter/material.dart';

class UploadimageModel extends FlutterFlowModel<UploadimageWidget> {
  ///  Local state fields for this component.

  TileblocksRecord? tileblock;

  DocumentReference? tileblockref;

  bool? showimageupload;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
