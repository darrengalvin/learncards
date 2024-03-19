import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'main_app_tiles_widget.dart' show MainAppTilesWidget;
import 'package:flutter/material.dart';

class MainAppTilesModel extends FlutterFlowModel<MainAppTilesWidget> {
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

  // Stores action output result for [Firestore Query - Query a collection] action in MainAppTiles widget.
  List<TilesRecord>? tilesOriginal;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
