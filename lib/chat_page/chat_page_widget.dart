import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_on_page_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_page_model.dart';
export 'chat_page_model.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({
    super.key,
    required this.companiesDoc,
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
                    ),
                  ),
                  StreamBuilder<List<MyTeamRecord>>(
                    stream: queryMyTeamRecord(
                      queryBuilder: (myTeamRecord) => myTeamRecord.where(
                        'company',
                        isEqualTo: widget.companiesDoc?.reference.id,
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
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final myTeam = containerMyTeamRecordList.toList();
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(myTeam.length, (myTeamIndex) {
                                final myTeamItem = myTeam[myTeamIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'CHAT_PAGE_PAGE_Column_uul1i8nq_ON_TAP');
                                    logFirebaseEvent('Column_firestore_query');
                                    _model.checkingMentorChat =
                                        await querySessionsRecordOnce(
                                      queryBuilder: (sessionsRecord) =>
                                          sessionsRecord.where(
                                        'sessionId',
                                        isEqualTo: valueOrDefault<String>(
                                          FFAppState().nonLoggedInSessionId,
                                          'nonloggedinnotset',
                                        ),
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    logFirebaseEvent('Column_update_app_state');
                                    setState(() {
                                      FFAppState().selectedThreadId =
                                          '${myTeamItem.reference.id}+${valueOrDefault<String>(
                                        widget.sessionsDoc?.reference.id,
                                        '0',
                                      )}';
                                    });
                                    logFirebaseEvent('Column_update_app_state');
                                    setState(() {
                                      FFAppState().selectedTeam =
                                          myTeamItem.reference.id;
                                    });

                                    setState(() {});
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(),
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 90.0,
                                                height: 90.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    myTeamItem.image,
                                                    'https://res.cloudinary.com/dplpckpbm/image/upload/v1708824869/dg0865_Chief_AI_Officer_Taylor_Jordan_Leads_AI_strategy_and_imp_3be63b10-fc84-4fb8-815c-db58d2530086_dlybur.png',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                width: 40.0,
                                                height: 40.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    myTeamItem.image,
                                                    'https://res.cloudinary.com/dplpckpbm/image/upload/v1708824869/dg0865_Chief_AI_Officer_Taylor_Jordan_Leads_AI_strategy_and_imp_3be63b10-fc84-4fb8-815c-db58d2530086_dlybur.png',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                width: 26.0,
                                                height: 26.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          90.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      '1',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .customColor3,
                                                                fontSize: 18.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
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
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
