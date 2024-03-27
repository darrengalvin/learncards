import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'custom_form_widget.dart' show CustomFormWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomFormModel extends FlutterFlowModel<CustomFormWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for whereNow widget.
  FocusNode? whereNowFocusNode;
  TextEditingController? whereNowController;
  String? Function(BuildContext, String?)? whereNowControllerValidator;
  // State field(s) for numberOfStudents widget.
  FocusNode? numberOfStudentsFocusNode;
  TextEditingController? numberOfStudentsController;
  String? Function(BuildContext, String?)? numberOfStudentsControllerValidator;
  // State field(s) for aveTO widget.
  FocusNode? aveTOFocusNode;
  TextEditingController? aveTOController;
  String? Function(BuildContext, String?)? aveTOControllerValidator;
  // State field(s) for fullPartTime widget.
  String? fullPartTimeValue;
  FormFieldController<String>? fullPartTimeValueController;
  // State field(s) for locationType widget.
  FocusNode? locationTypeFocusNode;
  TextEditingController? locationTypeController;
  String? Function(BuildContext, String?)? locationTypeControllerValidator;
  // State field(s) for goals widget.
  FocusNode? goalsFocusNode;
  TextEditingController? goalsController;
  String? Function(BuildContext, String?)? goalsControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    whereNowFocusNode?.dispose();
    whereNowController?.dispose();

    numberOfStudentsFocusNode?.dispose();
    numberOfStudentsController?.dispose();

    aveTOFocusNode?.dispose();
    aveTOController?.dispose();

    locationTypeFocusNode?.dispose();
    locationTypeController?.dispose();

    goalsFocusNode?.dispose();
    goalsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
