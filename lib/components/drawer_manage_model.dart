import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/drawer_content_widget.dart';
import '/components/dynamic_toggle_icon_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'drawer_manage_widget.dart' show DrawerManageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerManageModel extends FlutterFlowModel<DrawerManageWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Model for dynamic_ToggleIcon component.
  late DynamicToggleIconModel dynamicToggleIconModel;
  // Model for drawer_Content component.
  late DrawerContentModel drawerContentModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDownType widget.
  int? dropDownTypeValue;
  FormFieldController<int>? dropDownTypeValueController;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for DropDownGroup widget.
  String? dropDownGroupValue;
  FormFieldController<String>? dropDownGroupValueController;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue3;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  Tilesv2Record? newTile;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dynamicToggleIconModel =
        createModel(context, () => DynamicToggleIconModel());
    drawerContentModel = createModel(context, () => DrawerContentModel());
  }

  @override
  void dispose() {
    dynamicToggleIconModel.dispose();
    drawerContentModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
