import '/backend/backend.dart';
import '/components/document_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'blockv3_widget.dart' show Blockv3Widget;
import 'package:flutter/material.dart';

class Blockv3Model extends FlutterFlowModel<Blockv3Widget> {
  ///  Local state fields for this component.

  int viewImageIndex = 0;

  bool showEdit = false;

  FontSettingsStruct? fontSettingsWidget;
  void updateFontSettingsWidgetStruct(Function(FontSettingsStruct) updateFn) =>
      updateFn(fontSettingsWidget ??= FontSettingsStruct());

  String changedText = '';

  bool showEmptyImageUpload = false;

  int? quizCurrentID = 1;

  String? correctAnswer = '';

  double? countDownTime = 30.0;

  LearnCardsRecord? selectedLearnCard;

  bool questionReady = false;

  Color? cardBackgroundColor;

  bool? learnCardsActive;

  ///  State fields for stateful widgets in this component.

  // State field(s) for BlockTypeChips widget.
  FormFieldController<List<String>>? blockTypeChipsValueController;
  String? get blockTypeChipsValue =>
      blockTypeChipsValueController?.value?.firstOrNull;
  set blockTypeChipsValue(String? val) =>
      blockTypeChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  TileBlocksRecord? newInlineBlockEnd;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for tesitEdit widget.
  FocusNode? tesitEditFocusNode;
  TextEditingController? tesitEditController;
  String? Function(BuildContext, String?)? tesitEditControllerValidator;
  // Model for Document component.
  late DocumentModel documentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    documentModel = createModel(context, () => DocumentModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    tesitEditFocusNode?.dispose();
    tesitEditController?.dispose();

    documentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
