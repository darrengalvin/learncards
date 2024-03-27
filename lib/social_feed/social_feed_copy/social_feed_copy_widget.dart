import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/header_container_widget.dart';
import '/components/nav_chips_widget.dart';
import '/components/no_access_widget.dart';
import '/components/side_menu_copy_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/search_pages/live_video/broadcast_name_input/broadcast_name_input_widget.dart';
import '/social_feed/reply_to_post/reply_to_post_widget.dart';
import '/testpage/components/post_comment_functions/post_comment_functions_widget.dart';
import '/testpage/components/post_functions/post_functions_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'social_feed_copy_model.dart';
export 'social_feed_copy_model.dart';

class SocialFeedCopyWidget extends StatefulWidget {
  const SocialFeedCopyWidget({
    super.key,
    this.tilesdoc,
    this.tilesdocref,
    this.categorydoc,
    this.categoryref,
    this.templatelist,
    this.featuredtiem,
    this.url,
    this.broadcastdocuments,
    this.broadcastcomment,
    this.broadcastdocref,
    this.users,
    this.whosonlinelive,
    this.userref,
    this.usersdoc,
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
  final BroadcastsRecord? broadcastdocuments;
  final BroadcastcommentsRecord? broadcastcomment;
  final DocumentReference? broadcastdocref;
  final UsersRecord? users;
  final UsersonlineliveRecord? whosonlinelive;
  final DocumentReference? userref;
  final UsersRecord? usersdoc;
  final String? broadcastname;
  final DocumentReference? broadcastref;
  final DocumentReference? pushref;
  final PushnotificationRecord? pushdoc;
  final String? broadcastlocation;
  final String? urlstring;

  @override
  State<SocialFeedCopyWidget> createState() => _SocialFeedCopyWidgetState();
}

class _SocialFeedCopyWidgetState extends State<SocialFeedCopyWidget>
    with TickerProviderStateMixin {
  late SocialFeedCopyModel _model;

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
    'columnOnPageLoadAnimation': AnimationInfo(
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
    'containerOnPageLoadAnimation2': AnimationInfo(
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
    'containerOnPageLoadAnimation3': AnimationInfo(
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
    'containerOnPageLoadAnimation4': AnimationInfo(
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
    'containerOnPageLoadAnimation5': AnimationInfo(
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
    'containerOnPageLoadAnimation6': AnimationInfo(
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
    'containerOnPageLoadAnimation7': AnimationInfo(
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
    _model = createModel(context, () => SocialFeedCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SocialFeedCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SOCIAL_FEED_COPY_SocialFeedCopy_ON_INIT_');
      logFirebaseEvent('SocialFeedCopy_update_app_state');
      setState(() {
        FFAppState().showmenuopen = false;
        FFAppState().drawerMenu = false;
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        title: 'SocialFeedCopy',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            body: SafeArea(
              top: true,
              child: StreamBuilder<List<CategoriesRecord>>(
                stream: queryCategoriesRecord(
                  queryBuilder: (categoriesRecord) => categoriesRecord.where(
                    'categoryname',
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
                  List<CategoriesRecord> columnCategoriesRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final columnCategoriesRecord =
                      columnCategoriesRecordList.isNotEmpty
                          ? columnCategoriesRecordList.first
                          : null;
                  return Column(
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
                                'SOCIAL_FEED_COPY_Stack_8gg5m4i0_ON_TAP');
                            logFirebaseEvent('Stack_update_app_state');
                            FFAppState().update(() {
                              FFAppState().drawerMenu = false;
                            });
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
                                                    setState(() => _model
                                                            .mouseRegionHovered1 =
                                                        true);
                                                    logFirebaseEvent(
                                                        'SOCIAL_FEED_COPY_MouseRegion_oih78tw1_ON');
                                                    logFirebaseEvent(
                                                        'MouseRegion_update_app_state');
                                                    setState(() {
                                                      FFAppState()
                                                          .showmenuopen = true;
                                                    });
                                                  }),
                                                  onExit: ((event) async {
                                                    setState(() => _model
                                                            .mouseRegionHovered1 =
                                                        false);
                                                    logFirebaseEvent(
                                                        'SOCIAL_FEED_COPY_MouseRegion_oih78tw1_ON');
                                                    logFirebaseEvent(
                                                        'MouseRegion_update_app_state');
                                                    setState(() {
                                                      FFAppState()
                                                          .showmenuopen = false;
                                                    });
                                                  }),
                                                  child: Visibility(
                                                    visible:
                                                        responsiveVisibility(
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
                                                          height:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .sideMenuCopyModel,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
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
                                                    setState(() => _model
                                                            .mouseRegionHovered2 =
                                                        true);
                                                    logFirebaseEvent(
                                                        'SOCIAL_FEED_COPY_MouseRegion_u3cxwzxp_ON');
                                                    logFirebaseEvent(
                                                        'MouseRegion_update_app_state');
                                                    setState(() {
                                                      FFAppState()
                                                          .showmenuopen = true;
                                                      FFAppState().drawerMenu =
                                                          true;
                                                    });
                                                  }),
                                                  onExit: ((event) async {
                                                    setState(() => _model
                                                            .mouseRegionHovered2 =
                                                        false);
                                                    logFirebaseEvent(
                                                        'SOCIAL_FEED_COPY_MouseRegion_u3cxwzxp_ON');
                                                    logFirebaseEvent(
                                                        'MouseRegion_update_app_state');
                                                    setState(() {
                                                      FFAppState()
                                                          .showmenuopen = false;
                                                      FFAppState().drawerMenu =
                                                          false;
                                                    });
                                                  }),
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
                                                          height:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child:
                                                                wrapWithModel(
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
                                                  'SOCIAL_FEED_COPY_Container_yiwhde9e_ON_T');
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              setState(() {
                                                FFAppState().showmenuopen =
                                                    false;
                                                FFAppState().drawerMenu = false;
                                              });
                                            },
                                            child: Container(
                                              width: 100.0,
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: SizedBox(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: Stack(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, -1.0),
                                                  children: [
                                                    SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 88.0,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
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
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              88.0,
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Container(
                                                                                width: 400.0,
                                                                                height: 100.0,
                                                                                decoration: const BoxDecoration(),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: wrapWithModel(
                                                                                      model: _model.headerContainerModel,
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
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .stretch,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
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
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.stretch,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.all(10.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        StreamBuilder<List<BroadcastsRecord>>(
                                                                                          stream: queryBroadcastsRecord(
                                                                                            queryBuilder: (broadcastsRecord) => broadcastsRecord
                                                                                                .where(
                                                                                                  'audience',
                                                                                                  arrayContains: FFAppState().selectedcategory,
                                                                                                )
                                                                                                .where(
                                                                                                  'is_live',
                                                                                                  isEqualTo: true,
                                                                                                )
                                                                                                .orderBy('time', descending: true),
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
                                                                                            List<BroadcastsRecord> listViewBroadcastsRecordList = snapshot.data!;
                                                                                            // Return an empty Container when the item does not exist.
                                                                                            if (snapshot.data!.isEmpty) {
                                                                                              return Container();
                                                                                            }
                                                                                            final listViewBroadcastsRecord = listViewBroadcastsRecordList.isNotEmpty ? listViewBroadcastsRecordList.first : null;
                                                                                            return ListView(
                                                                                              padding: EdgeInsets.zero,
                                                                                              primary: false,
                                                                                              shrinkWrap: true,
                                                                                              scrollDirection: Axis.vertical,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      logFirebaseEvent('SOCIAL_FEED_COPY_Card_cwmzcva4_ON_TAP');
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
                                                                                                        _model.nEWliveStreamIdResultre = await MuxVideoGroup.newGetLiveStreamIDCall.call(
                                                                                                          playbackIds: functions.getPlaybackIdFromUrl(listViewBroadcastsRecord.url),
                                                                                                        );
                                                                                                        if ((_model.nEWliveStreamIdResultre?.succeeded ?? true)) {
                                                                                                          logFirebaseEvent('Card_backend_call');
                                                                                                          _model.nEWpastLiveStreamResultRE = await MuxVideoGroup.newGetPastLiveStreamCall.call(
                                                                                                            streamId: MuxVideoGroup.newGetLiveStreamIDCall.streamid(
                                                                                                              (_model.nEWliveStreamIdResultre?.jsonBody ?? ''),
                                                                                                            ),
                                                                                                          );
                                                                                                          if ((_model.nEWpastLiveStreamResultRE?.succeeded ?? true)) {
                                                                                                            logFirebaseEvent('Card_navigate_to');

                                                                                                            context.pushNamed('SocialFeedCopy');
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
                                                                                                                  Container(
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
                                                                                                                                      if (listViewBroadcastsRecord?.isLive ?? true)
                                                                                                                                        InkWell(
                                                                                                                                          splashColor: Colors.transparent,
                                                                                                                                          focusColor: Colors.transparent,
                                                                                                                                          hoverColor: Colors.transparent,
                                                                                                                                          highlightColor: Colors.transparent,
                                                                                                                                          onTap: () async {
                                                                                                                                            logFirebaseEvent('SOCIAL_FEED_COPY_Icon_l4qe5bzx_ON_TAP');
                                                                                                                                            logFirebaseEvent('Icon_backend_call');

                                                                                                                                            await listViewBroadcastsRecord!.reference.update(createBroadcastsRecordData(
                                                                                                                                              isLive: false,
                                                                                                                                            ));
                                                                                                                                          },
                                                                                                                                          child: Icon(
                                                                                                                                            Icons.settings_input_antenna,
                                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                                            size: 24.0,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      if (listViewBroadcastsRecord?.isLive ?? true)
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
                                                                                                                                            logFirebaseEvent('SOCIAL_FEED_COPY_PAGE_delete_ICN_ON_TAP');
                                                                                                                                            logFirebaseEvent('IconButton_backend_call');
                                                                                                                                            await listViewBroadcastsRecord!.reference.delete();
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
                                                                                                                                              listViewBroadcastsRecord!.name,
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
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      wrapWithModel(
                                                                                        model: _model.navChipsModel,
                                                                                        updateCallback: () => setState(() {}),
                                                                                        child: const NavChipsWidget(),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                    children: [
                                                                                      Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            if ((currentUserDocument?.hasaccess.toList() ?? []).contains(FFAppState().selectedcategory))
                                                                                              AuthUserStreamWidget(
                                                                                                builder: (context) => StreamBuilder<List<SocialfeedRecord>>(
                                                                                                  stream: querySocialfeedRecord(
                                                                                                    queryBuilder: (socialfeedRecord) => socialfeedRecord.where(
                                                                                                      'socialfeedref',
                                                                                                      isEqualTo: FFAppState().socialfeedRef,
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
                                                                                                                Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                  children: [
                                                                                                                    Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      children: [
                                                                                                                        if (valueOrDefault<bool>(currentUserDocument?.isadmin, false) == true)
                                                                                                                          Padding(
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                            child: InkWell(
                                                                                                                              splashColor: Colors.transparent,
                                                                                                                              focusColor: Colors.transparent,
                                                                                                                              hoverColor: Colors.transparent,
                                                                                                                              highlightColor: Colors.transparent,
                                                                                                                              onTap: () async {
                                                                                                                                logFirebaseEvent('SOCIAL_FEED_COPY_Stack_ulipth4u_ON_TAP');
                                                                                                                                logFirebaseEvent('Stack_bottom_sheet');
                                                                                                                                await showModalBottomSheet(
                                                                                                                                  isScrollControlled: true,
                                                                                                                                  backgroundColor: Colors.transparent,
                                                                                                                                  enableDrag: false,
                                                                                                                                  context: context,
                                                                                                                                  builder: (context) {
                                                                                                                                    return WebViewAware(
                                                                                                                                      child: GestureDetector(
                                                                                                                                        onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                                                        child: Padding(
                                                                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                          child: const BroadcastNameInputWidget(),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                ).then((value) => safeSetState(() {}));
                                                                                                                              },
                                                                                                                              child: Stack(
                                                                                                                                children: [
                                                                                                                                  Column(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Padding(
                                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 5.0, 0.0),
                                                                                                                                        child: FlutterFlowIconButton(
                                                                                                                                          borderColor: Colors.transparent,
                                                                                                                                          borderRadius: 30.0,
                                                                                                                                          borderWidth: 1.0,
                                                                                                                                          buttonSize: 40.0,
                                                                                                                                          fillColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                          icon: Icon(
                                                                                                                                            Icons.photo_camera_front,
                                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                            size: 20.0,
                                                                                                                                          ),
                                                                                                                                          onPressed: () async {
                                                                                                                                            logFirebaseEvent('SOCIAL_FEED_COPY_photo_camera_front_ICN_');
                                                                                                                                            logFirebaseEvent('IconButton_bottom_sheet');
                                                                                                                                            await showModalBottomSheet(
                                                                                                                                              isScrollControlled: true,
                                                                                                                                              backgroundColor: Colors.transparent,
                                                                                                                                              enableDrag: false,
                                                                                                                                              context: context,
                                                                                                                                              builder: (context) {
                                                                                                                                                return WebViewAware(
                                                                                                                                                  child: GestureDetector(
                                                                                                                                                    onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                                                                    child: Padding(
                                                                                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                                      child: const BroadcastNameInputWidget(),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                );
                                                                                                                                              },
                                                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                                                          },
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                  Column(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Padding(
                                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 25.0, 0.0),
                                                                                                                                        child: FlutterFlowIconButton(
                                                                                                                                          borderColor: Colors.transparent,
                                                                                                                                          borderRadius: 30.0,
                                                                                                                                          borderWidth: 1.0,
                                                                                                                                          buttonSize: 40.0,
                                                                                                                                          fillColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                          icon: Icon(
                                                                                                                                            Icons.photo_camera_front,
                                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                            size: 20.0,
                                                                                                                                          ),
                                                                                                                                          onPressed: () async {
                                                                                                                                            logFirebaseEvent('SOCIAL_FEED_COPY_photo_camera_front_ICN_');
                                                                                                                                            logFirebaseEvent('IconButton_bottom_sheet');
                                                                                                                                            await showModalBottomSheet(
                                                                                                                                              isScrollControlled: true,
                                                                                                                                              backgroundColor: Colors.transparent,
                                                                                                                                              enableDrag: false,
                                                                                                                                              context: context,
                                                                                                                                              builder: (context) {
                                                                                                                                                return WebViewAware(
                                                                                                                                                  child: GestureDetector(
                                                                                                                                                    onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                                                                    child: Padding(
                                                                                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                                      child: const BroadcastNameInputWidget(),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                );
                                                                                                                                              },
                                                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                                                          },
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        Padding(
                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                          child: Stack(
                                                                                                                            children: [
                                                                                                                              Column(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  if (FFAppState().readytopost != true)
                                                                                                                                    Padding(
                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 5.0, 0.0),
                                                                                                                                      child: FlutterFlowIconButton(
                                                                                                                                        borderColor: Colors.transparent,
                                                                                                                                        borderRadius: 30.0,
                                                                                                                                        borderWidth: 1.0,
                                                                                                                                        buttonSize: 40.0,
                                                                                                                                        fillColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                        icon: Icon(
                                                                                                                                          Icons.post_add_rounded,
                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                          size: 20.0,
                                                                                                                                        ),
                                                                                                                                        onPressed: () async {
                                                                                                                                          logFirebaseEvent('SOCIAL_FEED_COPY_post_add_rounded_ICN_ON');
                                                                                                                                          logFirebaseEvent('IconButton_update_app_state');
                                                                                                                                          FFAppState().update(() {
                                                                                                                                            FFAppState().readytopost = true;
                                                                                                                                          });
                                                                                                                                        },
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                              Column(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  if (FFAppState().readytopost == true)
                                                                                                                                    Padding(
                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 25.0, 0.0),
                                                                                                                                      child: FlutterFlowIconButton(
                                                                                                                                        borderColor: Colors.transparent,
                                                                                                                                        borderRadius: 30.0,
                                                                                                                                        borderWidth: 1.0,
                                                                                                                                        buttonSize: 40.0,
                                                                                                                                        fillColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                        icon: Icon(
                                                                                                                                          Icons.keyboard_arrow_up_sharp,
                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                          size: 20.0,
                                                                                                                                        ),
                                                                                                                                        onPressed: () async {
                                                                                                                                          logFirebaseEvent('SOCIAL_FEED_COPY_keyboard_arrow_up_sharp');
                                                                                                                                          logFirebaseEvent('IconButton_update_app_state');
                                                                                                                                          FFAppState().update(() {
                                                                                                                                            FFAppState().readytopost = false;
                                                                                                                                          });
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
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            if (_model.showlivefeed == true)
                                                                                                              Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  SingleChildScrollView(
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                      children: [
                                                                                                                        Container(
                                                                                                                          width: double.infinity,
                                                                                                                          decoration: BoxDecoration(
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Stack(
                                                                                                          children: [
                                                                                                            if ((currentUserDocument?.hasaccess.toList() ?? []).contains(FFAppState().selectedcategory) != false)
                                                                                                              wrapWithModel(
                                                                                                                model: _model.noAccessModel,
                                                                                                                updateCallback: () => setState(() {}),
                                                                                                                child: const NoAccessWidget(),
                                                                                                              ),
                                                                                                            if (FFAppState().readytopost == true)
                                                                                                              Container(
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                  borderRadius: BorderRadius.circular(15.0),
                                                                                                                ),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                                                  children: [
                                                                                                                    Align(
                                                                                                                      alignment: const AlignmentDirectional(0.95, 0.0),
                                                                                                                      child: Padding(
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 0.0),
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 8.0),
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                children: [
                                                                                                                                  Container(
                                                                                                                                    width: 50.0,
                                                                                                                                    height: 50.0,
                                                                                                                                    clipBehavior: Clip.antiAlias,
                                                                                                                                    decoration: const BoxDecoration(
                                                                                                                                      shape: BoxShape.circle,
                                                                                                                                    ),
                                                                                                                                    child: Image.network(
                                                                                                                                      currentUserPhoto,
                                                                                                                                      fit: BoxFit.cover,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Expanded(
                                                                                                                                    child: Padding(
                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                                      child: TextFormField(
                                                                                                                                        controller: _model.textController,
                                                                                                                                        focusNode: _model.textFieldFocusNode,
                                                                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                                                                          '_model.textController',
                                                                                                                                          const Duration(milliseconds: 2000),
                                                                                                                                          () => setState(() {}),
                                                                                                                                        ),
                                                                                                                                        autofocus: true,
                                                                                                                                        obscureText: false,
                                                                                                                                        decoration: InputDecoration(
                                                                                                                                          hintText: 'Write something...',
                                                                                                                                          hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                fontFamily: 'Outfit',
                                                                                                                                                color: const Color(0xFF57636C),
                                                                                                                                                fontSize: 14.0,
                                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                              ),
                                                                                                                                          enabledBorder: const UnderlineInputBorder(
                                                                                                                                            borderSide: BorderSide(
                                                                                                                                              color: Color(0x00000000),
                                                                                                                                              width: 1.0,
                                                                                                                                            ),
                                                                                                                                            borderRadius: BorderRadius.only(
                                                                                                                                              topLeft: Radius.circular(4.0),
                                                                                                                                              topRight: Radius.circular(4.0),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                          focusedBorder: const UnderlineInputBorder(
                                                                                                                                            borderSide: BorderSide(
                                                                                                                                              color: Color(0x00000000),
                                                                                                                                              width: 1.0,
                                                                                                                                            ),
                                                                                                                                            borderRadius: BorderRadius.only(
                                                                                                                                              topLeft: Radius.circular(4.0),
                                                                                                                                              topRight: Radius.circular(4.0),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                          errorBorder: const UnderlineInputBorder(
                                                                                                                                            borderSide: BorderSide(
                                                                                                                                              color: Color(0x00000000),
                                                                                                                                              width: 1.0,
                                                                                                                                            ),
                                                                                                                                            borderRadius: BorderRadius.only(
                                                                                                                                              topLeft: Radius.circular(4.0),
                                                                                                                                              topRight: Radius.circular(4.0),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                          focusedErrorBorder: const UnderlineInputBorder(
                                                                                                                                            borderSide: BorderSide(
                                                                                                                                              color: Color(0x00000000),
                                                                                                                                              width: 1.0,
                                                                                                                                            ),
                                                                                                                                            borderRadius: BorderRadius.only(
                                                                                                                                              topLeft: Radius.circular(4.0),
                                                                                                                                              topRight: Radius.circular(4.0),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                          contentPadding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 8.0, 12.0),
                                                                                                                                        ),
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                              fontFamily: 'Outfit',
                                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                              fontSize: 14.0,
                                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                            ),
                                                                                                                                        maxLines: 3,
                                                                                                                                        validator: _model.textControllerValidator.asValidator(context),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            Padding(
                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 12.0),
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                                                children: [
                                                                                                                                  Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Padding(
                                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                                                        child: FlutterFlowIconButton(
                                                                                                                                          borderColor: Colors.transparent,
                                                                                                                                          borderRadius: 30.0,
                                                                                                                                          borderWidth: 1.0,
                                                                                                                                          buttonSize: 40.0,
                                                                                                                                          icon: const Icon(
                                                                                                                                            Icons.photo_outlined,
                                                                                                                                            color: Color(0xFF57636C),
                                                                                                                                            size: 20.0,
                                                                                                                                          ),
                                                                                                                                          onPressed: () async {
                                                                                                                                            logFirebaseEvent('SOCIAL_FEED_COPY_photo_outlined_ICN_ON_T');
                                                                                                                                            logFirebaseEvent('IconButton_upload_media_to_firebase');
                                                                                                                                            final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                                                                              context: context,
                                                                                                                                              allowPhoto: true,
                                                                                                                                            );
                                                                                                                                            if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                                                              setState(() => _model.isDataUploading1 = true);
                                                                                                                                              var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                                                                              var downloadUrls = <String>[];
                                                                                                                                              try {
                                                                                                                                                showUploadMessage(
                                                                                                                                                  context,
                                                                                                                                                  'Uploading file...',
                                                                                                                                                  showLoading: true,
                                                                                                                                                );
                                                                                                                                                selectedUploadedFiles = selectedMedia
                                                                                                                                                    .map((m) => FFUploadedFile(
                                                                                                                                                          name: m.storagePath.split('/').last,
                                                                                                                                                          bytes: m.bytes,
                                                                                                                                                          height: m.dimensions?.height,
                                                                                                                                                          width: m.dimensions?.width,
                                                                                                                                                          blurHash: m.blurHash,
                                                                                                                                                        ))
                                                                                                                                                    .toList();

                                                                                                                                                downloadUrls = (await Future.wait(
                                                                                                                                                  selectedMedia.map(
                                                                                                                                                    (m) async => await uploadData(m.storagePath, m.bytes),
                                                                                                                                                  ),
                                                                                                                                                ))
                                                                                                                                                    .where((u) => u != null)
                                                                                                                                                    .map((u) => u!)
                                                                                                                                                    .toList();
                                                                                                                                              } finally {
                                                                                                                                                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                                                                                                                _model.isDataUploading1 = false;
                                                                                                                                              }
                                                                                                                                              if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                                                                setState(() {
                                                                                                                                                  _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                                                                                                                                                  _model.uploadedFileUrl1 = downloadUrls.first;
                                                                                                                                                });
                                                                                                                                                showUploadMessage(context, 'Success!');
                                                                                                                                              } else {
                                                                                                                                                setState(() {});
                                                                                                                                                showUploadMessage(context, 'Failed to upload data');
                                                                                                                                                return;
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                          },
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Padding(
                                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                                                        child: FlutterFlowIconButton(
                                                                                                                                          borderColor: Colors.transparent,
                                                                                                                                          borderRadius: 30.0,
                                                                                                                                          borderWidth: 1.0,
                                                                                                                                          buttonSize: 40.0,
                                                                                                                                          icon: const Icon(
                                                                                                                                            Icons.video_call,
                                                                                                                                            color: Color(0xFF57636C),
                                                                                                                                            size: 20.0,
                                                                                                                                          ),
                                                                                                                                          onPressed: () async {
                                                                                                                                            logFirebaseEvent('SOCIAL_FEED_COPY_video_call_ICN_ON_TAP');
                                                                                                                                            logFirebaseEvent('IconButton_upload_media_to_firebase');
                                                                                                                                            final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                                                                              context: context,
                                                                                                                                              allowPhoto: true,
                                                                                                                                              allowVideo: true,
                                                                                                                                            );
                                                                                                                                            if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                                                              setState(() => _model.isDataUploading2 = true);
                                                                                                                                              var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                                                                              var downloadUrls = <String>[];
                                                                                                                                              try {
                                                                                                                                                showUploadMessage(
                                                                                                                                                  context,
                                                                                                                                                  'Uploading file...',
                                                                                                                                                  showLoading: true,
                                                                                                                                                );
                                                                                                                                                selectedUploadedFiles = selectedMedia
                                                                                                                                                    .map((m) => FFUploadedFile(
                                                                                                                                                          name: m.storagePath.split('/').last,
                                                                                                                                                          bytes: m.bytes,
                                                                                                                                                          height: m.dimensions?.height,
                                                                                                                                                          width: m.dimensions?.width,
                                                                                                                                                          blurHash: m.blurHash,
                                                                                                                                                        ))
                                                                                                                                                    .toList();

                                                                                                                                                downloadUrls = (await Future.wait(
                                                                                                                                                  selectedMedia.map(
                                                                                                                                                    (m) async => await uploadData(m.storagePath, m.bytes),
                                                                                                                                                  ),
                                                                                                                                                ))
                                                                                                                                                    .where((u) => u != null)
                                                                                                                                                    .map((u) => u!)
                                                                                                                                                    .toList();
                                                                                                                                              } finally {
                                                                                                                                                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                                                                                                                _model.isDataUploading2 = false;
                                                                                                                                              }
                                                                                                                                              if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                                                                setState(() {
                                                                                                                                                  _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                                                                                                                                                  _model.uploadedFileUrl2 = downloadUrls.first;
                                                                                                                                                });
                                                                                                                                                showUploadMessage(context, 'Success!');
                                                                                                                                              } else {
                                                                                                                                                setState(() {});
                                                                                                                                                showUploadMessage(context, 'Failed to upload data');
                                                                                                                                                return;
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                          },
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Padding(
                                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                        child: FlutterFlowIconButton(
                                                                                                                                          borderColor: Colors.transparent,
                                                                                                                                          borderRadius: 30.0,
                                                                                                                                          borderWidth: 1.0,
                                                                                                                                          buttonSize: 40.0,
                                                                                                                                          icon: Icon(
                                                                                                                                            Icons.close_outlined,
                                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                            size: 20.0,
                                                                                                                                          ),
                                                                                                                                          onPressed: () async {
                                                                                                                                            logFirebaseEvent('SOCIAL_FEED_COPY_close_outlined_ICN_ON_T');
                                                                                                                                            logFirebaseEvent('IconButton_update_app_state');
                                                                                                                                            FFAppState().update(() {
                                                                                                                                              FFAppState().readytopost = false;
                                                                                                                                            });
                                                                                                                                          },
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                  FFButtonWidget(
                                                                                                                                    onPressed: () async {
                                                                                                                                      logFirebaseEvent('SOCIAL_FEED_COPY_PAGE_POST_BTN_ON_TAP');
                                                                                                                                      logFirebaseEvent('Button_backend_call');

                                                                                                                                      var socialpostsRecordReference = SocialpostsRecord.collection.doc();
                                                                                                                                      await socialpostsRecordReference.set({
                                                                                                                                        ...createSocialpostsRecordData(
                                                                                                                                          photo: _model.uploadedFileUrl1,
                                                                                                                                          video: _model.uploadedFileUrl2,
                                                                                                                                          username: currentUserDisplayName,
                                                                                                                                          datetime: getCurrentTimestamp,
                                                                                                                                          posterphoto: currentUserPhoto,
                                                                                                                                          postuser: currentUserReference,
                                                                                                                                          postdescription: _model.textController.text,
                                                                                                                                        ),
                                                                                                                                        ...mapToFirestore(
                                                                                                                                          {
                                                                                                                                            'memberlevel': [FFAppState().selectedcategory],
                                                                                                                                          },
                                                                                                                                        ),
                                                                                                                                      });
                                                                                                                                      _model.createdpost = SocialpostsRecord.getDocumentFromData({
                                                                                                                                        ...createSocialpostsRecordData(
                                                                                                                                          photo: _model.uploadedFileUrl1,
                                                                                                                                          video: _model.uploadedFileUrl2,
                                                                                                                                          username: currentUserDisplayName,
                                                                                                                                          datetime: getCurrentTimestamp,
                                                                                                                                          posterphoto: currentUserPhoto,
                                                                                                                                          postuser: currentUserReference,
                                                                                                                                          postdescription: _model.textController.text,
                                                                                                                                        ),
                                                                                                                                        ...mapToFirestore(
                                                                                                                                          {
                                                                                                                                            'memberlevel': [FFAppState().selectedcategory],
                                                                                                                                          },
                                                                                                                                        ),
                                                                                                                                      }, socialpostsRecordReference);
                                                                                                                                      logFirebaseEvent('Button_update_app_state');
                                                                                                                                      FFAppState().update(() {
                                                                                                                                        FFAppState().readytopost = false;
                                                                                                                                      });
                                                                                                                                      logFirebaseEvent('Button_clear_uploaded_data');
                                                                                                                                      setState(() {
                                                                                                                                        _model.isDataUploading2 = false;
                                                                                                                                        _model.uploadedLocalFile2 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                                                                        _model.uploadedFileUrl2 = '';
                                                                                                                                      });

                                                                                                                                      logFirebaseEvent('Button_clear_uploaded_data');
                                                                                                                                      setState(() {
                                                                                                                                        _model.isDataUploading1 = false;
                                                                                                                                        _model.uploadedLocalFile1 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                                                                        _model.uploadedFileUrl1 = '';
                                                                                                                                      });

                                                                                                                                      setState(() {});
                                                                                                                                    },
                                                                                                                                    text: 'Post',
                                                                                                                                    options: FFButtonOptions(
                                                                                                                                      width: 70.0,
                                                                                                                                      height: 30.0,
                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                            fontFamily: 'Outfit',
                                                                                                                                            color: Colors.white,
                                                                                                                                            fontSize: 16.0,
                                                                                                                                            fontWeight: FontWeight.w500,
                                                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                          ),
                                                                                                                                      elevation: 2.0,
                                                                                                                                      borderSide: const BorderSide(
                                                                                                                                        color: Colors.transparent,
                                                                                                                                        width: 1.0,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            if ((_model.uploadedFileUrl2 != '') || (_model.uploadedFileUrl1 != ''))
                                                                                                                              Column(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                                                                children: [
                                                                                                                                  SizedBox(
                                                                                                                                    width: double.infinity,
                                                                                                                                    child: Stack(
                                                                                                                                      alignment: const AlignmentDirectional(0.050000000000000044, 0.0),
                                                                                                                                      children: [
                                                                                                                                        Padding(
                                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                                                                                                                                          child: Container(
                                                                                                                                            decoration: BoxDecoration(
                                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                            ),
                                                                                                                                            child: Column(
                                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                                              children: [
                                                                                                                                                if (_model.uploadedFileUrl1 != '')
                                                                                                                                                  Align(
                                                                                                                                                    alignment: const AlignmentDirectional(0.0, -1.67),
                                                                                                                                                    child: Padding(
                                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 30.0),
                                                                                                                                                      child: Image.network(
                                                                                                                                                        _model.uploadedFileUrl2,
                                                                                                                                                        width: double.infinity,
                                                                                                                                                        fit: BoxFit.cover,
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                if (_model.uploadedFileUrl2 != '')
                                                                                                                                                  Align(
                                                                                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                                                    child: FlutterFlowVideoPlayer(
                                                                                                                                                      path: _model.uploadedFileUrl1,
                                                                                                                                                      videoType: VideoType.network,
                                                                                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                                                      autoPlay: false,
                                                                                                                                                      looping: true,
                                                                                                                                                      showControls: true,
                                                                                                                                                      allowFullScreen: true,
                                                                                                                                                      allowPlaybackSpeedMenu: false,
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
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                          ],
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
                                                                              ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
                                                                            ),
                                                                            SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      decoration: const BoxDecoration(),
                                                                                      child: Visibility(
                                                                                        visible: (currentUserDocument?.hasaccess.toList() ?? []).contains(FFAppState().selectedcategory),
                                                                                        child: AuthUserStreamWidget(
                                                                                          builder: (context) => StreamBuilder<List<SocialpostsRecord>>(
                                                                                            stream: querySocialpostsRecord(
                                                                                              queryBuilder: (socialpostsRecord) => socialpostsRecord
                                                                                                  .where(
                                                                                                    'memberlevel',
                                                                                                    arrayContains: FFAppState().selectedcategory,
                                                                                                  )
                                                                                                  .orderBy('datetime', descending: true),
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
                                                                                              List<SocialpostsRecord> listViewSocialpostsRecordList = snapshot.data!;
                                                                                              return ListView.builder(
                                                                                                padding: EdgeInsets.zero,
                                                                                                primary: false,
                                                                                                shrinkWrap: true,
                                                                                                scrollDirection: Axis.vertical,
                                                                                                itemCount: listViewSocialpostsRecordList.length,
                                                                                                itemBuilder: (context, listViewIndex) {
                                                                                                  final listViewSocialpostsRecord = listViewSocialpostsRecordList[listViewIndex];
                                                                                                  return Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 9.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
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
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                        border: Border.all(
                                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: SingleChildScrollView(
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                                          children: [
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: const EdgeInsets.all(7.0),
                                                                                                                  child: ClipRRect(
                                                                                                                    borderRadius: BorderRadius.circular(40.0),
                                                                                                                    child: Image.network(
                                                                                                                      listViewSocialpostsRecord.posterphoto,
                                                                                                                      width: 60.0,
                                                                                                                      height: 60.0,
                                                                                                                      fit: BoxFit.cover,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  listViewSocialpostsRecord.username,
                                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                                ),
                                                                                                                Expanded(
                                                                                                                  child: Padding(
                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            dateTimeFormat('relative', listViewSocialpostsRecord.datetime!),
                                                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                  fontFamily: 'Outfit',
                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        FlutterFlowIconButton(
                                                                                                                          borderColor: Colors.transparent,
                                                                                                                          borderRadius: 30.0,
                                                                                                                          borderWidth: 1.0,
                                                                                                                          buttonSize: 40.0,
                                                                                                                          icon: const Icon(
                                                                                                                            Icons.keyboard_control_rounded,
                                                                                                                            color: Color(0xFF57636C),
                                                                                                                            size: 20.0,
                                                                                                                          ),
                                                                                                                          onPressed: () async {
                                                                                                                            logFirebaseEvent('SOCIAL_FEED_COPY_keyboard_control_rounde');
                                                                                                                            logFirebaseEvent('IconButton_bottom_sheet');
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
                                                                                                                                      child: SizedBox(
                                                                                                                                        height: 200.0,
                                                                                                                                        child: PostFunctionsWidget(
                                                                                                                                          postdetailsref: listViewSocialpostsRecord.reference,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                                          },
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(17.0, 7.0, 7.0, 7.0),
                                                                                                              child: Text(
                                                                                                                listViewSocialpostsRecord.postdescription,
                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 14.0,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                                              child: SingleChildScrollView(
                                                                                                                scrollDirection: Axis.horizontal,
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                  children: [
                                                                                                                    InkWell(
                                                                                                                      splashColor: Colors.transparent,
                                                                                                                      focusColor: Colors.transparent,
                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                      onTap: () async {
                                                                                                                        logFirebaseEvent('SOCIAL_FEED_COPY_Container_y25bn773_ON_T');
                                                                                                                      },
                                                                                                                      child: Container(
                                                                                                                        width: 40.0,
                                                                                                                        height: 40.0,
                                                                                                                        decoration: const BoxDecoration(),
                                                                                                                        child: ToggleIcon(
                                                                                                                          onPressed: () async {
                                                                                                                            final likesElement = currentUserReference;
                                                                                                                            final likesUpdate = listViewSocialpostsRecord.likes.contains(likesElement) ? FieldValue.arrayRemove([likesElement]) : FieldValue.arrayUnion([likesElement]);
                                                                                                                            await listViewSocialpostsRecord.reference.update({
                                                                                                                              ...mapToFirestore(
                                                                                                                                {
                                                                                                                                  'likes': likesUpdate,
                                                                                                                                },
                                                                                                                              ),
                                                                                                                            });
                                                                                                                          },
                                                                                                                          value: listViewSocialpostsRecord.likes.contains(currentUserReference),
                                                                                                                          onIcon: Icon(
                                                                                                                            Icons.favorite,
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            size: 25.0,
                                                                                                                          ),
                                                                                                                          offIcon: Icon(
                                                                                                                            Icons.favorite_border,
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            size: 25.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        listViewSocialpostsRecord.likes.length.toString(),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Outfit',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        'likes',
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Outfit',
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                                      child: Icon(
                                                                                                                        Icons.mode_comment_outlined,
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        size: 24.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        listViewSocialpostsRecord.numbercomments.toString(),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Outfit',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 14.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                                                                                                                      child: InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          logFirebaseEvent('SOCIAL_FEED_COPY_Row_gtu2gm7i_ON_TAP');
                                                                                                                          logFirebaseEvent('Row_bottom_sheet');
                                                                                                                          await showModalBottomSheet(
                                                                                                                            isScrollControlled: true,
                                                                                                                            backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                                            barrierColor: const Color(0x00000000),
                                                                                                                            context: context,
                                                                                                                            builder: (context) {
                                                                                                                              return WebViewAware(
                                                                                                                                child: GestureDetector(
                                                                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                                                  child: Padding(
                                                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                    child: SizedBox(
                                                                                                                                      height: 300.0,
                                                                                                                                      child: ReplyToPostWidget(
                                                                                                                                        postid: listViewSocialpostsRecord.reference,
                                                                                                                                        posterdetails: listViewSocialpostsRecord,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            },
                                                                                                                          ).then((value) => safeSetState(() {}));
                                                                                                                        },
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              'Reply',
                                                                                                                              textAlign: TextAlign.end,
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Outfit',
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    fontSize: 14.0,
                                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Padding(
                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                                              child: Icon(
                                                                                                                                Icons.reply_sharp,
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                size: 24.0,
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
                                                                                                            Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                SingleChildScrollView(
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: const EdgeInsets.all(15.0),
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
                                                                                                                                          queryBuilder: (broadcastsRecord) => broadcastsRecord
                                                                                                                                              .where(
                                                                                                                                                'audience',
                                                                                                                                                arrayContains: FFAppState().selectedcategory,
                                                                                                                                              )
                                                                                                                                              .where(
                                                                                                                                                'linkedSocialPost',
                                                                                                                                                isEqualTo: listViewSocialpostsRecord.reference,
                                                                                                                                              )
                                                                                                                                              .orderBy('time', descending: true),
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
                                                                                                                                          List<BroadcastsRecord> listViewBroadcastsRecordList = snapshot.data!;
                                                                                                                                          // Return an empty Container when the item does not exist.
                                                                                                                                          if (snapshot.data!.isEmpty) {
                                                                                                                                            return Container();
                                                                                                                                          }
                                                                                                                                          final listViewBroadcastsRecord = listViewBroadcastsRecordList.isNotEmpty ? listViewBroadcastsRecordList.first : null;
                                                                                                                                          return ListView(
                                                                                                                                            padding: EdgeInsets.zero,
                                                                                                                                            primary: false,
                                                                                                                                            shrinkWrap: true,
                                                                                                                                            scrollDirection: Axis.vertical,
                                                                                                                                            children: [
                                                                                                                                              InkWell(
                                                                                                                                                splashColor: Colors.transparent,
                                                                                                                                                focusColor: Colors.transparent,
                                                                                                                                                hoverColor: Colors.transparent,
                                                                                                                                                highlightColor: Colors.transparent,
                                                                                                                                                onTap: () async {
                                                                                                                                                  logFirebaseEvent('SOCIAL_FEED_COPY_Card_nx4kdjl4_ON_TAP');
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
                                                                                                                                                              Container(
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
                                                                                                                                                                                  if (listViewBroadcastsRecord?.isLive ?? true)
                                                                                                                                                                                    InkWell(
                                                                                                                                                                                      splashColor: Colors.transparent,
                                                                                                                                                                                      focusColor: Colors.transparent,
                                                                                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                                                                                      onTap: () async {
                                                                                                                                                                                        logFirebaseEvent('SOCIAL_FEED_COPY_Icon_x4sdh75v_ON_TAP');
                                                                                                                                                                                        logFirebaseEvent('Icon_backend_call');

                                                                                                                                                                                        await listViewBroadcastsRecord!.reference.update(createBroadcastsRecordData(
                                                                                                                                                                                          isLive: false,
                                                                                                                                                                                        ));
                                                                                                                                                                                      },
                                                                                                                                                                                      child: Icon(
                                                                                                                                                                                        Icons.settings_input_antenna,
                                                                                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                                                                                        size: 24.0,
                                                                                                                                                                                      ),
                                                                                                                                                                                    ),
                                                                                                                                                                                  if (listViewBroadcastsRecord?.isLive ?? true)
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
                                                                                                                                                                                        logFirebaseEvent('SOCIAL_FEED_COPY_PAGE_delete_ICN_ON_TAP');
                                                                                                                                                                                        logFirebaseEvent('IconButton_backend_call');
                                                                                                                                                                                        await listViewBroadcastsRecord!.reference.delete();
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
                                                                                                                                                                                          listViewBroadcastsRecord!.name,
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
                                                                                                                                                            ],
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                      ],
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
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
                                                                                                                      Padding(
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                                                        child: Container(
                                                                                                                          constraints: BoxConstraints(
                                                                                                                            maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                          ),
                                                                                                                          decoration: const BoxDecoration(),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                                if (listViewSocialpostsRecord.video != '')
                                                                                                                  Padding(
                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                    child: FlutterFlowVideoPlayer(
                                                                                                                      path: listViewSocialpostsRecord.video,
                                                                                                                      videoType: VideoType.network,
                                                                                                                      autoPlay: false,
                                                                                                                      looping: true,
                                                                                                                      showControls: true,
                                                                                                                      allowFullScreen: true,
                                                                                                                      allowPlaybackSpeedMenu: false,
                                                                                                                      lazyLoad: true,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            if (listViewSocialpostsRecord.photo != '')
                                                                                                              Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                                                child: ClipRRect(
                                                                                                                  borderRadius: BorderRadius.circular(15.0),
                                                                                                                  child: Image.network(
                                                                                                                    listViewSocialpostsRecord.photo,
                                                                                                                    width: 500.0,
                                                                                                                    height: 500.0,
                                                                                                                    fit: BoxFit.cover,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                              child: StreamBuilder<List<SocialCommentsRecord>>(
                                                                                                                stream: querySocialCommentsRecord(
                                                                                                                  parent: listViewSocialpostsRecord.reference,
                                                                                                                  queryBuilder: (socialCommentsRecord) => socialCommentsRecord
                                                                                                                      .where(
                                                                                                                        'postid',
                                                                                                                        isEqualTo: listViewSocialpostsRecord.reference,
                                                                                                                      )
                                                                                                                      .orderBy('timeposted'),
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
                                                                                                                  List<SocialCommentsRecord> listViewCommentsSocialCommentsRecordList = snapshot.data!;
                                                                                                                  return ListView.builder(
                                                                                                                    padding: EdgeInsets.zero,
                                                                                                                    primary: false,
                                                                                                                    shrinkWrap: true,
                                                                                                                    scrollDirection: Axis.vertical,
                                                                                                                    itemCount: listViewCommentsSocialCommentsRecordList.length,
                                                                                                                    itemBuilder: (context, listViewCommentsIndex) {
                                                                                                                      final listViewCommentsSocialCommentsRecord = listViewCommentsSocialCommentsRecordList[listViewCommentsIndex];
                                                                                                                      return Padding(
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                          children: [
                                                                                                                            Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                              children: [
                                                                                                                                Padding(
                                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                  child: Container(
                                                                                                                                    width: 500.0,
                                                                                                                                    constraints: BoxConstraints(
                                                                                                                                      maxWidth: MediaQuery.sizeOf(context).width * 0.85,
                                                                                                                                    ),
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                                                    ),
                                                                                                                                    child: Column(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        Padding(
                                                                                                                                          padding: const EdgeInsets.all(7.0),
                                                                                                                                          child: Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                            children: [
                                                                                                                                              Row(
                                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                                children: [
                                                                                                                                                  Column(
                                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                                    children: [
                                                                                                                                                      Padding(
                                                                                                                                                        padding: const EdgeInsets.all(5.0),
                                                                                                                                                        child: ClipRRect(
                                                                                                                                                          borderRadius: BorderRadius.circular(40.0),
                                                                                                                                                          child: Image.network(
                                                                                                                                                            listViewCommentsSocialCommentsRecord.usersphoto,
                                                                                                                                                            width: 40.0,
                                                                                                                                                            height: 40.0,
                                                                                                                                                            fit: BoxFit.cover,
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                    ],
                                                                                                                                                  ),
                                                                                                                                                  Padding(
                                                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 0.0),
                                                                                                                                                    child: Text(
                                                                                                                                                      listViewCommentsSocialCommentsRecord.username,
                                                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                            fontFamily: 'Outfit',
                                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                            fontSize: 14.0,
                                                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                                          ),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                  Padding(
                                                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 0.0),
                                                                                                                                                    child: Text(
                                                                                                                                                      dateTimeFormat('relative', getCurrentTimestamp),
                                                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                            fontFamily: 'Outfit',
                                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                            fontSize: 14.0,
                                                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                                          ),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                  FlutterFlowIconButton(
                                                                                                                                                    borderColor: Colors.transparent,
                                                                                                                                                    borderRadius: 30.0,
                                                                                                                                                    borderWidth: 1.0,
                                                                                                                                                    buttonSize: 40.0,
                                                                                                                                                    icon: const Icon(
                                                                                                                                                      Icons.keyboard_control_rounded,
                                                                                                                                                      color: Color(0xFF57636C),
                                                                                                                                                      size: 20.0,
                                                                                                                                                    ),
                                                                                                                                                    onPressed: () async {
                                                                                                                                                      logFirebaseEvent('SOCIAL_FEED_COPY_keyboard_control_rounde');
                                                                                                                                                      logFirebaseEvent('IconButton_bottom_sheet');
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
                                                                                                                                                                child: SizedBox(
                                                                                                                                                                  height: 200.0,
                                                                                                                                                                  child: PostCommentFunctionsWidget(
                                                                                                                                                                    commentposterref: listViewCommentsSocialCommentsRecord.reference,
                                                                                                                                                                  ),
                                                                                                                                                                ),
                                                                                                                                                              ),
                                                                                                                                                            ),
                                                                                                                                                          );
                                                                                                                                                        },
                                                                                                                                                      ).then((value) => safeSetState(() {}));
                                                                                                                                                    },
                                                                                                                                                  ),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                              Padding(
                                                                                                                                                padding: const EdgeInsets.all(15.0),
                                                                                                                                                child: Column(
                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                  children: [
                                                                                                                                                    Text(
                                                                                                                                                      listViewCommentsSocialCommentsRecord.comment,
                                                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                            fontFamily: 'Outfit',
                                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                            fontSize: 14.0,
                                                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                                          ),
                                                                                                                                                    ),
                                                                                                                                                  ],
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Padding(
                                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                                                                                                                                          child: InkWell(
                                                                                                                                            splashColor: Colors.transparent,
                                                                                                                                            focusColor: Colors.transparent,
                                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                                            onTap: () async {
                                                                                                                                              logFirebaseEvent('SOCIAL_FEED_COPY_Row_56mqtzyq_ON_TAP');
                                                                                                                                              logFirebaseEvent('Row_bottom_sheet');
                                                                                                                                              await showModalBottomSheet(
                                                                                                                                                isScrollControlled: true,
                                                                                                                                                backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                                barrierColor: const Color(0x00000000),
                                                                                                                                                context: context,
                                                                                                                                                builder: (context) {
                                                                                                                                                  return WebViewAware(
                                                                                                                                                    child: GestureDetector(
                                                                                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                                                                      child: Padding(
                                                                                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                                        child: SizedBox(
                                                                                                                                                          height: 300.0,
                                                                                                                                                          child: ReplyToPostWidget(
                                                                                                                                                            postid: listViewSocialpostsRecord.reference,
                                                                                                                                                            posterdetails: listViewSocialpostsRecord,
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  );
                                                                                                                                                },
                                                                                                                                              ).then((value) => safeSetState(() {}));
                                                                                                                                            },
                                                                                                                                            child: Row(
                                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                                              children: [
                                                                                                                                                Text(
                                                                                                                                                  'Reply',
                                                                                                                                                  textAlign: TextAlign.end,
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                        fontFamily: 'Outfit',
                                                                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                                        fontSize: 14.0,
                                                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                                      ),
                                                                                                                                                ),
                                                                                                                                                const Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                                                                  child: Icon(
                                                                                                                                                    Icons.reply_sharp,
                                                                                                                                                    color: Color(0xFF57636C),
                                                                                                                                                    size: 24.0,
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
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    },
                                                                                                                  );
                                                                                                                },
                                                                                                              ),
                                                                                                            ),
                                                                                                            if (listViewSocialpostsRecord.islive == true)
                                                                                                              Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                                                child: Container(
                                                                                                                  constraints: BoxConstraints(
                                                                                                                    maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                  ),
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: const SingleChildScrollView(
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [],
                                                                                                                    ),
                                                                                                                  ),
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
                                                        ],
                                                      ),
                                                    ),
                                                    if (FFAppState().drawerMenu)
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      40.0,
                                                                      80.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 300.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: Color(
                                                                  0xE6070814),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      25.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          12.0),
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
                                                                        const EdgeInsets.all(
                                                                            20.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                                              logFirebaseEvent('SOCIAL_FEED_COPY_Container_9uh94wvd_ON_T');
                                                                              logFirebaseEvent('Container_update_app_state');
                                                                              FFAppState().update(() {
                                                                                FFAppState().drawerMenu = false;
                                                                              });
                                                                            },
                                                                            child:
                                                                                Container(
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
                                                                          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation3']!),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                                              logFirebaseEvent('SOCIAL_FEED_COPY_Container_zcsgplow_ON_T');
                                                                              logFirebaseEvent('Container_update_app_state');
                                                                              FFAppState().update(() {
                                                                                FFAppState().drawerMenu = false;
                                                                              });
                                                                            },
                                                                            child:
                                                                                Container(
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
                                                                          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation4']!),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                                              logFirebaseEvent('SOCIAL_FEED_COPY_Container_qbgxzoqu_ON_T');
                                                                              logFirebaseEvent('Container_update_app_state');
                                                                              FFAppState().update(() {
                                                                                FFAppState().drawerMenu = false;
                                                                              });
                                                                            },
                                                                            child:
                                                                                Container(
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
                                                                          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation5']!),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                                              logFirebaseEvent('SOCIAL_FEED_COPY_Container_yurs3u7d_ON_T');
                                                                              logFirebaseEvent('Container_update_app_state');
                                                                              FFAppState().update(() {
                                                                                FFAppState().drawerMenu = false;
                                                                              });
                                                                            },
                                                                            child:
                                                                                Container(
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
                                                                          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation6']!),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                                              logFirebaseEvent('SOCIAL_FEED_COPY_Container_5zxnkbvn_ON_T');
                                                                              logFirebaseEvent('Container_update_app_state');
                                                                              FFAppState().update(() {
                                                                                FFAppState().drawerMenu = false;
                                                                              });
                                                                            },
                                                                            child:
                                                                                Container(
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
                                                                          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation7']!),
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
                  );
                },
              ),
            ),
          ),
        ));
  }
}
