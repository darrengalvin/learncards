import '/backend/backend.dart';
import '/components/social_feed_bottoms_h_e_e_t_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/middle_pane/body_content/body_content_widget.dart';
import '/middle_pane/body_content_mainiles/body_content_mainiles_widget.dart';
import '/middle_pane/body_contentt_learn_cards/body_contentt_learn_cards_widget.dart';
import '/middle_pane/preparing/preparing_widget.dart';
import '/right_pane/social_feed_new_componant/social_feed_new_componant_widget.dart';
import 'middle_column_widget.dart' show MiddleColumnWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MiddleColumnModel extends FlutterFlowModel<MiddleColumnWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Preparing component.
  late PreparingModel preparingModel;
  // Model for BodyContent component.
  late BodyContentModel bodyContentModel;
  // Model for socialFeedNewComponant component.
  late SocialFeedNewComponantModel socialFeedNewComponantModel;
  // Model for bodyContentMainTiles.
  late BodyContentMainilesModel bodyContentMainTilesModel;
  // Model for SocialFeedBottomsHEET component.
  late SocialFeedBottomsHEETModel socialFeedBottomsHEETModel;
  // Model for BodyContenttLearnCards component.
  late BodyContenttLearnCardsModel bodyContenttLearnCardsModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    preparingModel = createModel(context, () => PreparingModel());
    bodyContentModel = createModel(context, () => BodyContentModel());
    socialFeedNewComponantModel =
        createModel(context, () => SocialFeedNewComponantModel());
    bodyContentMainTilesModel =
        createModel(context, () => BodyContentMainilesModel());
    socialFeedBottomsHEETModel =
        createModel(context, () => SocialFeedBottomsHEETModel());
    bodyContenttLearnCardsModel =
        createModel(context, () => BodyContenttLearnCardsModel());
  }

  @override
  void dispose() {
    preparingModel.dispose();
    bodyContentModel.dispose();
    socialFeedNewComponantModel.dispose();
    bodyContentMainTilesModel.dispose();
    socialFeedBottomsHEETModel.dispose();
    bodyContenttLearnCardsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
