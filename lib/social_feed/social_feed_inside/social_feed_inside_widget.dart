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
import '/right_pane/social_feed_new_componant/social_feed_new_componant_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'social_feed_inside_model.dart';
export 'social_feed_inside_model.dart';

class SocialFeedInsideWidget extends StatefulWidget {
  const SocialFeedInsideWidget({
    super.key,
    this.tilesdoc,
    this.tilesdocref,
    this.categorydoc,
    this.categoryref,
    this.templatelist,
    this.featuredtiem,
    this.socialfeedref,
    this.socialfeeddoc,
  });

  final TilesRecord? tilesdoc;
  final DocumentReference? tilesdocref;
  final DocumentsRecord? categorydoc;
  final DocumentReference? categoryref;
  final TemplatesRecord? templatelist;
  final FeaturedpagesRecord? featuredtiem;
  final DocumentReference? socialfeedref;
  final SocialfeedRecord? socialfeeddoc;

  @override
  State<SocialFeedInsideWidget> createState() => _SocialFeedInsideWidgetState();
}

class _SocialFeedInsideWidgetState extends State<SocialFeedInsideWidget>
    with TickerProviderStateMixin {
  late SocialFeedInsideModel _model;

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
        VisibilityEffect(duration: 1000.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: const Offset(81.0, 0.0),
          end: const Offset(0.0, 0.0),
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
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1200.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1200.ms,
          duration: 600.ms,
          begin: const Offset(92.0, 0.0),
          end: const Offset(0.0, 0.0),
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
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 700.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 700.ms,
          duration: 600.ms,
          begin: const Offset(81.0, 0.0),
          end: const Offset(0.0, 0.0),
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
    'columnOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 900.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 900.ms,
          duration: 600.ms,
          begin: const Offset(81.0, 0.0),
          end: const Offset(0.0, 0.0),
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
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(-31.0, 0.0),
          end: const Offset(0.0, 0.0),
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
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 100.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 400.ms,
          begin: const Offset(-26.0, 0.0),
          end: const Offset(0.0, 0.0),
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
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 150.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 400.ms,
          begin: const Offset(-26.0, 0.0),
          end: const Offset(0.0, 0.0),
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
    'containerOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 400.ms,
          begin: const Offset(-26.0, 0.0),
          end: const Offset(0.0, 0.0),
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
    'containerOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 250.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 400.ms,
          begin: const Offset(-26.0, 0.0),
          end: const Offset(0.0, 0.0),
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
    'containerOnPageLoadAnimation8': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: const Offset(-26.0, 0.0),
          end: const Offset(0.0, 0.0),
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
    'containerOnPageLoadAnimation9': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(-31.0, 0.0),
          end: const Offset(0.0, 0.0),
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
    'containerOnPageLoadAnimation10': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 100.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 400.ms,
          begin: const Offset(-26.0, 0.0),
          end: const Offset(0.0, 0.0),
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
    'containerOnPageLoadAnimation11': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 150.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 400.ms,
          begin: const Offset(-26.0, 0.0),
          end: const Offset(0.0, 0.0),
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
    'containerOnPageLoadAnimation12': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 400.ms,
          begin: const Offset(-26.0, 0.0),
          end: const Offset(0.0, 0.0),
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
    'containerOnPageLoadAnimation13': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 250.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 400.ms,
          begin: const Offset(-26.0, 0.0),
          end: const Offset(0.0, 0.0),
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
    'containerOnPageLoadAnimation14': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: const Offset(-26.0, 0.0),
          end: const Offset(0.0, 0.0),
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
    _model = createModel(context, () => SocialFeedInsideModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SocialFeedInside'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SOCIAL_FEED_INSIDE_SocialFeedInside_ON_I');
      logFirebaseEvent('SocialFeedInside_update_app_state');
      setState(() {
        FFAppState().showmenuopen = false;
        FFAppState().drawerMenu = false;
      });
    });

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
        title: 'SocialFeedInside',
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
                        logFirebaseEvent(
                            'SOCIAL_FEED_INSIDE_Stack_mr3ue0i1_ON_TAP');
                        logFirebaseEvent('Stack_update_app_state');
                        FFAppState().update(() {});
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: const BoxDecoration(),
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
                                  stops: const [0.0, 0.1, 0.4, 0.6, 0.9, 1.0],
                                  begin: const AlignmentDirectional(1.0, 0.0),
                                  end: const AlignmentDirectional(-1.0, 0),
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
                                              onEnter: ((event) async {
                                                setState(() =>
                                                    _model.mouseRegionHovered1 =
                                                        true);
                                                logFirebaseEvent(
                                                    'SOCIAL_FEED_INSIDE_MouseRegion_zprd98r1_');
                                                logFirebaseEvent(
                                                    'MouseRegion_update_app_state');
                                                setState(() {});
                                              }),
                                              onExit: ((event) async {
                                                setState(() =>
                                                    _model.mouseRegionHovered1 =
                                                        false);
                                              }),
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
                                                      decoration: BoxDecoration(
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
                                                            const SideMenuCopyWidget(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            MouseRegion(
                                              opaque: false,
                                              cursor: MouseCursor.defer ??
                                                  MouseCursor.defer,
                                              onEnter: ((event) async {
                                                setState(() =>
                                                    _model.mouseRegionHovered2 =
                                                        true);
                                                logFirebaseEvent(
                                                    'SOCIAL_FEED_INSIDE_MouseRegion_rb6dv10f_');
                                                logFirebaseEvent(
                                                    'MouseRegion_update_app_state');
                                                setState(() {});
                                              }),
                                              onExit: ((event) async {
                                                setState(() =>
                                                    _model.mouseRegionHovered2 =
                                                        false);
                                                logFirebaseEvent(
                                                    'SOCIAL_FEED_INSIDE_MouseRegion_rb6dv10f_');
                                                logFirebaseEvent(
                                                    'MouseRegion_update_app_state');
                                                setState(() {});
                                              }),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 230.0,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .sideMenuModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child: SideMenuWidget(
                                                          action: () async {},
                                                        ),
                                                      ),
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
                                              'SOCIAL_FEED_INSIDE_Container_c2gh6nxb_ON');
                                          logFirebaseEvent(
                                              'Container_update_app_state');
                                          setState(() {});
                                        },
                                        child: Container(
                                          width: 100.0,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: SizedBox(
                                            width: double.infinity,
                                            height: double.infinity,
                                            child: Stack(
                                              alignment: const AlignmentDirectional(
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
                                                            const BoxDecoration(),
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
                                                                        SizedBox(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          88.0,
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                400.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: wrapWithModel(
                                                                                  model: _model.headerContainerModel1,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: HeaderContainerWidget(
                                                                                    action: () async {},
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
                                                                  const EdgeInsetsDirectional
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
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .stretch,
                                                                      children: [
                                                                        wrapWithModel(
                                                                          model:
                                                                              _model.socialFeedNewComponantModel,
                                                                          updateCallback: () =>
                                                                              setState(() {}),
                                                                          child:
                                                                              const SocialFeedNewComponantWidget(),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                    tabletLandscape:
                                                                        false,
                                                                  ))
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                                              context: context,
                                                                              phone: false,
                                                                            ))
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
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
                                                                                          boxShadow: const [
                                                                                            BoxShadow(
                                                                                              blurRadius: 15.0,
                                                                                              color: Color(0x25000000),
                                                                                              offset: Offset(0.0, 8.0),
                                                                                            )
                                                                                          ],
                                                                                          gradient: const LinearGradient(
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
                                                                                              decoration: const BoxDecoration(),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!),
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            decoration: BoxDecoration(
                                                                                              boxShadow: const [
                                                                                                BoxShadow(
                                                                                                  blurRadius: 15.0,
                                                                                                  color: Color(0x25000000),
                                                                                                  offset: Offset(0.0, 8.0),
                                                                                                )
                                                                                              ],
                                                                                              gradient: const LinearGradient(
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
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('SOCIAL_FEED_INSIDE_Container_v9vhz4dg_ON');
                                                                                                logFirebaseEvent('Container_update_app_state');
                                                                                                setState(() {});
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 100.0,
                                                                                                height: 1000.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                ),
                                                                                                child: SizedBox(
                                                                                                  width: double.infinity,
                                                                                                  height: double.infinity,
                                                                                                  child: Stack(
                                                                                                    alignment: const AlignmentDirectional(0.0, -1.0),
                                                                                                    children: [
                                                                                                      SingleChildScrollView(
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              width: double.infinity,
                                                                                                              height: 88.0,
                                                                                                              decoration: const BoxDecoration(),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        Expanded(
                                                                                                                          child: SizedBox(
                                                                                                                            width: double.infinity,
                                                                                                                            height: 88.0,
                                                                                                                            child: Stack(
                                                                                                                              children: [
                                                                                                                                Align(
                                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                                  child: wrapWithModel(
                                                                                                                                    model: _model.headerContainerModel2,
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
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Padding(
                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        FFButtonWidget(
                                                                                                                          onPressed: () async {
                                                                                                                            logFirebaseEvent('SOCIAL_FEED_INSIDE_GO_LIVE_BTN_ON_TAP');
                                                                                                                            logFirebaseEvent('Button_bottom_sheet');
                                                                                                                            await showModalBottomSheet(
                                                                                                                              isScrollControlled: true,
                                                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              barrierColor: const Color(0x00000000),
                                                                                                                              context: context,
                                                                                                                              builder: (context) {
                                                                                                                                return WebViewAware(
                                                                                                                                  child: GestureDetector(
                                                                                                                                    onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                                                    child: Padding(
                                                                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                      child: const SizedBox(
                                                                                                                                        height: 650.0,
                                                                                                                                        child: BroadcastNameInputWidget(),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                                          },
                                                                                                                          text: 'Go Live',
                                                                                                                          icon: const Icon(
                                                                                                                            Icons.settings_input_antenna,
                                                                                                                            size: 15.0,
                                                                                                                          ),
                                                                                                                          options: FFButtonOptions(
                                                                                                                            width: 120.0,
                                                                                                                            height: 40.0,
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                                                ),
                                                                                                                            elevation: 2.0,
                                                                                                                            borderSide: const BorderSide(
                                                                                                                              color: Colors.transparent,
                                                                                                                              width: 1.0,
                                                                                                                            ),
                                                                                                                            borderRadius: BorderRadius.circular(15.0),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Align(
                                                                                                                          alignment: const AlignmentDirectional(0.3, 0.1),
                                                                                                                          child: Padding(
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 8.0, 0.0),
                                                                                                                            child: SelectionArea(
                                                                                                                                child: Text(
                                                                                                                              'Live Videos',
                                                                                                                              textAlign: TextAlign.center,
                                                                                                                              style: FlutterFlowTheme.of(context).displaySmall.override(
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
                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 40.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Expanded(
                                                                                                                          flex: 2,
                                                                                                                          child: SingleChildScrollView(
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: [
                                                                                                                                Padding(
                                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                                                                                                                                  child: SingleChildScrollView(
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
                                                                                                                                              decoration: const BoxDecoration(),
                                                                                                                                              child: wrapWithModel(
                                                                                                                                                model: _model.navChipsModel,
                                                                                                                                                updateCallback: () => setState(() {}),
                                                                                                                                                child: const NavChipsWidget(),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                        Row(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                          children: [
                                                                                                                                            Padding(
                                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                                                                              child: Container(
                                                                                                                                                constraints: BoxConstraints(
                                                                                                                                                  maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                                                ),
                                                                                                                                                decoration: const BoxDecoration(),
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
                                                                                                                                                                queryBuilder: (broadcastsRecord) => broadcastsRecord.orderBy('time', descending: true),
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
                                                                                                                                                                        logFirebaseEvent('SOCIAL_FEED_INSIDE_Card_bx3b363j_ON_TAP');
                                                                                                                                                                        if (listViewBroadcastsRecord.isLive) {
                                                                                                                                                                          logFirebaseEvent('Card_update_app_state');
                                                                                                                                                                          FFAppState().update(() {});
                                                                                                                                                                        } else {
                                                                                                                                                                          logFirebaseEvent('Card_backend_call');
                                                                                                                                                                          _model.nEWliveStreamIdResult = await MuxVideoGroup.newGetLiveStreamIDCall.call(
                                                                                                                                                                            playbackIds: functions.getPlaybackIdFromUrl(listViewBroadcastsRecord.url),
                                                                                                                                                                          );
                                                                                                                                                                          logFirebaseEvent('Card_update_app_state');
                                                                                                                                                                          setState(() {});
                                                                                                                                                                          if ((_model.nEWliveStreamIdResult?.succeeded ?? true)) {
                                                                                                                                                                            logFirebaseEvent('Card_backend_call');
                                                                                                                                                                            _model.nEWpastLiveStreamResult = await MuxVideoGroup.newGetPastLiveStreamCall.call(
                                                                                                                                                                              streamId: MuxVideoGroup.newGetLiveStreamIDCall.streamid(
                                                                                                                                                                                (_model.nEWliveStreamIdResult?.jsonBody ?? ''),
                                                                                                                                                                              ),
                                                                                                                                                                            );
                                                                                                                                                                            if ((_model.nEWpastLiveStreamResult?.succeeded ?? true)) {
                                                                                                                                                                              logFirebaseEvent('Card_update_app_state');
                                                                                                                                                                              FFAppState().update(() {});
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
                                                                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                                                                                      child: Container(
                                                                                                                                                                                        height: 100.0,
                                                                                                                                                                                        decoration: BoxDecoration(
                                                                                                                                                                                          gradient: LinearGradient(
                                                                                                                                                                                            colors: [
                                                                                                                                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                                                                                              FlutterFlowTheme.of(context).secondary
                                                                                                                                                                                            ],
                                                                                                                                                                                            stops: const [0.0, 1.0],
                                                                                                                                                                                            begin: const AlignmentDirectional(0.0, -1.0),
                                                                                                                                                                                            end: const AlignmentDirectional(0, 1.0),
                                                                                                                                                                                          ),
                                                                                                                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                                                                                                                        ),
                                                                                                                                                                                        child: Padding(
                                                                                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 1.0),
                                                                                                                                                                                          child: Row(
                                                                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                                                                            children: [
                                                                                                                                                                                              ClipRRect(
                                                                                                                                                                                                borderRadius: const BorderRadius.only(
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
                                                                                                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
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
                                                                                                                                                                                                                logFirebaseEvent('SOCIAL_FEED_INSIDE_Icon_86az7f26_ON_TAP');
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
                                                                                                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                                                                                              child: Text(
                                                                                                                                                                                                                'Live Now',
                                                                                                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                                                                                              ),
                                                                                                                                                                                                            ),
                                                                                                                                                                                                          Padding(
                                                                                                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
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
                                                                                                                                                                                                                logFirebaseEvent('SOCIAL_FEED_INSIDE_delete_ICN_ON_TAP');
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
                                                                                                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
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
                                                                                                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
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
                                                                                                                                  ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation2']!),
                                                                                                                                ),
                                                                                                                                SingleChildScrollView(
                                                                                                                                  child: Column(
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
                                                                                                                                                  colors: [const Color(0x003C89B9), FlutterFlowTheme.of(context).iconBorder],
                                                                                                                                                  stops: const [0.0, 1.0],
                                                                                                                                                  begin: const AlignmentDirectional(1.0, 0.0),
                                                                                                                                                  end: const AlignmentDirectional(-1.0, 0),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation3']!),
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
                                                                                                      Align(
                                                                                                        alignment: const AlignmentDirectional(-1.0, -1.0),
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(40.0, 80.0, 0.0, 0.0),
                                                                                                          child: Container(
                                                                                                            width: 300.0,
                                                                                                            decoration: const BoxDecoration(
                                                                                                              color: Color(0xE6070814),
                                                                                                              boxShadow: [
                                                                                                                BoxShadow(
                                                                                                                  blurRadius: 25.0,
                                                                                                                  color: Color(0x33000000),
                                                                                                                  offset: Offset(0.0, 12.0),
                                                                                                                )
                                                                                                              ],
                                                                                                            ),
                                                                                                            child: Visibility(
                                                                                                              visible: currentUserEmail == '',
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Padding(
                                                                                                                    padding: const EdgeInsets.all(20.0),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                                                          child: InkWell(
                                                                                                                            splashColor: Colors.transparent,
                                                                                                                            focusColor: Colors.transparent,
                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                            onTap: () async {
                                                                                                                              logFirebaseEvent('SOCIAL_FEED_INSIDE_Container_0vn6fbfz_ON');
                                                                                                                              logFirebaseEvent('Container_update_app_state');
                                                                                                                              FFAppState().update(() {});
                                                                                                                            },
                                                                                                                            child: Container(
                                                                                                                              width: double.infinity,
                                                                                                                              height: 50.0,
                                                                                                                              decoration: const BoxDecoration(),
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
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
                                                                                                                          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation4']!),
                                                                                                                        ),
                                                                                                                        Padding(
                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                                                          child: InkWell(
                                                                                                                            splashColor: Colors.transparent,
                                                                                                                            focusColor: Colors.transparent,
                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                            onTap: () async {
                                                                                                                              logFirebaseEvent('SOCIAL_FEED_INSIDE_Container_6tojybhj_ON');
                                                                                                                              logFirebaseEvent('Container_update_app_state');
                                                                                                                              FFAppState().update(() {});
                                                                                                                            },
                                                                                                                            child: Container(
                                                                                                                              width: double.infinity,
                                                                                                                              height: 50.0,
                                                                                                                              decoration: const BoxDecoration(),
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
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
                                                                                                                          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation5']!),
                                                                                                                        ),
                                                                                                                        Padding(
                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                                                          child: InkWell(
                                                                                                                            splashColor: Colors.transparent,
                                                                                                                            focusColor: Colors.transparent,
                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                            onTap: () async {
                                                                                                                              logFirebaseEvent('SOCIAL_FEED_INSIDE_Container_rsbk6wrp_ON');
                                                                                                                              logFirebaseEvent('Container_update_app_state');
                                                                                                                              FFAppState().update(() {});
                                                                                                                            },
                                                                                                                            child: Container(
                                                                                                                              width: double.infinity,
                                                                                                                              height: 50.0,
                                                                                                                              decoration: const BoxDecoration(),
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
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
                                                                                                                          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation6']!),
                                                                                                                        ),
                                                                                                                        Padding(
                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                                                          child: InkWell(
                                                                                                                            splashColor: Colors.transparent,
                                                                                                                            focusColor: Colors.transparent,
                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                            onTap: () async {
                                                                                                                              logFirebaseEvent('SOCIAL_FEED_INSIDE_Container_hkhsckny_ON');
                                                                                                                              logFirebaseEvent('Container_update_app_state');
                                                                                                                              FFAppState().update(() {});
                                                                                                                            },
                                                                                                                            child: Container(
                                                                                                                              width: double.infinity,
                                                                                                                              height: 50.0,
                                                                                                                              decoration: const BoxDecoration(),
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
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
                                                                                                                          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation7']!),
                                                                                                                        ),
                                                                                                                        Padding(
                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                                                          child: InkWell(
                                                                                                                            splashColor: Colors.transparent,
                                                                                                                            focusColor: Colors.transparent,
                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                            onTap: () async {
                                                                                                                              logFirebaseEvent('SOCIAL_FEED_INSIDE_Container_xqdh3vjo_ON');
                                                                                                                              logFirebaseEvent('Container_update_app_state');
                                                                                                                              FFAppState().update(() {});
                                                                                                                            },
                                                                                                                            child: Container(
                                                                                                                              width: double.infinity,
                                                                                                                              height: 50.0,
                                                                                                                              decoration: const BoxDecoration(),
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
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
                                                                                                                          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation8']!),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: double.infinity,
                                                                                                                    height: 4.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).iconBorder,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation3']!),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation1']!),
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
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(40.0,
                                                                80.0, 0.0, 0.0),
                                                    child: Container(
                                                      width: 300.0,
                                                      decoration: const BoxDecoration(
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
                                                                  const EdgeInsets
                                                                      .all(
                                                                          20.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
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
                                                                            'SOCIAL_FEED_INSIDE_Container_bs70pyh3_ON');
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        FFAppState()
                                                                            .update(() {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
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
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
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
                                                                            animationsMap['containerOnPageLoadAnimation10']!),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
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
                                                                            'SOCIAL_FEED_INSIDE_Container_j5bj1rsh_ON');
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        FFAppState()
                                                                            .update(() {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
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
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
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
                                                                            animationsMap['containerOnPageLoadAnimation11']!),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
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
                                                                            'SOCIAL_FEED_INSIDE_Container_rrficwdr_ON');
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        FFAppState()
                                                                            .update(() {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
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
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
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
                                                                            animationsMap['containerOnPageLoadAnimation12']!),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
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
                                                                            'SOCIAL_FEED_INSIDE_Container_k9ozslrx_ON');
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        FFAppState()
                                                                            .update(() {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
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
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
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
                                                                            animationsMap['containerOnPageLoadAnimation13']!),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
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
                                                                            'SOCIAL_FEED_INSIDE_Container_7wwaapie_ON');
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        FFAppState()
                                                                            .update(() {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
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
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
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
                                                                            animationsMap['containerOnPageLoadAnimation14']!),
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
                                                            'containerOnPageLoadAnimation9']!),
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
