import '/backend/backend.dart';
import '/components/commenting_thread_widget.dart';
import '/components/respond_to_activity_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'body_contentt_learn_cards_widget.dart'
    show BodyContenttLearnCardsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BodyContenttLearnCardsModel
    extends FlutterFlowModel<BodyContenttLearnCardsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CommentingThread component.
  late CommentingThreadModel commentingThreadModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    commentingThreadModel = createModel(context, () => CommentingThreadModel());
  }

  @override
  void dispose() {
    commentingThreadModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
