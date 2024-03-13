import '/components/header_container_widget.dart';
import '/components/side_menu_copy_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'socialfeedslist_widget.dart' show SocialfeedslistWidget;
import 'package:flutter/material.dart';

class SocialfeedslistModel extends FlutterFlowModel<SocialfeedslistWidget> {
  ///  Local state fields for this page.

  bool? featuredready;

  DocumentReference? selectedfeatureref;

  String? recordedmp3;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // Model for sideMenuCopy component.
  late SideMenuCopyModel sideMenuCopyModel;
  // Model for HeaderContainer component.
  late HeaderContainerModel headerContainerModel;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // Model for sideMenumain.
  late SideMenuModel sideMenumainModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideMenuCopyModel = createModel(context, () => SideMenuCopyModel());
    headerContainerModel = createModel(context, () => HeaderContainerModel());
    sideMenumainModel = createModel(context, () => SideMenuModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideMenuCopyModel.dispose();
    headerContainerModel.dispose();
    sideMenumainModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
