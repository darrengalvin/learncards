import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/d_e_b_u_g_panel_widget.dart';
import '/components/learn_card_projects_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'demo_widget.dart' show DemoWidget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DemoModel extends FlutterFlowModel<DemoWidget> {
  ///  Local state fields for this page.

  List<int> stepCount = [];
  void addToStepCount(int item) => stepCount.add(item);
  void removeFromStepCount(int item) => stepCount.remove(item);
  void removeAtIndexFromStepCount(int index) => stepCount.removeAt(index);
  void insertAtIndexInStepCount(int index, int item) =>
      stepCount.insert(index, item);
  void updateStepCountAtIndex(int index, Function(int) updateFn) =>
      stepCount[index] = updateFn(stepCount[index]);

  bool apiResultReady = false;

  bool apiPassedOk = false;

  List<String> inspireItems = [];
  void addToInspireItems(String item) => inspireItems.add(item);
  void removeFromInspireItems(String item) => inspireItems.remove(item);
  void removeAtIndexFromInspireItems(int index) => inspireItems.removeAt(index);
  void insertAtIndexInInspireItems(int index, String item) =>
      inspireItems.insert(index, item);
  void updateInspireItemsAtIndex(int index, Function(String) updateFn) =>
      inspireItems[index] = updateFn(inspireItems[index]);

  String tempStreamingMessage = 'working..';

  bool showCompanyCode = false;

  bool showDemoCompanies = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in demo widget.
  List<CompaniesRecord>? companyQueryOnPageLoad;
  // Stores action output result for [Backend Call - Create Document] action in demo widget.
  SessionsRecord? sessionsCreated;
  // Stores action output result for [Firestore Query - Query a collection] action in demo widget.
  List<FlowiseChatsRecord>? queryFlowiseChats;
  // Stores action output result for [Backend Call - Create Document] action in demo widget.
  FlowiseChatsRecord? initialchatCreated;
  // Stores action output result for [Firestore Query - Query a collection] action in demo widget.
  List<SessionsRecord>? sessionsQueriedAain;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in PinCode widget.
  List<CompaniesRecord>? allCompanies;
  // Model for DEBUGPanel component.
  late DEBUGPanelModel dEBUGPanelModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
    dEBUGPanelModel = createModel(context, () => DEBUGPanelModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pinCodeController?.dispose();
    dEBUGPanelModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
