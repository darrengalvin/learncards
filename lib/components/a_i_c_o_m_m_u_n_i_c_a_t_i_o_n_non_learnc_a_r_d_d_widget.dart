import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_non_learnc_a_r_d_d_model.dart';
export 'a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_non_learnc_a_r_d_d_model.dart';

class AICOMMUNICATIONNonLearncARDDWidget extends StatefulWidget {
  const AICOMMUNICATIONNonLearncARDDWidget({
    super.key,
    bool? askingQuestion,
    this.learnCard,
    this.learnCardId,
  }) : this.askingQuestion = askingQuestion ?? false;

  final bool askingQuestion;
  final LearnCardsRecord? learnCard;
  final String? learnCardId;

  @override
  State<AICOMMUNICATIONNonLearncARDDWidget> createState() =>
      _AICOMMUNICATIONNonLearncARDDWidgetState();
}

class _AICOMMUNICATIONNonLearncARDDWidgetState
    extends State<AICOMMUNICATIONNonLearncARDDWidget>
    with TickerProviderStateMixin {
  late AICOMMUNICATIONNonLearncARDDModel _model;

  final animationsMap = {
    'iconOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
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
    _model = createModel(context, () => AICOMMUNICATIONNonLearncARDDModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_NON_LEARNC');
      logFirebaseEvent('AI_COMMUNICATION-nonLearncARDD_update_co');
      setState(() {
        _model.questionReady = true;
      });
      logFirebaseEvent('AI_COMMUNICATION-nonLearncARDD_wait__del');
      await Future.delayed(const Duration(milliseconds: 2000));
      logFirebaseEvent('AI_COMMUNICATION-nonLearncARDD_scroll_to');
      await _model.columnChatsScrollable?.animateTo(
        _model.columnChatsScrollable!.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    _model.askTheQuestionController ??= TextEditingController();
    _model.askTheQuestionFocusNode ??= FocusNode();

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
      alignment: AlignmentDirectional(-1.0, -1.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22.0),
        child: Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.9,
          constraints: BoxConstraints(
            maxWidth: 1000.0,
          ),
          decoration: BoxDecoration(
            color: Color(0xC5FFFFFF),
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 2.0),
              )
            ],
            borderRadius: BorderRadius.circular(22.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(17.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 12.0, 12.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      80.0, 0.0, 80.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_NON_LEARNC');
                                      logFirebaseEvent(
                                          'Icon_update_component_state');
                                      setState(() {
                                        _model.questionReady = true;
                                      });
                                      logFirebaseEvent('Icon_update_app_state');
                                      _model.updatePage(() {
                                        FFAppState().endDrawerOpen = false;
                                      });
                                      logFirebaseEvent('Icon_bottom_sheet');
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 35.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Hello World',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (valueOrDefault<bool>(
                        FFAppState().debugCount >= 3,
                        false,
                      ))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (FFAppState().debugCount >= 3)
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_NON_LEARNC');
                                    logFirebaseEvent('Button_update_app_state');
                                    setState(() {
                                      FFAppState().sessionId = '';
                                      FFAppState().activeThread = '';
                                      FFAppState().sessionid = '';
                                      FFAppState().nonLoggedInSessionId = '';
                                    });
                                    logFirebaseEvent(
                                        'Button_update_component_state');
                                    setState(() {
                                      _model.questionReady = true;
                                    });
                                  },
                                  text: 'CLEAR CHAT',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFADADAD),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 12.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDownValueController ??=
                                            FormFieldController<String>(null),
                                        options: ['Reading Topic (thread)'],
                                        onChanged: (val) => setState(
                                            () => _model.dropDownValue = val),
                                        width: 300.0,
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText: 'Previous Conversations',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                'Hello World',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_NON_LEARNC');
                                  logFirebaseEvent(
                                      'Icon_update_component_state');
                                  setState(() {
                                    _model.questionReady = true;
                                  });
                                  logFirebaseEvent('Icon_bottom_sheet');
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 45.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: StreamBuilder<List<FlowiseChatsRecord>>(
                              stream: queryFlowiseChatsRecord(
                                queryBuilder: (flowiseChatsRecord) =>
                                    flowiseChatsRecord
                                        .where(
                                          'user_id',
                                          isEqualTo: loggedIn
                                              ? currentUserUid
                                              : FFAppState()
                                                  .nonLoggedInSessionId,
                                        )
                                        .orderBy('created_time'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<FlowiseChatsRecord>
                                    columnChatsScrollableFlowiseChatsRecordList =
                                    snapshot.data!;
                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      columnChatsScrollableFlowiseChatsRecordList
                                          .length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 8.0),
                                  itemBuilder:
                                      (context, columnChatsScrollableIndex) {
                                    final columnChatsScrollableFlowiseChatsRecord =
                                        columnChatsScrollableFlowiseChatsRecordList[
                                            columnChatsScrollableIndex];
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (valueOrDefault<bool>(
                                          columnChatsScrollableFlowiseChatsRecord
                                                  .role ==
                                              'human',
                                          false,
                                        ))
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          33.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF74C5FF),
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
                                                          EdgeInsets.all(4.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(9.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnChatsScrollableFlowiseChatsRecord
                                                                      .text,
                                                                  'aiMessage',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: Colors
                                                                          .black,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 15.0,
                                              ),
                                            ],
                                          ),
                                        if (columnChatsScrollableFlowiseChatsRecord
                                                .role ==
                                            'ai')
                                          Container(
                                            width: double.infinity,
                                            child: Stack(
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      width: 55.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          AnimatedContainer(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    100),
                                                            curve: Curves
                                                                .easeInOut,
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: 600.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFEEEEEE),
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
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                              ),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          9.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            4.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        if (responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          tablet:
                                                                              false,
                                                                          tabletLandscape:
                                                                              false,
                                                                          desktop:
                                                                              false,
                                                                        ))
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(6.0),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.asset(
                                                                                'assets/images/Untitled_6.png',
                                                                                width: 35.0,
                                                                                height: 35.0,
                                                                                fit: BoxFit.scaleDown,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(6.0),
                                                                                  child: MarkdownBody(
                                                                                    data: valueOrDefault<String>(
                                                                                      columnChatsScrollableFlowiseChatsRecord.text,
                                                                                      '-',
                                                                                    ),
                                                                                    selectable: true,
                                                                                    onTapLink: (_, url, __) => launchURL(url!),
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
                                                            ),
                                                          ),
                                                        ],
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
                                                        EdgeInsets.all(6.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/UpSkilller__1_-removebg-preview.png',
                                                        width: 35.0,
                                                        height: 35.0,
                                                        fit: BoxFit.scaleDown,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    );
                                  },
                                  controller: _model.columnChatsScrollable,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      if (FFAppState().flowiseMessages.length > 0)
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                              ))
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/UpSkilller__1_-removebg-preview.png',
                                        width: 35.0,
                                        height: 35.0,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                ),
                              Expanded(
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 600.0,
                                    maxHeight: 600.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: SingleChildScrollView(
                                    primary: false,
                                    controller: _model.columnController,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 55.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  FFAppState()
                                                      .flowiseMessages
                                                      .first
                                                      .message,
                                                  ' - -',
                                                ),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
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
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (valueOrDefault<bool>(
                              _model.questionReady == false,
                              true,
                            ))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Processing..',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Icon(
                                                Icons.hourglass_bottom,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ).animateOnPageLoad(animationsMap[
                                                  'iconOnPageLoadAnimation']!),
                                            ].divide(SizedBox(width: 9.0)),
                                          ),
                                          Container(
                                            height: 55.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            color: Color(0xFF505050),
                                          ),
                                        ],
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: 5.0,
                                      borderWidth: 1.0,
                                      buttonSize: 55.0,
                                      fillColor: Color(0xFFCDCDCD),
                                      icon: Icon(
                                        Icons.send_sharp,
                                        color: Color(0xFFA6A6A6),
                                        size: 24.0,
                                      ),
                                      showLoadingIndicator: true,
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            if (valueOrDefault<bool>(
                              _model.questionReady == true,
                              false,
                            ))
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: TextFormField(
                                          controller:
                                              _model.askTheQuestionController,
                                          focusNode:
                                              _model.askTheQuestionFocusNode,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Respond Here',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily,
                                                      fontSize: 18.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily),
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFF464646),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 18.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          maxLines: 4,
                                          validator: _model
                                              .askTheQuestionControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: 5.0,
                                      borderWidth: 1.0,
                                      buttonSize: 55.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      icon: Icon(
                                        Icons.send_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      showLoadingIndicator: true,
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_NON_LEARNC');
                                        logFirebaseEvent(
                                            'IconButton_firestore_query');
                                        _model.companyQueryByCode =
                                            await queryCompaniesRecordOnce(
                                          queryBuilder: (companiesRecord) =>
                                              companiesRecord.where(
                                            'companyCode',
                                            isEqualTo: valueOrDefault<String>(
                                              FFAppState().companySecretCode,
                                              '223344',
                                            ),
                                          ),
                                        );
                                        if (FFAppState().nonLoggedInSessionId ==
                                                null ||
                                            FFAppState().nonLoggedInSessionId ==
                                                '') {
                                          // set session id on appstate
                                          logFirebaseEvent(
                                              'IconButton_setsessionidonappstate');
                                          setState(() {
                                            FFAppState().sessionId =
                                                random_data.randomString(
                                              18,
                                              22,
                                              true,
                                              true,
                                              true,
                                            );
                                            FFAppState().nonLoggedInSessionId =
                                                random_data.randomString(
                                              18,
                                              22,
                                              true,
                                              true,
                                              true,
                                            );
                                          });
                                        }
                                        // flowise chat document
                                        logFirebaseEvent(
                                            'IconButton_flowisechatdocument');

                                        await FlowiseChatsRecord.collection
                                            .doc()
                                            .set(createFlowiseChatsRecordData(
                                              userId: loggedIn
                                                  ? currentUserReference?.id
                                                  : FFAppState()
                                                      .nonLoggedInSessionId,
                                              role: 'human',
                                              text: _model
                                                  .askTheQuestionController
                                                  .text,
                                              createdTime: getCurrentTimestamp,
                                              sessionId: FFAppState().sessionid,
                                              threadId:
                                                  FFAppState().selectedThreadId,
                                              learnCardId:
                                                  valueOrDefault<String>(
                                                widget.learnCard?.learnCardId,
                                                'notset',
                                              ),
                                            ));
                                        logFirebaseEvent(
                                            'IconButton_scroll_to');
                                        await _model.columnChatsScrollable
                                            ?.animateTo(
                                          _model.columnChatsScrollable!.position
                                              .maxScrollExtent,
                                          duration: Duration(milliseconds: 100),
                                          curve: Curves.ease,
                                        );
                                        if (!(FFAppState().activeThread !=
                                                null &&
                                            FFAppState().activeThread != '')) {
                                          // generate active thread id
                                          logFirebaseEvent(
                                              'IconButton_generateactivethreadid');
                                          setState(() {
                                            FFAppState().activeThread =
                                                random_data.randomString(
                                              12,
                                              22,
                                              true,
                                              true,
                                              true,
                                            );
                                          });
                                        }
                                        // question ready false
                                        logFirebaseEvent(
                                            'IconButton_questionreadyfalse');
                                        setState(() {
                                          _model.questionReady = false;
                                        });
                                        logFirebaseEvent(
                                            'IconButton_scroll_to');
                                        await _model.columnChatsScrollable
                                            ?.animateTo(
                                          _model.columnChatsScrollable!.position
                                              .maxScrollExtent,
                                          duration: Duration(milliseconds: 100),
                                          curve: Curves.ease,
                                        );
                                        logFirebaseEvent(
                                            'IconButton_custom_action');
                                        await actions.callFlowiseStreamingChat(
                                          _model.askTheQuestionController.text,
                                          _model.companyQueryByCode?.first
                                              ?.continueLearnCardPrompt,
                                          '1',
                                          valueOrDefault<String>(
                                            widget.learnCard?.inputKey,
                                            'input key not set',
                                          ),
                                          valueOrDefault<String>(
                                            widget.learnCard?.outputKey,
                                            'output key not set',
                                          ),
                                          _model.companyQueryByCode?.first
                                              ?.supabaseProjUrl,
                                          _model.companyQueryByCode?.first
                                              ?.tableName,
                                          _model.companyQueryByCode?.first
                                              ?.supabaseApiKey,
                                          _model.companyQueryByCode?.first
                                              ?.queryName,
                                          valueOrDefault<bool>(
                                            _model.companyQueryByCode?.first
                                                ?.isLearnCards,
                                            false,
                                          ),
                                          () async {},
                                          () async {},
                                          'unknown',
                                        );
                                        // question ready false
                                        logFirebaseEvent(
                                            'IconButton_questionreadyfalse');
                                        setState(() {
                                          _model.questionReady = true;
                                        });
                                        // flowise chat document ai
                                        logFirebaseEvent(
                                            'IconButton_flowisechatdocumentai');

                                        await FlowiseChatsRecord.collection
                                            .doc()
                                            .set(createFlowiseChatsRecordData(
                                              userId: loggedIn
                                                  ? currentUserReference?.id
                                                  : FFAppState()
                                                      .nonLoggedInSessionId,
                                              role: 'ai',
                                              text: FFAppState()
                                                  .flowiseMessages
                                                  .first
                                                  .message,
                                              createdTime: getCurrentTimestamp,
                                              sessionId: FFAppState().sessionid,
                                              threadId: valueOrDefault<String>(
                                                FFAppState().selectedThreadId,
                                                'threadIdNotSet',
                                              ),
                                              learnCardId:
                                                  valueOrDefault<String>(
                                                widget.learnCard?.learnCardId,
                                                'notset',
                                              ),
                                            ));
                                        logFirebaseEvent(
                                            'IconButton_scroll_to');
                                        await _model.columnChatsScrollable
                                            ?.animateTo(
                                          _model.columnChatsScrollable!.position
                                              .maxScrollExtent,
                                          duration: Duration(milliseconds: 100),
                                          curve: Curves.ease,
                                        );
                                        logFirebaseEvent(
                                            'IconButton_update_app_state');
                                        setState(() {
                                          FFAppState().flowiseMessages = [];
                                        });
                                        logFirebaseEvent(
                                            'IconButton_update_component_state');
                                        setState(() {
                                          _model.questionReady = true;
                                        });
                                        logFirebaseEvent(
                                            'IconButton_wait__delay');
                                        await Future.delayed(
                                            const Duration(milliseconds: 500));
                                        logFirebaseEvent(
                                            'IconButton_clear_text_fields_pin_codes');
                                        setState(() {
                                          _model.askTheQuestionController
                                              ?.clear();
                                        });
                                        logFirebaseEvent(
                                            'IconButton_scroll_to');
                                        await _model.columnChatsScrollable
                                            ?.animateTo(
                                          _model.columnChatsScrollable!.position
                                              .maxScrollExtent,
                                          duration: Duration(milliseconds: 100),
                                          curve: Curves.ease,
                                        );

                                        setState(() {});
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 0.0, 30.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).success,
                                    icon: Icon(
                                      Icons.thumb_up,
                                      color: FlutterFlowTheme.of(context).white,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_NON_LEARNC');
                                      logFirebaseEvent(
                                          'IconButton_firestore_query');
                                      _model.activeSession =
                                          await querySessionsRecordOnce(
                                        queryBuilder: (sessionsRecord) =>
                                            sessionsRecord.where(
                                          'sessionId',
                                          isEqualTo:
                                              FFAppState().nonLoggedInSessionId,
                                        ),
                                      );
                                      logFirebaseEvent(
                                          'IconButton_backend_call');

                                      await _model
                                          .activeSession!.first.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'learnCardFeedbackGivenIds':
                                                FieldValue.arrayUnion([
                                              FFAppState().selectedLearnCardId
                                            ]),
                                          },
                                        ),
                                      });
                                      if (_model.activeSession?.first
                                              ?.learnCardFeedbackGivenIds
                                              ?.contains(valueOrDefault<String>(
                                            widget.learnCard?.learnCardId,
                                            '1212',
                                          )) ==
                                          true) {
                                        logFirebaseEvent(
                                            'IconButton_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                title: Text(
                                                    'This LearnCard has already recieved Feedback'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        await _model
                                            .activeSession!.first.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'learnCardFeedbackGivenIds':
                                                  FieldValue.arrayUnion([
                                                valueOrDefault<String>(
                                                  widget.learnCard?.learnCardId,
                                                  '121212',
                                                )
                                              ]),
                                              'learnCardCount':
                                                  FieldValue.increment(1),
                                            },
                                          ),
                                        });
                                      }

                                      logFirebaseEvent(
                                          'IconButton_firestore_query');
                                      _model.companyQueryByCode1 =
                                          await queryCompaniesRecordOnce(
                                        queryBuilder: (companiesRecord) =>
                                            companiesRecord.where(
                                          'companyCode',
                                          isEqualTo: valueOrDefault<String>(
                                            FFAppState().companySecretCode,
                                            '223344',
                                          ),
                                        ),
                                      );
                                      if (FFAppState().nonLoggedInSessionId ==
                                              null ||
                                          FFAppState().nonLoggedInSessionId ==
                                              '') {
                                        // set session id on appstate
                                        logFirebaseEvent(
                                            'IconButton_setsessionidonappstate');
                                        setState(() {
                                          FFAppState().sessionId =
                                              random_data.randomString(
                                            18,
                                            22,
                                            true,
                                            true,
                                            true,
                                          );
                                          FFAppState().nonLoggedInSessionId =
                                              random_data.randomString(
                                            18,
                                            22,
                                            true,
                                            true,
                                            true,
                                          );
                                        });
                                      }
                                      // flowise chat document
                                      logFirebaseEvent(
                                          'IconButton_flowisechatdocument');

                                      await FlowiseChatsRecord.collection
                                          .doc()
                                          .set(createFlowiseChatsRecordData(
                                            userId: loggedIn
                                                ? currentUserReference?.id
                                                : FFAppState()
                                                    .nonLoggedInSessionId,
                                            role: 'human',
                                            text: 'I like this',
                                            createdTime: getCurrentTimestamp,
                                            sessionId: FFAppState().sessionid,
                                            threadId:
                                                FFAppState().selectedThreadId,
                                            learnCardId: valueOrDefault<String>(
                                              widget.learnCard?.learnCardId,
                                              'notset',
                                            ),
                                          ));
                                      if (!(FFAppState().activeThread != null &&
                                          FFAppState().activeThread != '')) {
                                        // generate active thread id
                                        logFirebaseEvent(
                                            'IconButton_generateactivethreadid');
                                        setState(() {
                                          FFAppState().activeThread =
                                              random_data.randomString(
                                            12,
                                            22,
                                            true,
                                            true,
                                            true,
                                          );
                                        });
                                      }
                                      // question ready false
                                      logFirebaseEvent(
                                          'IconButton_questionreadyfalse');
                                      setState(() {
                                        _model.questionReady = false;
                                      });
                                      logFirebaseEvent('IconButton_scroll_to');
                                      await _model.columnChatsScrollable
                                          ?.animateTo(
                                        _model.columnChatsScrollable!.position
                                            .maxScrollExtent,
                                        duration: Duration(milliseconds: 100),
                                        curve: Curves.ease,
                                      );
                                      logFirebaseEvent(
                                          'IconButton_custom_action');
                                      await actions.callFlowiseStreamingChat(
                                        _model.askTheQuestionController.text,
                                        _model.companyQueryByCode1?.first
                                            ?.continueLearnCardPrompt,
                                        '1',
                                        valueOrDefault<String>(
                                          widget.learnCard?.inputKey,
                                          'input key not set',
                                        ),
                                        valueOrDefault<String>(
                                          widget.learnCard?.outputKey,
                                          'output key not set',
                                        ),
                                        _model.companyQueryByCode?.first
                                            ?.supabaseProjUrl,
                                        _model.companyQueryByCode?.first
                                            ?.tableName,
                                        _model.companyQueryByCode?.first
                                            ?.supabaseApiKey,
                                        _model.companyQueryByCode?.first
                                            ?.queryName,
                                        valueOrDefault<bool>(
                                          _model.companyQueryByCode?.first
                                              ?.isLearnCards,
                                          false,
                                        ),
                                        () async {},
                                        () async {},
                                        'unknown',
                                      );
                                      // question ready false
                                      logFirebaseEvent(
                                          'IconButton_questionreadyfalse');
                                      setState(() {
                                        _model.questionReady = true;
                                      });
                                      // flowise chat document ai
                                      logFirebaseEvent(
                                          'IconButton_flowisechatdocumentai');

                                      await FlowiseChatsRecord.collection
                                          .doc()
                                          .set(createFlowiseChatsRecordData(
                                            userId: loggedIn
                                                ? currentUserReference?.id
                                                : FFAppState()
                                                    .nonLoggedInSessionId,
                                            role: 'ai',
                                            text: FFAppState()
                                                .flowiseMessages
                                                .first
                                                .message,
                                            createdTime: getCurrentTimestamp,
                                            sessionId: FFAppState().sessionid,
                                            threadId: valueOrDefault<String>(
                                              FFAppState().selectedThreadId,
                                              'threadIdNotSet',
                                            ),
                                            learnCardId: valueOrDefault<String>(
                                              widget.learnCard?.learnCardId,
                                              'notset',
                                            ),
                                          ));
                                      logFirebaseEvent(
                                          'IconButton_update_app_state');
                                      setState(() {
                                        FFAppState().flowiseMessages = [];
                                      });
                                      logFirebaseEvent(
                                          'IconButton_update_component_state');
                                      setState(() {
                                        _model.questionReady = true;
                                      });
                                      logFirebaseEvent(
                                          'IconButton_wait__delay');
                                      await Future.delayed(
                                          const Duration(milliseconds: 500));
                                      logFirebaseEvent(
                                          'IconButton_clear_text_fields_pin_codes');
                                      setState(() {
                                        _model.askTheQuestionController
                                            ?.clear();
                                      });
                                      logFirebaseEvent('IconButton_scroll_to');
                                      await _model.columnChatsScrollable
                                          ?.animateTo(
                                        _model.columnChatsScrollable!.position
                                            .maxScrollExtent,
                                        duration: Duration(milliseconds: 100),
                                        curve: Curves.ease,
                                      );

                                      setState(() {});
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 0.0, 30.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: Icon(
                                      Icons.thumb_down_alt,
                                      color: FlutterFlowTheme.of(context).white,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_NON_LEARNC');
                                      // flowise chat document
                                      logFirebaseEvent(
                                          'IconButton_flowisechatdocument');

                                      await FlowiseChatsRecord.collection
                                          .doc()
                                          .set(createFlowiseChatsRecordData(
                                            userId: loggedIn
                                                ? currentUserReference?.id
                                                : FFAppState()
                                                    .nonLoggedInSessionId,
                                            role: 'human',
                                            text: 'I don\'t like this',
                                            createdTime: getCurrentTimestamp,
                                            sessionId: FFAppState().sessionid,
                                            threadId:
                                                FFAppState().selectedThreadId,
                                          ));
                                      logFirebaseEvent(
                                          'IconButton_firestore_query');
                                      _model.activeSessionNegative =
                                          await querySessionsRecordOnce(
                                        queryBuilder: (sessionsRecord) =>
                                            sessionsRecord.where(
                                          'sessionId',
                                          isEqualTo:
                                              FFAppState().nonLoggedInSessionId,
                                        ),
                                      );
                                      logFirebaseEvent(
                                          'IconButton_backend_call');

                                      await _model.activeSessionNegative!.first
                                          .reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'learnCardFeedbackGivenIds':
                                                FieldValue.arrayUnion([
                                              widget.learnCard?.learnCardId
                                            ]),
                                          },
                                        ),
                                      });
                                      if (_model.activeSession?.first
                                              ?.learnCardFeedbackGivenIds
                                              ?.contains(widget
                                                  .learnCard?.learnCardId) ==
                                          true) {
                                        logFirebaseEvent(
                                            'IconButton_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                title: Text(
                                                    'This LearnCard has already recieved Feedback'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        await _model.activeSessionNegative!
                                            .first.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'learnCardFeedbackGivenIds':
                                                  FieldValue.arrayUnion([
                                                widget.learnCard?.learnCardId
                                              ]),
                                              'learnCardCount':
                                                  FieldValue.increment(1),
                                            },
                                          ),
                                        });
                                      }

                                      setState(() {});
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: 400.0,
                                          decoration: BoxDecoration(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
