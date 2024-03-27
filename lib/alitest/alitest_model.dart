import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/right_pane/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_deletesoon/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_deletesoon_widget.dart';
import 'alitest_widget.dart' show AlitestWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AlitestModel extends FlutterFlowModel<AlitestWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AI_COMMUNICATION-deletesoon component.
  late AICOMMUNICATIONDeletesoonModel aICOMMUNICATIONDeletesoonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    aICOMMUNICATIONDeletesoonModel =
        createModel(context, () => AICOMMUNICATIONDeletesoonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    aICOMMUNICATIONDeletesoonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
