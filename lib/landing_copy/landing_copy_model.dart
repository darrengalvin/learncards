import '/backend/api_requests/api_calls.dart';
import '/components/learn_topic_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'landing_copy_widget.dart' show LandingCopyWidget;
import 'package:flutter/material.dart';

class LandingCopyModel extends FlutterFlowModel<LandingCopyWidget> {
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for LearnTopic component.
  late LearnTopicModel learnTopicModel;
  // Stores action output result for [Backend Call - API (OpenAi Inspire Me)] action in Button widget.
  ApiCallResponse? apiResultrbg;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    learnTopicModel = createModel(context, () => LearnTopicModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    learnTopicModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
