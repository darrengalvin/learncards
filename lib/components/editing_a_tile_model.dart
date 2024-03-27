import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editing_a_tile_widget.dart' show EditingATileWidget;
import 'package:flutter/material.dart';

class EditingATileModel extends FlutterFlowModel<EditingATileWidget> {
  ///  Local state fields for this component.

  bool showTypes = false;

  bool showItems = false;

  bool belowAndAbove = false;

  double? tempFontSize = 12.0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for BlockTypeChips widget.
  FormFieldController<List<String>>? blockTypeChipsValueController;
  String? get blockTypeChipsValue =>
      blockTypeChipsValueController?.value?.firstOrNull;
  set blockTypeChipsValue(String? val) =>
      blockTypeChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for theText widget.
  FocusNode? theTextFocusNode;
  TextEditingController? theTextController;
  String? Function(BuildContext, String?)? theTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for tiletext widget.
  FocusNode? tiletextFocusNode;
  TextEditingController? tiletextController;
  String? Function(BuildContext, String?)? tiletextControllerValidator;
  // State field(s) for position widget.
  FocusNode? positionFocusNode;
  TextEditingController? positionController;
  String? Function(BuildContext, String?)? positionControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    theTextFocusNode?.dispose();
    theTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    tiletextFocusNode?.dispose();
    tiletextController?.dispose();

    positionFocusNode?.dispose();
    positionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
