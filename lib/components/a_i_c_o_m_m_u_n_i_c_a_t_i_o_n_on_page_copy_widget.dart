import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_on_page_copy_model.dart';
export 'a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_on_page_copy_model.dart';

class AICOMMUNICATIONOnPageCopyWidget extends StatefulWidget {
  const AICOMMUNICATIONOnPageCopyWidget({
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
  State<AICOMMUNICATIONOnPageCopyWidget> createState() =>
      _AICOMMUNICATIONOnPageCopyWidgetState();
}

class _AICOMMUNICATIONOnPageCopyWidgetState
    extends State<AICOMMUNICATIONOnPageCopyWidget>
    with TickerProviderStateMixin {
  late AICOMMUNICATIONOnPageCopyModel _model;

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
    'buttonOnPageLoadAnimation1': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        TintEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          color: Colors.white,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        TintEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          color: Colors.white,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation3': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        TintEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          color: Colors.white,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation4': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        TintEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          color: Colors.white,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation5': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        TintEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          color: Colors.white,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation6': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        TintEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          color: Colors.white,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation7': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        TintEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          color: Colors.white,
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
    _model = createModel(context, () => AICOMMUNICATIONOnPageCopyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_COPY_AI');
      logFirebaseEvent('AI_COMMUNICATION-OnPageCopy_update_compo');
      setState(() {
        _model.questionReady = true;
      });
      logFirebaseEvent('AI_COMMUNICATION-OnPageCopy_update_app_s');
      _model.updatePage(() {
        FFAppState().debugMessage = () {
          if ((widget.sessionsDoc?.currentNavJourney == null ||
                  widget.sessionsDoc?.currentNavJourney == '') &&
              ((widget.isLearnCard != true) ||
                  (FFAppState().IsLearnCard != true))) {
            return valueOrDefault<String>(
              widget.companiesDoc?.userGatherDataPrompt,
              'promptNotFound',
            );
          } else if ((widget.isLearnCard == true) ||
              (FFAppState().IsLearnCard == true)) {
            return valueOrDefault<String>(
              widget.companiesDoc?.continueLearnCardPrompt,
              'promptNotFound',
            );
          } else {
            return valueOrDefault<String>(
              widget.companiesDoc?.youAreMyCoachPrompt,
              'promptNotFound',
            );
          }
        }();
      });
      logFirebaseEvent('AI_COMMUNICATION-OnPageCopy_wait__delay');
      await Future.delayed(const Duration(milliseconds: 1000));
      logFirebaseEvent('AI_COMMUNICATION-OnPageCopy_scroll_to');
      await _model.columnChatsScrollable?.animateTo(
        _model.columnChatsScrollable!.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    _model.askTheQuestionController1 ??= TextEditingController();
    _model.askTheQuestionFocusNode1 ??= FocusNode();

    _model.askTheQuestionController2 ??= TextEditingController();
    _model.askTheQuestionFocusNode2 ??= FocusNode();

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
      controller: _model.columnController,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.8,
                constraints: BoxConstraints(
                  maxWidth: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              valueOrDefault<String>(
                                widget.companiesDoc?.backgroundImage,
                                'https://res.cloudinary.com/dplpckpbm/image/upload/v1703535226/learningPathwaysBright_b3strj.webp',
                              ),
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(17.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
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
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (valueOrDefault<bool>(
                                                FFAppState()
                                                            .tempStreamingMessage !=
                                                        '',
                                                false,
                                              ))
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          25.0, 0.0, 25.0, 0.0),
                                                  child: Text(
                                                    'Mentor: ${valueOrDefault<String>(
                                                      FFAppState()
                                                          .tempStreamingMessage,
                                                      'notSet',
                                                    )}',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displaySmallFamily,
                                                          fontSize: 18.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmallFamily),
                                                        ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_COPY_cl');
                                                    logFirebaseEvent(
                                                        'IconButton_firestore_query');
                                                    _model.checkChatCompleted =
                                                        await querySessionsRecordOnce(
                                                      queryBuilder:
                                                          (sessionsRecord) =>
                                                              sessionsRecord
                                                                  .where(
                                                        'sessionId',
                                                        isEqualTo: FFAppState()
                                                            .nonLoggedInSessionId,
                                                      ),
                                                      singleRecord: true,
                                                    ).then((s) =>
                                                            s.firstOrNull);
                                                    if (_model
                                                            .checkChatCompleted
                                                            ?.currentNavJourney ==
                                                        'newSession') {
                                                      logFirebaseEvent(
                                                          'IconButton_update_app_state');
                                                      setState(() {
                                                        FFAppState()
                                                                .tempStreamingMessage =
                                                            'You must finish the welcome chat before you can continue.';
                                                      });
                                                    } else {
                                                      logFirebaseEvent(
                                                          'IconButton_update_app_state');
                                                      setState(() {
                                                        FFAppState()
                                                                .bottomSheetOpen =
                                                            false;
                                                      });
                                                      logFirebaseEvent(
                                                          'IconButton_bottom_sheet');
                                                      Navigator.pop(context);
                                                    }

                                                    setState(() {});
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
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
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 12.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue ??=
                                                  'Reading Topic (thread)',
                                            ),
                                            options: const ['Reading Topic (thread)'],
                                            onChanged: (val) => setState(() =>
                                                _model.dropDownValue = val),
                                            width: 300.0,
                                            height: 50.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText: 'Reading Topic',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_COPY_NE');
                                              logFirebaseEvent(
                                                  'Button_update_app_state');
                                              setState(() {
                                                FFAppState().selectedThreadId =
                                                    random_data.randomString(
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
                                                  FlowiseChatsRecord.collection
                                                      .doc();
                                              await flowiseChatsRecordReference
                                                  .set(
                                                      createFlowiseChatsRecordData(
                                                userId: loggedIn
                                                    ? currentUserReference?.id
                                                    : FFAppState()
                                                        .nonLoggedInSessionId,
                                                role: 'ai',
                                                text: widget.companiesDoc
                                                    ?.youAreMyCoachPrompt,
                                                createdTime:
                                                    getCurrentTimestamp,
                                                sessionId:
                                                    valueOrDefault<String>(
                                                  FFAppState()
                                                      .nonLoggedInSessionId,
                                                  'not set',
                                                ),
                                                threadId:
                                                    valueOrDefault<String>(
                                                  FFAppState().selectedThreadId,
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                  BorderRadius.circular(8.0),
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
                                            'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_COPY_Ic');
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
                                alignment: const AlignmentDirectional(-1.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      StreamBuilder<List<FlowiseChatsRecord>>(
                                    stream: queryFlowiseChatsRecord(
                                      queryBuilder: (flowiseChatsRecord) =>
                                          flowiseChatsRecord
                                              .where(
                                                'thread_id',
                                                isEqualTo:
                                                    valueOrDefault<String>(
                                                  FFAppState().selectedThreadId,
                                                  'noidset',
                                                ),
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
                                                FlutterFlowTheme.of(context)
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
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (columnChatsScrollableFlowiseChatsRecord
                                                      .role ==
                                                  'human')
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                        child: Container(
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: () {
                                                              if (MediaQuery.sizeOf(
                                                                          context)
                                                                      .width <
                                                                  kBreakpointSmall) {
                                                                return 350.0;
                                                              } else if (MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width <
                                                                  kBreakpointMedium) {
                                                                return 500.0;
                                                              } else if (MediaQuery
                                                                          .sizeOf(
                                                                              context)
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
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      8.0),
                                                              bottomRight:
                                                                  Radius
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
                                                                        const EdgeInsets.all(
                                                                            9.0),
                                                                    child: Text(
                                                                      columnChatsScrollableFlowiseChatsRecord
                                                                          .text,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                  width: double.infinity,
                                                  child: Stack(
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Flexible(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if (columnChatsScrollableFlowiseChatsRecord
                                                                        .role ==
                                                                    'ai')
                                                                  AnimatedContainer(
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            100),
                                                                    curve: Curves
                                                                        .easeInOut,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 480.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 580.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 880.0;
                                                                        } else {
                                                                          return 1550.0;
                                                                        }
                                                                      }(),
                                                                    ),
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      color: Color(
                                                                          0xFFF5F5F5),
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
                                                                        const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                                                const EdgeInsets.all(4.0),
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
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
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
                                                                if (columnChatsScrollableFlowiseChatsRecord
                                                                        .role ==
                                                                    'system')
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            15.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        AnimatedContainer(
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              100),
                                                                      curve: Curves
                                                                          .easeInOut,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            () {
                                                                          if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall) {
                                                                            return 480.0;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointMedium) {
                                                                            return 580.0;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointLarge) {
                                                                            return 880.0;
                                                                          } else {
                                                                            return 1550.0;
                                                                          }
                                                                        }(),
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor3,
                                                                        borderRadius:
                                                                            const BorderRadius.only(
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
                                                                          const AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                        context: context,
                                                        phone: false,
                                                      ))
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  6.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/UpSkilller__1_-removebg-preview.png',
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
                                            ],
                                          );
                                        },
                                        controller:
                                            _model.columnChatsScrollable,
                                      );
                                    },
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
                                      alignment:
                                          const AlignmentDirectional(0.0, -429.57),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Flexible(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                AnimatedContainer(
                                                  duration: const Duration(
                                                      milliseconds: 100),
                                                  curve: Curves.easeInOut,
                                                  constraints: const BoxConstraints(
                                                    maxWidth: 600.0,
                                                  ),
                                                  decoration: const BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                    borderRadius:
                                                        BorderRadius.only(
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
                                                      const AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 9.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.all(
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
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        controller:
                                                                            _model.columnMarkdownScrollable,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
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
                            if (FFAppState().flowiseMessages.isNotEmpty)
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                    ))
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, -1.0),
                                        child: Padding(
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
                                            if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                              tablet: false,
                                              tabletLandscape: false,
                                              desktop: false,
                                            ))
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: MarkdownBody(
                                                  data: valueOrDefault<String>(
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
                                      padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Processing',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    Icon(
                                                      Icons.hourglass_bottom,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'iconOnPageLoadAnimation']!),
                                                  ].divide(
                                                      const SizedBox(width: 9.0)),
                                                ),
                                                const Divider(
                                                  thickness: 1.0,
                                                  color: Color(0xFF505050),
                                                ),
                                              ],
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
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
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                    child: Visibility(
                                      visible: _model.questionReady == true,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: _model
                                                    .askTheQuestionController1,
                                                focusNode: _model
                                                    .askTheQuestionFocusNode1,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Respond Here',
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xFF464646),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(12.0, 0.0,
                                                              0.0, 0.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                validator: _model
                                                    .askTheQuestionController1Validator
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius: 5.0,
                                                borderWidth: 1.0,
                                                buttonSize: 55.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                                icon: Icon(
                                                  Icons.send_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                showLoadingIndicator: true,
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_COPY_se');
                                                  logFirebaseEvent(
                                                      'IconButton_firestore_query');
                                                  _model.companyQueryByCode =
                                                      await queryCompaniesRecordOnce(
                                                    queryBuilder:
                                                        (companiesRecord) =>
                                                            companiesRecord
                                                                .where(
                                                      'companyCode',
                                                      isEqualTo: valueOrDefault<
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
                                                            .askTheQuestionController1
                                                            .text,
                                                        createdTime:
                                                            getCurrentTimestamp,
                                                        sessionId: FFAppState()
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
                                                        milliseconds: 100),
                                                    curve: Curves.ease,
                                                  );
                                                  logFirebaseEvent(
                                                      'IconButton_custom_action');
                                                  await actions
                                                      .callFlowiseStreamingChat(
                                                    _model
                                                        .askTheQuestionController1
                                                        .text,
                                                    widget.companiesDoc
                                                        ?.youAreMyCoachPrompt,
                                                    '1',
                                                    FFAppState()
                                                        .nonLoggedInSessionId,
                                                    FFAppState()
                                                        .nonLoggedInSessionId,
                                                    valueOrDefault<String>(
                                                      _model
                                                          .companyQueryByCode
                                                          ?.first
                                                          .supabaseProjUrl,
                                                      'https://efdipbnxemvehcjbxekx.supabase.co',
                                                    ),
                                                    valueOrDefault<String>(
                                                      _model.companyQueryByCode
                                                          ?.first.tableName,
                                                      'table_name',
                                                    ),
                                                    valueOrDefault<String>(
                                                      _model
                                                          .companyQueryByCode
                                                          ?.first
                                                          .supabaseApiKey,
                                                      'apikey',
                                                    ),
                                                    valueOrDefault<String>(
                                                      _model.companyQueryByCode
                                                          ?.first.queryName,
                                                      'queryName',
                                                    ),
                                                    valueOrDefault<bool>(
                                                      _model.companyQueryByCode
                                                          ?.first.isLearnCards,
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
                                                            milliseconds: 100),
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
                                                            milliseconds: 100),
                                                        curve: Curves.ease,
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
                                                            milliseconds: 100),
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
                                                            milliseconds: 100),
                                                        curve: Curves.ease,
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
                                                    _model.questionReady = true;
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
                                                          milliseconds: 500));
                                                  logFirebaseEvent(
                                                      'IconButton_clear_text_fields_pin_codes');
                                                  setState(() {
                                                    _model
                                                        .askTheQuestionController1
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
                                            FlutterFlowIconButton(
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius: 5.0,
                                              borderWidth: 1.0,
                                              buttonSize: 55.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor3,
                                              icon: Icon(
                                                Icons.send_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              showLoadingIndicator: true,
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_COPY_se');
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
                                                      ? currentUserReference?.id
                                                      : FFAppState()
                                                          .nonLoggedInSessionId,
                                                  role: 'human',
                                                  text: _model
                                                      .askTheQuestionController1
                                                      .text,
                                                  createdTime:
                                                      getCurrentTimestamp,
                                                  sessionId:
                                                      valueOrDefault<String>(
                                                    FFAppState()
                                                        .nonLoggedInSessionId,
                                                    'sessionIdNotSet',
                                                  ),
                                                  threadId: widget.sessionsDoc
                                                              ?.currentNavJourney ==
                                                          'newSession'
                                                      ? valueOrDefault<String>(
                                                          widget.sessionsDoc
                                                              ?.defaultThreadId,
                                                          'notSetOnPostMessage',
                                                        )
                                                      : FFAppState()
                                                          .selectedThreadId,
                                                  companyName:
                                                      valueOrDefault<String>(
                                                    widget.companiesDoc
                                                        ?.companyname,
                                                    'coname',
                                                  ),
                                                  chatType:
                                                      valueOrDefault<String>(
                                                    FFAppState().chatType,
                                                    'none',
                                                  ),
                                                  companyDocId:
                                                      valueOrDefault<String>(
                                                    widget.companiesDoc
                                                        ?.reference.id,
                                                    'doc',
                                                  ),
                                                  threadDetails:
                                                      createThreadsStruct(
                                                    threadId:
                                                        valueOrDefault<String>(
                                                      widget.sessionsDoc
                                                                  ?.currentNavJourney ==
                                                              'newSession'
                                                          ? valueOrDefault<
                                                              String>(
                                                              widget.sessionsDoc
                                                                  ?.defaultThreadId,
                                                              'notSetOnPostMessage',
                                                            )
                                                          : FFAppState()
                                                              .selectedThreadId,
                                                      'threadDetailsNotSet',
                                                    ),
                                                    threadName:
                                                        'Initial Welcome Chat',
                                                    clearUnsetFields: false,
                                                    create: true,
                                                  ),
                                                ));
                                                _model.createdThread =
                                                    FlowiseChatsRecord
                                                        .getDocumentFromData(
                                                            createFlowiseChatsRecordData(
                                                              userId: loggedIn
                                                                  ? currentUserReference
                                                                      ?.id
                                                                  : FFAppState()
                                                                      .nonLoggedInSessionId,
                                                              role: 'human',
                                                              text: _model
                                                                  .askTheQuestionController1
                                                                  .text,
                                                              createdTime:
                                                                  getCurrentTimestamp,
                                                              sessionId:
                                                                  valueOrDefault<
                                                                      String>(
                                                                FFAppState()
                                                                    .nonLoggedInSessionId,
                                                                'sessionIdNotSet',
                                                              ),
                                                              threadId: widget
                                                                          .sessionsDoc
                                                                          ?.currentNavJourney ==
                                                                      'newSession'
                                                                  ? valueOrDefault<
                                                                      String>(
                                                                      widget
                                                                          .sessionsDoc
                                                                          ?.defaultThreadId,
                                                                      'notSetOnPostMessage',
                                                                    )
                                                                  : FFAppState()
                                                                      .selectedThreadId,
                                                              companyName:
                                                                  valueOrDefault<
                                                                      String>(
                                                                widget
                                                                    .companiesDoc
                                                                    ?.companyname,
                                                                'coname',
                                                              ),
                                                              chatType:
                                                                  valueOrDefault<
                                                                      String>(
                                                                FFAppState()
                                                                    .chatType,
                                                                'none',
                                                              ),
                                                              companyDocId:
                                                                  valueOrDefault<
                                                                      String>(
                                                                widget
                                                                    .companiesDoc
                                                                    ?.reference
                                                                    .id,
                                                                'doc',
                                                              ),
                                                              threadDetails:
                                                                  createThreadsStruct(
                                                                threadId:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  widget.sessionsDoc
                                                                              ?.currentNavJourney ==
                                                                          'newSession'
                                                                      ? valueOrDefault<
                                                                          String>(
                                                                          widget
                                                                              .sessionsDoc
                                                                              ?.defaultThreadId,
                                                                          'notSetOnPostMessage',
                                                                        )
                                                                      : FFAppState()
                                                                          .selectedThreadId,
                                                                  'threadDetailsNotSet',
                                                                ),
                                                                threadName:
                                                                    'Initial Welcome Chat',
                                                                clearUnsetFields:
                                                                    false,
                                                                create: true,
                                                              ),
                                                            ),
                                                            flowiseChatsRecordReference1);
                                                // question ready false
                                                logFirebaseEvent(
                                                    'IconButton_questionreadyfalse');
                                                setState(() {
                                                  _model.questionReady = false;
                                                });
                                                logFirebaseEvent(
                                                    'IconButton_scroll_to');
                                                await _model
                                                    .columnChatsScrollable
                                                    ?.animateTo(
                                                  _model.columnChatsScrollable!
                                                      .position.maxScrollExtent,
                                                  duration: const Duration(
                                                      milliseconds: 100),
                                                  curve: Curves.ease,
                                                );
                                                logFirebaseEvent(
                                                    'IconButton_firestore_query');
                                                _model.sessionForFlowise =
                                                    await querySessionsRecordOnce(
                                                  queryBuilder:
                                                      (sessionsRecord) =>
                                                          sessionsRecord.where(
                                                    'sessionId',
                                                    isEqualTo: FFAppState()
                                                        .nonLoggedInSessionId,
                                                  ),
                                                  singleRecord: true,
                                                ).then((s) => s.firstOrNull);
                                                logFirebaseEvent(
                                                    'IconButton_custom_action');
                                                await actions
                                                    .callFlowiseStreamingChat(
                                                  _model
                                                      .askTheQuestionController1
                                                      .text,
                                                  valueOrDefault<String>(
                                                    () {
                                                      if ((widget.sessionsDoc
                                                                      ?.currentNavJourney ==
                                                                  null ||
                                                              widget.sessionsDoc
                                                                      ?.currentNavJourney ==
                                                                  '') &&
                                                          ((widget.isLearnCard !=
                                                                  true) ||
                                                              (FFAppState()
                                                                      .IsLearnCard !=
                                                                  true))) {
                                                        return 'This weeks focus topic is${widget.companiesDoc?.userGatherDataPrompt}';
                                                      } else if ((widget
                                                                  .isLearnCard ==
                                                              true) ||
                                                          (FFAppState()
                                                                  .IsLearnCard ==
                                                              true)) {
                                                        return widget
                                                            .companiesDoc
                                                            ?.continueLearnCardPrompt;
                                                      } else if ((widget
                                                                  .sessionsDoc
                                                                  ?.currentNavJourney ==
                                                              'newUser') ||
                                                          (widget.sessionsDoc
                                                                  ?.currentNavJourney ==
                                                              'newSession')) {
                                                        return 'This weeks topic is : ${widget.companiesDoc?.companyAiData.thisWeeksTopic} ${widget.companiesDoc?.userGatherDataPrompt}';
                                                      } else {
                                                        return widget
                                                            .companiesDoc
                                                            ?.youAreMyCoachPrompt;
                                                      }
                                                    }(),
                                                    'my prompt is ',
                                                  ),
                                                  '1',
                                                  FFAppState()
                                                      .nonLoggedInSessionId,
                                                  FFAppState()
                                                      .nonLoggedInSessionId,
                                                  widget.companiesDoc
                                                      ?.supabaseProjUrl,
                                                  valueOrDefault<String>(
                                                    widget.companiesDoc
                                                        ?.tableName,
                                                    'tableName',
                                                  ),
                                                  valueOrDefault<String>(
                                                    widget.companiesDoc
                                                        ?.supabaseApiKey,
                                                    'tableName',
                                                  ),
                                                  valueOrDefault<String>(
                                                    widget.companiesDoc
                                                        ?.queryName,
                                                    'queryName',
                                                  ),
                                                  false,
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
                                                          milliseconds: 100),
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
                                                          milliseconds: 100),
                                                      curve: Curves.ease,
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
                                                          milliseconds: 100),
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
                                                          milliseconds: 100),
                                                      curve: Curves.ease,
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
                                                      sessionId: FFAppState()
                                                          .nonLoggedInSessionId,
                                                      threadId: widget
                                                                  .sessionsDoc
                                                                  ?.currentNavJourney ==
                                                              'newSession'
                                                          ? valueOrDefault<
                                                              String>(
                                                              widget.sessionsDoc
                                                                  ?.defaultThreadId,
                                                              'notSetOnPostMessage',
                                                            )
                                                          : FFAppState()
                                                              .selectedThreadId,
                                                      companyName:
                                                          valueOrDefault<
                                                              String>(
                                                        widget.companiesDoc
                                                            ?.companyname,
                                                        'coName',
                                                      ),
                                                      chatType:
                                                          FFAppState().chatType,
                                                      companyDocId:
                                                          valueOrDefault<
                                                              String>(
                                                        widget.companiesDoc
                                                            ?.reference.id,
                                                        'id',
                                                      ),
                                                      threadDetails:
                                                          createThreadsStruct(
                                                        threadId: widget
                                                                    .sessionsDoc
                                                                    ?.currentNavJourney ==
                                                                'newSession'
                                                            ? valueOrDefault<
                                                                String>(
                                                                widget
                                                                    .sessionsDoc
                                                                    ?.defaultThreadId,
                                                                'notSetOnPostMessage',
                                                              )
                                                            : FFAppState()
                                                                .selectedThreadId,
                                                        threadName:
                                                            'Initial Welcome Chat',
                                                        clearUnsetFields: false,
                                                        create: true,
                                                      ),
                                                    ));
                                                logFirebaseEvent(
                                                    'IconButton_scroll_to');
                                                await _model
                                                    .columnChatsScrollable
                                                    ?.animateTo(
                                                  _model.columnChatsScrollable!
                                                      .position.maxScrollExtent,
                                                  duration: const Duration(
                                                      milliseconds: 100),
                                                  curve: Curves.ease,
                                                );
                                                // question ready false
                                                logFirebaseEvent(
                                                    'IconButton_questionreadyfalse');
                                                setState(() {
                                                  _model.questionReady = true;
                                                });
                                                logFirebaseEvent(
                                                    'IconButton_update_app_state');
                                                setState(() {
                                                  FFAppState().flowiseMessages =
                                                      [];
                                                });
                                                logFirebaseEvent(
                                                    'IconButton_wait__delay');
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 500));
                                                logFirebaseEvent(
                                                    'IconButton_clear_text_fields_pin_codes');
                                                setState(() {
                                                  _model
                                                      .askTheQuestionController1
                                                      ?.clear();
                                                });
                                                logFirebaseEvent(
                                                    'IconButton_scroll_to');
                                                await _model
                                                    .columnChatsScrollable
                                                    ?.animateTo(
                                                  _model.columnChatsScrollable!
                                                      .position.maxScrollExtent,
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius: 5.0,
                                                borderWidth: 1.0,
                                                buttonSize: 55.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                icon: Icon(
                                                  Icons.send_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                showLoadingIndicator: true,
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_COPY_se');
                                                  logFirebaseEvent(
                                                      'IconButton_firestore_query');
                                                  _model.companyQueryByCode1 =
                                                      await queryCompaniesRecordOnce(
                                                    queryBuilder:
                                                        (companiesRecord) =>
                                                            companiesRecord
                                                                .where(
                                                      'companyCode',
                                                      isEqualTo: valueOrDefault<
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
                                                            .askTheQuestionController1
                                                            .text,
                                                        createdTime:
                                                            getCurrentTimestamp,
                                                        sessionId: FFAppState()
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
                                                        milliseconds: 100),
                                                    curve: Curves.ease,
                                                  );
                                                  logFirebaseEvent(
                                                      'IconButton_custom_action');
                                                  await actions
                                                      .callFlowiseStreamingChat(
                                                    _model
                                                        .askTheQuestionController1
                                                        .text,
                                                    widget.companiesDoc
                                                        ?.userGatherDataPrompt,
                                                    '1',
                                                    FFAppState()
                                                        .nonLoggedInSessionId,
                                                    FFAppState()
                                                        .nonLoggedInSessionId,
                                                    valueOrDefault<String>(
                                                      _model
                                                          .companyQueryByCode1
                                                          ?.first
                                                          .supabaseProjUrl,
                                                      'https://efdipbnxemvehcjbxekx.supabase.co',
                                                    ),
                                                    valueOrDefault<String>(
                                                      _model.companyQueryByCode1
                                                          ?.first.tableName,
                                                      'table_name',
                                                    ),
                                                    valueOrDefault<String>(
                                                      _model
                                                          .companyQueryByCode1
                                                          ?.first
                                                          .supabaseApiKey,
                                                      'apikey',
                                                    ),
                                                    valueOrDefault<String>(
                                                      _model.companyQueryByCode1
                                                          ?.first.queryName,
                                                      'queryName',
                                                    ),
                                                    valueOrDefault<bool>(
                                                      _model.companyQueryByCode1
                                                          ?.first.isLearnCards,
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
                                                            milliseconds: 100),
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
                                                            milliseconds: 100),
                                                        curve: Curves.ease,
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
                                                            milliseconds: 100),
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
                                                            milliseconds: 100),
                                                        curve: Curves.ease,
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
                                                        valueOrDefault<String>(
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
                                                        milliseconds: 100),
                                                    curve: Curves.ease,
                                                  );
                                                  // question ready false
                                                  logFirebaseEvent(
                                                      'IconButton_questionreadyfalse');
                                                  setState(() {
                                                    _model.questionReady = true;
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
                                                          milliseconds: 500));
                                                  logFirebaseEvent(
                                                      'IconButton_clear_text_fields_pin_codes');
                                                  setState(() {
                                                    _model
                                                        .askTheQuestionController1
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  if ((widget.sessionsDoc?.userEmail != null &&
                                          widget.sessionsDoc?.userEmail !=
                                              '') &&
                                      responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                      ))
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      child: Visibility(
                                        visible: _model.questionReady == true,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: _model
                                                      .askTheQuestionController2,
                                                  focusNode: _model
                                                      .askTheQuestionFocusNode2,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'Enter your password',
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
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
                                                    hintText:
                                                        'You will find this on your welcome email',
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFF464646),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                  validator: _model
                                                      .askTheQuestionController2Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              FFButtonWidget(
                                                onPressed: () {
                                                  print('Button pressed ...');
                                                },
                                                text: 'Submit',
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
                                                                .secondaryText,
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
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (valueOrDefault<bool>(
                      FFAppState().debugCount >= 3,
                      false,
                    ))
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
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
                            activeColor:
                                FlutterFlowTheme.of(context).primaryText,
                            inactiveColor:
                                FlutterFlowTheme.of(context).alternate,
                            selectedColor: FlutterFlowTheme.of(context).primary,
                            activeFillColor:
                                FlutterFlowTheme.of(context).primaryText,
                            inactiveFillColor:
                                FlutterFlowTheme.of(context).alternate,
                            selectedFillColor:
                                FlutterFlowTheme.of(context).primary,
                          ),
                          controller: _model.pinCodeController,
                          onChanged: (_) {},
                          onCompleted: (_) async {
                            logFirebaseEvent(
                                'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_COPY_Pi');
                            logFirebaseEvent('PinCode_firestore_query');
                            _model.allCompanies =
                                await queryCompaniesRecordOnce();
                            if (_model.pinCodeController!.text ==
                                _model.allCompanies
                                    ?.where((e) =>
                                        e.companyCode ==
                                        _model.pinCodeController!.text)
                                    .toList()
                                    .first
                                    .companyCode) {
                              logFirebaseEvent('PinCode_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: const Text('ok'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: const Text('Ok'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                              logFirebaseEvent('PinCode_update_app_state');
                              setState(() {
                                FFAppState().companySecretCode =
                                    _model.pinCodeController!.text;
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
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
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
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
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
                          validator: _model.pinCodeControllerValidator
                              .asValidator(context),
                        ),
                      ),
                  ],
                ),
              ),
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
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Visibility(
                visible: responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                    const Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (valueOrDefault<bool>(
                          (widget.sessionsDoc?.currentNavJourney ==
                                  'welcomeChatComplete') ||
                              (FFAppState().debugCount >= 3),
                          false,
                        ))
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_COPY_CO');
                              logFirebaseEvent('Button_action_block');
                              unawaited(
                                () async {}(),
                              );
                            },
                            text: 'Continue',
                            options: FFButtonOptions(
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 4.0, 24.0, 4.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color:
                                  FlutterFlowTheme.of(context).selectedButton,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 18.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 1.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation1']!),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (valueOrDefault<bool>(
                          (widget.sessionsDoc?.currentNavJourney ==
                                  'learningPlan') ||
                              (FFAppState().debugCount >= 3),
                          false,
                        ))
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_COPY_GE');
                              logFirebaseEvent('Button_action_block');
                              unawaited(
                                () async {
                                  await action_blocks.getSomeTileNames(
                                    context,
                                    companyDoc: widget.companiesDoc,
                                  );
                                  setState(() {});
                                }(),
                              );
                            },
                            text: 'Get Tiles',
                            options: FFButtonOptions(
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 4.0, 24.0, 4.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).customColor3,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 18.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 1.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation2']!),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (valueOrDefault<bool>(
                          (widget.sessionsDoc?.currentNavJourney ==
                                  'learningPlan') ||
                              (FFAppState().debugCount >= 3),
                          false,
                        ))
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_COPY_CR');
                              logFirebaseEvent('Button_backend_call');

                              await FlowiseChatsRecord.collection
                                  .doc()
                                  .set(createFlowiseChatsRecordData(
                                    role: 'system',
                                    text:
                                        'I have found some great topics you will enjoy learning',
                                    createdTime: getCurrentTimestamp,
                                    sessionId:
                                        FFAppState().nonLoggedInSessionId,
                                    tileId: '',
                                    threadId: FFAppState().selectedThreadId,
                                    userId: FFAppState().nonLoggedInSessionId,
                                  ));
                            },
                            text: 'Create Chat',
                            options: FFButtonOptions(
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 4.0, 24.0, 4.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color:
                                  FlutterFlowTheme.of(context).selectedButton,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 18.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 1.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation3']!),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (valueOrDefault<bool>(
                          (widget.sessionsDoc?.currentNavJourney ==
                                  'learningPlan') ||
                              (FFAppState().debugCount >= 3),
                          false,
                        ))
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_COPY_UP');
                              logFirebaseEvent('Button_backend_call');

                              await widget.sessionsDoc!.reference.update({
                                ...createSessionsRecordData(
                                  currentNavJourney: 'youAreMyCoach',
                                ),
                                ...mapToFirestore(
                                  {
                                    'learnCardCount': FieldValue.increment(
                                        widget.sessionsDoc!.learnCardCount >= 1
                                            ? 0
                                            : 3),
                                  },
                                ),
                              });
                            },
                            text: 'Update Learn Count and NavPath',
                            options: FFButtonOptions(
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 4.0, 24.0, 4.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color:
                                  FlutterFlowTheme.of(context).selectedButton,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 18.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 1.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation4']!),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (valueOrDefault<bool>(
                          (widget.sessionsDoc?.currentNavJourney ==
                                  'learningPlan') ||
                              (FFAppState().debugCount >= 3),
                          false,
                        ))
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_COPY_CO');
                              logFirebaseEvent('Button_update_app_state');
                              _model.updatePage(() {
                                FFAppState().leftPane = 'aiMenu';
                                FFAppState().middlePane = 'bodyContent';
                                FFAppState().selectedThreadId =
                                    random_data.randomString(
                                  10,
                                  10,
                                  true,
                                  true,
                                  true,
                                );
                              });
                            },
                            text: 'Columns States',
                            options: FFButtonOptions(
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 4.0, 24.0, 4.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color:
                                  FlutterFlowTheme.of(context).selectedButton,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 18.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 1.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation5']!),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (valueOrDefault<bool>(
                          (widget.sessionsDoc?.currentNavJourney ==
                                  'learningPlan') ||
                              (FFAppState().debugCount >= 3),
                          false,
                        ))
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_COPY_CH');
                              logFirebaseEvent('Button_backend_call');

                              await FlowiseChatsRecord.collection
                                  .doc()
                                  .set(createFlowiseChatsRecordData(
                                    sessionId: widget.sessionsDoc?.reference.id,
                                    createdTime: getCurrentTimestamp,
                                    text:
                                        'I\'m here to assist and navigate you through your learning journey. With the invaluable guidance and knowledge imparted by ${valueOrDefault<String>(
                                      widget.companiesDoc?.companyAiData
                                          .ownerName,
                                      'the app owner ',
                                    )} and the team, I am equipped to serve as your mentor. My role is to generate content, address your queries, and ensure your educational journey remains engaging. I kindly ask for your patience as I am currently analysing our recent dialogue to identify a suitable topic that will effectively address your challenges and facilitate your progress. I will add this to your learning plan when I am finished.  In the meantime, why not check out a learnCard?',
                                    threadId: FFAppState().selectedThreadId,
                                    role: 'ai',
                                    userId: FFAppState().nonLoggedInSessionId,
                                  ));
                            },
                            text: 'Chat Doc',
                            options: FFButtonOptions(
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 4.0, 24.0, 4.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color:
                                  FlutterFlowTheme.of(context).selectedButton,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 18.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 1.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation6']!),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (valueOrDefault<bool>(
                          (widget.sessionsDoc?.currentNavJourney ==
                                  'learningPlan') ||
                              (FFAppState().debugCount >= 3),
                          false,
                        ))
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_COPY_2_');
                              logFirebaseEvent('Button_backend_call');

                              await widget.sessionsDoc!.reference
                                  .update(createSessionsRecordData(
                                currentNavJourney: 'learningPlan',
                                coachMeThreadID: random_data.randomString(
                                  10,
                                  10,
                                  true,
                                  true,
                                  true,
                                ),
                              ));
                              logFirebaseEvent('Button_action_block');
                              unawaited(
                                () async {
                                  await action_blocks.welcomeUserInitialContent(
                                    context,
                                    companyDocPassed: widget.companiesDoc,
                                  );
                                  setState(() {});
                                }(),
                              );
                              logFirebaseEvent('Button_action_block');
                              unawaited(
                                () async {
                                  await action_blocks.getSomeTileNames(
                                    context,
                                    companyDoc: widget.companiesDoc,
                                  );
                                  setState(() {});
                                }(),
                              );
                              logFirebaseEvent('Button_backend_call');

                              await FlowiseChatsRecord.collection
                                  .doc()
                                  .set(createFlowiseChatsRecordData(
                                    role: 'system',
                                    text:
                                        'I have found some great topics you will enjoy learning',
                                    createdTime: getCurrentTimestamp,
                                    sessionId:
                                        FFAppState().nonLoggedInSessionId,
                                    tileId: '',
                                    threadId: FFAppState().selectedThreadId,
                                    userId: FFAppState().nonLoggedInSessionId,
                                  ));
                              logFirebaseEvent('Button_backend_call');

                              await widget.sessionsDoc!.reference.update({
                                ...createSessionsRecordData(
                                  currentNavJourney: 'youAreMyCoach',
                                ),
                                ...mapToFirestore(
                                  {
                                    'learnCardCount': FieldValue.increment(
                                        widget.sessionsDoc!.learnCardCount >= 1
                                            ? 0
                                            : 3),
                                  },
                                ),
                              });
                              logFirebaseEvent('Button_update_app_state');
                              _model.updatePage(() {
                                FFAppState().leftPane = 'aiMenu';
                                FFAppState().middlePane = 'bodyContent';
                                FFAppState().selectedThreadId =
                                    random_data.randomString(
                                  10,
                                  10,
                                  true,
                                  true,
                                  true,
                                );
                              });
                              logFirebaseEvent('Button_backend_call');

                              await FlowiseChatsRecord.collection
                                  .doc()
                                  .set(createFlowiseChatsRecordData(
                                    sessionId: widget.sessionsDoc?.reference.id,
                                    createdTime: getCurrentTimestamp,
                                    text:
                                        'I\'m here to assist and navigate you through your learning journey. With the invaluable guidance and knowledge imparted by ${valueOrDefault<String>(
                                      widget.companiesDoc?.companyAiData
                                          .ownerName,
                                      'the app owner ',
                                    )} and the team, I am equipped to serve as your mentor. My role is to generate content, address your queries, and ensure your educational journey remains engaging. I kindly ask for your patience as I am currently analysing our recent dialogue to identify a suitable topic that will effectively address your challenges and facilitate your progress. I will add this to your learning plan when I am finished.  In the meantime, why not check out a learnCard?',
                                    threadId: FFAppState().selectedThreadId,
                                    role: 'ai',
                                    userId: FFAppState().nonLoggedInSessionId,
                                  ));
                            },
                            text: '2. Start my learning journey',
                            options: FFButtonOptions(
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 4.0, 24.0, 4.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color:
                                  FlutterFlowTheme.of(context).selectedButton,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 18.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 1.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation7']!),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}