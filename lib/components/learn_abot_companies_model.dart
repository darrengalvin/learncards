import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'learn_abot_companies_widget.dart' show LearnAbotCompaniesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LearnAbotCompaniesModel
    extends FlutterFlowModel<LearnAbotCompaniesWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for contactName widget.
  FocusNode? contactNameFocusNode;
  TextEditingController? contactNameController;
  String? Function(BuildContext, String?)? contactNameControllerValidator;
  // State field(s) for companyName widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameController;
  String? Function(BuildContext, String?)? companyNameControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for websiteAddress widget.
  FocusNode? websiteAddressFocusNode;
  TextEditingController? websiteAddressController;
  String? Function(BuildContext, String?)? websiteAddressControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SalesLeadsRecord? createdLead;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    contactNameFocusNode?.dispose();
    contactNameController?.dispose();

    companyNameFocusNode?.dispose();
    companyNameController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();

    websiteAddressFocusNode?.dispose();
    websiteAddressController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
