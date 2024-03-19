import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'demo_model.dart';
export 'demo_model.dart';

class DemoWidget extends StatefulWidget {
  const DemoWidget({super.key});

  @override
  State<DemoWidget> createState() => _DemoWidgetState();
}

class _DemoWidgetState extends State<DemoWidget> {
  late DemoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DemoModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'demo'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DEMO_PAGE_demo_ON_INIT_STATE');
      logFirebaseEvent('demo_firestore_query');
      _model.companyQueryOnPageLoad = await queryCompaniesRecordOnce(
        queryBuilder: (companiesRecord) => companiesRecord.where(
          'companyCode',
          isEqualTo: valueOrDefault<String>(
            FFAppState().companySecretCode,
            '2233445566',
          ),
        ),
      );
      if (FFAppState().companySecretCode == '') {
        logFirebaseEvent('demo_update_app_state');
        setState(() {
          FFAppState().companySecretCode = '22335555';
        });
      }
      if (!(FFAppState().nonLoggedInSessionId != '')) {
        logFirebaseEvent('demo_backend_call');

        var sessionsRecordReference = SessionsRecord.collection.doc();
        await sessionsRecordReference.set(createSessionsRecordData(
          dateTime: getCurrentTimestamp,
          sessionId: FFAppState().nonLoggedInSessionId,
        ));
        _model.sessionsCreated = SessionsRecord.getDocumentFromData(
            createSessionsRecordData(
              dateTime: getCurrentTimestamp,
              sessionId: FFAppState().nonLoggedInSessionId,
            ),
            sessionsRecordReference);
        logFirebaseEvent('demo_backend_call');

        await _model.sessionsCreated!.reference.update(createSessionsRecordData(
          sessionId: _model.sessionsCreated?.reference.id,
        ));
        logFirebaseEvent('demo_update_app_state');
        setState(() {
          FFAppState().nonLoggedInSessionId =
              _model.sessionsCreated!.reference.id;
        });
      }
      if (!(FFAppState().activeThread != '')) {
        logFirebaseEvent('demo_update_app_state');
        setState(() {
          FFAppState().activeThread = random_data.randomString(
            10,
            10,
            true,
            true,
            true,
          );
        });
      }
      logFirebaseEvent('demo_firestore_query');
      _model.queryFlowiseChats = await queryFlowiseChatsRecordOnce();
      if (_model.queryFlowiseChats!
          .where((e) => e.sessionId == FFAppState().nonLoggedInSessionId)
          .toList()
          .isNotEmpty) {
        return;
      }

      // flowise chat document
      logFirebaseEvent('demo_flowisechatdocument');

      var flowiseChatsRecordReference = FlowiseChatsRecord.collection.doc();
      await flowiseChatsRecordReference.set(createFlowiseChatsRecordData(
        userId: loggedIn
            ? currentUserReference?.id
            : FFAppState().nonLoggedInSessionId,
        role: 'ai',
        text: valueOrDefault<String>(
          _model.companyQueryOnPageLoad?.first.welcomeMessage,
          'Welcome',
        ),
        createdTime: getCurrentTimestamp,
        sessionId: valueOrDefault<String>(
          FFAppState().nonLoggedInSessionId,
          'not set',
        ),
        threadId: valueOrDefault<String>(
          FFAppState().activeThread,
          'no thread id was passed',
        ),
      ));
      _model.initialchatCreated = FlowiseChatsRecord.getDocumentFromData(
          createFlowiseChatsRecordData(
            userId: loggedIn
                ? currentUserReference?.id
                : FFAppState().nonLoggedInSessionId,
            role: 'ai',
            text: valueOrDefault<String>(
              _model.companyQueryOnPageLoad?.first.welcomeMessage,
              'Welcome',
            ),
            createdTime: getCurrentTimestamp,
            sessionId: valueOrDefault<String>(
              FFAppState().nonLoggedInSessionId,
              'not set',
            ),
            threadId: valueOrDefault<String>(
              FFAppState().activeThread,
              'no thread id was passed',
            ),
          ),
          flowiseChatsRecordReference);
      logFirebaseEvent('demo_firestore_query');
      _model.sessionsQueriedAain = await querySessionsRecordOnce(
        queryBuilder: (sessionsRecord) => sessionsRecord.where(
          'sessionId',
          isEqualTo: FFAppState().nonLoggedInSessionId,
        ),
      );
      logFirebaseEvent('demo_backend_call');

      await _model.sessionsQueriedAain!.first.reference
          .update(createSessionsRecordData(
        defaultThreadId: _model.initialchatCreated?.threadId,
      ));
    });

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
        title: 'demo',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            body: SafeArea(
              top: true,
              child: StreamBuilder<List<CompaniesRecord>>(
                stream: queryCompaniesRecord(),
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
                  List<CompaniesRecord> containerCompaniesRecordList =
                      snapshot.data!;
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          valueOrDefault<String>(
                            containerCompaniesRecordList
                                .where((e) =>
                                    e.companyCode ==
                                    FFAppState().companySecretCode)
                                .toList()
                                .first
                                .backgroundImage,
                            'https://res.cloudinary.com/dplpckpbm/image/upload/v1703535226/learningPathwaysBright_b3strj.webp',
                          ),
                        ).image,
                      ),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.network(
                                          'https://res.cloudinary.com/dplpckpbm/image/upload/v1703535226/learningPathwaysBright_b3strj.webp',
                                        ).image,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, -1.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 150.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  containerCompaniesRecordList
                                                      .first
                                                      .colors
                                                      .primaryColor,
                                                  FlutterFlowTheme.of(context)
                                                      .gray200,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                constraints:
                                                                    const BoxConstraints(
                                                                  maxWidth:
                                                                      400.0,
                                                                ),
                                                                decoration:
                                                                    const BoxDecoration(),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'DEMO_PAGE_GO_TO_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_navigate_to');

                                                  context.pushNamed(
                                                    'Library-fixed',
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );
                                                },
                                                text:
                                                    'Launch : ${containerCompaniesRecordList.where((e) => e.companyCode == FFAppState().companySecretCode).toList().first.companyname}',
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 600.0,
                                              decoration: const BoxDecoration(),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Builder(
                                                            builder: (context) {
                                                              final companiesScroll =
                                                                  containerCompaniesRecordList
                                                                      .toList();
                                                              return SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List.generate(
                                                                      companiesScroll
                                                                          .length,
                                                                      (companiesScrollIndex) {
                                                                    final companiesScrollItem =
                                                                        companiesScroll[
                                                                            companiesScrollIndex];
                                                                    return Container(
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            100,
                                                                        color: Colors
                                                                            .green);
                                                                  }),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
