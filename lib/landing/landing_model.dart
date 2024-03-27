import '/backend/backend.dart';
import '/components/learn_topic_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'landing_widget.dart' show LandingWidget;
import 'package:flutter/material.dart';

class LandingModel extends FlutterFlowModel<LandingWidget> {
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
  // Stores action output result for [Firestore Query - Query a collection] action in landing widget.
  List<CompaniesRecord>? companyQueryOnPageLoad;
  // Stores action output result for [Backend Call - Create Document] action in landing widget.
  SessionsRecord? sessionsCreated;
  // Stores action output result for [Firestore Query - Query a collection] action in landing widget.
  List<FlowiseChatsRecord>? queryFlowiseChats;
  // Model for LearnTopic component.
  late LearnTopicModel learnTopicModel;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in PinCode widget.
  List<CompaniesRecord>? allCompanies;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    learnTopicModel = createModel(context, () => LearnTopicModel());
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    learnTopicModel.dispose();
    pinCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
