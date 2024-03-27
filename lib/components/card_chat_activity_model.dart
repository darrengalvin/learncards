import '/components/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_non_learnc_a_r_d_d_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'card_chat_activity_widget.dart' show CardChatActivityWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardChatActivityModel extends FlutterFlowModel<CardChatActivityWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for AI_COMMUNICATION-nonLearncARDD component.
  late AICOMMUNICATIONNonLearncARDDModel aICOMMUNICATIONNonLearncARDDModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    aICOMMUNICATIONNonLearncARDDModel =
        createModel(context, () => AICOMMUNICATIONNonLearncARDDModel());
  }

  @override
  void dispose() {
    aICOMMUNICATIONNonLearncARDDModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
