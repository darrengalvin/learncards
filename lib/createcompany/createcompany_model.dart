import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'createcompany_widget.dart' show CreatecompanyWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreatecompanyModel extends FlutterFlowModel<CreatecompanyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for companyName widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameController;
  String? Function(BuildContext, String?)? companyNameControllerValidator;
  String? _companyNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter the patients full name.';
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode1;
  TextEditingController? descriptionController1;
  String? Function(BuildContext, String?)? descriptionController1Validator;
  // State field(s) for industry widget.
  FocusNode? industryFocusNode;
  TextEditingController? industryController;
  String? Function(BuildContext, String?)? industryControllerValidator;
  String? _industryControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter an age for the patient.';
    }

    return null;
  }

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for cloudinaryURL widget.
  FocusNode? cloudinaryURLFocusNode1;
  TextEditingController? cloudinaryURLController1;
  final cloudinaryURLMask1 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? cloudinaryURLController1Validator;
  String? _cloudinaryURLController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter the date of birth of the patient.';
    }

    return null;
  }

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for cloudinaryURL widget.
  FocusNode? cloudinaryURLFocusNode2;
  TextEditingController? cloudinaryURLController2;
  final cloudinaryURLMask2 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? cloudinaryURLController2Validator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for primarycolour widget.
  FocusNode? primarycolourFocusNode;
  TextEditingController? primarycolourController;
  String? Function(BuildContext, String?)? primarycolourControllerValidator;
  // State field(s) for secondaryColour widget.
  FocusNode? secondaryColourFocusNode;
  TextEditingController? secondaryColourController;
  String? Function(BuildContext, String?)? secondaryColourControllerValidator;
  // State field(s) for PrimaryText widget.
  FocusNode? primaryTextFocusNode;
  TextEditingController? primaryTextController;
  String? Function(BuildContext, String?)? primaryTextControllerValidator;
  // State field(s) for secondaryText widget.
  FocusNode? secondaryTextFocusNode;
  TextEditingController? secondaryTextController;
  String? Function(BuildContext, String?)? secondaryTextControllerValidator;
  // State field(s) for teritorycolour widget.
  FocusNode? teritorycolourFocusNode;
  TextEditingController? teritorycolourController;
  String? Function(BuildContext, String?)? teritorycolourControllerValidator;
  // State field(s) for alternativecolour widget.
  FocusNode? alternativecolourFocusNode;
  TextEditingController? alternativecolourController;
  String? Function(BuildContext, String?)? alternativecolourControllerValidator;
  // State field(s) for companyemail widget.
  FocusNode? companyemailFocusNode1;
  TextEditingController? companyemailController1;
  String? Function(BuildContext, String?)? companyemailController1Validator;
  // State field(s) for companyindusty widget.
  FocusNode? companyindustyFocusNode;
  TextEditingController? companyindustyController;
  String? Function(BuildContext, String?)? companyindustyControllerValidator;
  DateTime? datePicked;
  // State field(s) for companyemail widget.
  FocusNode? companyemailFocusNode2;
  TextEditingController? companyemailController2;
  String? Function(BuildContext, String?)? companyemailController2Validator;
  // State field(s) for thisweekstopic widget.
  FocusNode? thisweekstopicFocusNode;
  TextEditingController? thisweekstopicController;
  String? Function(BuildContext, String?)? thisweekstopicControllerValidator;
  // State field(s) for flowiseURL widget.
  FocusNode? flowiseURLFocusNode;
  TextEditingController? flowiseURLController;
  final flowiseURLMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? flowiseURLControllerValidator;
  // State field(s) for queryName widget.
  FocusNode? queryNameFocusNode;
  TextEditingController? queryNameController;
  String? Function(BuildContext, String?)? queryNameControllerValidator;
  // State field(s) for TableName widget.
  FocusNode? tableNameFocusNode;
  TextEditingController? tableNameController;
  final tableNameMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? tableNameControllerValidator;
  // State field(s) for supabaseProjectURL widget.
  FocusNode? supabaseProjectURLFocusNode;
  TextEditingController? supabaseProjectURLController;
  final supabaseProjectURLMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      supabaseProjectURLControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode2;
  TextEditingController? descriptionController2;
  String? Function(BuildContext, String?)? descriptionController2Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode3;
  TextEditingController? descriptionController3;
  String? Function(BuildContext, String?)? descriptionController3Validator;
  // State field(s) for usergatherdata widget.
  FocusNode? usergatherdataFocusNode;
  TextEditingController? usergatherdataController;
  String? Function(BuildContext, String?)? usergatherdataControllerValidator;
  // State field(s) for coachmeprompt widget.
  FocusNode? coachmepromptFocusNode;
  TextEditingController? coachmepromptController;
  String? Function(BuildContext, String?)? coachmepromptControllerValidator;
  // State field(s) for memberLevels widget.
  FocusNode? memberLevelsFocusNode1;
  TextEditingController? memberLevelsController1;
  final memberLevelsMask1 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? memberLevelsController1Validator;
  // State field(s) for memberLevels widget.
  FocusNode? memberLevelsFocusNode2;
  TextEditingController? memberLevelsController2;
  final memberLevelsMask2 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? memberLevelsController2Validator;
  // State field(s) for GroupJourneys widget.
  FocusNode? groupJourneysFocusNode;
  TextEditingController? groupJourneysController;
  final groupJourneysMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? groupJourneysControllerValidator;
  // State field(s) for memberLevels widget.
  FocusNode? memberLevelsFocusNode3;
  TextEditingController? memberLevelsController3;
  final memberLevelsMask3 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? memberLevelsController3Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompaniesRecord? createdCompany;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    companyNameControllerValidator = _companyNameControllerValidator;
    industryControllerValidator = _industryControllerValidator;
    cloudinaryURLController1Validator = _cloudinaryURLController1Validator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    companyNameFocusNode?.dispose();
    companyNameController?.dispose();

    descriptionFocusNode1?.dispose();
    descriptionController1?.dispose();

    industryFocusNode?.dispose();
    industryController?.dispose();

    cloudinaryURLFocusNode1?.dispose();
    cloudinaryURLController1?.dispose();

    cloudinaryURLFocusNode2?.dispose();
    cloudinaryURLController2?.dispose();

    primarycolourFocusNode?.dispose();
    primarycolourController?.dispose();

    secondaryColourFocusNode?.dispose();
    secondaryColourController?.dispose();

    primaryTextFocusNode?.dispose();
    primaryTextController?.dispose();

    secondaryTextFocusNode?.dispose();
    secondaryTextController?.dispose();

    teritorycolourFocusNode?.dispose();
    teritorycolourController?.dispose();

    alternativecolourFocusNode?.dispose();
    alternativecolourController?.dispose();

    companyemailFocusNode1?.dispose();
    companyemailController1?.dispose();

    companyindustyFocusNode?.dispose();
    companyindustyController?.dispose();

    companyemailFocusNode2?.dispose();
    companyemailController2?.dispose();

    thisweekstopicFocusNode?.dispose();
    thisweekstopicController?.dispose();

    flowiseURLFocusNode?.dispose();
    flowiseURLController?.dispose();

    queryNameFocusNode?.dispose();
    queryNameController?.dispose();

    tableNameFocusNode?.dispose();
    tableNameController?.dispose();

    supabaseProjectURLFocusNode?.dispose();
    supabaseProjectURLController?.dispose();

    tabBarController?.dispose();
    descriptionFocusNode2?.dispose();
    descriptionController2?.dispose();

    descriptionFocusNode3?.dispose();
    descriptionController3?.dispose();

    usergatherdataFocusNode?.dispose();
    usergatherdataController?.dispose();

    coachmepromptFocusNode?.dispose();
    coachmepromptController?.dispose();

    memberLevelsFocusNode1?.dispose();
    memberLevelsController1?.dispose();

    memberLevelsFocusNode2?.dispose();
    memberLevelsController2?.dispose();

    groupJourneysFocusNode?.dispose();
    groupJourneysController?.dispose();

    memberLevelsFocusNode3?.dispose();
    memberLevelsController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
