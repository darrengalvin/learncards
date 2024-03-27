import '/flutter_flow/flutter_flow_util.dart';
import 'api_stream_chats_widget.dart' show ApiStreamChatsWidget;
import 'package:flutter/material.dart';

class ApiStreamChatsModel extends FlutterFlowModel<ApiStreamChatsWidget> {
  ///  Local state fields for this page.

  Color? pageColor = const Color(0xff1c4494);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - convertListToJson] action in apiStreamChats widget.
  List<dynamic>? jsonOutput2;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for AskTheQuestion widget.
  FocusNode? askTheQuestionFocusNode;
  TextEditingController? askTheQuestionController;
  String? Function(BuildContext, String?)? askTheQuestionControllerValidator;
  // Stores action output result for [Custom Action - convertListToJson] action in IconButton widget.
  List<dynamic>? jsonOutput;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
    listViewController?.dispose();
    askTheQuestionFocusNode?.dispose();
    askTheQuestionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
