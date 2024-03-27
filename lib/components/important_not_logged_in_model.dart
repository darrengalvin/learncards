import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'important_not_logged_in_widget.dart' show ImportantNotLoggedInWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ImportantNotLoggedInModel
    extends FlutterFlowModel<ImportantNotLoggedInWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? emailTextController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for password widget.
  final passwordKey = GlobalKey();
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  String? passwordSelectedOption;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for confirmPassowrd widget.
  final confirmPassowrdKey = GlobalKey();
  FocusNode? confirmPassowrdFocusNode;
  TextEditingController? confirmPassowrdController;
  String? confirmPassowrdSelectedOption;
  late bool confirmPassowrdVisibility;
  String? Function(BuildContext, String?)? confirmPassowrdControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  LogsRecord? logsQuery;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    confirmPassowrdVisibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();

    passwordFocusNode?.dispose();

    confirmPassowrdFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
