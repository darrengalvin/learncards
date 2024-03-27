import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'drawer_empty_list_widget.dart' show DrawerEmptyListWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerEmptyListModel extends FlutterFlowModel<DrawerEmptyListWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ChoiceChipsType widget.
  FormFieldController<List<String>>? choiceChipsTypeValueController;
  String? get choiceChipsTypeValue =>
      choiceChipsTypeValueController?.value?.firstOrNull;
  set choiceChipsTypeValue(String? val) =>
      choiceChipsTypeValueController?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChipsLayout widget.
  FormFieldController<List<String>>? choiceChipsLayoutValueController;
  String? get choiceChipsLayoutValue =>
      choiceChipsLayoutValueController?.value?.firstOrNull;
  set choiceChipsLayoutValue(String? val) =>
      choiceChipsLayoutValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TileBlocksRecord? newBlock;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
