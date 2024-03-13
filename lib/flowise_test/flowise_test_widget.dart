import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'flowise_test_model.dart';
export 'flowise_test_model.dart';

class FlowiseTestWidget extends StatefulWidget {
  const FlowiseTestWidget({super.key});

  @override
  State<FlowiseTestWidget> createState() => _FlowiseTestWidgetState();
}

class _FlowiseTestWidgetState extends State<FlowiseTestWidget> {
  late FlowiseTestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FlowiseTestModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'flowiseTest'});
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
        title: 'flowiseTest',
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
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: 399.0,
                        height: 300.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'FLOWISE_TEST_PAGE_BUTTON_BTN_ON_TAP');
                            logFirebaseEvent('Button_backend_call');
                            _model.apiResult9jb =
                                await FlowiseGroup.flowiseAPICallCall.call(
                              question: (_model.sessionsQuery?.first?.userAiData
                                      ?.toMap())
                                  ?.toString(),
                              systemMessagePrompt:
                                  'I am using a learning platform that generates learn cards, with ${functions.stringifyJSON((_model.companiesQuery?.first?.companyAiData?.toMap())?.toString())} the topic I have been studying is  body(topic)  sales techniques and the learn card I am ready to generate is   body(readingItem)${(_model.sessionsQuery?.first?.userAiData?.toMap())?.toString()} I need an introduction text (HTMLbodyText) that engages me in the topic with a view of educating me,  You will decide on an activity that we can do together via interactive chat, You will give that activity a name, description and you will explain in the body text why you have chosen this for me. You will give me an estimated time between 15-30 minutes to complete said activity.  You will invite me to engage in said activity by using one of my learn cards by clicking on the button below ‘generate learn card’.  This will be returned as a json object and the body text will be in HTML${'${_model.companiesQuery?.first?.companyAiData?.companyName} ${_model.companiesQuery?.first?.companyAiData?.companySummary} ${_model.companiesQuery?.first?.companyAiData?.companyIndustry}'}${_model.sessionsQuery?.first?.userAiData?.userName}${_model.sessionsQuery?.first?.userAiData?.learningStyle}${_model.sessionsQuery?.first?.userAiData?.jobRole} with the following keys  activityName, activityDescription, activityPurpose, estimatedCompletionTime, HTMLbodyText, invitation',
                            );

                            setState(() {});
                          },
                          text: 'Button',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: 399.0,
                        height: 300.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                (_model.apiResult9jb?.jsonBody ?? '')
                                    .toString(),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  (_model.apiResult9jb?.statusCode ?? 200)
                                      .toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  (_model.apiResult9jb?.succeeded ?? true)
                                      .toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: 399.0,
                        height: 300.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'FLOWISE_TEST_PAGE_SAMPLE_DATA_BTN_ON_TAP');
                            logFirebaseEvent('Button_firestore_query');
                            _model.sessionsQuery =
                                await querySessionsRecordOnce(
                              queryBuilder: (sessionsRecord) =>
                                  sessionsRecord.where(
                                'sessionId',
                                isEqualTo: FFAppState().nonLoggedInSessionId,
                              ),
                            );
                            logFirebaseEvent('Button_firestore_query');
                            _model.companiesQuery =
                                await queryCompaniesRecordOnce(
                              queryBuilder: (companiesRecord) =>
                                  companiesRecord.where(
                                'isowner',
                                isEqualTo: true,
                              ),
                            );
                            logFirebaseEvent('Button_backend_call');

                            await _model.sessionsQuery!.first.reference
                                .update(createSessionsRecordData(
                              userAiData: createUserDataForAiStruct(
                                userName: 'Darren ',
                                learningStyle: 'any',
                                jobRole: 'Director',
                                clearUnsetFields: false,
                              ),
                              dateTime: getCurrentTimestamp,
                            ));
                            logFirebaseEvent('Button_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    title: Text('The Value of Users is'),
                                    content: Text((_model
                                            .sessionsQuery!.first.userAiData
                                            .toMap())
                                        .toString()),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                            logFirebaseEvent('Button_backend_call');

                            await _model.companiesQuery!.first.reference
                                .update(createCompaniesRecordData(
                              companyAiData: createCompanyDataForAiStruct(
                                companyName: 'Institute of Global Sales',
                                companySummary:
                                    'Helping people globally to sell professionaly',
                                companyIndustry: 'sales',
                                clearUnsetFields: false,
                              ),
                            ));
                            logFirebaseEvent('Button_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    title: Text('The value of companies is'),
                                    content: Text((_model
                                            .companiesQuery!.first.companyAiData
                                            .toMap())
                                        .toString()),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );

                            setState(() {});
                          },
                          text: 'sample data',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
