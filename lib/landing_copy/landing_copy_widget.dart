import '/backend/api_requests/api_calls.dart';
import '/components/learn_topic_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'landing_copy_model.dart';
export 'landing_copy_model.dart';

class LandingCopyWidget extends StatefulWidget {
  const LandingCopyWidget({super.key});

  @override
  State<LandingCopyWidget> createState() => _LandingCopyWidgetState();
}

class _LandingCopyWidgetState extends State<LandingCopyWidget> {
  late LandingCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LandingCopyModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'landingCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LANDING_COPY_landingCopy_ON_INIT_STATE');
      if ((FFAppState().openAiData.isNotEmpty) == true) {
        logFirebaseEvent('landingCopy_update_app_state');
        setState(() {
          FFAppState().openAiData = [];
        });
      } else {
        return;
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
        title: 'landingCopy',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 2.0,
                              sigmaY: 2.0,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 2.0,
                                          sigmaY: 2.0,
                                        ),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor7,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                FFAppState().backgroundImageUrl,
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
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (_model.apiResultReady != true)
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    constraints: BoxConstraints(
                                                      minWidth: 500.0,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                FFAppState()
                                                                    .backgroundImageUrl,
                                                                width: 400.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 360.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            200.0,
                                                                            0.0,
                                                                            200.0,
                                                                            0.0),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/Screenshot_2023-12-25_at_20.25.06-removebg-preview.png',
                                                                      width:
                                                                          300.0,
                                                                      height:
                                                                          500.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        17.0),
                                                          ),
                                                        ),
                                                        wrapWithModel(
                                                          model: _model
                                                              .learnTopicModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              LearnTopicWidget(),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      30.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'LANDING_COPY_PAGE_START_OVER_BTN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Button_update_app_state');
                                                                      setState(
                                                                          () {
                                                                        FFAppState().dalle3Used =
                                                                            false;
                                                                        FFAppState().openAiData =
                                                                            [];
                                                                      });
                                                                    },
                                                                    text:
                                                                        'Dalle3. used${FFAppState().dalle3Used.toString()}',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          150.0,
                                                                      height:
                                                                          50.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          4.0,
                                                                          24.0,
                                                                          4.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .selectedButton,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                18.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                      elevation:
                                                                          1.0,
                                                                      borderSide:
                                                                          BorderSide(
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
                                                                  Container(
                                                                    height:
                                                                        60.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    logFirebaseEvent('LANDING_COPY_PAGE_LET\'S_GO_BTN_ON_TAP');
                                                                                    logFirebaseEvent('Button_navigate_to');

                                                                                    context.pushNamed('signup');
                                                                                  },
                                                                                  text: 'Let\'s go',
                                                                                  options: FFButtonOptions(
                                                                                    width: 150.0,
                                                                                    height: 50.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 4.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).selectedButton,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 18.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                        ),
                                                                                    elevation: 1.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height:
                                                                        60.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                  ),
                                                                  Container(
                                                                    height:
                                                                        60.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          200.0,
                                                                          0.0,
                                                                          200.0,
                                                                          0.0),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    logFirebaseEvent('LANDING_COPY_PAGE_INSPIRE_ME_BTN_ON_TAP');
                                                                                    logFirebaseEvent('Button_backend_call');
                                                                                    _model.apiResultrbg = await OpenAiInspireMeCall.call(
                                                                                      systemMessage: 'I have a platform that suggests things that one can learn using openAi Api, any topic I need a list of 5 items, just the items no conversation',
                                                                                      userMessage: 'inspire me',
                                                                                    );
                                                                                    if ((_model.apiResultrbg?.succeeded ?? true)) {
                                                                                      logFirebaseEvent('Button_alert_dialog');
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return WebViewAware(
                                                                                            child: AlertDialog(
                                                                                              title: Text((_model.apiResultrbg?.jsonBody ?? '').toString()),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                  child: Text('Ok'),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                      logFirebaseEvent('Button_update_page_state');
                                                                                      setState(() {
                                                                                        _model.inspireItems = (_model.apiResultrbg?.jsonBody ?? '').toList().cast<String>();
                                                                                      });
                                                                                    } else {
                                                                                      logFirebaseEvent('Button_alert_dialog');
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return WebViewAware(
                                                                                            child: AlertDialog(
                                                                                              title: Text((_model.apiResultrbg?.statusCode ?? 200).toString()),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                  child: Text('Ok'),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    }

                                                                                    setState(() {});
                                                                                  },
                                                                                  text: 'Inspire me',
                                                                                  options: FFButtonOptions(
                                                                                    width: 150.0,
                                                                                    height: 50.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 4.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).selectedButton,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 18.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                        ),
                                                                                    elevation: 1.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
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
                                                              Container(
                                                                height: 60.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                              ),
                                                              Container(
                                                                height: 60.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          200.0,
                                                                          0.0,
                                                                          200.0,
                                                                          0.0),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                              child: Container(
                                                                                width: 200.0,
                                                                                height: 40.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(17.0),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    'Python Programming',
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                              child: Container(
                                                                                width: 240.0,
                                                                                height: 40.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(17.0),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    'Working with Elephants',
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                              child: Container(
                                                                                width: 200.0,
                                                                                height: 40.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(17.0),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    'Marketing',
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                            ],
                                                          ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'LANDING_COPY_PAGE_BUTTON_BTN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Button_update_app_state');
                                                            setState(() {
                                                              FFAppState()
                                                                      .backgroundImageUrl =
                                                                  'https://res.cloudinary.com/dplpckpbm/image/upload/v1703441285/Screenshot_2023-12-24_at_18.07.40_xuj9lx.png';
                                                            });
                                                            if (FFAppState()
                                                                        .backgroundImageUrl !=
                                                                    null &&
                                                                FFAppState()
                                                                        .backgroundImageUrl !=
                                                                    '') {
                                                              logFirebaseEvent(
                                                                  'Button_update_app_state');
                                                              setState(() {
                                                                FFAppState()
                                                                    .backgroundImageUrl = '';
                                                              });
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'Button_update_app_state');
                                                              setState(() {
                                                                FFAppState()
                                                                        .backgroundImageUrl =
                                                                    'https://res.cloudinary.com/dplpckpbm/image/upload/v1703441285/Screenshot_2023-12-24_at_18.07.40_xuj9lx.png';
                                                              });
                                                            }
                                                          },
                                                          text: 'Button',
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (valueOrDefault<bool>(
                            FFAppState().apiActive == true,
                            false,
                          ))
                            Opacity(
                              opacity: 0.9,
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .selectedButton,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 500.0,
                                      height: 500.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor5,
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          30.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  _model
                                                                      .tempStreamingMessage,
                                                                  'working..',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).headlineMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          30.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  FFAppState()
                                                                      .nonLoggedInSessionId,
                                                                  'no session id set',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).headlineMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Lottie.asset(
                                            'assets/lottie_animations/Animation_-_1703108950357.json',
                                            width: 350.0,
                                            height: 350.0,
                                            fit: BoxFit.cover,
                                            animate: true,
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
