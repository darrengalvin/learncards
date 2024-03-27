import '/backend/backend.dart';
import '/components/dynamic_toggle_icon_widget.dart';
import '/components/image_gallery_widget.dart';
import '/components/text_list_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'drawer_block_new_widget.dart' show DrawerBlockNewWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerBlockNewModel extends FlutterFlowModel<DrawerBlockNewWidget> {
  ///  Local state fields for this component.

  bool isEdit = false;

  String? app = '';

  List<String> appList = [];
  void addToAppList(String item) => appList.add(item);
  void removeFromAppList(String item) => appList.remove(item);
  void removeAtIndexFromAppList(int index) => appList.removeAt(index);
  void insertAtIndexInAppList(int index, String item) =>
      appList.insert(index, item);
  void updateAppListAtIndex(int index, Function(String) updateFn) =>
      appList[index] = updateFn(appList[index]);

  String currentId = '';

  TileBlocksRecord? blockDoc;

  ///  State fields for stateful widgets in this component.

  // Model for dynamic_ToggleIcon component.
  late DynamicToggleIconModel dynamicToggleIconModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue3;
  // State field(s) for BlockType widget.
  String? blockTypeValue;
  FormFieldController<String>? blockTypeValueController;
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
  // Model for imageGallery component.
  late ImageGalleryModel imageGalleryModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dynamicToggleIconModel =
        createModel(context, () => DynamicToggleIconModel());
    textListModel = createModel(context, () => TextListModel());
    imageGalleryModel = createModel(context, () => ImageGalleryModel());
  }

  @override
  void dispose() {
    dynamicToggleIconModel.dispose();
    tabBarController?.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    headerFocusNode?.dispose();
    headerController?.dispose();

    paragraphFocusNode?.dispose();
    paragraphController?.dispose();

    textListModel.dispose();
    imageGalleryModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
