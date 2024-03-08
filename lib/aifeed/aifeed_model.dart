import '/backend/api_requests/api_calls.dart';
import '/components/side_menu_copy_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'aifeed_widget.dart' show AifeedWidget;
import 'package:flutter/material.dart';

class AifeedModel extends FlutterFlowModel<AifeedWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // Model for sideMenuCopy component.
  late SideMenuCopyModel sideMenuCopyModel;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // Model for sideMenu component.
  late SideMenuModel sideMenuModel;
  // State field(s) for askG widget.
  FocusNode? askGFocusNode;
  TextEditingController? askGController;
  String? Function(BuildContext, String?)? askGControllerValidator;
  // Stores action output result for [Backend Call - API (openaidavinci)] action in Button widget.
  ApiCallResponse? yesok;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideMenuCopyModel = createModel(context, () => SideMenuCopyModel());
    sideMenuModel = createModel(context, () => SideMenuModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideMenuCopyModel.dispose();
    sideMenuModel.dispose();
    askGFocusNode?.dispose();
    askGController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
