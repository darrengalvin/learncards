import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'desktop_tile_nav_a_your_saved_widget.dart'
    show DesktopTileNavAYourSavedWidget;
import 'package:flutter/material.dart';

class DesktopTileNavAYourSavedModel
    extends FlutterFlowModel<DesktopTileNavAYourSavedWidget> {
  ///  Local state fields for this component.

  List<Tilesv2Record> listOfQuery = [];
  void addToListOfQuery(Tilesv2Record item) => listOfQuery.add(item);
  void removeFromListOfQuery(Tilesv2Record item) => listOfQuery.remove(item);
  void removeAtIndexFromListOfQuery(int index) => listOfQuery.removeAt(index);
  void insertAtIndexInListOfQuery(int index, Tilesv2Record item) =>
      listOfQuery.insert(index, item);
  void updateListOfQueryAtIndex(int index, Function(Tilesv2Record) updateFn) =>
      listOfQuery[index] = updateFn(listOfQuery[index]);

  int? waitCounter;

  bool exitLoop = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in tile widget.
  CompaniesRecord? companyQuery;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
