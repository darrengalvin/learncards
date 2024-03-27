import '/flutter_flow/flutter_flow_util.dart';
import 'app_entry_new_widget.dart' show AppEntryNewWidget;
import 'package:flutter/material.dart';

class AppEntryNewModel extends FlutterFlowModel<AppEntryNewWidget> {
  ///  Local state fields for this component.

  bool? featuredready;

  String? appEntriesResponse;

  String? appEntriesQuestion;

  String? appEntriesVideo;

  bool? showNextTile;

  bool? hideNextTile;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Reply widget.
  FocusNode? replyFocusNode;
  TextEditingController? replyController;
  String? Function(BuildContext, String?)? replyControllerValidator;
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleController;
  String? Function(BuildContext, String?)? titleControllerValidator;
  // State field(s) for qnotshown widget.
  FocusNode? qnotshownFocusNode;
  TextEditingController? qnotshownController;
  String? Function(BuildContext, String?)? qnotshownControllerValidator;
  // State field(s) for videurl widget.
  FocusNode? videurlFocusNode;
  TextEditingController? videurlController;
  String? Function(BuildContext, String?)? videurlControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    replyFocusNode?.dispose();
    replyController?.dispose();

    titleFocusNode?.dispose();
    titleController?.dispose();

    qnotshownFocusNode?.dispose();
    qnotshownController?.dispose();

    videurlFocusNode?.dispose();
    videurlController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
