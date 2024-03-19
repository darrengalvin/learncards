import '/backend/api_requests/api_calls.dart';
import '/components/header_container_widget.dart';
import '/components/nav_chips_widget.dart';
import '/components/side_menu_copy_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/right_pane/social_feed_new_componant/social_feed_new_componant_widget.dart';
import 'social_feed_inside_widget.dart' show SocialFeedInsideWidget;
import 'package:flutter/material.dart';

class SocialFeedInsideModel extends FlutterFlowModel<SocialFeedInsideWidget> {
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
  // Model for HeaderContainer component.
  late HeaderContainerModel headerContainerModel1;
  // Model for socialFeedNewComponant component.
  late SocialFeedNewComponantModel socialFeedNewComponantModel;
  // Model for HeaderContainer component.
  late HeaderContainerModel headerContainerModel2;
  // Model for NavChips component.
  late NavChipsModel navChipsModel;
  // Stores action output result for [Backend Call - API (New GetLiveStreamID)] action in Card widget.
  ApiCallResponse? nEWliveStreamIdResult;
  // Stores action output result for [Backend Call - API (New GetPastLiveStream)] action in Card widget.
  ApiCallResponse? nEWpastLiveStreamResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideMenuCopyModel = createModel(context, () => SideMenuCopyModel());
    sideMenuModel = createModel(context, () => SideMenuModel());
    headerContainerModel1 = createModel(context, () => HeaderContainerModel());
    socialFeedNewComponantModel =
        createModel(context, () => SocialFeedNewComponantModel());
    headerContainerModel2 = createModel(context, () => HeaderContainerModel());
    navChipsModel = createModel(context, () => NavChipsModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideMenuCopyModel.dispose();
    sideMenuModel.dispose();
    headerContainerModel1.dispose();
    socialFeedNewComponantModel.dispose();
    headerContainerModel2.dispose();
    navChipsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
