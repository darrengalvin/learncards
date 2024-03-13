import '/components/text_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_text_block_widget.dart' show EditTextBlockWidget;
import 'package:flutter/material.dart';

class EditTextBlockModel extends FlutterFlowModel<EditTextBlockWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextIOptions widget.
  FormFieldController<List<String>>? textIOptionsValueController;
  String? get textIOptionsValue =>
      textIOptionsValueController?.value?.firstOrNull;
  set textIOptionsValue(String? val) =>
      textIOptionsValueController?.value = val != null ? [val] : [];
  // State field(s) for Header widget.
  FocusNode? headerFocusNode;
  TextEditingController? headerController;
  String? Function(BuildContext, String?)? headerControllerValidator;
  // State field(s) for Paragraph widget.
  FocusNode? paragraphFocusNode;
  TextEditingController? paragraphController;
  String? Function(BuildContext, String?)? paragraphControllerValidator;
  // Model for TextList component.
  late TextListModel textListModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    textListModel = createModel(context, () => TextListModel());
  }

  @override
  void dispose() {
    headerFocusNode?.dispose();
    headerController?.dispose();

    paragraphFocusNode?.dispose();
    paragraphController?.dispose();

    textListModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
