import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'panel_edit_block_widget.dart' show PanelEditBlockWidget;
import 'package:flutter/material.dart';

class PanelEditBlockModel extends FlutterFlowModel<PanelEditBlockWidget> {
  ///  Local state fields for this component.

  int callbackTab = 1;

  bool isEdit = false;

  double panelSize = 1.0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for BlockTitle widget.
  FocusNode? blockTitleFocusNode;
  TextEditingController? blockTitleController;
  String? Function(BuildContext, String?)? blockTitleControllerValidator;
  // State field(s) for BlockTypeChips widget.
  FormFieldController<List<String>>? blockTypeChipsValueController;
  String? get blockTypeChipsValue =>
      blockTypeChipsValueController?.value?.firstOrNull;
  set blockTypeChipsValue(String? val) =>
      blockTypeChipsValueController?.value = val != null ? [val] : [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    blockTitleFocusNode?.dispose();
    blockTitleController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
