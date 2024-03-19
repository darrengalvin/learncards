import '/flutter_flow/flutter_flow_util.dart';
import 'add_video_to_existing_tile_widget.dart'
    show AddVideoToExistingTileWidget;
import 'package:flutter/material.dart';

class AddVideoToExistingTileModel
    extends FlutterFlowModel<AddVideoToExistingTileWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for videotitle widget.
  FocusNode? videotitleFocusNode;
  TextEditingController? videotitleController;
  String? Function(BuildContext, String?)? videotitleControllerValidator;
  // State field(s) for featuredsummary widget.
  FocusNode? featuredsummaryFocusNode;
  TextEditingController? featuredsummaryController;
  String? Function(BuildContext, String?)? featuredsummaryControllerValidator;
  // State field(s) for videoURL widget.
  FocusNode? videoURLFocusNode;
  TextEditingController? videoURLController;
  String? Function(BuildContext, String?)? videoURLControllerValidator;
  // State field(s) for position widget.
  FocusNode? positionFocusNode;
  TextEditingController? positionController;
  String? Function(BuildContext, String?)? positionControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    videotitleFocusNode?.dispose();
    videotitleController?.dispose();

    featuredsummaryFocusNode?.dispose();
    featuredsummaryController?.dispose();

    videoURLFocusNode?.dispose();
    videoURLController?.dispose();

    positionFocusNode?.dispose();
    positionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
