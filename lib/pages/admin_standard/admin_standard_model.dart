import '/flutter_flow/flutter_flow_util.dart';
import 'admin_standard_widget.dart' show AdminStandardWidget;
import 'package:flutter/material.dart';

class AdminStandardModel extends FlutterFlowModel<AdminStandardWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for linkplace widget.
  FocusNode? linkplaceFocusNode;
  TextEditingController? linkplaceController;
  String? Function(BuildContext, String?)? linkplaceControllerValidator;
  String currentPageLink = '';
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for Switch widget.
  bool? switchValue4;
  // State field(s) for Switch widget.
  bool? switchValue5;
  // State field(s) for Switch widget.
  bool? switchValue6;
  // State field(s) for Switch widget.
  bool? switchValue7;

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
