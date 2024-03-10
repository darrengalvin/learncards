import '/components/dynamic_text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'video_gallery_widget.dart' show VideoGalleryWidget;
import 'package:flutter/material.dart';

class VideoGalleryModel extends FlutterFlowModel<VideoGalleryWidget> {
  ///  Local state fields for this component.

  List<String> videoGallery = [];
  void addToVideoGallery(String item) => videoGallery.add(item);
  void removeFromVideoGallery(String item) => videoGallery.remove(item);
  void removeAtIndexFromVideoGallery(int index) => videoGallery.removeAt(index);
  void insertAtIndexInVideoGallery(int index, String item) =>
      videoGallery.insert(index, item);
  void updateVideoGalleryAtIndex(int index, Function(String) updateFn) =>
      videoGallery[index] = updateFn(videoGallery[index]);

  int loopCounter = 0;

  String addStatus = 'Add';

  ///  State fields for stateful widgets in this component.

  // State field(s) for VideoOptions widget.
  FormFieldController<List<String>>? videoOptionsValueController;
  String? get videoOptionsValue =>
      videoOptionsValueController?.value?.firstOrNull;
  set videoOptionsValue(String? val) =>
      videoOptionsValueController?.value = val != null ? [val] : [];
  // State field(s) for CheckboxListTile widget.

  Map<String, bool> checkboxListTileValueMap = {};
  List<String> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for VideoLink widget.
  FocusNode? videoLinkFocusNode;
  TextEditingController? videoLinkController;
  String? Function(BuildContext, String?)? videoLinkControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Models for dynamicTextField dynamic component.
  late FlutterFlowDynamicModels<DynamicTextFieldModel> dynamicTextFieldModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dynamicTextFieldModels =
        FlutterFlowDynamicModels(() => DynamicTextFieldModel());
  }

  @override
  void dispose() {
    videoLinkFocusNode?.dispose();
    videoLinkController?.dispose();

    dynamicTextFieldModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
