import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/right_pane/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_deletesoon/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_deletesoon_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'learn_card_chat_activity_model.dart';
export 'learn_card_chat_activity_model.dart';

class LearnCardChatActivityWidget extends StatefulWidget {
  const LearnCardChatActivityWidget({
    super.key,
    String? learcardId,
    required this.learningCardTitle,
  }) : learcardId = learcardId ?? '1212121';

  final String learcardId;
  final String? learningCardTitle;

  @override
  State<LearnCardChatActivityWidget> createState() =>
      _LearnCardChatActivityWidgetState();
}

class _LearnCardChatActivityWidgetState
    extends State<LearnCardChatActivityWidget> {
  late LearnCardChatActivityModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LearnCardChatActivityModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<LearnCardsRecord>>(
      stream: queryLearnCardsRecord(
        queryBuilder: (learnCardsRecord) => learnCardsRecord.where(
          'learnCardId',
          isEqualTo: FFAppState().selectedLearnCardId,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<LearnCardsRecord> learnCardChatActivityLearnCardsRecordList =
            snapshot.data!;
        return Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                maxWidth: 550.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x25090F13),
                    offset: Offset(0.0, 2.0),
                  )
                ],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60.0,
                            height: 4.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                        ],
                      ),
                      if (valueOrDefault<bool>(
                        FFAppState().selectedLearnCardId != '',
                        false,
                      ))
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Text(
                            learnCardChatActivityLearnCardsRecordList
                                .first.title,
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ),
                      Divider(
                        height: 24.0,
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'LEARN_CARD_CHAT_ACTIVITY_Container_b8ypr');
                              logFirebaseEvent('Container_bottom_sheet');
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: const BoxDecoration(),
                            ),
                          ),
                        ],
                      ),
                      wrapWithModel(
                        model: _model.aICOMMUNICATIONDeletesoonModel,
                        updateCallback: () => setState(() {}),
                        child: AICOMMUNICATIONDeletesoonWidget(
                          askingQuestion: false,
                          learnCard: learnCardChatActivityLearnCardsRecordList
                              .where((e) =>
                                  e.learnCardId ==
                                  FFAppState().selectedLearnCardId)
                              .toList()
                              .first,
                          learnCardId: FFAppState().selectedLearnCardId,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
