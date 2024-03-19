import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'drawer_empty_list_widget.dart' show DrawerEmptyListWidget;
import 'package:flutter/material.dart';

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
