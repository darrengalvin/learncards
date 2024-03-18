import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'create_new_tile_beta_widget.dart' show CreateNewTileBetaWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateNewTileBetaModel extends FlutterFlowModel<CreateNewTileBetaWidget> {
  ///  Local state fields for this component.

  DocumentReference? selectedUsers;

  List<DocumentReference> selectedGroups = [];
  void addToSelectedGroups(DocumentReference item) => selectedGroups.add(item);
  void removeFromSelectedGroups(DocumentReference item) =>
      selectedGroups.remove(item);
  void removeAtIndexFromSelectedGroups(int index) =>
      selectedGroups.removeAt(index);
  void insertAtIndexInSelectedGroups(int index, DocumentReference item) =>
      selectedGroups.insert(index, item);
  void updateSelectedGroupsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      selectedGroups[index] = updateFn(selectedGroups[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
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

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for isFeatured widget.
  bool? isFeaturedValue1;
  // State field(s) for isFeatured widget.
  bool? isFeaturedValue2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TilesRecord? newlycreatedtile;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleTitleFocusNode?.dispose();
    titleTitleController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
