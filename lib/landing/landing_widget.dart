import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/learn_abot_companies_widget.dart';
import '/components/learn_topic_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'landing_model.dart';
export 'landing_model.dart';

class LandingWidget extends StatefulWidget {
  const LandingWidget({super.key});

  @override
  State<LandingWidget> createState() => _LandingWidgetState();
}

class _LandingWidgetState extends State<LandingWidget> {
  late LandingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LandingModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'landing'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LANDING_PAGE_landing_ON_INIT_STATE');
      logFirebaseEvent('landing_firestore_query');
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
        logFirebaseEvent('landing_update_app_state');
        setState(() {
          FFAppState().companySecretCode = '22335555';
        });
      }
      if (!(FFAppState().nonLoggedInSessionId != '')) {
        logFirebaseEvent('landing_backend_call');

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
        logFirebaseEvent('landing_backend_call');

        await _model.sessionsCreated!.reference.update(createSessionsRecordData(
          sessionId: _model.sessionsCreated?.reference.id,
        ));
        logFirebaseEvent('landing_update_app_state');
        setState(() {
          FFAppState().nonLoggedInSessionId =
              _model.sessionsCreated!.reference.id;
        });
      }
      if (!(FFAppState().activeThread != '')) {
        logFirebaseEvent('landing_update_app_state');
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
      logFirebaseEvent('landing_firestore_query');
      _model.queryFlowiseChats = await queryFlowiseChatsRecordOnce();
      if (!(_model.queryFlowiseChats!
          .where((e) => e.sessionId == FFAppState().nonLoggedInSessionId)
          .toList()
          .isNotEmpty)) {
        // flowise chat document
        logFirebaseEvent('landing_flowisechatdocument');

        await FlowiseChatsRecord.collection
            .doc()
            .set(createFlowiseChatsRecordData(
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
      }
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
        title: 'landing',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  StreamBuilder<List<CompaniesRecord>>(
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
                      List<CompaniesRecord> containerCompaniesRecordList =
                          snapshot.data!;
                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 2.0,
                                      sigmaY: 2.0,
                                    ),
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Stack(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 2.0,
                                                  sigmaY: 2.0,
                                                ),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .customColor7,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        containerCompaniesRecordList
                                                            .first
                                                            .backgroundImage,
                                                        'https://res.cloudinary.com/dplpckpbm/image/upload/v1703535226/learningPathwaysBright_b3strj.webp',
                                                      ),
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -1.89),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                const BoxDecoration(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 850.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0x49E0D9D9),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(17.0),
                                                      ),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            wrapWithModel(
                                                              model: _model
                                                                  .learnTopicModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              child:
                                                                  const LearnTopicWidget(),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 25.0,
                                                                20.0, 0.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          MouseRegion(
                                                            opaque: false,
                                                            cursor: MouseCursor
                                                                    .defer ??
                                                                MouseCursor
                                                                    .defer,
                                                            onEnter:
                                                                ((event) async {
                                                              setState(() =>
                                                                  _model.mouseRegionHovered1 =
                                                                      true);
                                                              logFirebaseEvent(
                                                                  'LANDING_MouseRegion_a06emy7l_ON_TOGGLE_O');
                                                              logFirebaseEvent(
                                                                  'MouseRegion_update_page_state');
                                                              setState(() {
                                                                _model.showCompanyCode =
                                                                    true;
                                                              });
                                                            }),
                                                            onExit:
                                                                ((event) async {
                                                              setState(() =>
                                                                  _model.mouseRegionHovered1 =
                                                                      false);
                                                              logFirebaseEvent(
                                                                  'LANDING_MouseRegion_a06emy7l_ON_TOGGLE_O');
                                                              logFirebaseEvent(
                                                                  'MouseRegion_update_page_state');
                                                              setState(() {
                                                                _model.showCompanyCode =
                                                                    false;
                                                              });
                                                            }),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'LANDING_GOT_A_COMPANY_CODE?_BTN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Button_update_page_state');
                                                                      setState(
                                                                          () {
                                                                        _model.showCompanyCode =
                                                                            true;
                                                                      });
                                                                    },
                                                                    text:
                                                                        'Got a company Code?',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          50.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                20.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'LANDING_PAGE_CLEAR_DEBUG_BTN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Button_update_app_state');
                                                                      setState(
                                                                          () {
                                                                        FFAppState()
                                                                            .debugCount = 0;
                                                                      });
                                                                    },
                                                                    text:
                                                                        'Clear Debug',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          50.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                20.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 25.0,
                                                                20.0, 0.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          if (_model
                                                              .showCompanyCode)
                                                            MouseRegion(
                                                              opaque: false,
                                                              cursor: MouseCursor
                                                                      .defer ??
                                                                  MouseCursor
                                                                      .defer,
                                                              onEnter:
                                                                  ((event) async {
                                                                setState(() =>
                                                                    _model.mouseRegionHovered2 =
                                                                        true);
                                                                logFirebaseEvent(
                                                                    'LANDING_MouseRegion_4mkm6vjf_ON_TOGGLE_O');
                                                                logFirebaseEvent(
                                                                    'MouseRegion_update_page_state');
                                                                setState(() {
                                                                  _model.showCompanyCode =
                                                                      true;
                                                                });
                                                              }),
                                                              onExit:
                                                                  ((event) async {
                                                                setState(() =>
                                                                    _model.mouseRegionHovered2 =
                                                                        false);
                                                                logFirebaseEvent(
                                                                    'LANDING_MouseRegion_4mkm6vjf_ON_TOGGLE_O');
                                                                logFirebaseEvent(
                                                                    'MouseRegion_update_page_state');
                                                                setState(() {
                                                                  _model.showCompanyCode =
                                                                      false;
                                                                });
                                                              }),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                constraints:
                                                                    const BoxConstraints(
                                                                  maxWidth:
                                                                      900.0,
                                                                  maxHeight:
                                                                      700.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0xFFE6EDFB),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              17.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.all(25.0),
                                                                                    child: Text(
                                                                                      'Have a Company Code? Enter it Here!',
                                                                                      style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                                            fontSize: 22.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        logFirebaseEvent('LANDING_PAGE_DEMOS_HERE_BTN_ON_TAP');
                                                                                        logFirebaseEvent('Button_update_page_state');
                                                                                        setState(() {
                                                                                          _model.showDemoCompanies = true;
                                                                                        });
                                                                                      },
                                                                                      text: 'Demos Here',
                                                                                      options: FFButtonOptions(
                                                                                        height: 40.0,
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).accent2,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                              color: Colors.white,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                            ),
                                                                                        elevation: 3.0,
                                                                                        borderSide: const BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Divider(
                                                                                        thickness: 1.0,
                                                                                        color: FlutterFlowTheme.of(context).accent2,
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: SingleChildScrollView(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: const EdgeInsets.all(25.0),
                                                                                                child: Text(
                                                                                                  'Are you associated with a membership body, institution, or organisation that\'s invited you to join their custom learning plan? \n\nEnter your code here, and we\'ll direct you to their tailored platform for a self-guided learning experience with their curated content.\n\nOpting to proceed without a company code? No worries! You\'ll access a wide range of AI-generated content through LearnCards, crafted to enhance your learning journey.',
                                                                                                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                                                        fontSize: 18.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Divider(
                                                                                                thickness: 1.0,
                                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  if (_model.showDemoCompanies == true)
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 15.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                            child: Text(
                                                                                                              'Demos ',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    fontSize: 30.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          RichText(
                                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                                            text: TextSpan(
                                                                                                              children: [
                                                                                                                TextSpan(
                                                                                                                  text: 'Institute of Sales Professionals ',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        fontSize: 22.0,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                      ),
                                                                                                                ),
                                                                                                                const TextSpan(
                                                                                                                  text: '22334455',
                                                                                                                  style: TextStyle(
                                                                                                                    fontSize: 22.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                const TextSpan(
                                                                                                                  text: '',
                                                                                                                  style: TextStyle(),
                                                                                                                )
                                                                                                              ],
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    fontSize: 12.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          RichText(
                                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                                            text: TextSpan(
                                                                                                              children: [
                                                                                                                TextSpan(
                                                                                                                  text: 'Leeds University:  ',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        fontSize: 22.0,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                      ),
                                                                                                                ),
                                                                                                                const TextSpan(
                                                                                                                  text: 'lE3DUN!V',
                                                                                                                  style: TextStyle(
                                                                                                                    fontSize: 22.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                const TextSpan(
                                                                                                                  text: '',
                                                                                                                  style: TextStyle(),
                                                                                                                )
                                                                                                              ],
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          RichText(
                                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                                            text: TextSpan(
                                                                                                              children: [
                                                                                                                TextSpan(
                                                                                                                  text: 'Martial Arts Business.   ',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        fontSize: 22.0,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                      ),
                                                                                                                ),
                                                                                                                const TextSpan(
                                                                                                                  text: 'MABM4455',
                                                                                                                  style: TextStyle(
                                                                                                                    fontSize: 22.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                const TextSpan(
                                                                                                                  text: '',
                                                                                                                  style: TextStyle(),
                                                                                                                )
                                                                                                              ],
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          RichText(
                                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                                            text: TextSpan(
                                                                                                              children: [
                                                                                                                TextSpan(
                                                                                                                  text: 'African Youth Education Hub : ',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        fontSize: 22.0,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                      ),
                                                                                                                ),
                                                                                                                const TextSpan(
                                                                                                                  text: 'AA1AA212',
                                                                                                                  style: TextStyle(
                                                                                                                    fontSize: 22.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                const TextSpan(
                                                                                                                  text: '',
                                                                                                                  style: TextStyle(),
                                                                                                                )
                                                                                                              ],
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          RichText(
                                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                                            text: TextSpan(
                                                                                                              children: [
                                                                                                                TextSpan(
                                                                                                                  text: 'Job Center Plus.   ',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        fontSize: 22.0,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                      ),
                                                                                                                ),
                                                                                                                const TextSpan(
                                                                                                                  text: '09090808',
                                                                                                                  style: TextStyle(
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    fontSize: 22.0,
                                                                                                                  ),
                                                                                                                )
                                                                                                              ],
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                                                                                                          child: Text(
                                                                                                            'Enter your code here',
                                                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 10.0, 0.0),
                                                                                                        child: FFButtonWidget(
                                                                                                          onPressed: () async {
                                                                                                            logFirebaseEvent('LANDING_WANT_YOUR_OWN_PLATFORM?_BTN_ON_T');
                                                                                                            logFirebaseEvent('Button_bottom_sheet');
                                                                                                            await showModalBottomSheet(
                                                                                                              isScrollControlled: true,
                                                                                                              backgroundColor: Colors.transparent,
                                                                                                              enableDrag: false,
                                                                                                              context: context,
                                                                                                              builder: (context) {
                                                                                                                return WebViewAware(
                                                                                                                  child: GestureDetector(
                                                                                                                    onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                                    child: Padding(
                                                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                                                      child: LearnAbotCompaniesWidget(
                                                                                                                        onClosePressed: () async {},
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                          },
                                                                                                          text: 'Want your own Platform?',
                                                                                                          options: FFButtonOptions(
                                                                                                            height: 50.0,
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 20.0,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                                ),
                                                                                                            elevation: 3.0,
                                                                                                            borderSide: const BorderSide(
                                                                                                              color: Colors.transparent,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Divider(
                                                                                            thickness: 1.0,
                                                                                            color: FlutterFlowTheme.of(context).accent2,
                                                                                          ),
                                                                                          Divider(
                                                                                            thickness: 1.0,
                                                                                            color: FlutterFlowTheme.of(context).accent2,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                                                                                            child: PinCodeTextField(
                                                                                              autoDisposeControllers: false,
                                                                                              appContext: context,
                                                                                              length: 8,
                                                                                              textStyle: FlutterFlowTheme.of(context).bodyLarge,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                              enableActiveFill: false,
                                                                                              autoFocus: true,
                                                                                              enablePinAutofill: false,
                                                                                              errorTextSpace: 16.0,
                                                                                              showCursor: true,
                                                                                              cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                              obscureText: false,
                                                                                              hintCharacter: '?',
                                                                                              keyboardType: TextInputType.number,
                                                                                              pinTheme: PinTheme(
                                                                                                fieldHeight: 44.0,
                                                                                                fieldWidth: 44.0,
                                                                                                borderWidth: 2.0,
                                                                                                borderRadius: const BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(12.0),
                                                                                                  bottomRight: Radius.circular(12.0),
                                                                                                  topLeft: Radius.circular(12.0),
                                                                                                  topRight: Radius.circular(12.0),
                                                                                                ),
                                                                                                shape: PinCodeFieldShape.box,
                                                                                                activeColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                inactiveColor: FlutterFlowTheme.of(context).alternate,
                                                                                                selectedColor: FlutterFlowTheme.of(context).primary,
                                                                                                activeFillColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                inactiveFillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                selectedFillColor: FlutterFlowTheme.of(context).primary,
                                                                                              ),
                                                                                              controller: _model.pinCodeController,
                                                                                              onChanged: (_) {},
                                                                                              onCompleted: (_) async {
                                                                                                logFirebaseEvent('LANDING_PinCode_oibym5xx_ON_PINCODE_COMP');
                                                                                                logFirebaseEvent('PinCode_firestore_query');
                                                                                                _model.allCompanies = await queryCompaniesRecordOnce();
                                                                                                if (_model.pinCodeController!.text == _model.allCompanies?.where((e) => e.companyCode == _model.pinCodeController!.text).toList().first.companyCode) {
                                                                                                  logFirebaseEvent('PinCode_alert_dialog');
                                                                                                  await showDialog(
                                                                                                    context: context,
                                                                                                    builder: (alertDialogContext) {
                                                                                                      return WebViewAware(
                                                                                                        child: AlertDialog(
                                                                                                          title: const Text('ok'),
                                                                                                          actions: [
                                                                                                            TextButton(
                                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                              child: const Text('Ok'),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                  logFirebaseEvent('PinCode_update_app_state');
                                                                                                  setState(() {
                                                                                                    FFAppState().companySecretCode = _model.pinCodeController!.text;
                                                                                                  });
                                                                                                } else {
                                                                                                  logFirebaseEvent('PinCode_alert_dialog');
                                                                                                  await showDialog(
                                                                                                    context: context,
                                                                                                    builder: (alertDialogContext) {
                                                                                                      return WebViewAware(
                                                                                                        child: AlertDialog(
                                                                                                          title: const Text('no match found'),
                                                                                                          actions: [
                                                                                                            TextButton(
                                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                              child: const Text('Ok'),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                  logFirebaseEvent('PinCode_update_app_state');
                                                                                                  setState(() {
                                                                                                    FFAppState().companySecretCode = '22335555';
                                                                                                  });
                                                                                                  logFirebaseEvent('PinCode_alert_dialog');
                                                                                                  await showDialog(
                                                                                                    context: context,
                                                                                                    builder: (alertDialogContext) {
                                                                                                      return WebViewAware(
                                                                                                        child: AlertDialog(
                                                                                                          title: const Text('Reverted back to default '),
                                                                                                          content: const Text('LearnCards'),
                                                                                                          actions: [
                                                                                                            TextButton(
                                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                              child: const Text('Ok'),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                }

                                                                                                logFirebaseEvent('PinCode_navigate_to');

                                                                                                context.goNamed(
                                                                                                  'landing',
                                                                                                  extra: <String, dynamic>{
                                                                                                    kTransitionInfoKey: const TransitionInfo(
                                                                                                      hasTransition: true,
                                                                                                      transitionType: PageTransitionType.fade,
                                                                                                      duration: Duration(milliseconds: 0),
                                                                                                    ),
                                                                                                  },
                                                                                                );

                                                                                                setState(() {});
                                                                                              },
                                                                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                                              validator: _model.pinCodeControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
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
                                                    ),
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
                              ),
                            ],
                          ),
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
