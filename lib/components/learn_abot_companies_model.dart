import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'learn_abot_companies_widget.dart' show LearnAbotCompaniesWidget;
import 'package:flutter/material.dart';

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
