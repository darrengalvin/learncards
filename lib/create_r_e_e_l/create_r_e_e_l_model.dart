import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_r_e_e_l_widget.dart' show CreateREELWidget;
import 'package:flutter/material.dart';

class CreateREELModel extends FlutterFlowModel<CreateREELWidget> {
  ///  Local state fields for this page.

  DocumentReference? selectedtile;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for titleTitle widget.
  FocusNode? titleTitleFocusNode;
  TextEditingController? titleTitleController;
  String? Function(BuildContext, String?)? titleTitleControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Checkbox widget.

  Map<TilesRecord, bool> checkboxValueMap = {};
  List<TilesRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    titleTitleFocusNode?.dispose();
    titleTitleController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
