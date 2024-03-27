import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_landing_widget.dart';
import '/components/user_discover_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'learn_topic_model.dart';
export 'learn_topic_model.dart';

class LearnTopicWidget extends StatefulWidget {
  const LearnTopicWidget({super.key});

  @override
  State<LearnTopicWidget> createState() => _LearnTopicWidgetState();
}

class _LearnTopicWidgetState extends State<LearnTopicWidget>
    with TickerProviderStateMixin {
  late LearnTopicModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LearnTopicModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: StreamBuilder<List<CompaniesRecord>>(
        stream: queryCompaniesRecord(
          queryBuilder: (companiesRecord) => companiesRecord.where(
            'companyCode',
            isEqualTo: FFAppState().companySecretCode,
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
          List<CompaniesRecord> containerCompaniesRecordList = snapshot.data!;
          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('LEARN_TOPIC_Container_905rdyhz_ON_TAP');
              logFirebaseEvent('Container_update_app_state');
              setState(() {
                FFAppState().debugCount = FFAppState().debugCount + 1;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0x85FAFAFA),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        constraints: BoxConstraints(
                                          minWidth: 380.0,
                                          maxWidth: 750.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(17.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 300.0,
                                                    maxHeight: 160.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'LEARN_TOPIC_COMP_Image_yiduqyr5_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Image_navigate_to');

                                                      context.pushNamed(
                                                        'cloudinaryUploadTest',
                                                        queryParameters: {
                                                          'presetId':
                                                              serializeParam(
                                                            '',
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          containerCompaniesRecordList
                                                              .first
                                                              .companylogo,
                                                          'https://res.cloudinary.com/dplpckpbm/image/upload/v1704589748/Screenshot_2023-12-31_at_15.43.12-removebg-preview_wahdfo.png',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      25.0, 5.0, 25.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  containerCompaniesRecordList
                                                      .first.welcomedescription,
                                                  'Welcome to your self-guided learning journey, where you can explore a world of knowledge at your own pace.',
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmallFamily,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily),
                                                        ),
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                            ),
                                            if (FFAppState().debugCount >= 3)
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                40.0, 0.0),
                                                    child: SelectionArea(
                                                        child: Text(
                                                      'CURRENT SESSION; ${FFAppState().nonLoggedInSessionId}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    )),
                                                  ),
                                                  Text(
                                                    'Active Thread; ${FFAppState().activeThread}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(25.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Comoany Code${valueOrDefault<String>(
                                                        FFAppState()
                                                            .companySecretCode,
                                                        'company not set ',
                                                      )}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            if (FFAppState().debugCount >= 3)
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                40.0, 0.0),
                                                    child: SelectionArea(
                                                        child: Text(
                                                      'Table Name; ${containerCompaniesRecordList.first.queryName}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    )),
                                                  ),
                                                  Text(
                                                    'Query Name; ${containerCompaniesRecordList.first.queryName}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ],
                                              ),
                                            if (FFAppState().debugCount >= 3)
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'url: ${containerCompaniesRecordList.first.flowiseUrl}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ],
                                              ),
                                            wrapWithModel(
                                              model: _model
                                                  .aICOMMUNICATIONLandingModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child:
                                                  AICOMMUNICATIONLandingWidget(
                                                askingQuestion: false,
                                              ),
                                            ),
                                            if (FFAppState().debugCount >= 3)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 1.0, 0.0, 10.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'LEARN_TOPIC_COMP_START_OVER_BTN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Button_update_app_state');
                                                    setState(() {
                                                      FFAppState().sessionId =
                                                          '';
                                                      FFAppState()
                                                          .activeThread = '';
                                                      FFAppState().sessionid =
                                                          '';
                                                      FFAppState()
                                                          .nonLoggedInSessionId = '';
                                                    });
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.pushNamed(
                                                      'Library-fixed',
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
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
                                                  text: 'Start Over',
                                                  options: FFButtonOptions(
                                                    width: 600.0,
                                                    height: 50.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 4.0,
                                                                24.0, 4.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .selectedButton,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 18.0,
                                                              useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmallFamily),
                                                            ),
                                                    elevation: 1.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            if (valueOrDefault<bool>(
                                              FFAppState().debugCount >= 3,
                                              false,
                                            ))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 1.0, 0.0, 10.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'LEARN_TOPIC_LEAVE_DEBUG_MODE_BTN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Button_update_app_state');
                                                    setState(() {
                                                      FFAppState().debugCount =
                                                          0;
                                                    });
                                                  },
                                                  text: 'Leave Debug Mode',
                                                  options: FFButtonOptions(
                                                    width: 600.0,
                                                    height: 50.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 4.0,
                                                                24.0, 4.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .selectedButton,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 18.0,
                                                              useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmallFamily),
                                                            ),
                                                    elevation: 1.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            StreamBuilder<List<SessionsRecord>>(
                                              stream: querySessionsRecord(
                                                queryBuilder:
                                                    (sessionsRecord) =>
                                                        sessionsRecord.where(
                                                  'sessionId',
                                                  isEqualTo: FFAppState()
                                                      .nonLoggedInSessionId,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<SessionsRecord>
                                                    cardSessionsRecordList =
                                                    snapshot.data!;
                                                return Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  elevation: 4.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Visibility(
                                                    visible:
                                                        valueOrDefault<bool>(
                                                      (cardSessionsRecordList
                                                              .first
                                                              .buttonValues
                                                              .where((e) =>
                                                                  e.buttonName ==
                                                                  'Build Learning Journey')
                                                              .toList()
                                                              .isNotEmpty) ==
                                                          true,
                                                      false,
                                                    ),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'LEARN_TOPIC_BUILD_LEARNING_PLAN_BTN_ON_T');
                                                        logFirebaseEvent(
                                                            'Button_backend_call');

                                                        var tilesv2RecordReference =
                                                            Tilesv2Record
                                                                .collection
                                                                .doc();
                                                        await tilesv2RecordReference
                                                            .set(
                                                                createTilesv2RecordData(
                                                          createdTime:
                                                              getCurrentTimestamp,
                                                          updatedTime:
                                                              getCurrentTimestamp,
                                                          sessionIdUser:
                                                              valueOrDefault<
                                                                  String>(
                                                            FFAppState()
                                                                .nonLoggedInSessionId,
                                                            '1',
                                                          ),
                                                          title:
                                                              'Welcome to your Learning Journey',
                                                          tileTier: 1,
                                                          parentId:
                                                              containerCompaniesRecordList
                                                                  .first
                                                                  .primaryTile,
                                                          tileIndex: 0,
                                                        ));
                                                        _model.createdTile = Tilesv2Record
                                                            .getDocumentFromData(
                                                                createTilesv2RecordData(
                                                                  createdTime:
                                                                      getCurrentTimestamp,
                                                                  updatedTime:
                                                                      getCurrentTimestamp,
                                                                  sessionIdUser:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    FFAppState()
                                                                        .nonLoggedInSessionId,
                                                                    '1',
                                                                  ),
                                                                  title:
                                                                      'Welcome to your Learning Journey',
                                                                  tileTier: 1,
                                                                  parentId:
                                                                      containerCompaniesRecordList
                                                                          .first
                                                                          .primaryTile,
                                                                  tileIndex: 0,
                                                                ),
                                                                tilesv2RecordReference);
                                                        logFirebaseEvent(
                                                            'Button_backend_call');

                                                        var tileBlocksRecordReference =
                                                            TileBlocksRecord
                                                                .collection
                                                                .doc();
                                                        await tileBlocksRecordReference
                                                            .set(
                                                                createTileBlocksRecordData(
                                                          createdTime:
                                                              getCurrentTimestamp,
                                                          updatedTime:
                                                              getCurrentTimestamp,
                                                          blockIndex: 0,
                                                          tileId: _model
                                                              .createdTile
                                                              ?.reference
                                                              .id,
                                                          htmlContent:
                                                              '<!DOCTYPE html> <html> <head>     <title>Content Generation in Progress</title>     <style>         body {             font-family: Arial, sans-serif;             background-color: #f2f2f2;             text-align: center;             padding: 50px;         }         .message-box {             background-color: #fff;             margin: auto;             padding: 20px;             border-radius: 8px;             box-shadow: 0 4px 8px rgba(0,0,0,0.1);             max-width: 400px;         }         .message-header {             font-size: 24px;             color: #333;             margin-bottom: 10px;         }         .message-body {             font-size: 16px;             color: #666;         }         .loader {             border: 4px solid #f3f3f3;             border-radius: 50%;             border-top: 4px solid #3498db;             width: 30px;             height: 30px;             -webkit-animation: spin 2s linear infinite;             animation: spin 2s linear infinite;             margin: 10px auto;         }         @-webkit-keyframes spin {             0% { -webkit-transform: rotate(0deg); }             100% { -webkit-transform: rotate(360deg); }         }         @keyframes spin {             0% { transform: rotate(0deg); }             100% { transform: rotate(360deg); }         }     </style> </head> <body>     <div class=\"message-box\">         <div class=\"message-header\">Generating Your Content</div>         <div class=\"loader\"></div>         <div class=\"message-body\">             We are still generating your content, it should take no more than a minute or two. Hang tight!         </div>     </div> </body> </html>',
                                                        ));
                                                        _model.createdTileBlock =
                                                            TileBlocksRecord
                                                                .getDocumentFromData(
                                                                    createTileBlocksRecordData(
                                                                      createdTime:
                                                                          getCurrentTimestamp,
                                                                      updatedTime:
                                                                          getCurrentTimestamp,
                                                                      blockIndex:
                                                                          0,
                                                                      tileId: _model
                                                                          .createdTile
                                                                          ?.reference
                                                                          .id,
                                                                      htmlContent:
                                                                          '<!DOCTYPE html> <html> <head>     <title>Content Generation in Progress</title>     <style>         body {             font-family: Arial, sans-serif;             background-color: #f2f2f2;             text-align: center;             padding: 50px;         }         .message-box {             background-color: #fff;             margin: auto;             padding: 20px;             border-radius: 8px;             box-shadow: 0 4px 8px rgba(0,0,0,0.1);             max-width: 400px;         }         .message-header {             font-size: 24px;             color: #333;             margin-bottom: 10px;         }         .message-body {             font-size: 16px;             color: #666;         }         .loader {             border: 4px solid #f3f3f3;             border-radius: 50%;             border-top: 4px solid #3498db;             width: 30px;             height: 30px;             -webkit-animation: spin 2s linear infinite;             animation: spin 2s linear infinite;             margin: 10px auto;         }         @-webkit-keyframes spin {             0% { -webkit-transform: rotate(0deg); }             100% { -webkit-transform: rotate(360deg); }         }         @keyframes spin {             0% { transform: rotate(0deg); }             100% { transform: rotate(360deg); }         }     </style> </head> <body>     <div class=\"message-box\">         <div class=\"message-header\">Generating Your Content</div>         <div class=\"loader\"></div>         <div class=\"message-body\">             We are still generating your content, it should take no more than a minute or two. Hang tight!         </div>     </div> </body> </html>',
                                                                    ),
                                                                    tileBlocksRecordReference);
                                                        logFirebaseEvent(
                                                            'Button_action_block');
                                                        unawaited(
                                                          () async {
                                                            await action_blocks
                                                                .getSomeTileNames(
                                                              context,
                                                              companyDoc:
                                                                  containerCompaniesRecordList
                                                                      .first,
                                                            );
                                                            setState(() {});
                                                          }(),
                                                        );
                                                        logFirebaseEvent(
                                                            'Button_update_app_state');
                                                        setState(() {
                                                          FFAppState()
                                                              .selectedLearnCardId = '';
                                                        });
                                                        logFirebaseEvent(
                                                            'Button_action_block');
                                                        unawaited(
                                                          () async {
                                                            await action_blocks
                                                                .tempStreamingWelcomeUserMessages(
                                                              context,
                                                              sessionsDoc:
                                                                  cardSessionsRecordList
                                                                      .first,
                                                            );
                                                            setState(() {});
                                                          }(),
                                                        );
                                                        logFirebaseEvent(
                                                            'Button_firestore_query');
                                                        _model.companyCodeWelcome =
                                                            await queryCompaniesRecordOnce(
                                                          queryBuilder:
                                                              (companiesRecord) =>
                                                                  companiesRecord
                                                                      .where(
                                                            'companyCode',
                                                            isEqualTo: FFAppState()
                                                                .companySecretCode,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Button_backend_call');

                                                        await cardSessionsRecordList
                                                            .first.reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'learnCardCount':
                                                                  FieldValue.increment(
                                                                      cardSessionsRecordList.first.freeCardsIssueCount >=
                                                                              1
                                                                          ? 0
                                                                          : 3),
                                                            },
                                                          ),
                                                        });
                                                        logFirebaseEvent(
                                                            'Button_update_app_state');
                                                        setState(() {
                                                          FFAppState()
                                                                  .showPane =
                                                              'content';
                                                        });

                                                        setState(() {});
                                                      },
                                                      text:
                                                          'Build Learning Plan',
                                                      options: FFButtonOptions(
                                                        width: 600.0,
                                                        height: 70.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    4.0,
                                                                    24.0,
                                                                    4.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .selectedButton,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      18.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                        elevation: 1.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation']!),
                                    ],
                                  ),
                                  wrapWithModel(
                                    model: _model.userDiscoverModel,
                                    updateCallback: () => setState(() {}),
                                    child: UserDiscoverWidget(
                                      askingQuestion: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
