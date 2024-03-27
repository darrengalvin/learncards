import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_new_tilea_inside_widget.dart' show CreateNewTileaInsideWidget;
import 'package:flutter/material.dart';

class CreateNewTileaInsideModel
    extends FlutterFlowModel<CreateNewTileaInsideWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for tileTitle widget.
  FocusNode? tileTitleFocusNode;
  TextEditingController? tileTitleController;
  String? Function(BuildContext, String?)? tileTitleControllerValidator;
  // State field(s) for tileSummary widget.
  FocusNode? tileSummaryFocusNode;
  TextEditingController? tileSummaryController;
  String? Function(BuildContext, String?)? tileSummaryControllerValidator;
  // State field(s) for position widget.
  FocusNode? positionFocusNode;
  TextEditingController? positionController;
  String? Function(BuildContext, String?)? positionControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for CheckboxListTile widget.

  Map<CategoriesRecord, bool> checkboxListTileValueMap = {};
  List<CategoriesRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TilesRecord? newlycreated;
  // State field(s) for featured widget.
  bool? featuredValue;
  // State field(s) for isAI widget.
  bool? isAIValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    tileTitleFocusNode?.dispose();
    tileTitleController?.dispose();

    tileSummaryFocusNode?.dispose();
    tileSummaryController?.dispose();

    positionFocusNode?.dispose();
    positionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
