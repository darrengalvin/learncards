import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'api_stream_widget.dart' show ApiStreamWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ApiStreamModel extends FlutterFlowModel<ApiStreamWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for AskTheQuestion widget.
  FocusNode? askTheQuestionFocusNode;
  TextEditingController? askTheQuestionController;
  String? Function(BuildContext, String?)? askTheQuestionControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    askTheQuestionFocusNode?.dispose();
    askTheQuestionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
