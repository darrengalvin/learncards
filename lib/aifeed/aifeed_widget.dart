import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/side_menu_copy_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'aifeed_model.dart';
export 'aifeed_model.dart';

class AifeedWidget extends StatefulWidget {
  const AifeedWidget({
    super.key,
    this.tilesdoc,
    this.tilesdocref,
    this.categorydoc,
    this.categoryref,
    this.templatelist,
    this.featuredtiem,
  });

  final TilesRecord? tilesdoc;
  final DocumentReference? tilesdocref;
  final DocumentsRecord? categorydoc;
  final DocumentReference? categoryref;
  final TemplatesRecord? templatelist;
  final FeaturedpagesRecord? featuredtiem;

  @override
  State<AifeedWidget> createState() => _AifeedWidgetState();
}

class _AifeedWidgetState extends State<AifeedWidget>
    with TickerProviderStateMixin {
  late AifeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 5000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(-10.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 700.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 700.ms,
          duration: 600.ms,
          begin: Offset(81.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 700.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1000.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: Offset(81.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1200.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1200.ms,
          duration: 600.ms,
          begin: Offset(92.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(-31.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 100.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 400.ms,
          begin: Offset(-26.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 150.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 400.ms,
          begin: Offset(-26.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 400.ms,
          begin: Offset(-26.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation8': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 250.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 400.ms,
          begin: Offset(-26.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation9': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: Offset(-26.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AifeedModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'aifeed'});
    _model.askGController ??= TextEditingController();
    _model.askGFocusNode ??= FocusNode();

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
        title: 'aifeed',
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
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('AIFEED_PAGE_Stack_q9c8daxw_ON_TAP');
                        logFirebaseEvent('Stack_update_app_state');
                        FFAppState().update(() {
                          FFAppState().drawerMenu = false;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Container(
                              width: 30.0,
                              height: 25.0,
                              decoration: BoxDecoration(),
                              child: FlutterFlowVideoPlayer(
                                path: '',
                                videoType: VideoType.network,
                                width: 800.0,
                                height: double.infinity,
                                autoPlay: true,
                                looping: true,
                                showControls: false,
                                allowFullScreen: false,
                                allowPlaybackSpeedMenu: false,
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation1']!),
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    Colors.transparent,
                                    Colors.transparent,
                                    FlutterFlowTheme.of(context).platinum,
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground
                                  ],
                                  stops: [0.0, 0.1, 0.4, 0.6, 0.9, 1.0],
                                  begin: AlignmentDirectional(1.0, 0.0),
                                  end: AlignmentDirectional(-1.0, 0),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10.0,
                                      sigmaY: 10.0,
                                    ),
                                    child: Visibility(
                                      visible: responsiveVisibility(
                                        context: context,
                                        phone: false,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              MouseRegion(
                                                opaque: false,
                                                cursor: MouseCursor.defer ??
                                                    MouseCursor.defer,
                                                child: Visibility(
                                                  visible: responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 50.0,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .sideMenuCopyModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              SideMenuCopyWidget(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                onEnter: ((event) async {
                                                  setState(() => _model
                                                          .mouseRegionHovered1 =
                                                      true);
                                                  logFirebaseEvent(
                                                      'AIFEED_MouseRegion_weiqlmk1_ON_TOGGLE_ON');
                                                  logFirebaseEvent(
                                                      'MouseRegion_update_app_state');
                                                  setState(() {
                                                    FFAppState().showmenuopen =
                                                        true;
                                                  });
                                                }),
                                                onExit: ((event) async {
                                                  setState(() => _model
                                                          .mouseRegionHovered1 =
                                                      false);
                                                  logFirebaseEvent(
                                                      'AIFEED_MouseRegion_weiqlmk1_ON_TOGGLE_OF');
                                                  logFirebaseEvent(
                                                      'MouseRegion_update_app_state');
                                                  setState(() {
                                                    FFAppState().showmenuopen =
                                                        false;
                                                  });
                                                }),
                                              ),
                                              MouseRegion(
                                                opaque: false,
                                                cursor: MouseCursor.defer ??
                                                    MouseCursor.defer,
                                                child: Visibility(
                                                  visible: FFAppState()
                                                          .showmenuopen ==
                                                      true,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 230.0,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .sideMenuModel,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                SideMenuWidget(
                                                              action:
                                                                  () async {},
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                onEnter: ((event) async {
                                                  setState(() => _model
                                                          .mouseRegionHovered2 =
                                                      true);
                                                  logFirebaseEvent(
                                                      'AIFEED_MouseRegion_3iwo6cl9_ON_TOGGLE_ON');
                                                  logFirebaseEvent(
                                                      'MouseRegion_update_app_state');
                                                  setState(() {
                                                    FFAppState().showmenuopen =
                                                        true;
                                                    FFAppState().drawerMenu =
                                                        true;
                                                  });
                                                }),
                                                onExit: ((event) async {
                                                  setState(() => _model
                                                          .mouseRegionHovered2 =
                                                      false);
                                                  logFirebaseEvent(
                                                      'AIFEED_MouseRegion_3iwo6cl9_ON_TOGGLE_OF');
                                                  logFirebaseEvent(
                                                      'MouseRegion_update_app_state');
                                                  setState(() {
                                                    FFAppState().showmenuopen =
                                                        false;
                                                    FFAppState().drawerMenu =
                                                        false;
                                                  });
                                                }),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 10.0,
                                        sigmaY: 10.0,
                                      ),
                                      child: Container(
                                        width: 100.0,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            children: [
                                              SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      height: 88.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        88.0,
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(26.0, 0.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: 50.0,
                                                                                height: 100.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Visibility(
                                                                                  visible: FFAppState().showDotMenu,
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(26.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('AIFEED_PAGE_Container_3p0aslm6_ON_TAP');
                                                                                        logFirebaseEvent('Container_update_app_state');
                                                                                        setState(() {
                                                                                          FFAppState().drawerMenu = true;
                                                                                        });
                                                                                      },
                                                                                      child: Container(
                                                                                        width: 50.0,
                                                                                        height: 88.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Icon(
                                                                                          Icons.notes,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          SelectionArea(
                                                                                              child: Text(
                                                                                            'TODAY',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontSize: 17.0,
                                                                                                  fontWeight: FontWeight.w900,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          )),
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              dateTimeFormat('MMMMEEEEd', getCurrentTimestamp),
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                    fontSize: 12.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                  ),
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.arrow_drop_down_rounded,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              400.0,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(),
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
                                                    SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        40.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .stretch,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            24.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.stretch,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                              children: [
                                                                                Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      if ((currentUserDocument?.hasaccess?.toList() ?? []).contains(FFAppState().selectedcategory))
                                                                                        AuthUserStreamWidget(
                                                                                          builder: (context) => StreamBuilder<List<SocialfeedRecord>>(
                                                                                            stream: querySocialfeedRecord(
                                                                                              queryBuilder: (socialfeedRecord) => socialfeedRecord.where(
                                                                                                'category',
                                                                                                isEqualTo: FFAppState().selectedcategory,
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
                                                                                              List<SocialfeedRecord> listViewSocialfeedRecordList = snapshot.data!;
                                                                                              // Return an empty Container when the item does not exist.
                                                                                              if (snapshot.data!.isEmpty) {
                                                                                                return Container();
                                                                                              }
                                                                                              final listViewSocialfeedRecord = listViewSocialfeedRecordList.isNotEmpty ? listViewSocialfeedRecordList.first : null;
                                                                                              return ListView(
                                                                                                padding: EdgeInsets.zero,
                                                                                                shrinkWrap: true,
                                                                                                scrollDirection: Axis.vertical,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                    children: [
                                                                                                      Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(0.1, 0.0),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                                                                                                              child: Container(
                                                                                                                width: double.infinity,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  borderRadius: BorderRadius.circular(22.0),
                                                                                                                ),
                                                                                                                child: Visibility(
                                                                                                                  visible: FFAppState().showresponse == true,
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsets.all(20.0),
                                                                                                                    child: Text(
                                                                                                                      OpenaidavinciCall.choices(
                                                                                                                        (_model.yesok?.jsonBody ?? ''),
                                                                                                                      ).toString(),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                            fontSize: 16.0,
                                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                          ),
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
                                                                                                  if (FFAppState().readytopost == true)
                                                                                                    Container(
                                                                                                      width: 100.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                ],
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation1']!),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            6.0,
                                                                            0.0,
                                                                            6.0),
                                                                        child:
                                                                            Text(
                                                                          'Recent Topics',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.stretch,
                                                                          children: [
                                                                            SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        SingleChildScrollView(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              SingleChildScrollView(
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                                  children: [
                                                                                                    SingleChildScrollView(
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                                                                                                                child: StreamBuilder<List<QuestionsRecord>>(
                                                                                                                  stream: queryQuestionsRecord(
                                                                                                                    queryBuilder: (questionsRecord) => questionsRecord
                                                                                                                        .where(
                                                                                                                          'showhide',
                                                                                                                          isEqualTo: true,
                                                                                                                        )
                                                                                                                        .orderBy('time', descending: true),
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
                                                                                                                    List<QuestionsRecord> listViewQuestionsRecordList = snapshot.data!;
                                                                                                                    return ListView.builder(
                                                                                                                      padding: EdgeInsets.zero,
                                                                                                                      primary: false,
                                                                                                                      shrinkWrap: true,
                                                                                                                      scrollDirection: Axis.vertical,
                                                                                                                      itemCount: listViewQuestionsRecordList.length,
                                                                                                                      itemBuilder: (context, listViewIndex) {
                                                                                                                        final listViewQuestionsRecord = listViewQuestionsRecordList[listViewIndex];
                                                                                                                        return Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                                                                                                                          child: Container(
                                                                                                                            width: double.infinity,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              color: Colors.white,
                                                                                                                              boxShadow: [
                                                                                                                                BoxShadow(
                                                                                                                                  blurRadius: 3.0,
                                                                                                                                  color: Color(0x33000000),
                                                                                                                                  offset: Offset(0.0, 1.0),
                                                                                                                                )
                                                                                                                              ],
                                                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                                                            ),
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsets.all(12.0),
                                                                                                                              child: Column(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                children: [
                                                                                                                                  Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                    children: [
                                                                                                                                      ClipRRect(
                                                                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                                                                        child: Image.network(
                                                                                                                                          listViewQuestionsRecord.profilepic,
                                                                                                                                          width: 80.0,
                                                                                                                                          height: 60.0,
                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Expanded(
                                                                                                                                        child: Padding(
                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                                          child: Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                            children: [
                                                                                                                                              Text(
                                                                                                                                                listViewQuestionsRecord.questions,
                                                                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                                      fontFamily: 'Outfit',
                                                                                                                                                      color: Color(0xFF101213),
                                                                                                                                                      fontSize: 18.0,
                                                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                                    child: Text(
                                                                                                                                      listViewQuestionsRecord.answer,
                                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                            fontFamily: 'Outfit',
                                                                                                                                            color: Color(0xFF57636C),
                                                                                                                                            fontSize: 14.0,
                                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                                                    child: Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        Padding(
                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                                          child: SelectionArea(
                                                                                                                                              child: Text(
                                                                                                                                            'Asked',
                                                                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                  fontFamily: 'Outfit',
                                                                                                                                                  color: Color(0xFF57636C),
                                                                                                                                                  fontSize: 12.0,
                                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                                ),
                                                                                                                                          )),
                                                                                                                                        ),
                                                                                                                                        Expanded(
                                                                                                                                          child: Padding(
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 0.0, 0.0),
                                                                                                                                            child: SelectionArea(
                                                                                                                                                child: Text(
                                                                                                                                              dateTimeFormat('relative', listViewQuestionsRecord.time!),
                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                    fontFamily: 'Outfit',
                                                                                                                                                    color: Color(0xFF101213),
                                                                                                                                                    fontSize: 12.0,
                                                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                                  ),
                                                                                                                                            )),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    );
                                                                                                                  },
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
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: double.infinity,
                                                                              height: 50.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                                                                                child: StreamBuilder<List<QuestionsRecord>>(
                                                                                  stream: queryQuestionsRecord(
                                                                                    queryBuilder: (questionsRecord) => questionsRecord
                                                                                        .where(
                                                                                          'showhide',
                                                                                          isEqualTo: true,
                                                                                        )
                                                                                        .orderBy('time', descending: true),
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
                                                                                    List<QuestionsRecord> listViewQuestionsRecordList = snapshot.data!;
                                                                                    return ListView.builder(
                                                                                      padding: EdgeInsets.zero,
                                                                                      primary: false,
                                                                                      shrinkWrap: true,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      itemCount: listViewQuestionsRecordList.length,
                                                                                      itemBuilder: (context, listViewIndex) {
                                                                                        final listViewQuestionsRecord = listViewQuestionsRecordList[listViewIndex];
                                                                                        return Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Colors.white,
                                                                                              boxShadow: [
                                                                                                BoxShadow(
                                                                                                  blurRadius: 3.0,
                                                                                                  color: Color(0x33000000),
                                                                                                  offset: Offset(0.0, 1.0),
                                                                                                )
                                                                                              ],
                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.all(12.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                                        child: Image.network(
                                                                                                          listViewQuestionsRecord.profilepic,
                                                                                                          width: 80.0,
                                                                                                          height: 60.0,
                                                                                                          fit: BoxFit.cover,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Expanded(
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                listViewQuestionsRecord.questions,
                                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                      fontFamily: 'Outfit',
                                                                                                                      color: Color(0xFF101213),
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      listViewQuestionsRecord.answer,
                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                            fontFamily: 'Outfit',
                                                                                                            color: Color(0xFF57636C),
                                                                                                            fontSize: 14.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                          child: SelectionArea(
                                                                                                              child: Text(
                                                                                                            'Asked',
                                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                  fontFamily: 'Outfit',
                                                                                                                  color: Color(0xFF57636C),
                                                                                                                  fontSize: 12.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                ),
                                                                                                          )),
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 0.0, 0.0),
                                                                                                            child: SelectionArea(
                                                                                                                child: Text(
                                                                                                              dateTimeFormat('relative', listViewQuestionsRecord.time!),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Outfit',
                                                                                                                    color: Color(0xFF101213),
                                                                                                                    fontSize: 12.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                  ),
                                                                                                            )),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
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
                                                                    ],
                                                                  ),
                                                                ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                  tablet: false,
                                                                  tabletLandscape:
                                                                      false,
                                                                ))
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (responsiveVisibility(
                                                                            context:
                                                                                context,
                                                                            phone:
                                                                                false,
                                                                          ))
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if (responsiveVisibility(
                                                                                    context: context,
                                                                                    phone: false,
                                                                                  ))
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 15.0,
                                                                                            color: Color(0x25000000),
                                                                                            offset: Offset(0.0, 8.0),
                                                                                          )
                                                                                        ],
                                                                                        gradient: LinearGradient(
                                                                                          colors: [
                                                                                            Color(0x12068DE2),
                                                                                            Color(0x00068DE2),
                                                                                            Color(0x00068DE2),
                                                                                            Color(0x12068DE2)
                                                                                          ],
                                                                                          stops: [
                                                                                            0.0,
                                                                                            0.2,
                                                                                            0.8,
                                                                                            1.0
                                                                                          ],
                                                                                          begin: AlignmentDirectional(0.0, -1.0),
                                                                                          end: AlignmentDirectional(0, 1.0),
                                                                                        ),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).iconBorder,
                                                                                        ),
                                                                                      ),
                                                                                      child: Visibility(
                                                                                        visible: responsiveVisibility(
                                                                                          context: context,
                                                                                          phone: false,
                                                                                        ),
                                                                                        child: ClipRRect(
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation3']!),
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: FlutterFlowVideoPlayer(
                                                                                      path: 'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                                                                                      videoType: VideoType.network,
                                                                                      width: double.infinity,
                                                                                      height: double.infinity,
                                                                                      autoPlay: false,
                                                                                      looping: true,
                                                                                      showControls: true,
                                                                                      allowFullScreen: true,
                                                                                      allowPlaybackSpeedMenu: false,
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: double.infinity,
                                                                                          decoration: BoxDecoration(
                                                                                            boxShadow: [
                                                                                              BoxShadow(
                                                                                                blurRadius: 15.0,
                                                                                                color: Color(0x25000000),
                                                                                                offset: Offset(0.0, 8.0),
                                                                                              )
                                                                                            ],
                                                                                            gradient: LinearGradient(
                                                                                              colors: [
                                                                                                Color(0x12068DE2),
                                                                                                Color(0x00068DE2),
                                                                                                Color(0x00068DE2),
                                                                                                Color(0x12068DE2)
                                                                                              ],
                                                                                              stops: [
                                                                                                0.0,
                                                                                                0.2,
                                                                                                0.8,
                                                                                                1.0
                                                                                              ],
                                                                                              begin: AlignmentDirectional(0.0, -1.0),
                                                                                              end: AlignmentDirectional(0, 1.0),
                                                                                            ),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).iconBorder,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation2']!),
                                                                                  ),
                                                                                  SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 500.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            boxShadow: [
                                                                                              BoxShadow(
                                                                                                blurRadius: 4.0,
                                                                                                color: Color(0x25090F13),
                                                                                                offset: Offset(0.0, 2.0),
                                                                                              )
                                                                                            ],
                                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                                          ),
                                                                                          child: Stack(
                                                                                            alignment: AlignmentDirectional(0.0, 1.0),
                                                                                            children: [
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: double.infinity,
                                                                                                    height: 130.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                      child: TextFormField(
                                                                                                        controller: _model.askGController,
                                                                                                        focusNode: _model.askGFocusNode,
                                                                                                        autofocus: true,
                                                                                                        obscureText: false,
                                                                                                        decoration: InputDecoration(
                                                                                                          hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                                          enabledBorder: OutlineInputBorder(
                                                                                                            borderSide: BorderSide(
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              width: 2.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.only(
                                                                                                              bottomLeft: Radius.circular(0.0),
                                                                                                              bottomRight: Radius.circular(0.0),
                                                                                                              topLeft: Radius.circular(22.0),
                                                                                                              topRight: Radius.circular(22.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          focusedBorder: OutlineInputBorder(
                                                                                                            borderSide: BorderSide(
                                                                                                              color: Color(0x00000000),
                                                                                                              width: 2.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.only(
                                                                                                              bottomLeft: Radius.circular(0.0),
                                                                                                              bottomRight: Radius.circular(0.0),
                                                                                                              topLeft: Radius.circular(22.0),
                                                                                                              topRight: Radius.circular(22.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          errorBorder: OutlineInputBorder(
                                                                                                            borderSide: BorderSide(
                                                                                                              color: Color(0x00000000),
                                                                                                              width: 2.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.only(
                                                                                                              bottomLeft: Radius.circular(0.0),
                                                                                                              bottomRight: Radius.circular(0.0),
                                                                                                              topLeft: Radius.circular(22.0),
                                                                                                              topRight: Radius.circular(22.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                                            borderSide: BorderSide(
                                                                                                              color: Color(0x00000000),
                                                                                                              width: 2.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.only(
                                                                                                              bottomLeft: Radius.circular(0.0),
                                                                                                              bottomRight: Radius.circular(0.0),
                                                                                                              topLeft: Radius.circular(22.0),
                                                                                                              topRight: Radius.circular(22.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          filled: true,
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                        maxLines: 5,
                                                                                                        keyboardType: TextInputType.multiline,
                                                                                                        validator: _model.askGControllerValidator.asValidator(context),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, -0.3),
                                                                                              child: FFButtonWidget(
                                                                                                onPressed: () async {
                                                                                                  logFirebaseEvent('AIFEED_PAGE_ASK_GORDON_BTN_ON_TAP');
                                                                                                  logFirebaseEvent('Button_backend_call');
                                                                                                  _model.yesok = await OpenaidavinciCall.call(
                                                                                                    prompt: _model.askGController.text,
                                                                                                  );
                                                                                                  if ((_model.yesok?.succeeded ?? true)) {
                                                                                                    logFirebaseEvent('Button_update_app_state');
                                                                                                    FFAppState().update(() {
                                                                                                      FFAppState().showresponse = true;
                                                                                                    });
                                                                                                    logFirebaseEvent('Button_backend_call');

                                                                                                    await QuestionsRecord.collection.doc().set(createQuestionsRecordData(
                                                                                                          answer: OpenaidavinciCall.choices(
                                                                                                            (_model.yesok?.jsonBody ?? ''),
                                                                                                          ).toString(),
                                                                                                          profilepic: 'https://med.gov.bz/wp-content/uploads/2020/08/dummy-profile-pic.jpg',
                                                                                                          showhide: true,
                                                                                                          time: getCurrentTimestamp,
                                                                                                          questions: _model.askGController.text,
                                                                                                        ));
                                                                                                  } else {
                                                                                                    logFirebaseEvent('Button_alert_dialog');
                                                                                                    await showDialog(
                                                                                                      context: context,
                                                                                                      builder: (alertDialogContext) {
                                                                                                        return WebViewAware(
                                                                                                          child: AlertDialog(
                                                                                                            title: Text('Shucks, the AI did not respond'),
                                                                                                            content: Text('Technical has been alerted'),
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
                                                                                                    logFirebaseEvent('Button_alert_dialog');
                                                                                                    await showDialog(
                                                                                                      context: context,
                                                                                                      builder: (alertDialogContext) {
                                                                                                        return WebViewAware(
                                                                                                          child: AlertDialog(
                                                                                                            title: Text((_model.yesok?.statusCode ?? 200).toString()),
                                                                                                            content: Text((_model.yesok?.getHeader('error') ?? '')),
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
                                                                                                text: 'Ask Gordon',
                                                                                                options: FFButtonOptions(
                                                                                                  width: 300.0,
                                                                                                  height: 40.0,
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                        color: Colors.white,
                                                                                                        fontSize: 22.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                      ),
                                                                                                  elevation: 2.0,
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Colors.transparent,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.only(
                                                                                                    bottomLeft: Radius.circular(12.0),
                                                                                                    bottomRight: Radius.circular(12.0),
                                                                                                    topLeft: Radius.circular(0.0),
                                                                                                    topRight: Radius.circular(0.0),
                                                                                                  ),
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
                                              if (FFAppState().drawerMenu)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(40.0,
                                                                80.0, 0.0, 0.0),
                                                    child: Container(
                                                      width: 300.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xE6070814),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 25.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                                0.0, 12.0),
                                                          )
                                                        ],
                                                      ),
                                                      child: Visibility(
                                                        visible:
                                                            currentUserEmail ==
                                                                '',
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          20.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'AIFEED_PAGE_Container_tc9luvws_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().drawerMenu =
                                                                              false;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.threesixty_rounded,
                                                                                  color: FlutterFlowTheme.of(context).iconBorder,
                                                                                  size: 20.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    'Stations',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).iconBorder,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                            animationsMap['containerOnPageLoadAnimation5']!),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'AIFEED_PAGE_Container_dksbsugm_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().drawerMenu =
                                                                              false;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.threesixty_rounded,
                                                                                  color: FlutterFlowTheme.of(context).iconBorder,
                                                                                  size: 20.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    'Car connect',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).iconBorder,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                            animationsMap['containerOnPageLoadAnimation6']!),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'AIFEED_PAGE_Container_hagi0aot_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().drawerMenu =
                                                                              false;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.threesixty_outlined,
                                                                                  color: FlutterFlowTheme.of(context).iconBorder,
                                                                                  size: 20.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    'Locker',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).iconBorder,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                            animationsMap['containerOnPageLoadAnimation7']!),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'AIFEED_PAGE_Container_t2aklh4i_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().drawerMenu =
                                                                              false;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.threesixty_rounded,
                                                                                  color: FlutterFlowTheme.of(context).iconBorder,
                                                                                  size: 20.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    'Charge reports',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).iconBorder,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                            animationsMap['containerOnPageLoadAnimation8']!),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'AIFEED_PAGE_Container_9d1gz3ug_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().drawerMenu =
                                                                              false;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.threesixty_rounded,
                                                                                  color: FlutterFlowTheme.of(context).iconBorder,
                                                                                  size: 20.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    'Warnings',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).iconBorder,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                            animationsMap['containerOnPageLoadAnimation9']!),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 4.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .iconBorder,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation4']!),
                                                  ),
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
