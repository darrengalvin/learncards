import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'flowise_test_widget.dart' show FlowiseTestWidget;
import 'package:flutter/material.dart';

class FlowiseTestModel extends FlutterFlowModel<FlowiseTestWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Flowise API Call)] action in Button widget.
  ApiCallResponse? apiResult9jb;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<SessionsRecord>? sessionsQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CompaniesRecord>? companiesQuery;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
