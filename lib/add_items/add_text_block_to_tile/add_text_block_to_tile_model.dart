import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_text_block_to_tile_widget.dart' show AddTextBlockToTileWidget;
import 'package:flutter/material.dart';

class AddTextBlockToTileModel
    extends FlutterFlowModel<AddTextBlockToTileWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for headertext widget.
  FocusNode? headertextFocusNode;
  TextEditingController? headertextController;
  String? Function(BuildContext, String?)? headertextControllerValidator;
  // State field(s) for textblock widget.
  FocusNode? textblockFocusNode;
  TextEditingController? textblockController;
  String? Function(BuildContext, String?)? textblockControllerValidator;
  // State field(s) for videoTitle widget.
  FocusNode? videoTitleFocusNode;
  TextEditingController? videoTitleController;
  String? Function(BuildContext, String?)? videoTitleControllerValidator;
  // State field(s) for linktext widget.
  FocusNode? linktextFocusNode;
  TextEditingController? linktextController;
  String? Function(BuildContext, String?)? linktextControllerValidator;
  // State field(s) for buttonlink widget.
  FocusNode? buttonlinkFocusNode;
  TextEditingController? buttonlinkController;
  String? Function(BuildContext, String?)? buttonlinkControllerValidator;
  // State field(s) for buttontext widget.
  FocusNode? buttontextFocusNode;
  TextEditingController? buttontextController;
  String? Function(BuildContext, String?)? buttontextControllerValidator;
  // State field(s) for docText widget.
  FocusNode? docTextFocusNode;
  TextEditingController? docTextController;
  String? Function(BuildContext, String?)? docTextControllerValidator;
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
    tabBarController?.dispose();
    headertextFocusNode?.dispose();
    headertextController?.dispose();

    textblockFocusNode?.dispose();
    textblockController?.dispose();

    videoTitleFocusNode?.dispose();
    videoTitleController?.dispose();

    linktextFocusNode?.dispose();
    linktextController?.dispose();

    buttonlinkFocusNode?.dispose();
    buttonlinkController?.dispose();

    buttontextFocusNode?.dispose();
    buttontextController?.dispose();

    docTextFocusNode?.dispose();
    docTextController?.dispose();

    tiletextFocusNode?.dispose();
    tiletextController?.dispose();

    positionFocusNode?.dispose();
    positionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
