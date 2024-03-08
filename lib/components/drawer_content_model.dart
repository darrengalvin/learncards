import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'drawer_content_widget.dart' show DrawerContentWidget;
import 'package:flutter/material.dart';

class DrawerContentModel extends FlutterFlowModel<DrawerContentWidget> {
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

  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
