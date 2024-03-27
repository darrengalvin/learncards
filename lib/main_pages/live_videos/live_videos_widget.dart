import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/header_container_widget.dart';
import '/components/nav_chips_widget.dart';
import '/components/side_menu_copy_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/search_pages/live_video/broadcast_name_input/broadcast_name_input_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'live_videos_model.dart';
export 'live_videos_model.dart';

class LiveVideosWidget extends StatefulWidget {
  const LiveVideosWidget({
    super.key,
    this.tilesdoc,
    this.tilesdocref,
    this.categorydoc,
    this.categoryref,
    this.templatelist,
    this.featuredtiem,
    this.url,
    this.userref,
    this.usersdocs,
    this.broadcastname,
    this.broadcastref,
    this.pushref,
    this.pushdoc,
    this.broadcastlocation,
    this.urlstring,
  });

  final TilesRecord? tilesdoc;
  final DocumentReference? tilesdocref;
  final DocumentsRecord? categorydoc;
  final DocumentReference? categoryref;
  final TemplatesRecord? templatelist;
  final FeaturedpagesRecord? featuredtiem;
  final String? url;
  final DocumentReference? userref;
  final UsersRecord? usersdocs;
  final String? broadcastname;
  final DocumentReference? broadcastref;
  final DocumentReference? pushref;
  final PushnotificationRecord? pushdoc;
  final String? broadcastlocation;
  final String? urlstring;

  @override
  State<LiveVideosWidget> createState() => _LiveVideosWidgetState();
}

class _LiveVideosWidgetState extends State<LiveVideosWidget>
    with TickerProviderStateMixin {
  late LiveVideosModel _model;

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
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 900.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 900.ms,
          duration: 600.ms,
          begin: Offset(81.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 900.ms,
          duration: 600.ms,
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
    'containerOnPageLoadAnimation3': AnimationInfo(
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
    'containerOnPageLoadAnimation4': AnimationInfo(
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
    'containerOnPageLoadAnimation5': AnimationInfo(
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
    'containerOnPageLoadAnimation6': AnimationInfo(
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
    'containerOnPageLoadAnimation7': AnimationInfo(
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
    _model = createModel(context, () => LiveVideosModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LiveVideos'});

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
        title: 'LiveVideos',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            floatingActionButton: Visibility(
              visible:
                  valueOrDefault<bool>(currentUserDocument?.isadmin, false) ==
                      true,
              child: AuthUserStreamWidget(
                builder: (context) => FloatingActionButton.extended(
                  onPressed: () async {
                    logFirebaseEvent(
                        'LIVE_VIDEOS_FloatingActionButton_2h81izk');
                    logFirebaseEvent('FloatingActionButton_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      barrierColor: Color(0x00000000),
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                          child: GestureDetector(
                            onTap: () => _model.unfocusNode.canRequestFocus
                                ? FocusScope.of(context)
                                    .requestFocus(_model.unfocusNode)
                                : FocusScope.of(context).unfocus(),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height: 650.0,
                                child: BroadcastNameInputWidget(),
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  icon: Icon(
                    Icons.live_tv_sharp,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  elevation: 12.0,
                  label: Text(
                    'GO LIVE',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              ),
            ),
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
                        logFirebaseEvent(
                            'LIVE_VIDEOS_PAGE_Stack_j90o7c8k_ON_TAP');
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
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(),
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
                                          Container(
                                            width: 1.0,
                                            height: 500.0,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0x003C89B9),
                                                  FlutterFlowTheme.of(context)
                                                      .iconBorder,
                                                  Color(0x003C89B9)
                                                ],
                                                stops: [0.0, 0.5, 1.0],
                                                begin: AlignmentDirectional(
                                                    0.0, -1.0),
                                                end: AlignmentDirectional(
                                                    0, 1.0),
                                              ),
                                            ),
                                          ),
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
                                                        width: 40.0,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
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
                                                      'LIVE_VIDEOS_MouseRegion_6dggkfta_ON_TOGG');
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
                                                      'LIVE_VIDEOS_MouseRegion_6dggkfta_ON_TOGG');
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
                                                            BoxDecoration(),
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
                                                      'LIVE_VIDEOS_MouseRegion_63hwetei_ON_TOGG');
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
                                                      'LIVE_VIDEOS_MouseRegion_63hwetei_ON_TOGG');
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
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'LIVE_VIDEOS_Container_ggg07xyz_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_update_app_state');
                                          setState(() {
                                            FFAppState().showmenuopen = false;
                                            FFAppState().drawerMenu = false;
                                          });
                                        },
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
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
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
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                wrapWithModel(
                                                                              model: _model.headerContainerModel,
                                                                              updateCallback: () => setState(() {}),
                                                                              child: HeaderContainerWidget(
                                                                                action: () async {},
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
                                                      SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'LIVE_VIDEOS_PAGE_GO_LIVE_BTN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Button_bottom_sheet');
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        barrierColor:
                                                                            Color(0x00000000),
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: Container(
                                                                                  height: 650.0,
                                                                                  child: BroadcastNameInputWidget(),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    text:
                                                                        'Go Live',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .settings_input_antenna,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          120.0,
                                                                      height:
                                                                          40.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                      elevation:
                                                                          2.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.3,
                                                                            0.1),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child: SelectionArea(
                                                                          child: Text(
                                                                        'Live Videos',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .displaySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 18.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                            ),
                                                                      )),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          40.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                24.0),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        ),
                                                                                        decoration: BoxDecoration(),
                                                                                        child: wrapWithModel(
                                                                                          model: _model.navChipsModel,
                                                                                          updateCallback: () => setState(() {}),
                                                                                          child: NavChipsWidget(),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                        child: Container(
                                                                                          constraints: BoxConstraints(
                                                                                            maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                                                                                          ),
                                                                                          decoration: BoxDecoration(),
                                                                                          child: SingleChildScrollView(
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                SingleChildScrollView(
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      StreamBuilder<List<BroadcastsRecord>>(
                                                                                                        stream: queryBroadcastsRecord(
                                                                                                          queryBuilder: (broadcastsRecord) => broadcastsRecord
                                                                                                              .where(
                                                                                                                'audience',
                                                                                                                arrayContains: FFAppState().selectedcategory,
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
                                                                                                          List<BroadcastsRecord> listViewBroadcastsRecordList = snapshot.data!;
                                                                                                          return ListView.builder(
                                                                                                            padding: EdgeInsets.zero,
                                                                                                            primary: false,
                                                                                                            shrinkWrap: true,
                                                                                                            scrollDirection: Axis.vertical,
                                                                                                            itemCount: listViewBroadcastsRecordList.length,
                                                                                                            itemBuilder: (context, listViewIndex) {
                                                                                                              final listViewBroadcastsRecord = listViewBroadcastsRecordList[listViewIndex];
                                                                                                              return InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  logFirebaseEvent('LIVE_VIDEOS_PAGE_Card_b3wsx9d4_ON_TAP');
                                                                                                                  if (listViewBroadcastsRecord.isLive) {
                                                                                                                    logFirebaseEvent('Card_navigate_to');

                                                                                                                    context.pushNamed(
                                                                                                                      'ViewBroadcast',
                                                                                                                      queryParameters: {
                                                                                                                        'url': serializeParam(
                                                                                                                          listViewBroadcastsRecord.url,
                                                                                                                          ParamType.String,
                                                                                                                        ),
                                                                                                                        'broadcastdocref': serializeParam(
                                                                                                                          listViewBroadcastsRecord.reference,
                                                                                                                          ParamType.DocumentReference,
                                                                                                                        ),
                                                                                                                      }.withoutNulls,
                                                                                                                    );
                                                                                                                  } else {
                                                                                                                    logFirebaseEvent('Card_backend_call');
                                                                                                                    _model.nEWliveStreamIdResult = await MuxVideoGroup.newGetLiveStreamIDCall.call(
                                                                                                                      playbackIds: functions.getPlaybackIdFromUrl(listViewBroadcastsRecord.url),
                                                                                                                    );
                                                                                                                    if ((_model.nEWliveStreamIdResult?.succeeded ?? true)) {
                                                                                                                      logFirebaseEvent('Card_backend_call');
                                                                                                                      _model.nEWpastLiveStreamResult = await MuxVideoGroup.newGetPastLiveStreamCall.call(
                                                                                                                        streamId: MuxVideoGroup.newGetLiveStreamIDCall.streamid(
                                                                                                                          (_model.nEWliveStreamIdResult?.jsonBody ?? ''),
                                                                                                                        ),
                                                                                                                      );
                                                                                                                      if ((_model.nEWpastLiveStreamResult?.succeeded ?? true)) {
                                                                                                                        logFirebaseEvent('Card_navigate_to');

                                                                                                                        context.pushNamed(
                                                                                                                          'ViewBroadcast',
                                                                                                                          queryParameters: {
                                                                                                                            'url': serializeParam(
                                                                                                                              functions.createUrlFromPlaybackId(MuxVideoGroup.newGetPastLiveStreamCall
                                                                                                                                  .plaYbackID(
                                                                                                                                    (_model.nEWpastLiveStreamResult?.jsonBody ?? ''),
                                                                                                                                  )
                                                                                                                                  .toString()),
                                                                                                                              ParamType.String,
                                                                                                                            ),
                                                                                                                            'broadcastdocref': serializeParam(
                                                                                                                              listViewBroadcastsRecord.reference,
                                                                                                                              ParamType.DocumentReference,
                                                                                                                            ),
                                                                                                                          }.withoutNulls,
                                                                                                                        );
                                                                                                                      }
                                                                                                                    }
                                                                                                                  }

                                                                                                                  setState(() {});
                                                                                                                },
                                                                                                                child: Card(
                                                                                                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                                  child: SingleChildScrollView(
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        SingleChildScrollView(
                                                                                                                          child: Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                            children: [
                                                                                                                              Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                                child: Container(
                                                                                                                                  height: 100.0,
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    gradient: LinearGradient(
                                                                                                                                      colors: [
                                                                                                                                        FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                                        FlutterFlowTheme.of(context).secondary
                                                                                                                                      ],
                                                                                                                                      stops: [0.0, 1.0],
                                                                                                                                      begin: AlignmentDirectional(0.0, -1.0),
                                                                                                                                      end: AlignmentDirectional(0, 1.0),
                                                                                                                                    ),
                                                                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                                                                  ),
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 1.0),
                                                                                                                                    child: Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        ClipRRect(
                                                                                                                                          borderRadius: BorderRadius.only(
                                                                                                                                            bottomLeft: Radius.circular(8.0),
                                                                                                                                            bottomRight: Radius.circular(0.0),
                                                                                                                                            topLeft: Radius.circular(8.0),
                                                                                                                                            topRight: Radius.circular(0.0),
                                                                                                                                          ),
                                                                                                                                          child: Image.asset(
                                                                                                                                            'assets/images/LIVE.jpeg',
                                                                                                                                            width: 100.0,
                                                                                                                                            height: 100.0,
                                                                                                                                            fit: BoxFit.cover,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Expanded(
                                                                                                                                          child: Padding(
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                                            child: Column(
                                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                              children: [
                                                                                                                                                Row(
                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                  children: [
                                                                                                                                                    if (listViewBroadcastsRecord.isLive)
                                                                                                                                                      InkWell(
                                                                                                                                                        splashColor: Colors.transparent,
                                                                                                                                                        focusColor: Colors.transparent,
                                                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                                                        onTap: () async {
                                                                                                                                                          logFirebaseEvent('LIVE_VIDEOS_PAGE_Icon_hdg8ixt2_ON_TAP');
                                                                                                                                                          logFirebaseEvent('Icon_backend_call');

                                                                                                                                                          await listViewBroadcastsRecord.reference.update(createBroadcastsRecordData(
                                                                                                                                                            isLive: false,
                                                                                                                                                          ));
                                                                                                                                                        },
                                                                                                                                                        child: Icon(
                                                                                                                                                          Icons.settings_input_antenna,
                                                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                                                          size: 24.0,
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                    if (listViewBroadcastsRecord.isLive)
                                                                                                                                                      Padding(
                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                                        child: Text(
                                                                                                                                                          'Live Now',
                                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                    Padding(
                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
                                                                                                                                                      child: FlutterFlowIconButton(
                                                                                                                                                        borderColor: Colors.transparent,
                                                                                                                                                        borderRadius: 30.0,
                                                                                                                                                        borderWidth: 1.0,
                                                                                                                                                        buttonSize: 40.0,
                                                                                                                                                        icon: Icon(
                                                                                                                                                          Icons.delete,
                                                                                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                                          size: 20.0,
                                                                                                                                                        ),
                                                                                                                                                        onPressed: () async {
                                                                                                                                                          logFirebaseEvent('LIVE_VIDEOS_PAGE_delete_ICN_ON_TAP');
                                                                                                                                                          logFirebaseEvent('IconButton_backend_call');
                                                                                                                                                          await listViewBroadcastsRecord.reference.delete();
                                                                                                                                                        },
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  ],
                                                                                                                                                ),
                                                                                                                                                Expanded(
                                                                                                                                                  child: Row(
                                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                                    children: [
                                                                                                                                                      Expanded(
                                                                                                                                                        child: Padding(
                                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                                                          child: Text(
                                                                                                                                                            listViewBroadcastsRecord.name,
                                                                                                                                                            style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                    ],
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                                Row(
                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                  children: [
                                                                                                                                                    Padding(
                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                                                      child: Text(
                                                                                                                                                        dateTimeFormat('MMMMEEEEd', listViewBroadcastsRecord.time!),
                                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                                                ],
                                                                              ),
                                                                            ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation1']!),
                                                                          ),
                                                                          SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        width: 25.0,
                                                                                        height: 1.0,
                                                                                        decoration: BoxDecoration(
                                                                                          gradient: LinearGradient(
                                                                                            colors: [
                                                                                              Color(0x003C89B9),
                                                                                              FlutterFlowTheme.of(context).iconBorder
                                                                                            ],
                                                                                            stops: [0.0, 1.0],
                                                                                            begin: AlignmentDirectional(1.0, 0.0),
                                                                                            end: AlignmentDirectional(-1.0, 0),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ).animateOnPageLoad(
                                                                              animationsMap['columnOnPageLoadAnimation2']!),
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
                                                              .fromSTEB(
                                                                  40.0,
                                                                  80.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 300.0,
                                                        decoration:
                                                            BoxDecoration(
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
                                                                MainAxisSize
                                                                    .min,
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'LIVE_VIDEOS_Container_psq0g95r_ON_TAP');
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
                                                                          width:
                                                                              double.infinity,
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
                                                                              animationsMap['containerOnPageLoadAnimation3']!),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'LIVE_VIDEOS_Container_ak1h4vze_ON_TAP');
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
                                                                          width:
                                                                              double.infinity,
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
                                                                              animationsMap['containerOnPageLoadAnimation4']!),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'LIVE_VIDEOS_Container_u80lm183_ON_TAP');
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
                                                                          width:
                                                                              double.infinity,
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
                                                                              animationsMap['containerOnPageLoadAnimation5']!),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'LIVE_VIDEOS_Container_m1nnqqnh_ON_TAP');
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
                                                                          width:
                                                                              double.infinity,
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
                                                                              animationsMap['containerOnPageLoadAnimation6']!),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'LIVE_VIDEOS_Container_go8jiatj_ON_TAP');
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
                                                                          width:
                                                                              double.infinity,
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
                                                                              animationsMap['containerOnPageLoadAnimation7']!),
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
                                                              'containerOnPageLoadAnimation2']!),
                                                    ),
                                                  ),
                                              ],
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
