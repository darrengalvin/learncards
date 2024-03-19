import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'manage_member_levels_widget.dart' show ManageMemberLevelsWidget;
import 'package:flutter/material.dart';

class ManageMemberLevelsModel
    extends FlutterFlowModel<ManageMemberLevelsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CheckboxListTile widget.

  Map<CategoriesRecord, bool> checkboxListTileValueMap = {};
  List<CategoriesRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for levelName widget.
  FocusNode? levelNameFocusNode;
  TextEditingController? levelNameController;
  String? Function(BuildContext, String?)? levelNameControllerValidator;
  // State field(s) for accessPendingMessage widget.
  FocusNode? accessPendingMessageFocusNode;
  TextEditingController? accessPendingMessageController;
  String? Function(BuildContext, String?)?
      accessPendingMessageControllerValidator;
  // State field(s) for noAccessMessage widget.
  FocusNode? noAccessMessageFocusNode;
  TextEditingController? noAccessMessageController;
  String? Function(BuildContext, String?)? noAccessMessageControllerValidator;
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
  void dispose() {
    unfocusNode.dispose();
    levelNameFocusNode?.dispose();
    levelNameController?.dispose();

    accessPendingMessageFocusNode?.dispose();
    accessPendingMessageController?.dispose();

    noAccessMessageFocusNode?.dispose();
    noAccessMessageController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
