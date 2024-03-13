import '/add_items/add_document_to_tile/add_document_to_tile_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/testpage/components/add_video_to_existing_tile/add_video_to_existing_tile_widget.dart';
import 'edit_tile_block_widget.dart' show EditTileBlockWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditTileBlockModel extends FlutterFlowModel<EditTileBlockWidget> {
  ///  Local state fields for this component.

  bool? headerOnBlock = false;

  bool? paragraphOnBlock;

  bool? videoOnBlock;

  bool? buttonOnBlock;

  bool? documentOnBlock;

  bool? imageOnBlock;

  bool? tileOnBlock;

  String? selectedOnBlock;

  String? headertexttmp;

  String? paragraphTmp;

  String? videoTmp;

  String? buttonTextTmp;

  String? buttonLinkTmp;

  String? documentTmp;

  String? imageTmp;

  String? tileTmp;

  List<String> choicesselected = [];
  void addToChoicesselected(String item) => choicesselected.add(item);
  void removeFromChoicesselected(String item) => choicesselected.remove(item);
  void removeAtIndexFromChoicesselected(int index) =>
      choicesselected.removeAt(index);
  void insertAtIndexInChoicesselected(int index, String item) =>
      choicesselected.insert(index, item);
  void updateChoicesselectedAtIndex(int index, Function(String) updateFn) =>
      choicesselected[index] = updateFn(choicesselected[index]);

  List<String> tileselected = [];
  void addToTileselected(String item) => tileselected.add(item);
  void removeFromTileselected(String item) => tileselected.remove(item);
  void removeAtIndexFromTileselected(int index) => tileselected.removeAt(index);
  void insertAtIndexInTileselected(int index, String item) =>
      tileselected.insert(index, item);
  void updateTileselectedAtIndex(int index, Function(String) updateFn) =>
      tileselected[index] = updateFn(tileselected[index]);

  List<String> videoselectedtitleLocal = [];
  void addToVideoselectedtitleLocal(String item) =>
      videoselectedtitleLocal.add(item);
  void removeFromVideoselectedtitleLocal(String item) =>
      videoselectedtitleLocal.remove(item);
  void removeAtIndexFromVideoselectedtitleLocal(int index) =>
      videoselectedtitleLocal.removeAt(index);
  void insertAtIndexInVideoselectedtitleLocal(int index, String item) =>
      videoselectedtitleLocal.insert(index, item);
  void updateVideoselectedtitleLocalAtIndex(
          int index, Function(String) updateFn) =>
      videoselectedtitleLocal[index] = updateFn(videoselectedtitleLocal[index]);

  bool? showimageupload;

  List<String> docselectedltitleocal = [];
  void addToDocselectedltitleocal(String item) =>
      docselectedltitleocal.add(item);
  void removeFromDocselectedltitleocal(String item) =>
      docselectedltitleocal.remove(item);
  void removeAtIndexFromDocselectedltitleocal(int index) =>
      docselectedltitleocal.removeAt(index);
  void insertAtIndexInDocselectedltitleocal(int index, String item) =>
      docselectedltitleocal.insert(index, item);
  void updateDocselectedltitleocalAtIndex(
          int index, Function(String) updateFn) =>
      docselectedltitleocal[index] = updateFn(docselectedltitleocal[index]);

  String? searchString;

  String? uploadedFile;

  String? fileProvideType;

  List<DocumentReference> selectedTile = [];
  void addToSelectedTile(DocumentReference item) => selectedTile.add(item);
  void removeFromSelectedTile(DocumentReference item) =>
      selectedTile.remove(item);
  void removeAtIndexFromSelectedTile(int index) => selectedTile.removeAt(index);
  void insertAtIndexInSelectedTile(int index, DocumentReference item) =>
      selectedTile.insert(index, item);
  void updateSelectedTileAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      selectedTile[index] = updateFn(selectedTile[index]);

  List<DocumentReference> selectedVideo = [];
  void addToSelectedVideo(DocumentReference item) => selectedVideo.add(item);
  void removeFromSelectedVideo(DocumentReference item) =>
      selectedVideo.remove(item);
  void removeAtIndexFromSelectedVideo(int index) =>
      selectedVideo.removeAt(index);
  void insertAtIndexInSelectedVideo(int index, DocumentReference item) =>
      selectedVideo.insert(index, item);
  void updateSelectedVideoAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      selectedVideo[index] = updateFn(selectedVideo[index]);

  List<DocumentReference> selectedDoc = [];
  void addToSelectedDoc(DocumentReference item) => selectedDoc.add(item);
  void removeFromSelectedDoc(DocumentReference item) =>
      selectedDoc.remove(item);
  void removeAtIndexFromSelectedDoc(int index) => selectedDoc.removeAt(index);
  void insertAtIndexInSelectedDoc(int index, DocumentReference item) =>
      selectedDoc.insert(index, item);
  void updateSelectedDocAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      selectedDoc[index] = updateFn(selectedDoc[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for HeaderSwitch widget.
  bool? headerSwitchValue;
  // State field(s) for Parawitch widget.
  bool? parawitchValue;
  // State field(s) for buttonSwitch widget.
  bool? buttonSwitchValue;
  // State field(s) for DocSwitch widget.
  bool? docSwitchValue;
  // State field(s) for imageSwitch widget.
  bool? imageSwitchValue;
  // State field(s) for videoSwitch widget.
  bool? videoSwitchValue1;
  // State field(s) for videoSwitch widget.
  bool? videoSwitchValue2;
  // State field(s) for SocialFeed widget.
  bool? socialFeedValue;
  // State field(s) for AISwitch widget.
  bool? aISwitchValue;
  // State field(s) for headertext widget.
  FocusNode? headertextFocusNode;
  TextEditingController? headertextController;
  String? Function(BuildContext, String?)? headertextControllerValidator;
  // State field(s) for paragraph widget.
  FocusNode? paragraphFocusNode;
  TextEditingController? paragraphController;
  String? Function(BuildContext, String?)? paragraphControllerValidator;
  // State field(s) for TabBarCurrent widget.
  TabController? tabBarCurrentController;
  int get tabBarCurrentCurrentIndex =>
      tabBarCurrentController != null ? tabBarCurrentController!.index : 0;

  // State field(s) for videoTitle widget.
  FocusNode? videoTitleFocusNode;
  TextEditingController? videoTitleController;
  String? Function(BuildContext, String?)? videoTitleControllerValidator;
  // State field(s) for featuredsummary widget.
  FocusNode? featuredsummaryFocusNode;
  TextEditingController? featuredsummaryController;
  String? Function(BuildContext, String?)? featuredsummaryControllerValidator;
  // State field(s) for videoURL widget.
  FocusNode? videoURLFocusNode;
  TextEditingController? videoURLController;
  String? Function(BuildContext, String?)? videoURLControllerValidator;
  // State field(s) for position widget.
  FocusNode? positionFocusNode1;
  TextEditingController? positionController1;
  String? Function(BuildContext, String?)? positionController1Validator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for ExistingName widget.
  FocusNode? existingNameFocusNode1;
  TextEditingController? existingNameController1;
  String? Function(BuildContext, String?)? existingNameController1Validator;
  // State field(s) for Checkbox widget.

  Map<VideosRecord, bool> checkboxValueMap2 = {};
  List<VideosRecord> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.

  Map<VideosRecord, bool> checkboxValueMap3 = {};
  List<VideosRecord> get checkboxCheckedItems3 => checkboxValueMap3.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for TabBar widget.
  TabController? tabBarController1;
  int get tabBarCurrentIndex1 =>
      tabBarController1 != null ? tabBarController1!.index : 0;

  // State field(s) for BETAdocTitle widget.
  FocusNode? bETAdocTitleFocusNode;
  TextEditingController? bETAdocTitleController;
  String? Function(BuildContext, String?)? bETAdocTitleControllerValidator;
  // State field(s) for position widget.
  FocusNode? positionFocusNode2;
  TextEditingController? positionController2;
  String? Function(BuildContext, String?)? positionController2Validator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for docLink widget.
  FocusNode? docLinkFocusNode;
  TextEditingController? docLinkController;
  String? Function(BuildContext, String?)? docLinkControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DocumentsRecord? docCreated;
  // State field(s) for ExistingName widget.
  FocusNode? existingNameFocusNode2;
  TextEditingController? existingNameController2;
  String? Function(BuildContext, String?)? existingNameController2Validator;
  // State field(s) for Checkbox widget.

  Map<DocumentsRecord, bool> checkboxValueMap4 = {};
  List<DocumentsRecord> get checkboxCheckedItems4 => checkboxValueMap4.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for TabBar widget.
  TabController? tabBarController2;
  int get tabBarCurrentIndex2 =>
      tabBarController2 != null ? tabBarController2!.index : 0;

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, TilesRecord>? listViewPagingController4;
  Query? listViewPagingQuery4;
  List<StreamSubscription?> listViewStreamSubscriptions4 = [];

  // State field(s) for linktext widget.
  FocusNode? linktextFocusNode;
  TextEditingController? linktextController;
  String? Function(BuildContext, String?)? linktextControllerValidator;
  // State field(s) for buttonlink widget.
  FocusNode? buttonlinkFocusNode1;
  TextEditingController? buttonlinkController1;
  String? Function(BuildContext, String?)? buttonlinkController1Validator;
  // State field(s) for socialfeedname widget.
  FocusNode? socialfeednameFocusNode;
  TextEditingController? socialfeednameController;
  String? Function(BuildContext, String?)? socialfeednameControllerValidator;
  // State field(s) for buttonlink widget.
  FocusNode? buttonlinkFocusNode2;
  TextEditingController? buttonlinkController2;
  String? Function(BuildContext, String?)? buttonlinkController2Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SocialfeedRecord? createdSocialFeed;
  // State field(s) for docText widget.
  FocusNode? docTextFocusNode;
  TextEditingController? docTextController;
  String? Function(BuildContext, String?)? docTextControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    headertextFocusNode?.dispose();
    headertextController?.dispose();

    paragraphFocusNode?.dispose();
    paragraphController?.dispose();

    tabBarCurrentController?.dispose();
    videoTitleFocusNode?.dispose();
    videoTitleController?.dispose();

    featuredsummaryFocusNode?.dispose();
    featuredsummaryController?.dispose();

    videoURLFocusNode?.dispose();
    videoURLController?.dispose();

    positionFocusNode1?.dispose();
    positionController1?.dispose();

    existingNameFocusNode1?.dispose();
    existingNameController1?.dispose();

    tabBarController1?.dispose();
    bETAdocTitleFocusNode?.dispose();
    bETAdocTitleController?.dispose();

    positionFocusNode2?.dispose();
    positionController2?.dispose();

    docLinkFocusNode?.dispose();
    docLinkController?.dispose();

    existingNameFocusNode2?.dispose();
    existingNameController2?.dispose();

    tabBarController2?.dispose();
    listViewStreamSubscriptions4.forEach((s) => s?.cancel());
    listViewPagingController4?.dispose();

    linktextFocusNode?.dispose();
    linktextController?.dispose();

    buttonlinkFocusNode1?.dispose();
    buttonlinkController1?.dispose();

    socialfeednameFocusNode?.dispose();
    socialfeednameController?.dispose();

    buttonlinkFocusNode2?.dispose();
    buttonlinkController2?.dispose();

    docTextFocusNode?.dispose();
    docTextController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, TilesRecord> setListViewController4(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController4 ??= _createListViewController4(query, parent);
    if (listViewPagingQuery4 != query) {
      listViewPagingQuery4 = query;
      listViewPagingController4?.refresh();
    }
    return listViewPagingController4!;
  }

  PagingController<DocumentSnapshot?, TilesRecord> _createListViewController4(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, TilesRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryTilesRecordPage(
          queryBuilder: (_) => listViewPagingQuery4 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions4,
          controller: controller,
          pageSize: 3,
          isStream: true,
        ),
      );
  }
}
