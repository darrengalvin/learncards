import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_link_in_tile_widget.dart' show AddLinkInTileWidget;
import 'package:flutter/material.dart';

class AddLinkInTileModel extends FlutterFlowModel<AddLinkInTileWidget> {
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

  Map<CategoriesRecord, bool> checkboxListTileValueMap = {};
  List<CategoriesRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
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
