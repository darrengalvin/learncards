import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/header_container_widget.dart';
import '/components/nav_chips_widget.dart';
import '/components/no_access_widget.dart';
import '/components/side_menu_copy_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/search_pages/live_video/broadcast_name_input/broadcast_name_input_widget.dart';
import '/social_feed/reply_to_post/reply_to_post_widget.dart';
import '/testpage/components/post_comment_functions/post_comment_functions_widget.dart';
import '/testpage/components/post_functions/post_functions_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'social_feed_copy_widget.dart' show SocialFeedCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SocialFeedCopyModel extends FlutterFlowModel<SocialFeedCopyWidget> {
  ///  Local state fields for this page.

  bool showlivefeed = false;

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
  late HeaderContainerModel headerContainerModel;
  // Stores action output result for [Backend Call - API (New GetLiveStreamID)] action in Card widget.
  ApiCallResponse? nEWliveStreamIdResultre;
  // Stores action output result for [Backend Call - API (New GetPastLiveStream)] action in Card widget.
  ApiCallResponse? nEWpastLiveStreamResultRE;
  // Model for NavChips component.
  late NavChipsModel navChipsModel;
  // Model for NoAccess component.
  late NoAccessModel noAccessModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SocialpostsRecord? createdpost;
  // Stores action output result for [Backend Call - API (New GetLiveStreamID)] action in Card widget.
  ApiCallResponse? nEWliveStreamIdResult;
  // Stores action output result for [Backend Call - API (New GetPastLiveStream)] action in Card widget.
  ApiCallResponse? nEWpastLiveStreamResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideMenuCopyModel = createModel(context, () => SideMenuCopyModel());
    sideMenuModel = createModel(context, () => SideMenuModel());
    headerContainerModel = createModel(context, () => HeaderContainerModel());
    navChipsModel = createModel(context, () => NavChipsModel());
    noAccessModel = createModel(context, () => NoAccessModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideMenuCopyModel.dispose();
    sideMenuModel.dispose();
    headerContainerModel.dispose();
    navChipsModel.dispose();
    noAccessModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
