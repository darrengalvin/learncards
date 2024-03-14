import '/backend/backend.dart';
import '/components/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_on_page_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'chat_page_model.dart';
export 'chat_page_model.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({
    super.key,
    this.companiesDoc,
    this.sessionsDoc,
  });

  final CompaniesRecord? companiesDoc;
  final SessionsRecord? sessionsDoc;

  @override
  State<ChatPageWidget> createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> {
  late ChatPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'chatPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'chatPage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StreamBuilder<List<LearnCardsRecord>>(
                      stream: queryLearnCardsRecord(
                        queryBuilder: (learnCardsRecord) => learnCardsRecord
                            .where(
                              'companyDocId',
                              isEqualTo: FFAppState().selectedCompanyId,
                            )
                            .where(
                              'learnCardId',
                              isEqualTo: FFAppState().selectedLearnCardId,
                            ),
                        singleRecord: true,
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
                        List<LearnCardsRecord> containerLearnCardsRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final containerLearnCardsRecord =
                            containerLearnCardsRecordList.isNotEmpty
                                ? containerLearnCardsRecordList.first
                                : null;
                        return Container(
                          decoration: const BoxDecoration(),
                          child: StreamBuilder<List<MyTeamRecord>>(
                            stream: queryMyTeamRecord(
                              queryBuilder: (myTeamRecord) =>
                                  myTeamRecord.where(
                                'company',
                                isEqualTo: FFAppState().selectedCompanyId,
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
                              List<MyTeamRecord> containerMyTeamRecordList =
                                  snapshot.data!;
                              return Container(
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.aICOMMUNICATIONOnPageModel,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: AICOMMUNICATIONOnPageWidget(
                                        askingQuestion: false,
                                        isLearnCard: false,
                                        companiesDoc: widget.companiesDoc!,
                                        sessionsDoc: widget.sessionsDoc,
                                        learnCardDoc: containerLearnCardsRecord,
                                        teamDoc: containerMyTeamRecordList
                                            .where((e) =>
                                                e.reference.id ==
                                                FFAppState().selectedTeam)
                                            .toList()
                                            .first,
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          final teamMembers =
                                              containerMyTeamRecordList
                                                  .toList();
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                teamMembers.length,
                                                (teamMembersIndex) {
                                              final teamMembersItem =
                                                  teamMembers[teamMembersIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'CHAT_PAGE_PAGE_Column_uul1i8nq_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Column_firestore_query');
                                                  _model.checkingMentorChat =
                                                      await querySessionsRecordOnce(
                                                    queryBuilder:
                                                        (sessionsRecord) =>
                                                            sessionsRecord
                                                                .where(
                                                      'sessionId',
                                                      isEqualTo: valueOrDefault<
                                                          String>(
                                                        FFAppState()
                                                            .nonLoggedInSessionId,
                                                        'nonloggedinnotset',
                                                      ),
                                                    ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);
                                                  if ((_model.checkingMentorChat
                                                              ?.currentNavJourney ==
                                                          'newSession') &&
                                                      (teamMembersItem
                                                              .positionId !=
                                                          1)) {
                                                    logFirebaseEvent(
                                                        'Column_alert_dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            title: const Text(
                                                                'You must complete the welcome chat before you can speak to a mentor'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                    logFirebaseEvent(
                                                        'Column_update_app_state');
                                                    setState(() {
                                                      FFAppState()
                                                              .selectedThreadId =
                                                          teamMembersItem
                                                                      .positionId ==
                                                                  1
                                                              ? valueOrDefault<
                                                                  String>(
                                                                  widget
                                                                      .sessionsDoc
                                                                      ?.defaultThreadId,
                                                                  '-',
                                                                )
                                                              : '${teamMembersItem.reference.id}+${valueOrDefault<String>(
                                                                  widget
                                                                      .sessionsDoc
                                                                      ?.reference
                                                                      .id,
                                                                  '0',
                                                                )}';
                                                    });
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Column_update_app_state');
                                                    setState(() {
                                                      FFAppState()
                                                              .selectedThreadId =
                                                          teamMembersItem
                                                                      .positionId ==
                                                                  1
                                                              ? valueOrDefault<
                                                                  String>(
                                                                  widget
                                                                      .sessionsDoc
                                                                      ?.defaultThreadId,
                                                                  '-',
                                                                )
                                                              : '${teamMembersItem.reference.id}+${valueOrDefault<String>(
                                                                  widget
                                                                      .sessionsDoc
                                                                      ?.reference
                                                                      .id,
                                                                  '0',
                                                                )}';
                                                    });
                                                    logFirebaseEvent(
                                                        'Column_update_app_state');
                                                    setState(() {
                                                      FFAppState()
                                                              .selectedTeam =
                                                          teamMembersItem
                                                              .reference.id;
                                                    });
                                                  }

                                                  if ((_model.checkingMentorChat
                                                              ?.currentNavJourney ==
                                                          'newSession') &&
                                                      (teamMembersItem
                                                              .positionId !=
                                                          1)) {
                                                    logFirebaseEvent(
                                                        'Column_alert_dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            title: const Text(
                                                                'You must complete the welcome chat first.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                    logFirebaseEvent(
                                                        'Column_update_app_state');
                                                    setState(() {
                                                      FFAppState()
                                                          .selectedThreadId = teamMembersItem
                                                                  .positionId ==
                                                              1
                                                          ? _model
                                                              .checkingMentorChat!
                                                              .defaultThreadId
                                                          : '${teamMembersItem.reference.id}+${_model.checkingMentorChat?.reference.id}';
                                                    });
                                                    logFirebaseEvent(
                                                        'Column_update_app_state');
                                                    setState(() {
                                                      FFAppState()
                                                              .selectedTeam =
                                                          teamMembersItem
                                                              .reference.id;
                                                    });
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Column_update_app_state');
                                                    setState(() {
                                                      FFAppState()
                                                              .selectedThreadId =
                                                          valueOrDefault<
                                                              String>(
                                                        teamMembersItem
                                                                    .positionId ==
                                                                1
                                                            ? _model
                                                                .checkingMentorChat
                                                                ?.defaultThreadId
                                                            : '${teamMembersItem.reference.id}+${_model.checkingMentorChat?.reference.id}',
                                                        'o',
                                                      );
                                                    });
                                                    logFirebaseEvent(
                                                        'Column_update_app_state');
                                                    setState(() {
                                                      FFAppState()
                                                              .selectedTeam =
                                                          teamMembersItem
                                                              .reference.id;
                                                    });
                                                    logFirebaseEvent(
                                                        'Column_navigate_to');

                                                    context.pushNamed(
                                                      'chatPage',
                                                      queryParameters: {
                                                        'companiesDoc':
                                                            serializeParam(
                                                          widget.companiesDoc,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'companiesDoc':
                                                            widget.companiesDoc,
                                                      },
                                                    );
                                                  }

                                                  setState(() {});
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 100.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Stack(
                                                          children: [
                                                            Container(
                                                              width: 90.0,
                                                              height: 90.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  teamMembersItem
                                                                      .image,
                                                                  'https://res.cloudinary.com/dplpckpbm/image/upload/v1708824869/dg0865_Chief_AI_Officer_Taylor_Jordan_Leads_AI_strategy_and_imp_3be63b10-fc84-4fb8-815c-db58d2530086_dlybur.png',
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  teamMembersItem
                                                                      .image,
                                                                  'https://res.cloudinary.com/dplpckpbm/image/upload/v1708824869/dg0865_Chief_AI_Officer_Taylor_Jordan_Leads_AI_strategy_and_imp_3be63b10-fc84-4fb8-815c-db58d2530086_dlybur.png',
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 26.0,
                                                              height: 26.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            90.0),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    '1',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).customColor3,
                                                                          fontSize:
                                                                              18.0,
                                                                          fontWeight:
                                                                              FontWeight.w800,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
