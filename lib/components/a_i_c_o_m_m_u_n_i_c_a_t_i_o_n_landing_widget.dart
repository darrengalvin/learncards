import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_landing_model.dart';
export 'a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_landing_model.dart';

class AICOMMUNICATIONLandingWidget extends StatefulWidget {
  const AICOMMUNICATIONLandingWidget({
    super.key,
    bool? askingQuestion,
  }) : askingQuestion = askingQuestion ?? false;

  final bool askingQuestion;

  @override
  State<AICOMMUNICATIONLandingWidget> createState() =>
      _AICOMMUNICATIONLandingWidgetState();
}

class _AICOMMUNICATIONLandingWidgetState
    extends State<AICOMMUNICATIONLandingWidget> with TickerProviderStateMixin {
  late AICOMMUNICATIONLandingModel _model;

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
    _model = createModel(context, () => AICOMMUNICATIONLandingModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_LANDING_AI');
      logFirebaseEvent('AI_COMMUNICATION_Landing_update_componen');
      setState(() {
        _model.questionReady = true;
      });
      logFirebaseEvent('AI_COMMUNICATION_Landing_wait__delay');
      await Future.delayed(const Duration(milliseconds: 2000));
      logFirebaseEvent('AI_COMMUNICATION_Landing_scroll_to');
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

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22.0),
        child: Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.8,
          constraints: const BoxConstraints(
            maxWidth: 1200.0,
          ),
          decoration: BoxDecoration(
            color: const Color(0xC5FFFFFF),
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
                    children: [
                      if (valueOrDefault<bool>(
                        FFAppState().debugCount >= 3,
                        false,
                      ))
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(
                                        _model.dropDownValue ??=
                                            'Reading Topic (thread)',
                                      ),
                                      options: const ['Reading Topic (thread)'],
                                      onChanged: (val) => setState(
                                          () => _model.dropDownValue = val),
                                      width: 300.0,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      hintText: 'Reading Topic',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isOverButton: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  FFAppState().activeThread,
                                  '- -',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_LANDING_Ic');
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
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
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
                                        .where(
                                          'thread_id',
                                          isEqualTo: FFAppState().activeThread,
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
                                      const SizedBox(height: 8.0),
                                  itemBuilder:
                                      (context, columnChatsScrollableIndex) {
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
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          33.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xFFE6EDFB),
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
                                                          const EdgeInsets.all(4.0),
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
                                                                  const EdgeInsets
                                                                      .all(9.0),
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
                                                size: 35.0,
                                              ),
                                            ],
                                          ),
                                        if (columnChatsScrollableFlowiseChatsRecord
                                                .role ==
                                            'ai')
                                          SizedBox(
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
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    100),
                                                            curve: Curves
                                                                .easeInOut,
                                                            constraints:
                                                                const BoxConstraints(
                                                              maxWidth: 600.0,
                                                            ),
                                                            decoration:
                                                                const BoxDecoration(
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
                                                                                const EdgeInsets.all(6.0),
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
                                                        const EdgeInsets.all(6.0),
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
                      if (FFAppState().flowiseMessages.isNotEmpty)
                        SizedBox(
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 55.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        AnimatedContainer(
                                          duration: const Duration(milliseconds: 100),
                                          curve: Curves.easeInOut,
                                          constraints: const BoxConstraints(
                                            maxWidth: 600.0,
                                          ),
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFEEEEEE),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8.0),
                                              bottomRight: Radius.circular(8.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(8.0),
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(-1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 9.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child:
                                                                  SingleChildScrollView(
                                                                controller: _model
                                                                    .columnMarkdownScrollable,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              6.0),
                                                                      child:
                                                                          MarkdownBody(
                                                                        data: valueOrDefault<
                                                                            String>(
                                                                          FFAppState()
                                                                              .flowiseMessages
                                                                              .first
                                                                              .message,
                                                                          '- -',
                                                                        ),
                                                                        selectable:
                                                                            true,
                                                                        onTapLink: (_,
                                                                                url,
                                                                                __) =>
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
                                  padding: const EdgeInsets.all(6.0),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                              ))
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
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
                                            const AlignmentDirectional(-1.0, 0.0),
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
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Processing',
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
                                            ].divide(const SizedBox(width: 9.0)),
                                          ),
                                          Container(
                                            width: 100.0,
                                            height: 55.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: const Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [],
                                            ),
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
                                          FlutterFlowTheme.of(context).primary,
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
                            if (_model.questionReady == true)
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 8.0),
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
                                              borderSide: const BorderSide(
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
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
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
                                            'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_LANDING_se');
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
                                                '') {}
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
                                              sessionId: FFAppState()
                                                  .nonLoggedInSessionId,
                                              threadId: valueOrDefault<String>(
                                                FFAppState().activeThread,
                                                'no thread id was passed',
                                              ),
                                            ));
                                        if (!(FFAppState().activeThread != '')) {
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
                                          duration: const Duration(milliseconds: 100),
                                          curve: Curves.ease,
                                        );
                                        logFirebaseEvent(
                                            'IconButton_custom_action');
                                        await actions.callFlowiseStreamingChat(
                                          _model.askTheQuestionController.text,
                                          _model.companyQueryByCode?.first
                                              .userGatherDataPrompt,
                                          '1',
                                          FFAppState().nonLoggedInSessionId,
                                          FFAppState().nonLoggedInSessionId,
                                          valueOrDefault<String>(
                                            _model.companyQueryByCode?.first
                                                .supabaseProjUrl,
                                            'https://efdipbnxemvehcjbxekx.supabase.co',
                                          ),
                                          valueOrDefault<String>(
                                            _model.companyQueryByCode?.first
                                                .tableName,
                                            'table_name',
                                          ),
                                          valueOrDefault<String>(
                                            _model.companyQueryByCode?.first
                                                .supabaseApiKey,
                                            'apikey',
                                          ),
                                          valueOrDefault<String>(
                                            _model.companyQueryByCode?.first
                                                .queryName,
                                            'queryName',
                                          ),
                                          valueOrDefault<bool>(
                                            _model.companyQueryByCode?.first
                                                .isLearnCards,
                                            false,
                                          ),
                                          () async {
                                            // scroll non streaming column
                                            logFirebaseEvent(
                                                '_scrollnonstreamingcolumn');
                                            await _model.columnChatsScrollable
                                                ?.animateTo(
                                              _model.columnChatsScrollable!
                                                  .position.maxScrollExtent,
                                              duration:
                                                  const Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                            // scroll streaming
                                            logFirebaseEvent(
                                                '_scrollstreaming');
                                            await _model
                                                .columnMarkdownScrollable
                                                ?.animateTo(
                                              _model.columnMarkdownScrollable!
                                                  .position.maxScrollExtent,
                                              duration:
                                                  const Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                          },
                                          () async {
                                            // scroll non streaming column
                                            logFirebaseEvent(
                                                '_scrollnonstreamingcolumn');
                                            await _model.columnChatsScrollable
                                                ?.animateTo(
                                              _model.columnChatsScrollable!
                                                  .position.maxScrollExtent,
                                              duration:
                                                  const Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                            // scroll streaming
                                            logFirebaseEvent(
                                                '_scrollstreaming');
                                            await _model
                                                .columnMarkdownScrollable
                                                ?.animateTo(
                                              _model.columnMarkdownScrollable!
                                                  .position.maxScrollExtent,
                                              duration:
                                                  const Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                          },
                                          'unknown',
                                        );
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
                                              sessionId: FFAppState()
                                                  .nonLoggedInSessionId,
                                              threadId: valueOrDefault<String>(
                                                FFAppState().activeThread,
                                                'no thread id was found',
                                              ),
                                            ));
                                        // question ready false
                                        logFirebaseEvent(
                                            'IconButton_questionreadyfalse');
                                        setState(() {
                                          _model.questionReady = true;
                                        });
                                        logFirebaseEvent(
                                            'IconButton_update_app_state');
                                        setState(() {
                                          FFAppState().flowiseMessages = [];
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
                                          duration: const Duration(milliseconds: 100),
                                          curve: Curves.ease,
                                        );

                                        setState(() {});
                                      },
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
              if (valueOrDefault<bool>(
                FFAppState().debugCount >= 3,
                false,
              ))
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
                      logFirebaseEvent(
                          'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_LANDING_Pi');
                      logFirebaseEvent('PinCode_firestore_query');
                      _model.allCompanies = await queryCompaniesRecordOnce();
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
                    validator:
                        _model.pinCodeControllerValidator.asValidator(context),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
