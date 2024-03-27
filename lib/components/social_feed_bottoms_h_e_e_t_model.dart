import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/right_pane/social_feed_new_componant/social_feed_new_componant_widget.dart';
import 'social_feed_bottoms_h_e_e_t_widget.dart'
    show SocialFeedBottomsHEETWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SocialFeedBottomsHEETModel
    extends FlutterFlowModel<SocialFeedBottomsHEETWidget> {
  ///  Local state fields for this component.

  bool questionReady = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // Model for socialFeedNewComponant component.
  late SocialFeedNewComponantModel socialFeedNewComponantModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    socialFeedNewComponantModel =
        createModel(context, () => SocialFeedNewComponantModel());
  }

  @override
  void dispose() {
    columnController?.dispose();
    socialFeedNewComponantModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
