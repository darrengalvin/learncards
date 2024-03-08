import '/flutter_flow/flutter_flow_util.dart';
import 'noaccesspopup_copy_widget.dart' show NoaccesspopupCopyWidget;
import 'package:flutter/material.dart';

class NoaccesspopupCopyModel extends FlutterFlowModel<NoaccesspopupCopyWidget> {
  ///  Local state fields for this component.

  bool? accessRequested;

  bool? tellMeMorePressed;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // State field(s) for YouEnquiry widget.
  FocusNode? youEnquiryFocusNode;
  TextEditingController? youEnquiryController;
  String? Function(BuildContext, String?)? youEnquiryControllerValidator;
  // State field(s) for YoMobile widget.
  FocusNode? yoMobileFocusNode;
  TextEditingController? yoMobileController;
  String? Function(BuildContext, String?)? yoMobileControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
    youEnquiryFocusNode?.dispose();
    youEnquiryController?.dispose();

    yoMobileFocusNode?.dispose();
    yoMobileController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
