import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_event_widget.dart' show AddEventWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
