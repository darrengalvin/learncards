import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'drawer_content_block_copy_widget.dart'
    show DrawerContentBlockCopyWidget;
import 'package:flutter/material.dart';

class DrawerContentBlockCopyModel
    extends FlutterFlowModel<DrawerContentBlockCopyWidget> {
  ///  Local state fields for this component.

  int callbackTab = 1;

  ///  State fields for stateful widgets in this component.

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
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
