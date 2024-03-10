import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_video_widget.dart' show AddVideoWidget;
import 'package:flutter/material.dart';

class AddVideoModel extends FlutterFlowModel<AddVideoWidget> {
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
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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
    videotitleFocusNode?.dispose();
    videotitleController?.dispose();

    featuredsummaryFocusNode?.dispose();
    featuredsummaryController?.dispose();

    videoURLFocusNode?.dispose();
    videoURLController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
