import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/header_container_widget.dart';
import '/components/side_menu_copy_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'package:badges/badges.dart' as badges;
import 'support_widget.dart' show SupportWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SupportModel extends FlutterFlowModel<SupportWidget> {
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
  // State field(s) for type widget.
  String? typeValue;
  FormFieldController<String>? typeValueController;
  // State field(s) for whichpage widget.
  FocusNode? whichpageFocusNode;
  TextEditingController? whichpageController;
  String? Function(BuildContext, String?)? whichpageControllerValidator;
  // State field(s) for toreplicate widget.
  FocusNode? toreplicateFocusNode;
  TextEditingController? toreplicateController;
  String? Function(BuildContext, String?)? toreplicateControllerValidator;
  // State field(s) for feedback widget.
  FocusNode? feedbackFocusNode;
  TextEditingController? feedbackController;
  String? Function(BuildContext, String?)? feedbackControllerValidator;
  // State field(s) for improve widget.
  FocusNode? improveFocusNode;
  TextEditingController? improveController;
  String? Function(BuildContext, String?)? improveControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  BugreportingRecord? createdSupport;
  // Stores action output result for [Backend Call - API (make bug Notion )] action in Button widget.
  ApiCallResponse? apiResulto0b;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideMenuCopyModel = createModel(context, () => SideMenuCopyModel());
    sideMenuModel = createModel(context, () => SideMenuModel());
    headerContainerModel = createModel(context, () => HeaderContainerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideMenuCopyModel.dispose();
    sideMenuModel.dispose();
    headerContainerModel.dispose();
    whichpageFocusNode?.dispose();
    whichpageController?.dispose();

    toreplicateFocusNode?.dispose();
    toreplicateController?.dispose();

    feedbackFocusNode?.dispose();
    feedbackController?.dispose();

    improveFocusNode?.dispose();
    improveController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
