import '/components/commenting_thread_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'body_contentt_learn_cards_widget.dart'
    show BodyContenttLearnCardsWidget;
import 'package:flutter/material.dart';

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
