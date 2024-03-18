import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'session_checks_w_i_t_h_l_o_g_i_n_widget.dart'
    show SessionChecksWITHLOGINWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SessionChecksWITHLOGINModel
    extends FlutterFlowModel<SessionChecksWITHLOGINWidget> {
  ///  Local state fields for this component.

  String loginCheckMessage =
      'The password you are using for your ISP account does not match the password you signed up to the app with. Maybe you have changed it. Please try entering your app password here instead.   Or use the format password facility.';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in SessionChecks-WITHLOGIN widget.
  SessionsRecord? checksQueriesSessions;
  // State field(s) for emailAddress_Login widget.
  FocusNode? emailAddressLoginFocusNode;
  TextEditingController? emailAddressLoginController;
  String? Function(BuildContext, String?)? emailAddressLoginControllerValidator;
  // State field(s) for password_Login widget.
  FocusNode? passwordLoginFocusNode;
  TextEditingController? passwordLoginController;
  late bool passwordLoginVisibility;
  String? Function(BuildContext, String?)? passwordLoginControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button-Login widget.
  SessionsRecord? sessionsOnLogin;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordLoginVisibility = false;
  }

  @override
  void dispose() {
    emailAddressLoginFocusNode?.dispose();
    emailAddressLoginController?.dispose();

    passwordLoginFocusNode?.dispose();
    passwordLoginController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
