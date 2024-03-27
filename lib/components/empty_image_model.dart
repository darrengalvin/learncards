import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'empty_image_widget.dart' show EmptyImageWidget;
import 'package:flutter/material.dart';

class EmptyImageModel extends FlutterFlowModel<EmptyImageWidget> {
  ///  Local state fields for this component.

  bool isStatusTextVisible = false;

  bool showBlock = false;

  TileBlocksRecord? newTileBlock;

  double imageOpacity = 100.0;

  ///  State fields for stateful widgets in this component.

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
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
