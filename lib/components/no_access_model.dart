import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'no_access_widget.dart' show NoAccessWidget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NoAccessModel extends FlutterFlowModel<NoAccessWidget> {
  ///  Local state fields for this component.

  bool? accessRequested;

  bool? tellMeMorePressed;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // State field(s) for YouEnquiry widget.
  FocusNode? youEnquiryFocusNode;
  TextEditingController? youEnquiryController;
  String? Function(BuildContext, String?)? youEnquiryControllerValidator;
  // State field(s) for YoMobile widget.
  FocusNode? yoMobileFocusNode;
  TextEditingController? yoMobileController;
  String? Function(BuildContext, String?)? yoMobileControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
    youEnquiryFocusNode?.dispose();
    youEnquiryController?.dispose();

    yoMobileFocusNode?.dispose();
    yoMobileController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
