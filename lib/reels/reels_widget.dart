import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/noaccesspopup_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'reels_model.dart';
export 'reels_model.dart';

class ReelsWidget extends StatefulWidget {
  const ReelsWidget({super.key});

  @override
  State<ReelsWidget> createState() => _ReelsWidgetState();
}

class _ReelsWidgetState extends State<ReelsWidget>
    with TickerProviderStateMixin {
  late ReelsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReelsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'reels'});
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
        title: 'reels',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.05, 0.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 700.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: StreamBuilder<List<ReelsRecord>>(
                          stream: queryReelsRecord(
                            queryBuilder: (reelsRecord) => reelsRecord.where(
                              'category',
                              isEqualTo: FFAppState().selectedcategory,
                            ),
                            limit: 100,
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
                            List<ReelsRecord> pageViewReelsRecordList =
                                snapshot.data!;
                            return Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              child: PageView.builder(
                                controller: _model.pageViewController ??=
                                    PageController(
                                        initialPage: min(
                                            0,
                                            pageViewReelsRecordList.length -
                                                1)),
                                onPageChanged: (_) async {
                                  logFirebaseEvent(
                                      'REELS_PageView_pwt4xqgq_ON_WIDGET_SWIPE');
                                  logFirebaseEvent('PageView_play_sound');
                                  _model.soundPlayer ??= AudioPlayer();
                                  if (_model.soundPlayer!.playing) {
                                    await _model.soundPlayer!.stop();
                                  }
                                  _model.soundPlayer!.setVolume(1.0);
                                  _model.soundPlayer!
                                      .setUrl('')
                                      .then((_) => _model.soundPlayer!.play());
                                },
                                scrollDirection: Axis.vertical,
                                itemCount: pageViewReelsRecordList.length,
                                itemBuilder: (context, pageViewIndex) {
                                  final pageViewReelsRecord =
                                      pageViewReelsRecordList[pageViewIndex];
                                  return Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'REELS_PAGE_VideoPlayer_gsc8gluf_ON_TAP');
                                            logFirebaseEvent(
                                                'VideoPlayer_bottom_sheet');
                                            Navigator.pop(context);
                                          },
                                          child: FlutterFlowVideoPlayer(
                                            path: pageViewReelsRecord.video,
                                            videoType: VideoType.network,
                                            autoPlay: true,
                                            looping: true,
                                            showControls: true,
                                            allowFullScreen: true,
                                            allowPlaybackSpeedMenu: false,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
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
                                              Container(
                                                width: 75.0,
                                                height: 400.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.1, 1.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'REELS_PAGE_Container_tg4u5xl7_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_bottom_sheet');
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                constraints: BoxConstraints(
                                                  maxHeight: 140.0,
                                                ),
                                                decoration: BoxDecoration(),
                                                child: StreamBuilder<
                                                    List<TilesRecord>>(
                                                  stream: queryTilesRecord(
                                                    queryBuilder:
                                                        (tilesRecord) =>
                                                            tilesRecord.where(
                                                      'tileref',
                                                      isEqualTo:
                                                          pageViewReelsRecord
                                                              .linkedtile,
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
                                                    List<TilesRecord>
                                                        listViewTilesRecordList =
                                                        snapshot.data!;
                                                    // Return an empty Container when the item does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final listViewTilesRecord =
                                                        listViewTilesRecordList
                                                                .isNotEmpty
                                                            ? listViewTilesRecordList
                                                                .first
                                                            : null;
                                                    return ListView(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      12.0,
                                                                      16.0,
                                                                      12.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'REELS_PAGE_videoCard_ON_TAP');
                                                              if ((currentUserDocument
                                                                              ?.hasaccess
                                                                              ?.toList() ??
                                                                          [])
                                                                      .contains(
                                                                          pageViewReelsRecord
                                                                              .category) ==
                                                                  true) {
                                                                logFirebaseEvent(
                                                                    'videoCard_update_app_state');
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .SelectedTileRef =
                                                                      listViewTilesRecord
                                                                          ?.reference;
                                                                  FFAppState()
                                                                          .historyActive =
                                                                      false;
                                                                  FFAppState()
                                                                          .selectedTile =
                                                                      listViewTilesRecord!
                                                                          .title;
                                                                  FFAppState()
                                                                          .lasttiletouched =
                                                                      listViewTilesRecord
                                                                          ?.reference;
                                                                });
                                                                logFirebaseEvent(
                                                                    'videoCard_update_page_state');
                                                                setState(() {});
                                                                if (listViewTilesRecord!
                                                                        .children
                                                                        .length >
                                                                    0) {
                                                                  logFirebaseEvent(
                                                                      'videoCard_update_app_state');
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .childrenfound =
                                                                        true;
                                                                  });
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'videoCard_update_app_state');
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .childrenfound =
                                                                        false;
                                                                  });
                                                                }

                                                                if (listViewTilesRecord
                                                                        ?.tileref ==
                                                                    null) {
                                                                  logFirebaseEvent(
                                                                      'videoCard_backend_call');

                                                                  await listViewTilesRecord!
                                                                      .reference
                                                                      .update(
                                                                          createTilesRecordData(
                                                                    tileref:
                                                                        listViewTilesRecord
                                                                            ?.tileref,
                                                                  ));
                                                                }
                                                                if (listViewTilesRecord
                                                                        ?.tileref ==
                                                                    null) {
                                                                  logFirebaseEvent(
                                                                      'videoCard_backend_call');

                                                                  await listViewTilesRecord!
                                                                      .reference
                                                                      .update(
                                                                          createTilesRecordData(
                                                                    tileref:
                                                                        listViewTilesRecord
                                                                            ?.tileref,
                                                                  ));
                                                                }
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'videoCard_bottom_sheet');
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              NoaccesspopupWidget(),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));
                                                              }
                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 120.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4.0,
                                                                    color: Color(
                                                                        0x230E151B),
                                                                    offset:
                                                                        Offset(
                                                                            0.0,
                                                                            2.0),
                                                                  )
                                                                ],
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary
                                                                  ],
                                                                  stops: [
                                                                    0.0,
                                                                    1.0
                                                                  ],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Stack(
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(12.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(12.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        'https://images.unsplash.com/photo-1603988363607-e1e4a66962c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                                                                        width:
                                                                            120.0,
                                                                        height:
                                                                            100.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          130.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            listViewTilesRecord!.title,
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Readex Pro'),
                                                                                ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                4.0),
                                                                            child:
                                                                                Text(
                                                                              listViewTilesRecord!.summary,
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 12.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Readex Pro'),
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
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'containerOnPageLoadAnimation']!),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
