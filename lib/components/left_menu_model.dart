import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'left_menu_widget.dart' show LeftMenuWidget;
import 'package:flutter/material.dart';

class LeftMenuModel extends FlutterFlowModel<LeftMenuWidget> {
  ///  Local state fields for this component.

  bool showOpen = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompaniesRecord? companiesForSetup;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompaniesRecord? companyInLeftMenu;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
