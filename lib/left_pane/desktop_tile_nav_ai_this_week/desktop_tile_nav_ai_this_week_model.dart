import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/not_today_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'desktop_tile_nav_ai_this_week_widget.dart'
    show DesktopTileNavAiThisWeekWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
