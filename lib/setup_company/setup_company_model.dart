import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'setup_company_widget.dart' show SetupCompanyWidget;
import 'package:flutter/material.dart';

class SetupCompanyModel extends FlutterFlowModel<SetupCompanyWidget> {
  ///  Local state fields for this page.

  bool showCalendar = false;

  String? showCalendarTileId;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getTopics)] action in Button widget.
  ApiCallResponse? apiResultdkp;
  // State field(s) for flowiseURL widget.
  FocusNode? flowiseURLFocusNode;
  TextEditingController? flowiseURLController;
  String? Function(BuildContext, String?)? flowiseURLControllerValidator;
  // State field(s) for queryName widget.
  FocusNode? queryNameFocusNode;
  TextEditingController? queryNameController;
  String? Function(BuildContext, String?)? queryNameControllerValidator;
  // State field(s) for TableName widget.
  FocusNode? tableNameFocusNode;
  TextEditingController? tableNameController;
  String? Function(BuildContext, String?)? tableNameControllerValidator;
  // State field(s) for supabaseProjectURL widget.
  FocusNode? supabaseProjectURLFocusNode;
  TextEditingController? supabaseProjectURLController;
  String? Function(BuildContext, String?)?
      supabaseProjectURLControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for prompt widget.
  FocusNode? promptFocusNode;
  TextEditingController? promptController;
  String? Function(BuildContext, String?)? promptControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // State field(s) for usergatherdata widget.
  FocusNode? usergatherdataFocusNode;
  TextEditingController? usergatherdataController;
  String? Function(BuildContext, String?)? usergatherdataControllerValidator;
  // State field(s) for coachmeprompt widget.
  FocusNode? coachmepromptFocusNode;
  TextEditingController? coachmepromptController;
  String? Function(BuildContext, String?)? coachmepromptControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    flowiseURLFocusNode?.dispose();
    flowiseURLController?.dispose();

    queryNameFocusNode?.dispose();
    queryNameController?.dispose();

    tableNameFocusNode?.dispose();
    tableNameController?.dispose();

    supabaseProjectURLFocusNode?.dispose();
    supabaseProjectURLController?.dispose();

    tabBarController?.dispose();
    promptFocusNode?.dispose();
    promptController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();

    usergatherdataFocusNode?.dispose();
    usergatherdataController?.dispose();

    coachmepromptFocusNode?.dispose();
    coachmepromptController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
