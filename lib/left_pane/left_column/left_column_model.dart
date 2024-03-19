import '/backend/backend.dart';
import '/components/learn_cards_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/left_pane/desktop_tile_nav_a_your_saved/desktop_tile_nav_a_your_saved_widget.dart';
import '/left_pane/desktop_tile_nav_ai_this_week/desktop_tile_nav_ai_this_week_widget.dart';
import '/left_pane/event_app_tiles/event_app_tiles_widget.dart';
import '/left_pane/main_app_tiles/main_app_tiles_widget.dart';
import 'left_column_widget.dart' show LeftColumnWidget;
import 'package:flutter/material.dart';

class LeftColumnModel extends FlutterFlowModel<LeftColumnWidget> {
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

  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  CompaniesRecord? companycheckforbottomchat;
  // Model for DesktopTileNavAi-ThisWeek component.
  late DesktopTileNavAiThisWeekModel desktopTileNavAiThisWeekModel;
  // Model for DesktopTileNavA-YourSaved component.
  late DesktopTileNavAYourSavedModel desktopTileNavAYourSavedModel;
  // Model for MainAppTiles component.
  late MainAppTilesModel mainAppTilesModel;
  // Model for learnCards component.
  late LearnCardsModel learnCardsModel;
  // Model for EventAppTiles component.
  late EventAppTilesModel eventAppTilesModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    desktopTileNavAiThisWeekModel =
        createModel(context, () => DesktopTileNavAiThisWeekModel());
    desktopTileNavAYourSavedModel =
        createModel(context, () => DesktopTileNavAYourSavedModel());
    mainAppTilesModel = createModel(context, () => MainAppTilesModel());
    learnCardsModel = createModel(context, () => LearnCardsModel());
    eventAppTilesModel = createModel(context, () => EventAppTilesModel());
  }

  @override
  void dispose() {
    desktopTileNavAiThisWeekModel.dispose();
    desktopTileNavAYourSavedModel.dispose();
    mainAppTilesModel.dispose();
    learnCardsModel.dispose();
    eventAppTilesModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
