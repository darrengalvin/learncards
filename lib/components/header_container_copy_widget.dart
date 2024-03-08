import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_container_copy_model.dart';
export 'header_container_copy_model.dart';

class HeaderContainerCopyWidget extends StatefulWidget {
  const HeaderContainerCopyWidget({
    super.key,
    this.action,
    String? title,
    int? currentTier,
  })  : title = title ?? 'Library',
        currentTier = currentTier ?? 0;

  final Future Function()? action;
  final String title;
  final int currentTier;

  @override
  State<HeaderContainerCopyWidget> createState() =>
      _HeaderContainerCopyWidgetState();
}

class _HeaderContainerCopyWidgetState extends State<HeaderContainerCopyWidget>
    with TickerProviderStateMixin {
  late HeaderContainerCopyModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(-37.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(-37.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'iconButtonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(-10.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'iconButtonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(-10.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'iconButtonOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(-10.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'iconButtonOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(-10.0, 0.0),
          end: const Offset(0.0, 0.0),
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
    _model = createModel(context, () => HeaderContainerCopyModel());

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

    return StreamBuilder<List<Tilesv2Record>>(
      stream: queryTilesv2Record(
        queryBuilder: (tilesv2Record) => tilesv2Record.orderBy('tile_index'),
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
        List<Tilesv2Record> containerTilesv2RecordList = snapshot.data!;
        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: double.infinity,
          constraints: const BoxConstraints(
            maxHeight: 200.0,
          ),
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'HEADER_CONTAINER_COPY_Container_o6q84tei');
                                  logFirebaseEvent(
                                      'Container_update_app_state');
                                  FFAppState().callbackAction = 'Drawer';
                                  logFirebaseEvent(
                                      'Container_execute_callback');
                                  await widget.action?.call();
                                },
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.gripVertical,
                                      color: FlutterFlowTheme.of(context)
                                          .darkercolour,
                                      size: 40.0,
                                    ),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation1']!),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 50.0, 0.0),
                          child: Container(
                            height: 88.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 50.0, 0.0),
                          child: Container(
                            height: 88.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                        ),
                        Container(
                          height: 100.0,
                          constraints: const BoxConstraints(
                            maxWidth: 600.0,
                          ),
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (valueOrDefault<bool>(
                                        FFAppState().learningTypeSelected !=
                                                '',
                                        false,
                                      ))
                                        StreamBuilder<
                                            List<
                                                TotalTokensSessionUsersRecord>>(
                                          stream:
                                              queryTotalTokensSessionUsersRecord(
                                            queryBuilder:
                                                (totalTokensSessionUsersRecord) =>
                                                    totalTokensSessionUsersRecord
                                                        .where(
                                              'userSessionId',
                                              isEqualTo: FFAppState()
                                                  .nonLoggedInSessionId,
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
                                            List<TotalTokensSessionUsersRecord>
                                                richTextTotalTokensSessionUsersRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final richTextTotalTokensSessionUsersRecord =
                                                richTextTotalTokensSessionUsersRecordList
                                                        .isNotEmpty
                                                    ? richTextTotalTokensSessionUsersRecordList
                                                        .first
                                                    : null;
                                            return RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        'Learning Type Selected. ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text: FFAppState()
                                                        .learningTypeSelected,
                                                    style: const TextStyle(),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 18.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            );
                                          },
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<
                                          List<TotalTokensSessionUsersRecord>>(
                                        stream:
                                            queryTotalTokensSessionUsersRecord(
                                          queryBuilder:
                                              (totalTokensSessionUsersRecord) =>
                                                  totalTokensSessionUsersRecord
                                                      .where(
                                            'userSessionId',
                                            isEqualTo: FFAppState()
                                                .nonLoggedInSessionId,
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
                                          List<TotalTokensSessionUsersRecord>
                                              richTextTotalTokensSessionUsersRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final richTextTotalTokensSessionUsersRecord =
                                              richTextTotalTokensSessionUsersRecordList
                                                      .isNotEmpty
                                                  ? richTextTotalTokensSessionUsersRecordList
                                                      .first
                                                  : null;
                                          return RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'You have ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: valueOrDefault<String>(
                                                    richTextTotalTokensSessionUsersRecord
                                                        ?.newTotal
                                                        .toString(),
                                                    '0',
                                                  ),
                                                  style: const TextStyle(),
                                                ),
                                                const TextSpan(
                                                  text: 'Learning Cards Left',
                                                  style: TextStyle(),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 18.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<List<LearnCardsRecord>>(
                                        stream: queryLearnCardsRecord(
                                          queryBuilder: (learnCardsRecord) =>
                                              learnCardsRecord.where(
                                            'sessionId',
                                            isEqualTo: FFAppState()
                                                .nonLoggedInSessionId,
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
                                          List<LearnCardsRecord>
                                              richTextLearnCardsRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final richTextLearnCardsRecord =
                                              richTextLearnCardsRecordList
                                                      .isNotEmpty
                                                  ? richTextLearnCardsRecordList
                                                      .first
                                                  : null;
                                          return RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'You have ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: valueOrDefault<String>(
                                                    richTextLearnCardsRecord
                                                        ?.learnCardsRemaining
                                                        .toString(),
                                                    '0',
                                                  ),
                                                  style: const TextStyle(),
                                                ),
                                                const TextSpan(
                                                  text: 'Learning Cards Left',
                                                  style: TextStyle(),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 18.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<
                                          List<TotalTokensSessionUsersRecord>>(
                                        stream:
                                            queryTotalTokensSessionUsersRecord(
                                          queryBuilder:
                                              (totalTokensSessionUsersRecord) =>
                                                  totalTokensSessionUsersRecord
                                                      .where(
                                            'userSessionId',
                                            isEqualTo: FFAppState()
                                                .nonLoggedInSessionId,
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
                                          List<TotalTokensSessionUsersRecord>
                                              richTextTotalTokensSessionUsersRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final richTextTotalTokensSessionUsersRecord =
                                              richTextTotalTokensSessionUsersRecordList
                                                      .isNotEmpty
                                                  ? richTextTotalTokensSessionUsersRecordList
                                                      .first
                                                  : null;
                                          return RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Your Seession ID is ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                                const TextSpan(
                                                  text: '',
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: valueOrDefault<String>(
                                                    FFAppState()
                                                        .nonLoggedInSessionId,
                                                    'sessionId',
                                                  ),
                                                  style: const TextStyle(),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 18.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                decoration: const BoxDecoration(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 300.0,
                          height: 88.0,
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Visibility(
                                    visible: valueOrDefault<bool>(
                                            currentUserDocument?.isadmin,
                                            false) ==
                                        true,
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
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
                                                        'HEADER_CONTAINER_COPY_Container_sgs06d75');
                                                    logFirebaseEvent(
                                                        'Container_navigate_to');

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
                                                  child: Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
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
                                                              'HEADER_CONTAINER_COPY_Icon_hutwb6oj_ON_T');
                                                          logFirebaseEvent(
                                                              'Icon_navigate_to');

                                                          context.pushNamed(
                                                              'alitest');
                                                        },
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .gripVertical,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .darkercolour,
                                                          size: 40.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation2']!),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 30.0, 0.0),
                                            child: Text(
                                              'Edit Mode ${FFAppState().editMode.toString()}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 30.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/Screenshot_2023-12-30_at_21.15.48.png',
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.1,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Screenshot_2023-12-30_at_21.15.34.png',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.09,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .customColor7,
                                            borderRadius: 8.0,
                                            borderWidth: 0.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .customColor7,
                                            hoverColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            hoverIconColor:
                                                FlutterFlowTheme.of(context)
                                                    .customColor7,
                                            icon: Icon(
                                              Icons.rocket_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'HEADER_CONTAINER_COPY_AddTile_ON_TAP');
                                              logFirebaseEvent(
                                                  'AddTile_navigate_to');

                                              context.pushNamed('landing');
                                            },
                                          ).animateOnPageLoad(animationsMap[
                                              'iconButtonOnPageLoadAnimation1']!),
                                          FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .customColor7,
                                            borderRadius: 8.0,
                                            borderWidth: 0.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .customColor7,
                                            hoverColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            hoverIconColor:
                                                FlutterFlowTheme.of(context)
                                                    .customColor7,
                                            icon: Icon(
                                              Icons.edit_square,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'HEADER_CONTAINER_COPY_AddTile_ON_TAP');
                                              logFirebaseEvent(
                                                  'AddTile_update_app_state');
                                              FFAppState().update(() {
                                                FFAppState().editMode =
                                                    valueOrDefault<bool>(
                                                  FFAppState().editMode
                                                      ? false
                                                      : true,
                                                  true,
                                                );
                                              });
                                            },
                                          ).animateOnPageLoad(animationsMap[
                                              'iconButtonOnPageLoadAnimation2']!),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 12.0, 0.0),
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: const BoxDecoration(),
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor7,
                                                borderRadius: 8.0,
                                                borderWidth: 0.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor7,
                                                hoverColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                hoverIconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor7,
                                                icon: Icon(
                                                  Icons.add,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'HEADER_CONTAINER_COPY_AddTile_ON_TAP');
                                                  if (() {
                                                    if (FFAppState()
                                                                .viewTileContentId ==
                                                            '') {
                                                      return true;
                                                    } else if (FFAppState()
                                                                .tileNav
                                                                .tier0Id ==
                                                            '') {
                                                      return true;
                                                    } else {
                                                      return false;
                                                    }
                                                  }()) {
                                                    logFirebaseEvent(
                                                        'AddTile_firestore_query');
                                                    _model.navTileCount =
                                                        await queryTilesv2RecordCount(
                                                      queryBuilder:
                                                          (tilesv2Record) =>
                                                              tilesv2Record
                                                                  .where(
                                                        'tile_tier',
                                                        isEqualTo: 0,
                                                      ),
                                                    );
                                                    logFirebaseEvent(
                                                        'AddTile_backend_call');

                                                    var tilesv2RecordReference1 =
                                                        Tilesv2Record.collection
                                                            .doc();
                                                    await tilesv2RecordReference1
                                                        .set({
                                                      ...createTilesv2RecordData(
                                                        createdTime:
                                                            getCurrentTimestamp,
                                                        updatedTime:
                                                            getCurrentTimestamp,
                                                        user:
                                                            currentUserReference,
                                                        uid: currentUserUid,
                                                        type: 'Content',
                                                        title: 'Nav Tile-${(valueOrDefault<int>(
                                                              _model
                                                                  .navTileCount,
                                                              0,
                                                            ) + 1).toString()}',
                                                        subtitle: '',
                                                        details: '',
                                                        image: '',
                                                        thumbnail: '',
                                                        isPublished: false,
                                                        layout: '',
                                                        category: '',
                                                        isPublic: false,
                                                        isPinned: false,
                                                        isFeatured: false,
                                                        parentId:
                                                            valueOrDefault<
                                                                String>(
                                                          FFAppState()
                                                              .viewTileContentId,
                                                          '0',
                                                        ),
                                                        isContent: false,
                                                        tileId: '',
                                                        tileType: 'Content',
                                                        tileName:
                                                            'Nav Tile-${(valueOrDefault<int>(
                                                                  _model
                                                                      .navTileCount,
                                                                  0,
                                                                ) + 1).toString()}',
                                                        tileStatus: 'Draft',
                                                        tileTier:
                                                            valueOrDefault<int>(
                                                          FFAppState()
                                                              .navPath
                                                              .length,
                                                          0,
                                                        ),
                                                        tileIndex:
                                                            _model.navTileCount,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'tags': [''],
                                                          'access_users': [
                                                            FFAppState()
                                                                .tileNav
                                                                .tier0Id
                                                          ],
                                                          'access_groups': [
                                                            FFAppState()
                                                                .tileNav
                                                                .tier0Id
                                                          ],
                                                          'admin_users': [
                                                            currentUserUid
                                                          ],
                                                        },
                                                      ),
                                                    });
                                                    _model.newQuickTileNav =
                                                        Tilesv2Record
                                                            .getDocumentFromData({
                                                      ...createTilesv2RecordData(
                                                        createdTime:
                                                            getCurrentTimestamp,
                                                        updatedTime:
                                                            getCurrentTimestamp,
                                                        user:
                                                            currentUserReference,
                                                        uid: currentUserUid,
                                                        type: 'Content',
                                                        title: 'Nav Tile-${(valueOrDefault<int>(
                                                              _model
                                                                  .navTileCount,
                                                              0,
                                                            ) + 1).toString()}',
                                                        subtitle: '',
                                                        details: '',
                                                        image: '',
                                                        thumbnail: '',
                                                        isPublished: false,
                                                        layout: '',
                                                        category: '',
                                                        isPublic: false,
                                                        isPinned: false,
                                                        isFeatured: false,
                                                        parentId:
                                                            valueOrDefault<
                                                                String>(
                                                          FFAppState()
                                                              .viewTileContentId,
                                                          '0',
                                                        ),
                                                        isContent: false,
                                                        tileId: '',
                                                        tileType: 'Content',
                                                        tileName:
                                                            'Nav Tile-${(valueOrDefault<int>(
                                                                  _model
                                                                      .navTileCount,
                                                                  0,
                                                                ) + 1).toString()}',
                                                        tileStatus: 'Draft',
                                                        tileTier:
                                                            valueOrDefault<int>(
                                                          FFAppState()
                                                              .navPath
                                                              .length,
                                                          0,
                                                        ),
                                                        tileIndex:
                                                            _model.navTileCount,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'tags': [''],
                                                          'access_users': [
                                                            FFAppState()
                                                                .tileNav
                                                                .tier0Id
                                                          ],
                                                          'access_groups': [
                                                            FFAppState()
                                                                .tileNav
                                                                .tier0Id
                                                          ],
                                                          'admin_users': [
                                                            currentUserUid
                                                          ],
                                                        },
                                                      ),
                                                    }, tilesv2RecordReference1);
                                                    logFirebaseEvent(
                                                        'AddTile_update_app_state');
                                                    setState(() {
                                                      FFAppState()
                                                              .NewTileJustCreated =
                                                          true;
                                                    });
                                                    logFirebaseEvent(
                                                        'AddTile_backend_call');

                                                    await _model
                                                        .newQuickTileNav!
                                                        .reference
                                                        .update(
                                                            createTilesv2RecordData(
                                                      tileId: _model
                                                          .newQuickTileNav
                                                          ?.reference
                                                          .id,
                                                    ));
                                                    logFirebaseEvent(
                                                        'AddTile_backend_call');

                                                    var tileBlocksRecordReference1 =
                                                        TileBlocksRecord
                                                            .collection
                                                            .doc();
                                                    await tileBlocksRecordReference1
                                                        .set(
                                                            createTileBlocksRecordData(
                                                      createdTime:
                                                          getCurrentTimestamp,
                                                      updatedTime:
                                                          getCurrentTimestamp,
                                                      user:
                                                          currentUserReference,
                                                      uid: currentUserUid,
                                                      blockType: 'Text',
                                                      blockIndex: 0,
                                                      blockName: 'Block -',
                                                      blockStatus: 'Published',
                                                      tileId: _model
                                                          .newQuickTileNav
                                                          ?.reference
                                                          .id,
                                                      image: '',
                                                      thumbnail: '',
                                                      isDefaultTheme: false,
                                                      blockLayout: 'Paragraph',
                                                      blockTitle:
                                                          'Block Title ${random_data.randomString(
                                                        3,
                                                        7,
                                                        true,
                                                        false,
                                                        false,
                                                      )}',
                                                      blockSubtitle: '',
                                                      video: '',
                                                      audio: '',
                                                      text: '',
                                                      header: '',
                                                      subtitle: '',
                                                      title: '',
                                                      fontSettings:
                                                          createFontSettingsStruct(
                                                        fontSizeDouble: 14.0,
                                                        clearUnsetFields: false,
                                                        create: true,
                                                      ),
                                                    ));
                                                    _model.firstTileBlock =
                                                        TileBlocksRecord
                                                            .getDocumentFromData(
                                                                createTileBlocksRecordData(
                                                                  createdTime:
                                                                      getCurrentTimestamp,
                                                                  updatedTime:
                                                                      getCurrentTimestamp,
                                                                  user:
                                                                      currentUserReference,
                                                                  uid:
                                                                      currentUserUid,
                                                                  blockType:
                                                                      'Text',
                                                                  blockIndex: 0,
                                                                  blockName:
                                                                      'Block -',
                                                                  blockStatus:
                                                                      'Published',
                                                                  tileId: _model
                                                                      .newQuickTileNav
                                                                      ?.reference
                                                                      .id,
                                                                  image: '',
                                                                  thumbnail: '',
                                                                  isDefaultTheme:
                                                                      false,
                                                                  blockLayout:
                                                                      'Paragraph',
                                                                  blockTitle:
                                                                      'Block Title ${random_data.randomString(
                                                                    3,
                                                                    7,
                                                                    true,
                                                                    false,
                                                                    false,
                                                                  )}',
                                                                  blockSubtitle:
                                                                      '',
                                                                  video: '',
                                                                  audio: '',
                                                                  text: '',
                                                                  header: '',
                                                                  subtitle: '',
                                                                  title: '',
                                                                  fontSettings:
                                                                      createFontSettingsStruct(
                                                                    fontSizeDouble:
                                                                        14.0,
                                                                    clearUnsetFields:
                                                                        false,
                                                                    create:
                                                                        true,
                                                                  ),
                                                                ),
                                                                tileBlocksRecordReference1);
                                                    logFirebaseEvent(
                                                        'AddTile_backend_call');

                                                    await _model.firstTileBlock!
                                                        .reference
                                                        .update(
                                                            createTileBlocksRecordData(
                                                      blockId: _model
                                                          .firstTileBlock
                                                          ?.reference
                                                          .id,
                                                    ));
                                                    logFirebaseEvent(
                                                        'AddTile_update_app_state');
                                                    FFAppState()
                                                            .viewTileContentId =
                                                        _model.newQuickTileNav!
                                                            .reference.id;
                                                    FFAppState().addToNavPath(
                                                        _model.newQuickTileNav!
                                                            .reference.id);
                                                    FFAppState()
                                                            .selectedBlockID =
                                                        valueOrDefault<String>(
                                                      _model.firstTileBlock
                                                          ?.blockId,
                                                      '000',
                                                    );
                                                    logFirebaseEvent(
                                                        'AddTile_update_app_state');
                                                    _model.updatePage(() {
                                                      FFAppState()
                                                          .updateTileNavStruct(
                                                        (e) => e
                                                          ..tier0Id = _model
                                                              .newQuickTileNav
                                                              ?.reference
                                                              .id
                                                          ..tier1Id = ''
                                                          ..tier2Id = ''
                                                          ..tier3Id = ''
                                                          ..tier4Id = '',
                                                      );
                                                      FFAppState()
                                                          .showEdit = valueOrDefault<
                                                              bool>(
                                                            _model.firstTileBlock
                                                                        ?.text ==
                                                                    null ||
                                                                _model.firstTileBlock
                                                                        ?.text ==
                                                                    '',
                                                            false,
                                                          ) &&
                                                          (_model.firstTileBlock
                                                                  ?.blockIndex ==
                                                              0);
                                                    });
                                                  } else {
                                                    logFirebaseEvent(
                                                        'AddTile_firestore_query');
                                                    _model.childTileCount =
                                                        await queryTilesv2RecordCount(
                                                      queryBuilder:
                                                          (tilesv2Record) =>
                                                              tilesv2Record
                                                                  .where(
                                                        'parent_id',
                                                        isEqualTo: FFAppState()
                                                            .viewTileContentId,
                                                      ),
                                                    );
                                                    logFirebaseEvent(
                                                        'AddTile_backend_call');

                                                    var tilesv2RecordReference2 =
                                                        Tilesv2Record.collection
                                                            .doc();
                                                    await tilesv2RecordReference2
                                                        .set({
                                                      ...createTilesv2RecordData(
                                                        createdTime:
                                                            getCurrentTimestamp,
                                                        updatedTime:
                                                            getCurrentTimestamp,
                                                        user:
                                                            currentUserReference,
                                                        uid: currentUserUid,
                                                        type: 'Content',
                                                        title: 'Tile-${valueOrDefault<String>(
                                                          FFAppState()
                                                              .navPath
                                                              .length
                                                              .toString(),
                                                          '0',
                                                        )}${(valueOrDefault<int>(
                                                              _model
                                                                  .childTileCount,
                                                              0,
                                                            ) + 1).toString()}',
                                                        subtitle: '',
                                                        details: '',
                                                        image: '',
                                                        thumbnail: '',
                                                        isPublished: false,
                                                        layout: '',
                                                        category: '',
                                                        isPublic: false,
                                                        isPinned: false,
                                                        isFeatured: false,
                                                        parentId:
                                                            valueOrDefault<
                                                                String>(
                                                          FFAppState()
                                                              .viewTileContentId,
                                                          '0',
                                                        ),
                                                        isContent: false,
                                                        tileId: '',
                                                        tileType: 'Content',
                                                        tileName:
                                                            'Tile-${valueOrDefault<String>(
                                                          FFAppState()
                                                              .navPath
                                                              .length
                                                              .toString(),
                                                          '0',
                                                        )}${(valueOrDefault<int>(
                                                                  _model
                                                                      .childTileCount,
                                                                  0,
                                                                ) + 1).toString()}',
                                                        tileStatus: 'Draft',
                                                        tileTier:
                                                            valueOrDefault<int>(
                                                          FFAppState()
                                                              .navPath
                                                              .length,
                                                          0,
                                                        ),
                                                        tileIndex:
                                                            valueOrDefault<int>(
                                                          _model.childTileCount,
                                                          0,
                                                        ),
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'tags': [''],
                                                          'access_users': [
                                                            FFAppState()
                                                                .tileNav
                                                                .tier0Id
                                                          ],
                                                          'access_groups': [
                                                            FFAppState()
                                                                .tileNav
                                                                .tier0Id
                                                          ],
                                                          'admin_users': [
                                                            currentUserUid
                                                          ],
                                                        },
                                                      ),
                                                    });
                                                    _model.newQuickTileContent =
                                                        Tilesv2Record
                                                            .getDocumentFromData({
                                                      ...createTilesv2RecordData(
                                                        createdTime:
                                                            getCurrentTimestamp,
                                                        updatedTime:
                                                            getCurrentTimestamp,
                                                        user:
                                                            currentUserReference,
                                                        uid: currentUserUid,
                                                        type: 'Content',
                                                        title: 'Tile-${valueOrDefault<String>(
                                                          FFAppState()
                                                              .navPath
                                                              .length
                                                              .toString(),
                                                          '0',
                                                        )}${(valueOrDefault<int>(
                                                              _model
                                                                  .childTileCount,
                                                              0,
                                                            ) + 1).toString()}',
                                                        subtitle: '',
                                                        details: '',
                                                        image: '',
                                                        thumbnail: '',
                                                        isPublished: false,
                                                        layout: '',
                                                        category: '',
                                                        isPublic: false,
                                                        isPinned: false,
                                                        isFeatured: false,
                                                        parentId:
                                                            valueOrDefault<
                                                                String>(
                                                          FFAppState()
                                                              .viewTileContentId,
                                                          '0',
                                                        ),
                                                        isContent: false,
                                                        tileId: '',
                                                        tileType: 'Content',
                                                        tileName:
                                                            'Tile-${valueOrDefault<String>(
                                                          FFAppState()
                                                              .navPath
                                                              .length
                                                              .toString(),
                                                          '0',
                                                        )}${(valueOrDefault<int>(
                                                                  _model
                                                                      .childTileCount,
                                                                  0,
                                                                ) + 1).toString()}',
                                                        tileStatus: 'Draft',
                                                        tileTier:
                                                            valueOrDefault<int>(
                                                          FFAppState()
                                                              .navPath
                                                              .length,
                                                          0,
                                                        ),
                                                        tileIndex:
                                                            valueOrDefault<int>(
                                                          _model.childTileCount,
                                                          0,
                                                        ),
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'tags': [''],
                                                          'access_users': [
                                                            FFAppState()
                                                                .tileNav
                                                                .tier0Id
                                                          ],
                                                          'access_groups': [
                                                            FFAppState()
                                                                .tileNav
                                                                .tier0Id
                                                          ],
                                                          'admin_users': [
                                                            currentUserUid
                                                          ],
                                                        },
                                                      ),
                                                    }, tilesv2RecordReference2);
                                                    logFirebaseEvent(
                                                        'AddTile_update_app_state');
                                                    setState(() {
                                                      FFAppState()
                                                              .NewTileJustCreated =
                                                          true;
                                                    });
                                                    logFirebaseEvent(
                                                        'AddTile_backend_call');

                                                    await _model
                                                        .newQuickTileContent!
                                                        .reference
                                                        .update(
                                                            createTilesv2RecordData(
                                                      tileId: _model
                                                          .newQuickTileContent
                                                          ?.reference
                                                          .id,
                                                    ));
                                                    logFirebaseEvent(
                                                        'AddTile_backend_call');

                                                    var tileBlocksRecordReference2 =
                                                        TileBlocksRecord
                                                            .collection
                                                            .doc();
                                                    await tileBlocksRecordReference2
                                                        .set(
                                                            createTileBlocksRecordData(
                                                      createdTime:
                                                          getCurrentTimestamp,
                                                      updatedTime:
                                                          getCurrentTimestamp,
                                                      user:
                                                          currentUserReference,
                                                      uid: currentUserUid,
                                                      blockType: 'Text',
                                                      blockIndex: 0,
                                                      blockName: 'Block -',
                                                      blockStatus: 'Published',
                                                      tileId: _model
                                                          .newQuickTileContent
                                                          ?.reference
                                                          .id,
                                                      image: '',
                                                      thumbnail: '',
                                                      isDefaultTheme: false,
                                                      blockLayout: '',
                                                      blockTitle:
                                                          'Block Title ${random_data.randomString(
                                                        3,
                                                        7,
                                                        true,
                                                        false,
                                                        false,
                                                      )}',
                                                      blockSubtitle: '',
                                                      video: '',
                                                      audio: '',
                                                      text: '',
                                                      header: '',
                                                      subtitle: '',
                                                      title: '',
                                                      fontSettings:
                                                          createFontSettingsStruct(
                                                        fontSizeDouble: 14.0,
                                                        clearUnsetFields: false,
                                                        create: true,
                                                      ),
                                                    ));
                                                    _model.firstTileBlock2 =
                                                        TileBlocksRecord
                                                            .getDocumentFromData(
                                                                createTileBlocksRecordData(
                                                                  createdTime:
                                                                      getCurrentTimestamp,
                                                                  updatedTime:
                                                                      getCurrentTimestamp,
                                                                  user:
                                                                      currentUserReference,
                                                                  uid:
                                                                      currentUserUid,
                                                                  blockType:
                                                                      'Text',
                                                                  blockIndex: 0,
                                                                  blockName:
                                                                      'Block -',
                                                                  blockStatus:
                                                                      'Published',
                                                                  tileId: _model
                                                                      .newQuickTileContent
                                                                      ?.reference
                                                                      .id,
                                                                  image: '',
                                                                  thumbnail: '',
                                                                  isDefaultTheme:
                                                                      false,
                                                                  blockLayout:
                                                                      '',
                                                                  blockTitle:
                                                                      'Block Title ${random_data.randomString(
                                                                    3,
                                                                    7,
                                                                    true,
                                                                    false,
                                                                    false,
                                                                  )}',
                                                                  blockSubtitle:
                                                                      '',
                                                                  video: '',
                                                                  audio: '',
                                                                  text: '',
                                                                  header: '',
                                                                  subtitle: '',
                                                                  title: '',
                                                                  fontSettings:
                                                                      createFontSettingsStruct(
                                                                    fontSizeDouble:
                                                                        14.0,
                                                                    clearUnsetFields:
                                                                        false,
                                                                    create:
                                                                        true,
                                                                  ),
                                                                ),
                                                                tileBlocksRecordReference2);
                                                    logFirebaseEvent(
                                                        'AddTile_backend_call');

                                                    await _model
                                                        .firstTileBlock2!
                                                        .reference
                                                        .update(
                                                            createTileBlocksRecordData(
                                                      blockId: _model
                                                          .firstTileBlock2
                                                          ?.reference
                                                          .id,
                                                    ));
                                                    logFirebaseEvent(
                                                        'AddTile_update_app_state');
                                                    _model.updatePage(() {
                                                      FFAppState()
                                                              .viewTileContentId =
                                                          _model
                                                              .newQuickTileContent!
                                                              .reference
                                                              .id;
                                                      FFAppState().addToNavPath(
                                                          _model
                                                              .newQuickTileContent!
                                                              .reference
                                                              .id);
                                                      FFAppState()
                                                              .selectedBlockID =
                                                          valueOrDefault<
                                                              String>(
                                                        _model.firstTileBlock2
                                                            ?.blockId,
                                                        '000',
                                                      );
                                                    });
                                                    logFirebaseEvent(
                                                        'AddTile_update_app_state');
                                                    _model.updatePage(() {
                                                      FFAppState()
                                                          .updateTileNavStruct(
                                                        (e) => e
                                                          ..tier1Id =
                                                              FFAppState()
                                                                          .navPath
                                                                          .length ==
                                                                      1
                                                                  ? _model
                                                                      .newQuickTileContent
                                                                      ?.reference
                                                                      .id
                                                                  : FFAppState()
                                                                      .tileNav
                                                                      .tier1Id
                                                          ..tier2Id =
                                                              FFAppState()
                                                                          .navPath
                                                                          .length ==
                                                                      2
                                                                  ? _model
                                                                      .newQuickTileContent
                                                                      ?.reference
                                                                      .id
                                                                  : FFAppState()
                                                                      .tileNav
                                                                      .tier2Id,
                                                      );
                                                      FFAppState().showEdit =
                                                          valueOrDefault<bool>(
                                                        valueOrDefault<bool>(
                                                              _model.firstTileBlock2
                                                                          ?.text ==
                                                                      null ||
                                                                  _model.firstTileBlock2
                                                                          ?.text ==
                                                                      '',
                                                              false,
                                                            ) &&
                                                            valueOrDefault<
                                                                bool>(
                                                              _model.firstTileBlock2
                                                                      ?.blockIndex ==
                                                                  0,
                                                              false,
                                                            ),
                                                        false,
                                                      );
                                                    });
                                                  }

                                                  setState(() {});
                                                },
                                              ).animateOnPageLoad(animationsMap[
                                                  'iconButtonOnPageLoadAnimation3']!),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 12.0, 0.0),
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: const BoxDecoration(),
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor7,
                                                borderRadius: 8.0,
                                                borderWidth: 0.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                hoverColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                hoverIconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor7,
                                                icon: Icon(
                                                  Icons.menu_open_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor7,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'HEADER_CONTAINER_COPY_menu_open_outlined');
                                                  logFirebaseEvent(
                                                      'IconButton_update_app_state');
                                                  FFAppState().callbackAction =
                                                      'AdminDrawer';
                                                  logFirebaseEvent(
                                                      'IconButton_execute_callback');
                                                  await widget.action?.call();
                                                },
                                              ).animateOnPageLoad(animationsMap[
                                                  'iconButtonOnPageLoadAnimation4']!),
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 50.0,
                    decoration: const BoxDecoration(),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
