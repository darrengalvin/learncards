import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/commenting_thread_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chata_c_t_i_v_i_t_y_widget.dart' show ChataCTIVITYWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChataCTIVITYModel extends FlutterFlowModel<ChataCTIVITYWidget> {
  ///  Local state fields for this component.

  Color? learnCardBackgroundColour;

  int? waitingListValue = 0;

  List<String> waitingList = [
    'I am just preparing your LearnCard',
    'I won\'t be much longer',
    'Nearly there...',
    'Hold with me just a little while longer',
    'Ok, this is taking longer than I expected, lets give it another minuite and if  there is no change please press the Feedback button to let us know something has gone amiss.'
  ];
  void addToWaitingList(String item) => waitingList.add(item);
  void removeFromWaitingList(String item) => waitingList.remove(item);
  void removeAtIndexFromWaitingList(int index) => waitingList.removeAt(index);
  void insertAtIndexInWaitingList(int index, String item) =>
      waitingList.insert(index, item);
  void updateWaitingListAtIndex(int index, Function(String) updateFn) =>
      waitingList[index] = updateFn(waitingList[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Stores action output result for [Firestore Query - Query a collection] action in MouseRegion widget.
  List<CompaniesRecord>? companyForColor1;
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
