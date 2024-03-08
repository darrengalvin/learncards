import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'blockv4_widget.dart' show Blockv4Widget;
import 'package:flutter/material.dart';

class Blockv4Model extends FlutterFlowModel<Blockv4Widget> {
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

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
