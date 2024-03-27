import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'flowise_test_widget.dart' show FlowiseTestWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
