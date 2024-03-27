import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'noaccesspopup_widget.dart' show NoaccesspopupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NoaccesspopupModel extends FlutterFlowModel<NoaccesspopupWidget> {
  ///  Local state fields for this component.

  bool? accessRequested;

  bool? tellMeMorePressed;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

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
    tabBarController?.dispose();
    emailAddressLoginFocusNode?.dispose();
    emailAddressLoginController?.dispose();

    passwordLoginFocusNode?.dispose();
    passwordLoginController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
