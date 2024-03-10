import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'addfeaturedpage_widget.dart' show AddfeaturedpageWidget;
import 'package:flutter/material.dart';

class AddfeaturedpageModel extends FlutterFlowModel<AddfeaturedpageWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for featuredtitle widget.
  FocusNode? featuredtitleFocusNode;
  TextEditingController? featuredtitleController;
  String? Function(BuildContext, String?)? featuredtitleControllerValidator;
  // State field(s) for featuredsummary widget.
  FocusNode? featuredsummaryFocusNode;
  TextEditingController? featuredsummaryController;
  String? Function(BuildContext, String?)? featuredsummaryControllerValidator;
  // State field(s) for featuredbodytext widget.
  FocusNode? featuredbodytextFocusNode;
  TextEditingController? featuredbodytextController;
  String? Function(BuildContext, String?)? featuredbodytextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for CheckboxListTile widget.

  Map<CategoriesRecord, bool> checkboxListTileValueMap = {};
  List<CategoriesRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    featuredtitleFocusNode?.dispose();
    featuredtitleController?.dispose();

    featuredsummaryFocusNode?.dispose();
    featuredsummaryController?.dispose();

    featuredbodytextFocusNode?.dispose();
    featuredbodytextController?.dispose();

    textFieldFocusNode?.dispose();
    textController4?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
