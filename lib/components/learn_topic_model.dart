import '/backend/backend.dart';
import '/components/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_landing_widget.dart';
import '/components/user_discover_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'learn_topic_widget.dart' show LearnTopicWidget;
import 'package:flutter/material.dart';

class LearnTopicModel extends FlutterFlowModel<LearnTopicWidget> {
  ///  Local state fields for this component.

  int? stepCount = 1;

  ///  State fields for stateful widgets in this component.

  // Model for AI_COMMUNICATION_Landing component.
  late AICOMMUNICATIONLandingModel aICOMMUNICATIONLandingModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  Tilesv2Record? createdTile;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TileBlocksRecord? createdTileBlock;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CompaniesRecord>? companyCodeWelcome;
  // Model for UserDiscover component.
  late UserDiscoverModel userDiscoverModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    aICOMMUNICATIONLandingModel =
        createModel(context, () => AICOMMUNICATIONLandingModel());
    userDiscoverModel = createModel(context, () => UserDiscoverModel());
  }

  @override
  void dispose() {
    aICOMMUNICATIONLandingModel.dispose();
    userDiscoverModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
