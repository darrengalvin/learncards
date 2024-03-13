import '/flutter_flow/flutter_flow_util.dart';
import 'edit_link_in_tile_widget.dart' show EditLinkInTileWidget;
import 'package:flutter/material.dart';

class EditLinkInTileModel extends FlutterFlowModel<EditLinkInTileWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for LinkTitle widget.
  FocusNode? linkTitleFocusNode;
  TextEditingController? linkTitleController;
  String? Function(BuildContext, String?)? linkTitleControllerValidator;
  // State field(s) for linkURL widget.
  FocusNode? linkURLFocusNode;
  TextEditingController? linkURLController;
  String? Function(BuildContext, String?)? linkURLControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    linkTitleFocusNode?.dispose();
    linkTitleController?.dispose();

    linkURLFocusNode?.dispose();
    linkURLController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
