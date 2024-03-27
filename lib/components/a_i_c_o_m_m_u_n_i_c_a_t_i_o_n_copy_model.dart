import '/flutter_flow/flutter_flow_util.dart';
import 'a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_copy_widget.dart'
    show AICOMMUNICATIONCopyWidget;
import 'package:flutter/material.dart';

class AICOMMUNICATIONCopyModel
    extends FlutterFlowModel<AICOMMUNICATIONCopyWidget> {
  ///  Local state fields for this component.

  bool questionReady = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for AskTheQuestion widget.
  FocusNode? askTheQuestionFocusNode;
  TextEditingController? askTheQuestionController;
  String? Function(BuildContext, String?)? askTheQuestionControllerValidator;
  // State field(s) for TextFieldMessage widget.
  FocusNode? textFieldMessageFocusNode;
  TextEditingController? textFieldMessageController;
  String? Function(BuildContext, String?)? textFieldMessageControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    askTheQuestionFocusNode?.dispose();
    askTheQuestionController?.dispose();

    textFieldMessageFocusNode?.dispose();
    textFieldMessageController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
