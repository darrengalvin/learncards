import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dynamic_toggle_icon_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'drawer_block_new_copy_widget.dart' show DrawerBlockNewCopyWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerBlockNewCopyModel
    extends FlutterFlowModel<DrawerBlockNewCopyWidget> {
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

  String? currentId = '';

  ///  State fields for stateful widgets in this component.

  // Model for dynamic_ToggleIcon component.
  late DynamicToggleIconModel dynamicToggleIconModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue3;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AppsRecord? newApp;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AppsRecord? newAppa;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dynamicToggleIconModel =
        createModel(context, () => DynamicToggleIconModel());
  }

  @override
  void dispose() {
    dynamicToggleIconModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
