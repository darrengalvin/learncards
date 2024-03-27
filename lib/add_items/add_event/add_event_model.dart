import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_event_widget.dart' show AddEventWidget;
import 'package:flutter/material.dart';

class AddEventModel extends FlutterFlowModel<AddEventWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for eventTitle widget.
  FocusNode? eventTitleFocusNode;
  TextEditingController? eventTitleController;
  String? Function(BuildContext, String?)? eventTitleControllerValidator;
  // State field(s) for eventLocation widget.
  FocusNode? eventLocationFocusNode;
  TextEditingController? eventLocationController;
  String? Function(BuildContext, String?)? eventLocationControllerValidator;
  DateTime? datePicked;
  // State field(s) for eventType widget.
  String? eventTypeValue;
  FormFieldController<String>? eventTypeValueController;
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
    eventTitleFocusNode?.dispose();
    eventTitleController?.dispose();

    eventLocationFocusNode?.dispose();
    eventLocationController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
