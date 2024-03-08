import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'blockv3_copy2_backup_widget.dart' show Blockv3Copy2BackupWidget;
import 'package:flutter/material.dart';

class Blockv3Copy2BackupModel
    extends FlutterFlowModel<Blockv3Copy2BackupWidget> {
  ///  Local state fields for this component.

  int viewImageIndex = 0;

  bool showEdit = false;

  FontSettingsStruct? fontSettingsWidget;
  void updateFontSettingsWidgetStruct(Function(FontSettingsStruct) updateFn) =>
      updateFn(fontSettingsWidget ??= FontSettingsStruct());

  String changedText = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextEntry widget.
  FocusNode? textEntryFocusNode;
  TextEditingController? textEntryController;
  String? Function(BuildContext, String?)? textEntryControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  TileBlocksRecord? newInlineBlockEnd;
  // State field(s) for BlockTypeChips widget.
  FormFieldController<List<String>>? blockTypeChipsValueController;
  String? get blockTypeChipsValue =>
      blockTypeChipsValueController?.value?.firstOrNull;
  set blockTypeChipsValue(String? val) =>
      blockTypeChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textEntryFocusNode?.dispose();
    textEntryController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
