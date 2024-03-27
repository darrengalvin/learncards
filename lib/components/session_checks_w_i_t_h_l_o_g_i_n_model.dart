import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'session_checks_w_i_t_h_l_o_g_i_n_widget.dart'
    show SessionChecksWITHLOGINWidget;
import 'package:flutter/material.dart';

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
