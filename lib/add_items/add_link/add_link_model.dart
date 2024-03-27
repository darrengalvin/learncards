import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_link_widget.dart' show AddLinkWidget;
import 'package:flutter/material.dart';

class AddLinkModel extends FlutterFlowModel<AddLinkWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for LinkTitle widget.
  FocusNode? linkTitleFocusNode;
  TextEditingController? linkTitleController;
  String? Function(BuildContext, String?)? linkTitleControllerValidator;
  // State field(s) for linkURL widget.
  FocusNode? linkURLFocusNode;
  TextEditingController? linkURLController;
  String? Function(BuildContext, String?)? linkURLControllerValidator;
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
    linkTitleFocusNode?.dispose();
    linkTitleController?.dispose();

    linkURLFocusNode?.dispose();
    linkURLController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
