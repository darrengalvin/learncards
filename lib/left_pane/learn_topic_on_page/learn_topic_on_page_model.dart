import '/backend/backend.dart';
import '/components/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_on_page_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'learn_topic_on_page_widget.dart' show LearnTopicOnPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LearnTopicOnPageModel extends FlutterFlowModel<LearnTopicOnPageWidget> {
  ///  Local state fields for this component.

  int? stepCount = 1;

  ///  State fields for stateful widgets in this component.

  // Model for AI_COMMUNICATION-OnPage component.
  late AICOMMUNICATIONOnPageModel aICOMMUNICATIONOnPageModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    aICOMMUNICATIONOnPageModel =
        createModel(context, () => AICOMMUNICATIONOnPageModel());
  }

  @override
  void dispose() {
    aICOMMUNICATIONOnPageModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
