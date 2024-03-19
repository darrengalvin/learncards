import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'blockv31_widget.dart' show Blockv31Widget;
import 'package:flutter/material.dart';

class Blockv31Model extends FlutterFlowModel<Blockv31Widget> {
  ///  Local state fields for this component.

  int viewImageIndex = 0;

  bool showEdit = false;

  FontSettingsStruct? fontSettingsWidget;
  void updateFontSettingsWidgetStruct(Function(FontSettingsStruct) updateFn) =>
      updateFn(fontSettingsWidget ??= FontSettingsStruct());

  String changedText = '';

  bool showEmptyImageUpload = false;

  int? quizCurrentID = 1;

  String? correctAnswer = '';

  double? countDownTime = 30.0;

  LearnCardsRecord? selectedLearnCard;

  bool questionReady = false;

  Color? cardBackgroundColor;

  bool? learnCardsActive;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
