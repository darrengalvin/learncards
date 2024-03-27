import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'broadcast_name_input_widget.dart' show BroadcastNameInputWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BroadcastNameInputModel
    extends FlutterFlowModel<BroadcastNameInputWidget> {
  ///  Local state fields for this component.

  List<CategoriesRecord> selectedCat = [];
  void addToSelectedCat(CategoriesRecord item) => selectedCat.add(item);
  void removeFromSelectedCat(CategoriesRecord item) => selectedCat.remove(item);
  void removeAtIndexFromSelectedCat(int index) => selectedCat.removeAt(index);
  void insertAtIndexInSelectedCat(int index, CategoriesRecord item) =>
      selectedCat.insert(index, item);
  void updateSelectedCatAtIndex(
          int index, Function(CategoriesRecord) updateFn) =>
      selectedCat[index] = updateFn(selectedCat[index]);

  List<DocumentReference> selectedcatRef = [];
  void addToSelectedcatRef(DocumentReference item) => selectedcatRef.add(item);
  void removeFromSelectedcatRef(DocumentReference item) =>
      selectedcatRef.remove(item);
  void removeAtIndexFromSelectedcatRef(int index) =>
      selectedcatRef.removeAt(index);
  void insertAtIndexInSelectedcatRef(int index, DocumentReference item) =>
      selectedcatRef.insert(index, item);
  void updateSelectedcatRefAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      selectedcatRef[index] = updateFn(selectedcatRef[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

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
