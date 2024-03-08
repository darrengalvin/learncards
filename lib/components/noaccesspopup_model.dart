import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'noaccesspopup_widget.dart' show NoaccesspopupWidget;
import 'package:flutter/material.dart';

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
  // State field(s) for nonMemberemailAddress widget.
  FocusNode? nonMemberemailAddressFocusNode;
  TextEditingController? nonMemberemailAddressController;
  String? Function(BuildContext, String?)?
      nonMemberemailAddressControllerValidator;
  // State field(s) for NoneMemberpassword widget.
  FocusNode? noneMemberpasswordFocusNode;
  TextEditingController? noneMemberpasswordController;
  late bool noneMemberpasswordVisibility;
  String? Function(BuildContext, String?)?
      noneMemberpasswordControllerValidator;
  // State field(s) for nonMemmberpasswordConfirm widget.
  FocusNode? nonMemmberpasswordConfirmFocusNode;
  TextEditingController? nonMemmberpasswordConfirmController;
  late bool nonMemmberpasswordConfirmVisibility;
  String? Function(BuildContext, String?)?
      nonMemmberpasswordConfirmControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SessionsRecord? sessionsOnSignup;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordLoginVisibility = false;
    noneMemberpasswordVisibility = false;
    nonMemmberpasswordConfirmVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emailAddressLoginFocusNode?.dispose();
    emailAddressLoginController?.dispose();

    passwordLoginFocusNode?.dispose();
    passwordLoginController?.dispose();

    nonMemberemailAddressFocusNode?.dispose();
    nonMemberemailAddressController?.dispose();

    noneMemberpasswordFocusNode?.dispose();
    noneMemberpasswordController?.dispose();

    nonMemmberpasswordConfirmFocusNode?.dispose();
    nonMemmberpasswordConfirmController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
