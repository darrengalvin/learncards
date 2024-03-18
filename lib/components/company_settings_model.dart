import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'company_settings_widget.dart' show CompanySettingsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompanySettingsModel extends FlutterFlowModel<CompanySettingsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for welcomeIntroPrompt widget.
  FocusNode? welcomeIntroPromptFocusNode1;
  TextEditingController? welcomeIntroPromptController1;
  String? Function(BuildContext, String?)?
      welcomeIntroPromptController1Validator;
  // State field(s) for userGatherData widget.
  FocusNode? userGatherDataFocusNode;
  TextEditingController? userGatherDataController;
  String? Function(BuildContext, String?)? userGatherDataControllerValidator;
  // State field(s) for getTilesPrompt widget.
  FocusNode? getTilesPromptFocusNode;
  TextEditingController? getTilesPromptController;
  String? Function(BuildContext, String?)? getTilesPromptControllerValidator;
  // State field(s) for getTileContentPart1 widget.
  FocusNode? getTileContentPart1FocusNode;
  TextEditingController? getTileContentPart1Controller;
  String? Function(BuildContext, String?)?
      getTileContentPart1ControllerValidator;
  // State field(s) for getTileContent2 widget.
  FocusNode? getTileContent2FocusNode;
  TextEditingController? getTileContent2Controller;
  String? Function(BuildContext, String?)? getTileContent2ControllerValidator;
  // State field(s) for welcomeIntroPrompt widget.
  FocusNode? welcomeIntroPromptFocusNode2;
  TextEditingController? welcomeIntroPromptController2;
  String? Function(BuildContext, String?)?
      welcomeIntroPromptController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    welcomeIntroPromptFocusNode1?.dispose();
    welcomeIntroPromptController1?.dispose();

    userGatherDataFocusNode?.dispose();
    userGatherDataController?.dispose();

    getTilesPromptFocusNode?.dispose();
    getTilesPromptController?.dispose();

    getTileContentPart1FocusNode?.dispose();
    getTileContentPart1Controller?.dispose();

    getTileContent2FocusNode?.dispose();
    getTileContent2Controller?.dispose();

    welcomeIntroPromptFocusNode2?.dispose();
    welcomeIntroPromptController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
