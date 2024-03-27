import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/right_pane/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_deletesoon/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_deletesoon_widget.dart';
import 'learn_card_chat_activity_widget.dart' show LearnCardChatActivityWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LearnCardChatActivityModel
    extends FlutterFlowModel<LearnCardChatActivityWidget> {
  ///  Local state fields for this component.

  List<Tilesv2Record> listOfQuery = [];
  void addToListOfQuery(Tilesv2Record item) => listOfQuery.add(item);
  void removeFromListOfQuery(Tilesv2Record item) => listOfQuery.remove(item);
  void removeAtIndexFromListOfQuery(int index) => listOfQuery.removeAt(index);
  void insertAtIndexInListOfQuery(int index, Tilesv2Record item) =>
      listOfQuery.insert(index, item);
  void updateListOfQueryAtIndex(int index, Function(Tilesv2Record) updateFn) =>
      listOfQuery[index] = updateFn(listOfQuery[index]);

  ///  State fields for stateful widgets in this component.

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
    aICOMMUNICATIONDeletesoonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
