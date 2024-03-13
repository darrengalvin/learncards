import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_copy_model.dart';
export 'a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_copy_model.dart';

class AICOMMUNICATIONCopyWidget extends StatefulWidget {
  const AICOMMUNICATIONCopyWidget({
    super.key,
    bool? askingQuestion,
  }) : this.askingQuestion = askingQuestion ?? false;

  final bool askingQuestion;

  @override
  State<AICOMMUNICATIONCopyWidget> createState() =>
      _AICOMMUNICATIONCopyWidgetState();
}

class _AICOMMUNICATIONCopyWidgetState extends State<AICOMMUNICATIONCopyWidget>
    with TickerProviderStateMixin {
  late AICOMMUNICATIONCopyModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1500.ms,
          begin: Offset(0.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1500.ms,
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
    _model = createModel(context, () => AICOMMUNICATIONCopyModel());

    _model.askTheQuestionController ??= TextEditingController();
    _model.askTheQuestionFocusNode ??= FocusNode();
    _model.askTheQuestionFocusNode!.addListener(
      () async {
        logFirebaseEvent('A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_COPY_AskTh');
        if (_model.askTheQuestionController.text != null &&
            _model.askTheQuestionController.text != '') {
          logFirebaseEvent('AskTheQuestion_update_component_state');
          setState(() {});
        } else {
          logFirebaseEvent('AskTheQuestion_update_component_state');
          setState(() {});
        }
      },
    );
    _model.textFieldMessageController ??= TextEditingController();
    _model.textFieldMessageFocusNode ??= FocusNode();

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

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(17.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TextFormField(
                            controller: _model.askTheQuestionController,
                            focusNode: _model.askTheQuestionFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.askTheQuestionController',
                              Duration(milliseconds: 2000),
                              () async {
                                logFirebaseEvent(
                                    'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_COPY_AskTh');
                                if (_model.askTheQuestionController.text !=
                                        null &&
                                    _model.askTheQuestionController.text !=
                                        '') {
                                  logFirebaseEvent(
                                      'AskTheQuestion_update_component_state');
                                  setState(() {
                                    _model.questionReady = false;
                                  });
                                } else {
                                  logFirebaseEvent(
                                      'AskTheQuestion_update_component_state');
                                  setState(() {
                                    _model.questionReady = true;
                                  });
                                }
                              },
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Ask your question here',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    fontSize: 18.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 18.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            maxLines: 2,
                            validator: _model.askTheQuestionControllerValidator
                                .asValidator(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (valueOrDefault<bool>(
                  widget.askingQuestion == true,
                  false,
                ))
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 3000.0,
                        height: 1000.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 30.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(17.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        reverse: true,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  33.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF74C5FF),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  4.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Flexible(
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              9.0),
                                                                  child: Text(
                                                                    'Hello ',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              Colors.black,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.person_2,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 35.0,
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                width: double.infinity,
                                                child: Stack(
                                                  children: [
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      phone: false,
                                                    ))
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(6.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/logocaio.png',
                                                            width: 35.0,
                                                            height: 35.0,
                                                            fit: BoxFit
                                                                .scaleDown,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 8.0))
                                                .around(SizedBox(height: 8.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color: FlutterFlowTheme.of(context).accent4,
                                  ),
                                  Container(
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 50.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      15.0,
                                                                      0.0,
                                                                      15.0),
                                                          child: Text(
                                                            _model
                                                                .askTheQuestionController
                                                                .text,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    25.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () {
                                                            print(
                                                                'Button pressed ...');
                                                          },
                                                          text: 'Search',
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
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 200),
                                                      curve: Curves.easeIn,
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textFieldMessageController,
                                                          focusNode: _model
                                                              .textFieldMessageFocusNode,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textFieldMessageController',
                                                            Duration(
                                                                milliseconds:
                                                                    2000),
                                                            () =>
                                                                setState(() {}),
                                                          ),
                                                          onFieldSubmitted:
                                                              (_) async {
                                                            logFirebaseEvent(
                                                                'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_COPY_TextF');
                                                            if (!(_model.askTheQuestionController
                                                                        .text !=
                                                                    null &&
                                                                _model.askTheQuestionController
                                                                        .text !=
                                                                    '')) {
                                                              logFirebaseEvent(
                                                                  'TextFieldMessage_show_snack_bar');
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Ask a question',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                        ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                ),
                                                              );
                                                              return;
                                                            }
                                                            if (!(FFAppState()
                                                                        .sessionId !=
                                                                    null &&
                                                                FFAppState()
                                                                        .sessionId !=
                                                                    '')) {
                                                              logFirebaseEvent(
                                                                  'TextFieldMessage_update_app_state');
                                                              setState(() {
                                                                FFAppState()
                                                                        .sessionId =
                                                                    'ff-session-${random_data.randomString(
                                                                  7,
                                                                  12,
                                                                  true,
                                                                  true,
                                                                  true,
                                                                )}';
                                                              });
                                                            }
                                                            // Remove / disable this action if there are any problems with text field or submit button visibility
                                                            logFirebaseEvent(
                                                                'TextFieldMessage_update_app_state');
                                                            setState(() {
                                                              FFAppState()
                                                                      .processingFlowise =
                                                                  true;
                                                            });
                                                          },
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'Question',
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      color: Colors
                                                                          .black,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelMediumFamily),
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      color: Colors
                                                                          .black,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelMediumFamily),
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xB9BCBCBC),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor:
                                                                Colors.white,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: Colors
                                                                    .black,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                          cursorColor:
                                                              Color(0xFF323232),
                                                          validator: _model
                                                              .textFieldMessageControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 100),
                                                        curve: Curves.easeIn,
                                                        width: 100.0,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEFEFEF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFFCBCBCB),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: ClipRect(
                                                                child:
                                                                    ImageFiltered(
                                                                  imageFilter:
                                                                      ImageFilter
                                                                          .blur(
                                                                    sigmaX:
                                                                        12.0,
                                                                    sigmaY:
                                                                        12.0,
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: 55.0,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      gradient:
                                                                          LinearGradient(
                                                                        colors: [
                                                                          Colors
                                                                              .white,
                                                                          Color(
                                                                              0x6884A6E9)
                                                                        ],
                                                                        stops: [
                                                                          0.0,
                                                                          1.0
                                                                        ],
                                                                        begin: AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                        end: AlignmentDirectional(
                                                                            0,
                                                                            1.0),
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                    ),
                                                                  ).animateOnPageLoad(
                                                                          animationsMap[
                                                                              'containerOnPageLoadAnimation']!),
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
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                  curve: Curves.easeInOut,
                                                  width: 65.0,
                                                  height: 45.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    borderRadius: 5.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 45.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                    icon: Icon(
                                                      Icons.send,
                                                      color: Colors.white,
                                                      size: 24.0,
                                                    ),
                                                    showLoadingIndicator: true,
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_COPY_send_');
                                                      if (!(_model.textFieldMessageController
                                                                  .text !=
                                                              null &&
                                                          _model.textFieldMessageController
                                                                  .text !=
                                                              '')) {
                                                        logFirebaseEvent(
                                                            'IconButton_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Ask a question',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                  ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                        return;
                                                      }
                                                      if (!(FFAppState()
                                                                  .sessionId !=
                                                              null &&
                                                          FFAppState()
                                                                  .sessionId !=
                                                              '')) {
                                                        logFirebaseEvent(
                                                            'IconButton_update_app_state');
                                                        setState(() {
                                                          FFAppState()
                                                                  .sessionId =
                                                              'ff-session-${random_data.randomString(
                                                            7,
                                                            12,
                                                            true,
                                                            true,
                                                            true,
                                                          )}';
                                                        });
                                                      }
                                                      // Remove / disable this action if there are any problems with text field or submit button visibility
                                                      logFirebaseEvent(
                                                          'IconButton_update_app_state');
                                                      setState(() {
                                                        FFAppState()
                                                                .processingFlowise =
                                                            true;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                  curve: Curves.easeInOut,
                                                  width: 65.0,
                                                  height: 45.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Color(0xFFB5B5B5),
                                                    borderRadius: 5.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 45.0,
                                                    fillColor:
                                                        Color(0xFFD3D3D3),
                                                    icon: Icon(
                                                      Icons.send,
                                                      color: Colors.white,
                                                      size: 24.0,
                                                    ),
                                                    showLoadingIndicator: true,
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Builder(
                                        builder: (context) {
                                          final localMessages =
                                              FFAppState().userChats.toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            reverse: true,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: localMessages.length,
                                            itemBuilder:
                                                (context, localMessagesIndex) {
                                              final localMessagesItem =
                                                  localMessages[
                                                      localMessagesIndex];
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  if (localMessagesItem.role ==
                                                      'human')
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        33.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFF74C5FF),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            4.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(9.0),
                                                                        child:
                                                                            Text(
                                                                          localMessagesItem
                                                                              .message,
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: Colors.black,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.person_2,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 35.0,
                                                        ),
                                                      ],
                                                    ),
                                                  if (valueOrDefault<bool>(
                                                    localMessagesItem.role ==
                                                        'ai',
                                                    false,
                                                  ))
                                                    Container(
                                                      width: double.infinity,
                                                      child: Stack(
                                                        children: [
                                                          if (localMessagesItem
                                                                  .role ==
                                                              'ai')
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                ))
                                                                  Container(
                                                                    width: 55.0,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                  ),
                                                                Flexible(
                                                                  child:
                                                                      AnimatedContainer(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            100),
                                                                    curve: Curves
                                                                        .easeInOut,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          600.0,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFEEEEEE),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(8.0),
                                                                        bottomRight:
                                                                            Radius.circular(8.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          9.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                if (responsiveVisibility(
                                                                                  context: context,
                                                                                  tablet: false,
                                                                                  tabletLandscape: false,
                                                                                  desktop: false,
                                                                                ))
                                                                                  Padding(
                                                                                    padding: EdgeInsets.all(6.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: Image.asset(
                                                                                        'assets/images/Untitled_6.png',
                                                                                        width: 35.0,
                                                                                        height: 35.0,
                                                                                        fit: BoxFit.scaleDown,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                Flexible(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(9.0, 9.0, 9.0, 0.0),
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        functions.splitMessage(localMessagesItem.message, 'Here are some links for further reading', 0),
                                                                                        '...default',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            lineHeight: 1.5,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          if (valueOrDefault<
                                                                              bool>(
                                                                            functions.getSplitLength(localMessagesItem.message, 'Here are some links for further reading:').toString() ==
                                                                                '2',
                                                                            false,
                                                                          ))
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 8.0),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                constraints: BoxConstraints(
                                                                                  minHeight: 40.0,
                                                                                ),
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(18.0, 12.0, 0.0, 4.0),
                                                                                      child: Text(
                                                                                        'Further Reading',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            width: 100.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(13.0, 0.0, 13.0, 0.0),
                                                                                              child: Builder(
                                                                                                builder: (context) {
                                                                                                  final linkName = functions
                                                                                                          .extractLinkName(valueOrDefault<String>(
                                                                                                            functions.splitMessage(localMessagesItem.message, 'Here are some links for further reading', 1),
                                                                                                            '...',
                                                                                                          ))
                                                                                                          ?.toList() ??
                                                                                                      [];
                                                                                                  return Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: List.generate(linkName.length, (linkNameIndex) {
                                                                                                      final linkNameItem = linkName[linkNameIndex];
                                                                                                      return Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                              child: Container(
                                                                                                                width: 24.0,
                                                                                                                height: 24.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: Color(0x57B3B1B1),
                                                                                                                  shape: BoxShape.circle,
                                                                                                                ),
                                                                                                                child: Align(
                                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      '${valueOrDefault<String>(
                                                                                                                        ((valueOrDefault<int>(
                                                                                                                                      linkNameIndex,
                                                                                                                                      0,
                                                                                                                                    ) ??
                                                                                                                                    0) +
                                                                                                                                1)
                                                                                                                            .toString(),
                                                                                                                        '1',
                                                                                                                      )}',
                                                                                                                      '1',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Expanded(
                                                                                                              child: InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  logFirebaseEvent('A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_COPY_Text_');
                                                                                                                  logFirebaseEvent('Text_launch_u_r_l');
                                                                                                                  await launchURL(functions.extractLinks(valueOrDefault<String>(
                                                                                                                    functions.splitMessage(localMessagesItem.message, 'Here are some links for further reading', 1),
                                                                                                                    '...',
                                                                                                                  ))![linkNameIndex]);
                                                                                                                },
                                                                                                                child: Text(
                                                                                                                  linkNameItem,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                      ),
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
                                                                  ),
                                                                ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                  tablet: false,
                                                                  tabletLandscape:
                                                                      false,
                                                                  desktop:
                                                                      false,
                                                                ))
                                                                  Container(
                                                                    width: 33.0,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                          ))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(6.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/Untitled_6.png',
                                                                  width: 35.0,
                                                                  height: 35.0,
                                                                  fit: BoxFit
                                                                      .scaleDown,
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                ]
                                                    .divide(
                                                        SizedBox(height: 8.0))
                                                    .around(
                                                        SizedBox(height: 8.0)),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    height: 60.0,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Suggested:',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: Container(
                                                    width: 200.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              17.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'I’m feeling burnt out',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: Container(
                                                    width: 240.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              17.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'What is CORE how do i use it?',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: Container(
                                                    width: 200.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              17.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Who is Carl Rogers?',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
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
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
