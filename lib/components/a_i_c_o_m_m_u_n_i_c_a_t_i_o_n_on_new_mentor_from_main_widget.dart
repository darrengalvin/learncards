import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_on_new_mentor_from_main_model.dart';
export 'a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_on_new_mentor_from_main_model.dart';

class AICOMMUNICATIONOnNewMentorFromMainWidget extends StatefulWidget {
  const AICOMMUNICATIONOnNewMentorFromMainWidget({
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
  State<AICOMMUNICATIONOnNewMentorFromMainWidget> createState() =>
      _AICOMMUNICATIONOnNewMentorFromMainWidgetState();
}

class _AICOMMUNICATIONOnNewMentorFromMainWidgetState
    extends State<AICOMMUNICATIONOnNewMentorFromMainWidget>
    with TickerProviderStateMixin {
  late AICOMMUNICATIONOnNewMentorFromMainModel _model;

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
        createModel(context, () => AICOMMUNICATIONOnNewMentorFromMainModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_NEW_MEN');
      logFirebaseEvent('AI_COMMUNICATION-On-newMentorFromMain_up');
      setState(() {
        _model.questionReady = true;
      });
      logFirebaseEvent('AI_COMMUNICATION-On-newMentorFromMain_up');
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
      logFirebaseEvent('AI_COMMUNICATION-On-newMentorFromMain_wa');
      await Future.delayed(const Duration(milliseconds: 1000));
      logFirebaseEvent('AI_COMMUNICATION-On-newMentorFromMain_sc');
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
      controller: _model.columnController,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: StreamBuilder<List<MyTeamRecord>>(
              stream: queryMyTeamRecord(
                queryBuilder: (myTeamRecord) => myTeamRecord.where(
                  'memberId',
                  isEqualTo: valueOrDefault<String>(
                    FFAppState().selectedTeam,
                    '090090',
                  ),
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
                return ClipRRect(
                  borderRadius: BorderRadius.circular(22.0),
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.sizeOf(context).height * 0.9,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x2CFFF6C4),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                  (containerMyTeamRecord != null) == true
                                      ? containerMyTeamRecord!.image
                                      : 'https://res.cloudinary.com/dplpckpbm/image/upload/v1703535226/learningPathwaysBright_b3strj.webp',
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
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  25.0,
                                                                  0.0,
                                                                  25.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          FFAppState()
                                                              .tempStreamingMessage,
                                                          'notSet',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmallFamily,
                                                                  fontSize:
                                                                      18.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_NEW_MEN');
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
                                                          Navigator.pop(
                                                              context);
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
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(-1.0, 1.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: StreamBuilder<
                                          List<FlowiseChatsRecord>>(
                                        stream: queryFlowiseChatsRecord(
                                          queryBuilder: (flowiseChatsRecord) =>
                                              flowiseChatsRecord
                                                  .where(
                                                    'thread_id',
                                                    isEqualTo:
                                                        valueOrDefault<String>(
                                                      FFAppState()
                                                          .selectedThreadId,
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
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
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
                                                            child: Container(
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
                                                                    const EdgeInsets
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
                                                                            const EdgeInsets.all(9.0),
                                                                        child:
                                                                            Text(
                                                                          columnChatsScrollableFlowiseChatsRecord
                                                                              .text,
                                                                          textAlign:
                                                                              TextAlign.start,
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
                                                    (columnChatsScrollableFlowiseChatsRecord
                                                                .role ==
                                                            'ai') ||
                                                        (columnChatsScrollableFlowiseChatsRecord
                                                                .role ==
                                                            'system'),
                                                    false,
                                                  ))
                                                    SizedBox(
                                                      width: double.infinity,
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
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      columnChatsScrollableFlowiseChatsRecord
                                                                              .role ==
                                                                          'ai',
                                                                      false,
                                                                    ))
                                                                      AnimatedContainer(
                                                                        duration:
                                                                            const Duration(milliseconds: 100),
                                                                        curve: Curves
                                                                            .easeInOut,
                                                                        constraints:
                                                                            const BoxConstraints(
                                                                          maxWidth:
                                                                              600.0,
                                                                        ),
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          color:
                                                                              Color(0xFFF5F5F5),
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
                                                                        alignment: const AlignmentDirectional(
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
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            15.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AnimatedContainer(
                                                                          duration:
                                                                              const Duration(milliseconds: 100),
                                                                          curve:
                                                                              Curves.easeInOut,
                                                                          constraints:
                                                                              const BoxConstraints(
                                                                            maxWidth:
                                                                                600.0,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor3,
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              bottomLeft: Radius.circular(8.0),
                                                                              bottomRight: Radius.circular(8.0),
                                                                              topLeft: Radius.circular(0.0),
                                                                              topRight: Radius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          alignment: const AlignmentDirectional(
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
                                                            context: context,
                                                            phone: false,
                                                          ))
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(6.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
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
                                if (valueOrDefault<bool>(
                                  FFAppState().flowiseMessages.isNotEmpty,
                                  false,
                                ))
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
                                                      decoration: const BoxDecoration(
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
                                                              MainAxisSize.min,
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
                                                                      .all(4.0),
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
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            controller:
                                                                                _model.columnMarkdownScrollable,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                if (valueOrDefault<bool>(
                                  FFAppState().flowiseMessages.isNotEmpty,
                                  false,
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
                                      if (valueOrDefault<bool>(
                                        _model.questionReady == false,
                                        false,
                                      ))
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (valueOrDefault<bool>(
                                        widget.sessionsDoc?.currentNavJourney ==
                                            'mentorChat',
                                        false,
                                      ))
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          child: Visibility(
                                            visible: valueOrDefault<bool>(
                                              _model.questionReady == true,
                                              false,
                                            ),
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
                                                      validator: _model
                                                          .askTheQuestionControllerValidator
                                                          .asValidator(context),
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
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
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
                                                          'A_I_C_O_M_M_U_N_I_C_A_T_I_O_N_ON_NEW_MEN');
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
                                                        userId: valueOrDefault<
                                                            String>(
                                                          loggedIn
                                                              ? currentUserReference
                                                                  ?.id
                                                              : FFAppState()
                                                                  .nonLoggedInSessionId,
                                                          'nosessionid',
                                                        ),
                                                        role: 'human',
                                                        text: valueOrDefault<
                                                            String>(
                                                          _model
                                                              .askTheQuestionController
                                                              .text,
                                                          'the question is not set',
                                                        ),
                                                        createdTime:
                                                            getCurrentTimestamp,
                                                        sessionId:
                                                            valueOrDefault<
                                                                String>(
                                                          FFAppState()
                                                              .nonLoggedInSessionId,
                                                          'sessionIdNotSet',
                                                        ),
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
                                                              : valueOrDefault<
                                                                  String>(
                                                                  FFAppState()
                                                                      .selectedThreadId,
                                                                  'selected not set',
                                                                ),
                                                          'thread id did not set',
                                                        ),
                                                        companyName:
                                                            valueOrDefault<
                                                                String>(
                                                          widget.companiesDoc
                                                              ?.companyname,
                                                          'coname',
                                                        ),
                                                        companyDocId:
                                                            valueOrDefault<
                                                                String>(
                                                          widget.companiesDoc
                                                              ?.reference.id,
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
                                                      ));
                                                      _model.createdThread =
                                                          FlowiseChatsRecord
                                                              .getDocumentFromData(
                                                                  createFlowiseChatsRecordData(
                                                                    userId: valueOrDefault<
                                                                        String>(
                                                                      loggedIn
                                                                          ? currentUserReference
                                                                              ?.id
                                                                          : FFAppState()
                                                                              .nonLoggedInSessionId,
                                                                      'nosessionid',
                                                                    ),
                                                                    role:
                                                                        'human',
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      _model
                                                                          .askTheQuestionController
                                                                          .text,
                                                                      'the question is not set',
                                                                    ),
                                                                    createdTime:
                                                                        getCurrentTimestamp,
                                                                    sessionId:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      FFAppState()
                                                                          .nonLoggedInSessionId,
                                                                      'sessionIdNotSet',
                                                                    ),
                                                                    threadId:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      widget.sessionsDoc?.currentNavJourney ==
                                                                              'newSession'
                                                                          ? valueOrDefault<
                                                                              String>(
                                                                              widget.sessionsDoc?.defaultThreadId,
                                                                              'notSetOnPostMessage',
                                                                            )
                                                                          : valueOrDefault<
                                                                              String>(
                                                                              FFAppState().selectedThreadId,
                                                                              'selected not set',
                                                                            ),
                                                                      'thread id did not set',
                                                                    ),
                                                                    companyName:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      widget
                                                                          .companiesDoc
                                                                          ?.companyname,
                                                                      'coname',
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
                                                                        widget.sessionsDoc?.currentNavJourney ==
                                                                                'newSession'
                                                                            ? valueOrDefault<String>(
                                                                                widget.sessionsDoc?.defaultThreadId,
                                                                                'notSetOnPostMessage',
                                                                              )
                                                                            : FFAppState().selectedThreadId,
                                                                        'threadDetailsNotSet',
                                                                      ),
                                                                      threadName:
                                                                          'Initial Welcome Chat',
                                                                      clearUnsetFields:
                                                                          false,
                                                                      create:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                  flowiseChatsRecordReference1);
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
                                                          'IconButton_firestore_query');
                                                      _model.sessionForFlowise =
                                                          await querySessionsRecordOnce(
                                                        queryBuilder:
                                                            (sessionsRecord) =>
                                                                sessionsRecord
                                                                    .where(
                                                          'sessionId',
                                                          isEqualTo:
                                                              valueOrDefault<
                                                                  String>(
                                                            FFAppState()
                                                                .nonLoggedInSessionId,
                                                            'session id not set',
                                                          ),
                                                        ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      logFirebaseEvent(
                                                          'IconButton_custom_action');
                                                      await actions
                                                          .callFlowiseStreamingChat(
                                                        valueOrDefault<String>(
                                                          _model
                                                              .askTheQuestionController
                                                              .text,
                                                          'question not set',
                                                        ),
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
                                                              return 'This weeks focus topic is: ${widget.companiesDoc?.userGatherDataPrompt}';
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
                                                              return 'This weeks topic is : ${widget.companiesDoc?.companyAiData.thisWeeksTopic}  ${widget.companiesDoc?.userGatherDataPrompt}';
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
                                                      // flowise chat document ai
                                                      logFirebaseEvent(
                                                          'IconButton_flowisechatdocumentai');

                                                      await FlowiseChatsRecord
                                                          .collection
                                                          .doc()
                                                          .set(
                                                              createFlowiseChatsRecordData(
                                                            userId:
                                                                valueOrDefault<
                                                                    String>(
                                                              loggedIn
                                                                  ? currentUserReference
                                                                      ?.id
                                                                  : FFAppState()
                                                                      .nonLoggedInSessionId,
                                                              'sessionidnotset',
                                                            ),
                                                            role: 'ai',
                                                            text: FFAppState()
                                                                .flowiseMessages
                                                                .first
                                                                .message,
                                                            createdTime:
                                                                getCurrentTimestamp,
                                                            sessionId:
                                                                valueOrDefault<
                                                                    String>(
                                                              FFAppState()
                                                                  .nonLoggedInSessionId,
                                                              'session id not set',
                                                            ),
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
                                                              'thhrrad not set',
                                                            ),
                                                            companyName:
                                                                valueOrDefault<
                                                                    String>(
                                                              widget
                                                                  .companiesDoc
                                                                  ?.companyname,
                                                              'coName',
                                                            ),
                                                            companyDocId:
                                                                valueOrDefault<
                                                                    String>(
                                                              widget
                                                                  .companiesDoc
                                                                  ?.reference
                                                                  .id,
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
