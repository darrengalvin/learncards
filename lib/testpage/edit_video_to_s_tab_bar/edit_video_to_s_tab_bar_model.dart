import '/flutter_flow/flutter_flow_util.dart';
import 'edit_video_to_s_tab_bar_widget.dart' show EditVideoToSTabBarWidget;
import 'package:flutter/material.dart';

class EditVideoToSTabBarModel
    extends FlutterFlowModel<EditVideoToSTabBarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for videotitle widget.
  FocusNode? videotitleFocusNode;
  TextEditingController? videotitleController;
  String? Function(BuildContext, String?)? videotitleControllerValidator;
  // State field(s) for videosummary widget.
  FocusNode? videosummaryFocusNode;
  TextEditingController? videosummaryController;
  String? Function(BuildContext, String?)? videosummaryControllerValidator;
  // State field(s) for videoURL widget.
  FocusNode? videoURLFocusNode;
  TextEditingController? videoURLController;
  String? Function(BuildContext, String?)? videoURLControllerValidator;
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

    videosummaryFocusNode?.dispose();
    videosummaryController?.dispose();

    videoURLFocusNode?.dispose();
    videoURLController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
