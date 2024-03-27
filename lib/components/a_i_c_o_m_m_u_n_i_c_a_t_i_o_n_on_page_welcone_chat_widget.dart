import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_on_page_welcone_chat_model.dart';
export 'a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_on_page_welcone_chat_model.dart';

class AICOMMUNICATIONOnPageWelconeChatWidget extends StatefulWidget {
  const AICOMMUNICATIONOnPageWelconeChatWidget({
    super.key,
    bool? askingQuestion,
    required this.companiesDoc,
    bool? isLearnCard,
    this.learnCardDoc,
    this.sessionsDoc,
  })  : askingQuestion = askingQuestion ?? false,
        isLearnCard = isLearnCard ?? false;

  final bool askingQuestion;
  final CompaniesRecord? companiesDoc;
  final bool isLearnCard;
  final LearnCardsRecord? learnCardDoc;
  final SessionsRecord? sessionsDoc;

  @override
  State<AICOMMUNICATIONOnPageWelconeChatWidget> createState() =>
      _AICOMMUNICATIONOnPageWelconeChatWidgetState();
}

class _AICOMMUNICATIONOnPageWelconeChatWidgetState
    extends State<AICOMMUNICATIONOnPageWelconeChatWidget>
    with TickerProviderStateMixin {
  late AICOMMUNICATIONOnPageWelconeChatModel _model;

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
    _model =
        createModel(context, () => AICOMMUNICATIONOnPageWelconeChatModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_WELCONE');
      logFirebaseEvent('AI_COMMUNICATION-OnPage-WelconeChat_upda');
      setState(() {
        _model.questionReady = true;
      });
      logFirebaseEvent('AI_COMMUNICATION-OnPage-WelconeChat_wait');
      await Future.delayed(const Duration(milliseconds: 1000));
      logFirebaseEvent('AI_COMMUNICATION-OnPage-WelconeChat_scro');
      await _model.columnChatsScrollable?.animateTo(
        _model.columnChatsScrollable!.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
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

    return SingleChildScrollView(
      controller: _model.columnController1,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: StreamBuilder<List<MyTeamRecord>>(
              stream: queryMyTeamRecord(
                queryBuilder: (myTeamRecord) => myTeamRecord.where(
                  'memberId',
                  isEqualTo: FFAppState().selectedTeam,
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
                List<MyTeamRecord> containerMyTeamRecordList = snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final containerMyTeamRecord =
                    containerMyTeamRecordList.isNotEmpty
                        ? containerMyTeamRecordList.first
                        : null;
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_WELCONE');
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22.0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.97,
                      constraints: BoxConstraints(
                        maxWidth: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 550.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 580.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 580.0;
                          } else {
                            return 580.0;
                          }
                        }(),
                      ),
                      decoration: BoxDecoration(
                        boxShadow: const [
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return 550.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return 580.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return 700.0;
                                  } else {
                                    return 1550.0;
                                  }
                                }(),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            containerMyTeamRecord
                                                                ?.memberName,
                                                            'name',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 22.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            containerMyTeamRecord
                                                                ?.role,
                                                            'role',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons.close_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_WELCONE');
                                                          logFirebaseEvent(
                                                              'IconButton_bottom_sheet');
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 7.0, 7.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final skills =
                                                  containerMyTeamRecord?.skills
                                                          .toList() ??
                                                      [];
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children:
                                                    List.generate(skills.length,
                                                        (skillsIndex) {
                                                  final skillsItem =
                                                      skills[skillsIndex];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                7.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        skillsItem,
                                                        '-',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: 650.0,
                                                  decoration: const BoxDecoration(),
                                                  child: SingleChildScrollView(
                                                    controller: _model
                                                        .columnController2,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerMyTeamRecord
                                                                          ?.memberSummary,
                                                                      'summary',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 80.0,
                                                                  height: 80.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: 80.0,
                                                                    height:
                                                                        80.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      containerMyTeamRecord!
                                                                          .image,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            7.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent4,
                                                                  ),
                                                                  child:
                                                                      Visibility(
                                                                    visible:
                                                                        valueOrDefault<
                                                                            bool>(
                                                                      FFAppState()
                                                                              .IsLearnCard ==
                                                                          true,
                                                                      false,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(6.0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () {
                                                                              print('Button pressed ...');
                                                                            },
                                                                            text:
                                                                                'Help me with this LearnCard : ',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
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
                                                                        Text(
                                                                          'This is the title of a selected learnCard which i need to pass through ',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                      ],
                                                                    ),
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
                                  if (valueOrDefault<bool>(
                                    FFAppState().debugCount >= 3,
                                    false,
                                  ))
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 12.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 12.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .dropDownValueController ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.dropDownValue ??=
                                                        'Reading Topic (thread)',
                                                  ),
                                                  options: const [
                                                    'Reading Topic (thread)'
                                                  ],
                                                  onChanged: (val) => setState(
                                                      () => _model
                                                          .dropDownValue = val),
                                                  width: 300.0,
                                                  height: 50.0,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium,
                                                  hintText: 'Reading Topic',
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  borderWidth: 2.0,
                                                  borderRadius: 8.0,
                                                  margin: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 4.0, 16.0, 4.0),
                                                  hidesUnderline: true,
                                                  isOverButton: true,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_WELCONE');
                                                    logFirebaseEvent(
                                                        'Button_update_app_state');
                                                    setState(() {
                                                      FFAppState()
                                                              .selectedThreadId =
                                                          random_data
                                                              .randomString(
                                                        8,
                                                        10,
                                                        true,
                                                        true,
                                                        true,
                                                      );
                                                    });
                                                    // flowise chat document
                                                    logFirebaseEvent(
                                                        'Button_flowisechatdocument');

                                                    var flowiseChatsRecordReference =
                                                        FlowiseChatsRecord
                                                            .collection
                                                            .doc();
                                                    await flowiseChatsRecordReference
                                                        .set(
                                                            createFlowiseChatsRecordData(
                                                      userId: loggedIn
                                                          ? currentUserReference
                                                              ?.id
                                                          : FFAppState()
                                                              .nonLoggedInSessionId,
                                                      role: 'ai',
                                                      text: widget.companiesDoc
                                                          ?.youAreMyCoachPrompt,
                                                      createdTime:
                                                          getCurrentTimestamp,
                                                      sessionId: valueOrDefault<
                                                          String>(
                                                        FFAppState()
                                                            .nonLoggedInSessionId,
                                                        'not set',
                                                      ),
                                                      threadId: valueOrDefault<
                                                          String>(
                                                        FFAppState()
                                                            .selectedThreadId,
                                                        'no id set',
                                                      ),
                                                    ));
                                                    _model.initialchatCreated =
                                                        FlowiseChatsRecord
                                                            .getDocumentFromData(
                                                                createFlowiseChatsRecordData(
                                                                  userId: loggedIn
                                                                      ? currentUserReference
                                                                          ?.id
                                                                      : FFAppState()
                                                                          .nonLoggedInSessionId,
                                                                  role: 'ai',
                                                                  text: widget
                                                                      .companiesDoc
                                                                      ?.youAreMyCoachPrompt,
                                                                  createdTime:
                                                                      getCurrentTimestamp,
                                                                  sessionId:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    FFAppState()
                                                                        .nonLoggedInSessionId,
                                                                    'not set',
                                                                  ),
                                                                  threadId:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    FFAppState()
                                                                        .selectedThreadId,
                                                                    'no id set',
                                                                  ),
                                                                ),
                                                                flowiseChatsRecordReference);

                                                    setState(() {});
                                                  },
                                                  text: 'New Thread',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
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
                                              ],
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              FFAppState().activeThread,
                                              '- -',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_WELCONE');
                                              logFirebaseEvent(
                                                  'Icon_update_component_state');
                                              setState(() {
                                                _model.questionReady = true;
                                              });
                                              logFirebaseEvent(
                                                  'Icon_bottom_sheet');
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 45.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 1.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.network(
                                              containerMyTeamRecord.image,
                                            ).image,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: StreamBuilder<
                                              List<FlowiseChatsRecord>>(
                                            stream: queryFlowiseChatsRecord(
                                              queryBuilder:
                                                  (flowiseChatsRecord) =>
                                                      flowiseChatsRecord
                                                          .where(
                                                            'user_id',
                                                            isEqualTo: loggedIn
                                                                ? currentUserUid
                                                                : FFAppState()
                                                                    .nonLoggedInSessionId,
                                                          )
                                                          .where(
                                                            'thread_id',
                                                            isEqualTo:
                                                                valueOrDefault<
                                                                    String>(
                                                              FFAppState()
                                                                  .selectedThreadId,
                                                              'noidset',
                                                            ),
                                                          )
                                                          .orderBy(
                                                              'created_time'),
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
                                                    const SizedBox(height: 8.0),
                                                itemBuilder: (context,
                                                    columnChatsScrollableIndex) {
                                                  final columnChatsScrollableFlowiseChatsRecord =
                                                      columnChatsScrollableFlowiseChatsRecordList[
                                                          columnChatsScrollableIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      if (columnChatsScrollableFlowiseChatsRecord
                                                              .role ==
                                                          'human')
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Flexible(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            33.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 350.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 500.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 700.0;
                                                                      } else {
                                                                        return 1550.0;
                                                                      }
                                                                    }(),
                                                                  ),
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Color(
                                                                        0xFFE6EDFB),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              8.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              8.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
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
                                                                                const EdgeInsets.all(9.0),
                                                                            child:
                                                                                Text(
                                                                              columnChatsScrollableFlowiseChatsRecord.text,
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                      if ((columnChatsScrollableFlowiseChatsRecord
                                                                  .role ==
                                                              'ai') ||
                                                          (columnChatsScrollableFlowiseChatsRecord
                                                                  .role ==
                                                              'system'))
                                                        SizedBox(
                                                          width:
                                                              double.infinity,
                                                          child: Stack(
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Flexible(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        if (columnChatsScrollableFlowiseChatsRecord.role ==
                                                                            'ai')
                                                                          AnimatedContainer(
                                                                            duration:
                                                                                const Duration(milliseconds: 100),
                                                                            curve:
                                                                                Curves.easeInOut,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: () {
                                                                                if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                  return 480.0;
                                                                                } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                  return 580.0;
                                                                                } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                  return 880.0;
                                                                                } else {
                                                                                  return 1550.0;
                                                                                }
                                                                              }(),
                                                                            ),
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: Color(0xFFEEEEEE),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(8.0),
                                                                                bottomRight: Radius.circular(8.0),
                                                                                topLeft: Radius.circular(0.0),
                                                                                topRight: Radius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 9.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.all(4.0),
                                                                                    child: Row(
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
                                                                                            padding: const EdgeInsets.all(3.0),
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.network(
                                                                                                containerMyTeamRecord.image,
                                                                                                width: 35.0,
                                                                                                height: 35.0,
                                                                                                fit: BoxFit.scaleDown,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        Expanded(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsets.all(6.0),
                                                                                                      child: MarkdownBody(
                                                                                                        data: valueOrDefault<String>(
                                                                                                          columnChatsScrollableFlowiseChatsRecord.text,
                                                                                                          '-',
                                                                                                        ),
                                                                                                        selectable: true,
                                                                                                        onTapLink: (_, url, __) => launchURL(url!),
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
                                                                        if (columnChatsScrollableFlowiseChatsRecord.role ==
                                                                            'system')
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                15.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                AnimatedContainer(
                                                                              duration: const Duration(milliseconds: 100),
                                                                              curve: Curves.easeInOut,
                                                                              constraints: BoxConstraints(
                                                                                maxWidth: () {
                                                                                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                    return 480.0;
                                                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                    return 580.0;
                                                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                    return 880.0;
                                                                                  } else {
                                                                                    return 1550.0;
                                                                                  }
                                                                                }(),
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).customColor3,
                                                                                borderRadius: const BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(8.0),
                                                                                  bottomRight: Radius.circular(8.0),
                                                                                  topLeft: Radius.circular(0.0),
                                                                                  topRight: Radius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 9.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.all(4.0),
                                                                                      child: Row(
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
                                                                                              padding: const EdgeInsets.all(3.0),
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                child: Image.network(
                                                                                                  widget.companiesDoc!.companylogo,
                                                                                                  width: 35.0,
                                                                                                  height: 35.0,
                                                                                                  fit: BoxFit.scaleDown,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          Expanded(
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsets.all(6.0),
                                                                                                        child: MarkdownBody(
                                                                                                          data: valueOrDefault<String>(
                                                                                                            columnChatsScrollableFlowiseChatsRecord.text,
                                                                                                            '-',
                                                                                                          ),
                                                                                                          selectable: true,
                                                                                                          onTapLink: (_, url, __) => launchURL(url!),
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
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              if (responsiveVisibility(
                                                                context:
                                                                    context,
                                                                phone: false,
                                                              ))
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              6.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/UpSkilller__1_-removebg-preview.png',
                                                                      width:
                                                                          35.0,
                                                                      height:
                                                                          35.0,
                                                                      fit: BoxFit
                                                                          .scaleDown,
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                    ],
                                                  );
                                                },
                                                controller: _model
                                                    .columnChatsScrollable,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().flowiseMessages.isNotEmpty)
                                    SizedBox(
                                      width: double.infinity,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                0.0, -429.57),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Flexible(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      AnimatedContainer(
                                                        duration: const Duration(
                                                            milliseconds: 100),
                                                        curve: Curves.easeInOut,
                                                        constraints:
                                                            const BoxConstraints(
                                                          maxWidth: 600.0,
                                                        ),
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0xFFEEEEEE),
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
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                        ),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
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
                                                                    const EdgeInsets
                                                                        .all(
                                                                            4.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        controller:
                                                                            _model.columnController3,
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
                                                                              child: SingleChildScrollView(
                                                                                controller: _model.columnMarkdownScrollable,
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.all(6.0),
                                                                                      child: MarkdownBody(
                                                                                        data: valueOrDefault<String>(
                                                                                          FFAppState().flowiseMessages.first.message,
                                                                                          '- -',
                                                                                        ),
                                                                                        selectable: true,
                                                                                        onTapLink: (_, url, __) => launchURL(url!),
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
                                          ),
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                          ))
                                            Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                  if ((FFAppState().flowiseMessages.isNotEmpty) &&
                                      responsiveVisibility(
                                        context: context,
                                        desktop: false,
                                      ))
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                          ))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsets.all(6.0),
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
                                            ),
                                          Expanded(
                                            child: Container(
                                              constraints: const BoxConstraints(
                                                maxWidth: 600.0,
                                                maxHeight: 600.0,
                                              ),
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: MarkdownBody(
                                                      data: valueOrDefault<
                                                          String>(
                                                        FFAppState()
                                                            .flowiseMessages
                                                            .first
                                                            .message,
                                                        ' - -',
                                                      ),
                                                      selectable: true,
                                                      onTapLink: (_, url, __) =>
                                                          launchURL(url!),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (_model.questionReady == false)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 12.0),
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
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Processing',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .hourglass_bottom,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'iconOnPageLoadAnimation']!),
                                                        ].divide(const SizedBox(
                                                            width: 9.0)),
                                                      ),
                                                      const Divider(
                                                        thickness: 1.0,
                                                        color:
                                                            Color(0xFF505050),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 5.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 55.0,
                                                  fillColor: const Color(0xFFCDCDCD),
                                                  icon: const Icon(
                                                    Icons.send_sharp,
                                                    color: Color(0xFFA6A6A6),
                                                    size: 24.0,
                                                  ),
                                                  showLoadingIndicator: true,
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          child: Visibility(
                                            visible:
                                                _model.questionReady == true,
                                            child: Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller: _model
                                                          .askTheQuestionController,
                                                      focusNode: _model
                                                          .askTheQuestionFocusNode,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Respond Here',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  fontSize:
                                                                      18.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Color(
                                                                0xFF464646),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                      maxLines: 3,
                                                      validator: _model
                                                          .askTheQuestionControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderRadius: 5.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 55.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                      icon: Icon(
                                                        Icons.send_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      showLoadingIndicator:
                                                          true,
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_WELCONE');
                                                        logFirebaseEvent(
                                                            'IconButton_firestore_query');
                                                        _model.companyQueryByCode =
                                                            await queryCompaniesRecordOnce(
                                                          queryBuilder:
                                                              (companiesRecord) =>
                                                                  companiesRecord
                                                                      .where(
                                                            'companyCode',
                                                            isEqualTo:
                                                                valueOrDefault<
                                                                    String>(
                                                              FFAppState()
                                                                  .companySecretCode,
                                                              '223344',
                                                            ),
                                                          ),
                                                        );
                                                        if (FFAppState()
                                                                    .nonLoggedInSessionId ==
                                                                '') {}
                                                        // flowise chat document
                                                        logFirebaseEvent(
                                                            'IconButton_flowisechatdocument');

                                                        await FlowiseChatsRecord
                                                            .collection
                                                            .doc()
                                                            .set(
                                                                createFlowiseChatsRecordData(
                                                              userId: loggedIn
                                                                  ? currentUserReference
                                                                      ?.id
                                                                  : FFAppState()
                                                                      .nonLoggedInSessionId,
                                                              role: 'human',
                                                              text: _model
                                                                  .askTheQuestionController
                                                                  .text,
                                                              createdTime:
                                                                  getCurrentTimestamp,
                                                              sessionId:
                                                                  FFAppState()
                                                                      .nonLoggedInSessionId,
                                                              threadId: FFAppState()
                                                                  .selectedThreadId,
                                                            ));
                                                        if (!(FFAppState()
                                                                    .selectedThreadId !=
                                                                '')) {
                                                          // generate active thread id
                                                          logFirebaseEvent(
                                                              'IconButton_generateactivethreadid');
                                                          setState(() {
                                                            FFAppState()
                                                                    .activeThread =
                                                                random_data
                                                                    .randomString(
                                                              12,
                                                              22,
                                                              true,
                                                              true,
                                                              true,
                                                            );
                                                            FFAppState()
                                                                    .selectedThreadId =
                                                                random_data
                                                                    .randomString(
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
                                                          _model.questionReady =
                                                              false;
                                                        });
                                                        logFirebaseEvent(
                                                            'IconButton_scroll_to');
                                                        await _model
                                                            .columnChatsScrollable
                                                            ?.animateTo(
                                                          _model
                                                              .columnChatsScrollable!
                                                              .position
                                                              .maxScrollExtent,
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  100),
                                                          curve: Curves.ease,
                                                        );
                                                        logFirebaseEvent(
                                                            'IconButton_custom_action');
                                                        await actions
                                                            .callFlowiseStreamingChat(
                                                          _model
                                                              .askTheQuestionController
                                                              .text,
                                                          widget.companiesDoc
                                                              ?.youAreMyCoachPrompt,
                                                          '1',
                                                          FFAppState()
                                                              .nonLoggedInSessionId,
                                                          FFAppState()
                                                              .nonLoggedInSessionId,
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .companyQueryByCode
                                                                ?.first
                                                                .supabaseProjUrl,
                                                            'https://efdipbnxemvehcjbxekx.supabase.co',
                                                          ),
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .companyQueryByCode
                                                                ?.first
                                                                .tableName,
                                                            'table_name',
                                                          ),
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .companyQueryByCode
                                                                ?.first
                                                                .supabaseApiKey,
                                                            'apikey',
                                                          ),
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .companyQueryByCode
                                                                ?.first
                                                                .queryName,
                                                            'queryName',
                                                          ),
                                                          valueOrDefault<bool>(
                                                            _model
                                                                .companyQueryByCode
                                                                ?.first
                                                                .isLearnCards,
                                                            false,
                                                          ),
                                                          () async {
                                                            // scroll non streaming column
                                                            logFirebaseEvent(
                                                                '_scrollnonstreamingcolumn');
                                                            await _model
                                                                .columnChatsScrollable
                                                                ?.animateTo(
                                                              _model
                                                                  .columnChatsScrollable!
                                                                  .position
                                                                  .maxScrollExtent,
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      100),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                            // scroll streaming
                                                            logFirebaseEvent(
                                                                '_scrollstreaming');
                                                            await _model
                                                                .columnMarkdownScrollable
                                                                ?.animateTo(
                                                              _model
                                                                  .columnMarkdownScrollable!
                                                                  .position
                                                                  .maxScrollExtent,
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      100),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                          },
                                                          () async {
                                                            // scroll non streaming column
                                                            logFirebaseEvent(
                                                                '_scrollnonstreamingcolumn');
                                                            await _model
                                                                .columnChatsScrollable
                                                                ?.animateTo(
                                                              _model
                                                                  .columnChatsScrollable!
                                                                  .position
                                                                  .maxScrollExtent,
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      100),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                            // scroll streaming
                                                            logFirebaseEvent(
                                                                '_scrollstreaming');
                                                            await _model
                                                                .columnMarkdownScrollable
                                                                ?.animateTo(
                                                              _model
                                                                  .columnMarkdownScrollable!
                                                                  .position
                                                                  .maxScrollExtent,
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      100),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                          },
                                                          'unknown',
                                                        );
                                                        // flowise chat document ai
                                                        logFirebaseEvent(
                                                            'IconButton_flowisechatdocumentai');

                                                        await FlowiseChatsRecord
                                                            .collection
                                                            .doc()
                                                            .set(
                                                                createFlowiseChatsRecordData(
                                                              userId: loggedIn
                                                                  ? currentUserReference
                                                                      ?.id
                                                                  : FFAppState()
                                                                      .nonLoggedInSessionId,
                                                              role: 'ai',
                                                              text: FFAppState()
                                                                  .flowiseMessages
                                                                  .first
                                                                  .message,
                                                              createdTime:
                                                                  getCurrentTimestamp,
                                                              sessionId:
                                                                  FFAppState()
                                                                      .nonLoggedInSessionId,
                                                              threadId:
                                                                  valueOrDefault<
                                                                      String>(
                                                                FFAppState()
                                                                    .selectedThreadId,
                                                                'no thread id found',
                                                              ),
                                                            ));
                                                        logFirebaseEvent(
                                                            'IconButton_scroll_to');
                                                        await _model
                                                            .columnChatsScrollable
                                                            ?.animateTo(
                                                          _model
                                                              .columnChatsScrollable!
                                                              .position
                                                              .maxScrollExtent,
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  100),
                                                          curve: Curves.ease,
                                                        );
                                                        // question ready false
                                                        logFirebaseEvent(
                                                            'IconButton_questionreadyfalse');
                                                        setState(() {
                                                          _model.questionReady =
                                                              true;
                                                        });
                                                        logFirebaseEvent(
                                                            'IconButton_update_app_state');
                                                        setState(() {
                                                          FFAppState()
                                                              .flowiseMessages = [];
                                                        });
                                                        logFirebaseEvent(
                                                            'IconButton_wait__delay');
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    500));
                                                        logFirebaseEvent(
                                                            'IconButton_clear_text_fields_pin_codes');
                                                        setState(() {
                                                          _model
                                                              .askTheQuestionController
                                                              ?.clear();
                                                        });
                                                        logFirebaseEvent(
                                                            'IconButton_scroll_to');
                                                        await _model
                                                            .columnChatsScrollable
                                                            ?.animateTo(
                                                          _model
                                                              .columnChatsScrollable!
                                                              .position
                                                              .maxScrollExtent,
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  100),
                                                          curve: Curves.ease,
                                                        );

                                                        setState(() {});
                                                      },
                                                    ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    borderRadius: 5.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 55.0,
                                                    fillColor: widget
                                                        .companiesDoc
                                                        ?.colors
                                                        .primaryColor,
                                                    icon: Icon(
                                                      Icons.send_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                    showLoadingIndicator: true,
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_WELCONE');
                                                      logFirebaseEvent(
                                                          'IconButton_firestore_query');
                                                      _model.companyQueryByCode2 =
                                                          await queryCompaniesRecordOnce(
                                                        queryBuilder:
                                                            (companiesRecord) =>
                                                                companiesRecord
                                                                    .where(
                                                          'companyCode',
                                                          isEqualTo:
                                                              valueOrDefault<
                                                                  String>(
                                                            FFAppState()
                                                                .companySecretCode,
                                                            '223344',
                                                          ),
                                                        ),
                                                      );
                                                      // flowise chat document
                                                      logFirebaseEvent(
                                                          'IconButton_flowisechatdocument');

                                                      var flowiseChatsRecordReference1 =
                                                          FlowiseChatsRecord
                                                              .collection
                                                              .doc();
                                                      await flowiseChatsRecordReference1
                                                          .set(
                                                              createFlowiseChatsRecordData(
                                                        userId: loggedIn
                                                            ? currentUserReference
                                                                ?.id
                                                            : FFAppState()
                                                                .nonLoggedInSessionId,
                                                        role: 'human',
                                                        text: _model
                                                            .askTheQuestionController
                                                            .text,
                                                        createdTime:
                                                            getCurrentTimestamp,
                                                        sessionId: FFAppState()
                                                            .nonLoggedInSessionId,
                                                        threadId: FFAppState()
                                                            .selectedThreadId,
                                                        chatType: FFAppState()
                                                            .chatType,
                                                        companyDocId: _model
                                                            .companyQueryByCode2
                                                            ?.first
                                                            .reference
                                                            .id,
                                                        threadDetails:
                                                            createThreadsStruct(
                                                          threadId: FFAppState()
                                                              .selectedThreadId,
                                                          threadName:
                                                              containerMyTeamRecord
                                                                  .memberName,
                                                          threadImage:
                                                              containerMyTeamRecord
                                                                  .image,
                                                          clearUnsetFields:
                                                              false,
                                                          create: true,
                                                        ),
                                                      ));
                                                      _model.createdChat =
                                                          FlowiseChatsRecord
                                                              .getDocumentFromData(
                                                                  createFlowiseChatsRecordData(
                                                                    userId: loggedIn
                                                                        ? currentUserReference
                                                                            ?.id
                                                                        : FFAppState()
                                                                            .nonLoggedInSessionId,
                                                                    role:
                                                                        'human',
                                                                    text: _model
                                                                        .askTheQuestionController
                                                                        .text,
                                                                    createdTime:
                                                                        getCurrentTimestamp,
                                                                    sessionId:
                                                                        FFAppState()
                                                                            .nonLoggedInSessionId,
                                                                    threadId:
                                                                        FFAppState()
                                                                            .selectedThreadId,
                                                                    chatType:
                                                                        FFAppState()
                                                                            .chatType,
                                                                    companyDocId: _model
                                                                        .companyQueryByCode2
                                                                        ?.first
                                                                        .reference
                                                                        .id,
                                                                    threadDetails:
                                                                        createThreadsStruct(
                                                                      threadId:
                                                                          FFAppState()
                                                                              .selectedThreadId,
                                                                      threadName:
                                                                          containerMyTeamRecord
                                                                              .memberName,
                                                                      threadImage:
                                                                          containerMyTeamRecord
                                                                              .image,
                                                                      clearUnsetFields:
                                                                          false,
                                                                      create:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                  flowiseChatsRecordReference1);
                                                      if (!(FFAppState()
                                                                  .selectedThreadId !=
                                                              '')) {}
                                                      // question ready false
                                                      logFirebaseEvent(
                                                          'IconButton_questionreadyfalse');
                                                      setState(() {
                                                        _model.questionReady =
                                                            false;
                                                      });
                                                      logFirebaseEvent(
                                                          'IconButton_scroll_to');
                                                      await _model
                                                          .columnChatsScrollable
                                                          ?.animateTo(
                                                        _model
                                                            .columnChatsScrollable!
                                                            .position
                                                            .maxScrollExtent,
                                                        duration: const Duration(
                                                            milliseconds: 100),
                                                        curve: Curves.ease,
                                                      );
                                                      logFirebaseEvent(
                                                          'IconButton_alert_dialog');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: const Text(
                                                                  'about to call flo'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: const Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                      logFirebaseEvent(
                                                          'IconButton_alert_dialog');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: const Text(
                                                                  'flow finished'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: const Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                      logFirebaseEvent(
                                                          'IconButton_custom_action');
                                                      await actions
                                                          .callFlowiseStreamingChat(
                                                        _model
                                                            .askTheQuestionController
                                                            .text,
                                                        valueOrDefault<String>(
                                                          widget.companiesDoc
                                                              ?.youAreMyCoachPrompt,
                                                          'v',
                                                        ),
                                                        '1',
                                                        valueOrDefault<String>(
                                                          FFAppState()
                                                              .selectedThreadId,
                                                          'threadid',
                                                        ),
                                                        valueOrDefault<String>(
                                                          FFAppState()
                                                              .selectedThreadId,
                                                          'threadid',
                                                        ),
                                                        valueOrDefault<String>(
                                                          widget.companiesDoc
                                                              ?.supabaseProjUrl,
                                                          '0',
                                                        ),
                                                        valueOrDefault<String>(
                                                          widget.companiesDoc
                                                              ?.tableName,
                                                          'o',
                                                        ),
                                                        valueOrDefault<String>(
                                                          widget.companiesDoc
                                                              ?.supabaseApiKey,
                                                          'o',
                                                        ),
                                                        valueOrDefault<String>(
                                                          widget.companiesDoc
                                                              ?.queryName,
                                                          'k',
                                                        ),
                                                        false,
                                                        () async {
                                                          // scroll non streaming column
                                                          logFirebaseEvent(
                                                              '_scrollnonstreamingcolumn');
                                                          await _model
                                                              .columnMarkdownScrollable
                                                              ?.animateTo(
                                                            _model
                                                                .columnMarkdownScrollable!
                                                                .position
                                                                .maxScrollExtent,
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    100),
                                                            curve: Curves.ease,
                                                          );
                                                          // scroll streaming
                                                          logFirebaseEvent(
                                                              '_scrollstreaming');
                                                          await _model
                                                              .columnMarkdownScrollable
                                                              ?.animateTo(
                                                            _model
                                                                .columnMarkdownScrollable!
                                                                .position
                                                                .maxScrollExtent,
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    100),
                                                            curve: Curves.ease,
                                                          );
                                                        },
                                                        () async {
                                                          // scroll non streaming column
                                                          logFirebaseEvent(
                                                              '_scrollnonstreamingcolumn');
                                                          await _model
                                                              .columnMarkdownScrollable
                                                              ?.animateTo(
                                                            _model
                                                                .columnMarkdownScrollable!
                                                                .position
                                                                .maxScrollExtent,
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    100),
                                                            curve: Curves.ease,
                                                          );
                                                          // scroll streaming
                                                          logFirebaseEvent(
                                                              '_scrollstreaming');
                                                          await _model
                                                              .columnMarkdownScrollable
                                                              ?.animateTo(
                                                            _model
                                                                .columnMarkdownScrollable!
                                                                .position
                                                                .maxScrollExtent,
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    100),
                                                            curve: Curves.ease,
                                                          );
                                                        },
                                                        'unknown',
                                                      );
                                                      logFirebaseEvent(
                                                          'IconButton_alert_dialog');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: const Text(
                                                                  'chat was called '),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: const Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                      // flowise chat document ai
                                                      logFirebaseEvent(
                                                          'IconButton_flowisechatdocumentai');

                                                      await FlowiseChatsRecord
                                                          .collection
                                                          .doc()
                                                          .set(
                                                              createFlowiseChatsRecordData(
                                                            userId: loggedIn
                                                                ? currentUserReference
                                                                    ?.id
                                                                : FFAppState()
                                                                    .nonLoggedInSessionId,
                                                            role: 'ai',
                                                            text: FFAppState()
                                                                .flowiseMessages
                                                                .first
                                                                .message,
                                                            createdTime:
                                                                getCurrentTimestamp,
                                                            sessionId: FFAppState()
                                                                .nonLoggedInSessionId,
                                                            threadId:
                                                                valueOrDefault<
                                                                    String>(
                                                              FFAppState()
                                                                  .selectedThreadId,
                                                              'no thread id found',
                                                            ),
                                                            chatType:
                                                                FFAppState()
                                                                    .chatType,
                                                            companyDocId: _model
                                                                .companyQueryByCode2
                                                                ?.first
                                                                .reference
                                                                .id,
                                                            threadDetails:
                                                                createThreadsStruct(
                                                              threadId: FFAppState()
                                                                  .selectedThreadId,
                                                              threadName:
                                                                  containerMyTeamRecord
                                                                      .memberName,
                                                              clearUnsetFields:
                                                                  false,
                                                              create: true,
                                                            ),
                                                          ));
                                                      logFirebaseEvent(
                                                          'IconButton_scroll_to');
                                                      await _model
                                                          .columnChatsScrollable
                                                          ?.animateTo(
                                                        _model
                                                            .columnChatsScrollable!
                                                            .position
                                                            .maxScrollExtent,
                                                        duration: const Duration(
                                                            milliseconds: 100),
                                                        curve: Curves.ease,
                                                      );
                                                      // question ready false
                                                      logFirebaseEvent(
                                                          'IconButton_questionreadyfalse');
                                                      setState(() {
                                                        _model.questionReady =
                                                            true;
                                                      });
                                                      logFirebaseEvent(
                                                          'IconButton_update_app_state');
                                                      setState(() {
                                                        FFAppState()
                                                            .flowiseMessages = [];
                                                      });
                                                      logFirebaseEvent(
                                                          'IconButton_wait__delay');
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  500));
                                                      logFirebaseEvent(
                                                          'IconButton_clear_text_fields_pin_codes');
                                                      setState(() {
                                                        _model
                                                            .askTheQuestionController
                                                            ?.clear();
                                                      });
                                                      logFirebaseEvent(
                                                          'IconButton_scroll_to');
                                                      await _model
                                                          .columnChatsScrollable
                                                          ?.animateTo(
                                                        _model
                                                            .columnChatsScrollable!
                                                            .position
                                                            .maxScrollExtent,
                                                        duration: const Duration(
                                                            milliseconds: 100),
                                                        curve: Curves.ease,
                                                      );

                                                      setState(() {});
                                                    },
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderRadius: 5.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 55.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      icon: Icon(
                                                        Icons.send_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      showLoadingIndicator:
                                                          true,
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_WELCONE');
                                                        logFirebaseEvent(
                                                            'IconButton_firestore_query');
                                                        _model.companyQueryByCode1 =
                                                            await queryCompaniesRecordOnce(
                                                          queryBuilder:
                                                              (companiesRecord) =>
                                                                  companiesRecord
                                                                      .where(
                                                            'companyCode',
                                                            isEqualTo:
                                                                valueOrDefault<
                                                                    String>(
                                                              FFAppState()
                                                                  .companySecretCode,
                                                              '223344',
                                                            ),
                                                          ),
                                                        );
                                                        if (FFAppState()
                                                                    .nonLoggedInSessionId ==
                                                                '') {}
                                                        // flowise chat document
                                                        logFirebaseEvent(
                                                            'IconButton_flowisechatdocument');

                                                        await FlowiseChatsRecord
                                                            .collection
                                                            .doc()
                                                            .set(
                                                                createFlowiseChatsRecordData(
                                                              userId: loggedIn
                                                                  ? currentUserReference
                                                                      ?.id
                                                                  : FFAppState()
                                                                      .nonLoggedInSessionId,
                                                              role: 'human',
                                                              text: _model
                                                                  .askTheQuestionController
                                                                  .text,
                                                              createdTime:
                                                                  getCurrentTimestamp,
                                                              sessionId:
                                                                  FFAppState()
                                                                      .nonLoggedInSessionId,
                                                              threadId: FFAppState()
                                                                  .selectedThreadId,
                                                            ));
                                                        if (!(FFAppState()
                                                                    .selectedThreadId !=
                                                                '')) {
                                                          // generate active thread id
                                                          logFirebaseEvent(
                                                              'IconButton_generateactivethreadid');
                                                          setState(() {
                                                            FFAppState()
                                                                    .activeThread =
                                                                random_data
                                                                    .randomString(
                                                              12,
                                                              22,
                                                              true,
                                                              true,
                                                              true,
                                                            );
                                                            FFAppState()
                                                                    .selectedThreadId =
                                                                random_data
                                                                    .randomString(
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
                                                          _model.questionReady =
                                                              false;
                                                        });
                                                        logFirebaseEvent(
                                                            'IconButton_scroll_to');
                                                        await _model
                                                            .columnChatsScrollable
                                                            ?.animateTo(
                                                          _model
                                                              .columnChatsScrollable!
                                                              .position
                                                              .maxScrollExtent,
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  100),
                                                          curve: Curves.ease,
                                                        );
                                                        logFirebaseEvent(
                                                            'IconButton_custom_action');
                                                        await actions
                                                            .callFlowiseStreamingChat(
                                                          _model
                                                              .askTheQuestionController
                                                              .text,
                                                          widget.companiesDoc
                                                              ?.userGatherDataPrompt,
                                                          '1',
                                                          FFAppState()
                                                              .nonLoggedInSessionId,
                                                          FFAppState()
                                                              .nonLoggedInSessionId,
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .companyQueryByCode1
                                                                ?.first
                                                                .supabaseProjUrl,
                                                            'https://efdipbnxemvehcjbxekx.supabase.co',
                                                          ),
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .companyQueryByCode1
                                                                ?.first
                                                                .tableName,
                                                            'table_name',
                                                          ),
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .companyQueryByCode1
                                                                ?.first
                                                                .supabaseApiKey,
                                                            'apikey',
                                                          ),
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .companyQueryByCode1
                                                                ?.first
                                                                .queryName,
                                                            'queryName',
                                                          ),
                                                          valueOrDefault<bool>(
                                                            _model
                                                                .companyQueryByCode1
                                                                ?.first
                                                                .isLearnCards,
                                                            false,
                                                          ),
                                                          () async {
                                                            // scroll non streaming column
                                                            logFirebaseEvent(
                                                                '_scrollnonstreamingcolumn');
                                                            await _model
                                                                .columnChatsScrollable
                                                                ?.animateTo(
                                                              _model
                                                                  .columnChatsScrollable!
                                                                  .position
                                                                  .maxScrollExtent,
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      100),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                            // scroll streaming
                                                            logFirebaseEvent(
                                                                '_scrollstreaming');
                                                            await _model
                                                                .columnMarkdownScrollable
                                                                ?.animateTo(
                                                              _model
                                                                  .columnMarkdownScrollable!
                                                                  .position
                                                                  .maxScrollExtent,
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      100),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                          },
                                                          () async {
                                                            // scroll non streaming column
                                                            logFirebaseEvent(
                                                                '_scrollnonstreamingcolumn');
                                                            await _model
                                                                .columnChatsScrollable
                                                                ?.animateTo(
                                                              _model
                                                                  .columnChatsScrollable!
                                                                  .position
                                                                  .maxScrollExtent,
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      100),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                            // scroll streaming
                                                            logFirebaseEvent(
                                                                '_scrollstreaming');
                                                            await _model
                                                                .columnMarkdownScrollable
                                                                ?.animateTo(
                                                              _model
                                                                  .columnMarkdownScrollable!
                                                                  .position
                                                                  .maxScrollExtent,
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      100),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                          },
                                                          'unknown',
                                                        );
                                                        // flowise chat document ai
                                                        logFirebaseEvent(
                                                            'IconButton_flowisechatdocumentai');

                                                        var flowiseChatsRecordReference2 =
                                                            FlowiseChatsRecord
                                                                .collection
                                                                .doc();
                                                        await flowiseChatsRecordReference2
                                                            .set(
                                                                createFlowiseChatsRecordData(
                                                          userId: loggedIn
                                                              ? currentUserReference
                                                                  ?.id
                                                              : FFAppState()
                                                                  .nonLoggedInSessionId,
                                                          role: 'ai',
                                                          text: FFAppState()
                                                              .flowiseMessages
                                                              .first
                                                              .message,
                                                          createdTime:
                                                              getCurrentTimestamp,
                                                          sessionId: FFAppState()
                                                              .nonLoggedInSessionId,
                                                          threadId:
                                                              valueOrDefault<
                                                                  String>(
                                                            FFAppState()
                                                                .selectedThreadId,
                                                            'no thread id found',
                                                          ),
                                                        ));
                                                        _model.creeatedWelcomeChatDoc =
                                                            FlowiseChatsRecord
                                                                .getDocumentFromData(
                                                                    createFlowiseChatsRecordData(
                                                                      userId: loggedIn
                                                                          ? currentUserReference
                                                                              ?.id
                                                                          : FFAppState()
                                                                              .nonLoggedInSessionId,
                                                                      role:
                                                                          'ai',
                                                                      text: FFAppState()
                                                                          .flowiseMessages
                                                                          .first
                                                                          .message,
                                                                      createdTime:
                                                                          getCurrentTimestamp,
                                                                      sessionId:
                                                                          FFAppState()
                                                                              .nonLoggedInSessionId,
                                                                      threadId:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        FFAppState()
                                                                            .selectedThreadId,
                                                                        'no thread id found',
                                                                      ),
                                                                    ),
                                                                    flowiseChatsRecordReference2);
                                                        logFirebaseEvent(
                                                            'IconButton_scroll_to');
                                                        await _model
                                                            .columnChatsScrollable
                                                            ?.animateTo(
                                                          _model
                                                              .columnChatsScrollable!
                                                              .position
                                                              .maxScrollExtent,
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  100),
                                                          curve: Curves.ease,
                                                        );
                                                        // question ready false
                                                        logFirebaseEvent(
                                                            'IconButton_questionreadyfalse');
                                                        setState(() {
                                                          _model.questionReady =
                                                              true;
                                                        });
                                                        logFirebaseEvent(
                                                            'IconButton_update_app_state');
                                                        setState(() {
                                                          FFAppState()
                                                              .flowiseMessages = [];
                                                        });
                                                        logFirebaseEvent(
                                                            'IconButton_wait__delay');
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    500));
                                                        logFirebaseEvent(
                                                            'IconButton_clear_text_fields_pin_codes');
                                                        setState(() {
                                                          _model
                                                              .askTheQuestionController
                                                              ?.clear();
                                                        });
                                                        logFirebaseEvent(
                                                            'IconButton_scroll_to');
                                                        await _model
                                                            .columnChatsScrollable
                                                            ?.animateTo(
                                                          _model
                                                              .columnChatsScrollable!
                                                              .position
                                                              .maxScrollExtent,
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  100),
                                                          curve: Curves.ease,
                                                        );

                                                        setState(() {});
                                                      },
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
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (valueOrDefault<bool>(
                FFAppState().tempStreamingMessage != '',
                false,
              ))
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
            ],
          ),
          if (FFAppState().debugCount >= 3)
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 10.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_WELCONE');
                  logFirebaseEvent('Button_update_app_state');
                  setState(() {
                    FFAppState().sessionId = '';
                    FFAppState().activeThread = '';
                    FFAppState().sessionid = '';
                    FFAppState().nonLoggedInSessionId = '';
                  });
                  logFirebaseEvent('Button_navigate_to');

                  context.pushNamed(
                    'Library-fixed',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                text: 'Start Over',
                options: FFButtonOptions(
                  height: 50.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 4.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).selectedButton,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 18.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
                      ),
                  elevation: 1.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          if (valueOrDefault<bool>(
            FFAppState().debugCount >= 3,
            false,
          ))
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 10.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_WELCONE');
                  logFirebaseEvent('Button_update_app_state');
                  setState(() {
                    FFAppState().debugCount = 0;
                  });
                },
                text: 'Leave Debug Mode',
                options: FFButtonOptions(
                  height: 50.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 4.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).selectedButton,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 18.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
                      ),
                  elevation: 1.0,
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
    );
  }
}
