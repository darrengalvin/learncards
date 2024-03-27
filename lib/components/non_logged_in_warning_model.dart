import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'non_logged_in_warning_widget.dart' show NonLoggedInWarningWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NonLoggedInWarningModel
    extends FlutterFlowModel<NonLoggedInWarningWidget> {
  ///  Local state fields for this component.

  List<Tilesv2Record> listOfQuery = [];
  void addToListOfQuery(Tilesv2Record item) => listOfQuery.add(item);
  void removeFromListOfQuery(Tilesv2Record item) => listOfQuery.remove(item);
  void removeAtIndexFromListOfQuery(int index) => listOfQuery.removeAt(index);
  void insertAtIndexInListOfQuery(int index, Tilesv2Record item) =>
      listOfQuery.insert(index, item);
  void updateListOfQueryAtIndex(int index, Function(Tilesv2Record) updateFn) =>
      listOfQuery[index] = updateFn(listOfQuery[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for confirmPass widget.
  FocusNode? confirmPassFocusNode;
  TextEditingController? confirmPassController;
  late bool confirmPassVisibility;
  String? Function(BuildContext, String?)? confirmPassControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<Tilesv2Record>? tilesWithSessionIdAgaininside1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    confirmPassVisibility = false;
  }

  @override
  void dispose() {
    firstNameFocusNode?.dispose();
    firstNameController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    confirmPassFocusNode?.dispose();
    confirmPassController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
