import '/flutter_flow/flutter_flow_util.dart';
import 'admin_history_widget.dart' show AdminHistoryWidget;
import 'package:flutter/material.dart';

class AdminHistoryModel extends FlutterFlowModel<AdminHistoryWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for linkplace widget.
  FocusNode? linkplaceFocusNode;
  TextEditingController? linkplaceController;
  String? Function(BuildContext, String?)? linkplaceControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    linkplaceFocusNode?.dispose();
    linkplaceController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
