import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_new_tile_widget.dart' show CreateNewTileWidget;
import 'package:flutter/material.dart';

class CreateNewTileModel extends FlutterFlowModel<CreateNewTileWidget> {
  ///  Local state fields for this component.

  DocumentReference? selectedUsers;

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
  // State field(s) for PositionID widget.
  FocusNode? positionIDFocusNode;
  TextEditingController? positionIDController;
  String? Function(BuildContext, String?)? positionIDControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TilesRecord? newlycreatedtile;
  // State field(s) for CheckboxListTile widget.

  Map<CategoriesRecord, bool> checkboxListTileValueMap1 = {};
  List<CategoriesRecord> get checkboxListTileCheckedItems1 =>
      checkboxListTileValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for isFeatured widget.
  bool? isFeaturedValue;
  // State field(s) for isAI widget.
  bool? isAIValue;
  // State field(s) for ispush widget.
  bool? ispushValue;
  // State field(s) for CheckboxListTile widget.

  Map<UsersRecord, bool> checkboxListTileValueMap2 = {};
  List<UsersRecord> get checkboxListTileCheckedItems2 =>
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
    tileTitleFocusNode?.dispose();
    tileTitleController?.dispose();

    tileSummaryFocusNode?.dispose();
    tileSummaryController?.dispose();

    positionIDFocusNode?.dispose();
    positionIDController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
