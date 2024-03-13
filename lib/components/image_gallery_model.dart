import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/dynamic_text_field_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'image_gallery_widget.dart' show ImageGalleryWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ImageGalleryModel extends FlutterFlowModel<ImageGalleryWidget> {
  ///  Local state fields for this component.

  List<String> imageGallery = [];
  void addToImageGallery(String item) => imageGallery.add(item);
  void removeFromImageGallery(String item) => imageGallery.remove(item);
  void removeAtIndexFromImageGallery(int index) => imageGallery.removeAt(index);
  void insertAtIndexInImageGallery(int index, String item) =>
      imageGallery.insert(index, item);
  void updateImageGalleryAtIndex(int index, Function(String) updateFn) =>
      imageGallery[index] = updateFn(imageGallery[index]);

  int loopCounter = 0;

  String addStatus = 'Add';

  ///  State fields for stateful widgets in this component.

  // State field(s) for ImageOptions widget.
  FormFieldController<List<String>>? imageOptionsValueController;
  String? get imageOptionsValue =>
      imageOptionsValueController?.value?.firstOrNull;
  set imageOptionsValue(String? val) =>
      imageOptionsValueController?.value = val != null ? [val] : [];
  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, ImagesRecord>? gridViewPagingController;
  Query? gridViewPagingQuery;
  List<StreamSubscription?> gridViewStreamSubscriptions = [];

  // State field(s) for ImageLink widget.
  FocusNode? imageLinkFocusNode;
  TextEditingController? imageLinkController;
  String? Function(BuildContext, String?)? imageLinkControllerValidator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

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
    gridViewStreamSubscriptions.forEach((s) => s?.cancel());
    gridViewPagingController?.dispose();

    imageLinkFocusNode?.dispose();
    imageLinkController?.dispose();

    dynamicTextFieldModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, ImagesRecord> setGridViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController ??= _createGridViewController(query, parent);
    if (gridViewPagingQuery != query) {
      gridViewPagingQuery = query;
      gridViewPagingController?.refresh();
    }
    return gridViewPagingController!;
  }

  PagingController<DocumentSnapshot?, ImagesRecord> _createGridViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ImagesRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryImagesRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
