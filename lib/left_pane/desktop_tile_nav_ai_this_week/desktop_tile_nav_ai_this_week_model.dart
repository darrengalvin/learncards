import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'desktop_tile_nav_ai_this_week_widget.dart'
    show DesktopTileNavAiThisWeekWidget;
import 'package:flutter/material.dart';

class DesktopTileNavAiThisWeekModel
    extends FlutterFlowModel<DesktopTileNavAiThisWeekWidget> {
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

  bool tileIsToday = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Firestore Query - Query a collection] action in tile widget.
  CompaniesRecord? companyQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in tile widget.
  CompaniesRecord? companyQuery11;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
