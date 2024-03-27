import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/cloud_functions/cloud_functions.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_mux_broadcast.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:flutter/services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'start_broadcast_model.dart';
export 'start_broadcast_model.dart';

class StartBroadcastWidget extends StatefulWidget {
  const StartBroadcastWidget({
    super.key,
    this.broadcastName,
    this.broadcastref,
    this.broadcastelements,
    this.userref,
    this.usersdocs,
    this.pushref,
    this.pushdoc,
    this.broadcastLocation,
    this.categorydoc,
    this.audience,
  });

  final String? broadcastName;
  final DocumentReference? broadcastref;
  final BroadcastsRecord? broadcastelements;
  final DocumentReference? userref;
  final UsersRecord? usersdocs;
  final DocumentReference? pushref;
  final PushnotificationRecord? pushdoc;
  final String? broadcastLocation;
  final CategoriesRecord? categorydoc;
  final List<DocumentReference>? audience;

  @override
  State<StartBroadcastWidget> createState() => _StartBroadcastWidgetState();
}

class _StartBroadcastWidgetState extends State<StartBroadcastWidget> {
  late StartBroadcastModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? muxBroadcastPlaybackUrl;
  bool muxBroadcastIsLive = false;
  LiveStreamController? muxBroadcastController;
  final _initialAudioConfig = AudioConfig(
    channel: Channel.stereo,
  );
  final _initialVideoConfig = VideoConfig.withDefaultBitrate(
    resolution: Resolution.RESOLUTION_720,
  );
  bool _isSupportedPlatform = false;
  // variables for managing camera states
  bool _isCameraInitialized = false;
  bool _isFrontCamSelected = false;
  final _stopwatch = Stopwatch();
  String? _durationString;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartBroadcastModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'StartBroadcast'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('START_BROADCAST_StartBroadcast_ON_INIT_S');
      logFirebaseEvent('StartBroadcast_backend_call');

      await UsersonlineliveRecord.createDoc(widget.broadcastref!)
          .set(createUsersonlineliveRecordData(
        uid: currentUserReference,
      ));
      logFirebaseEvent('StartBroadcast_trigger_push_notification');
      triggerPushNotification(
        notificationTitle: currentUserDisplayName,
        notificationText: 'Is LIVE on the Martial Arts Business App',
        notificationImageUrl: currentUserPhoto,
        notificationSound: 'default',
        userRefs: widget.categorydoc!.userswithaccess.toList(),
        initialPageName: 'BroadcastListing',
        parameterData: {},
      );
    });

    if (Platform.isAndroid || Platform.isIOS) {
      _isSupportedPlatform = true;
      _initCamera();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _stopwatch.stop();
    _timer?.cancel();
    WakelockPlus.disable();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'StartBroadcast',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: responsiveVisibility(
              context: context,
              desktop: false,
            )
                ? AppBar(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    automaticallyImplyLeading: false,
                    leading: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'START_BROADCAST_arrow_back_rounded_ICN_O');
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamed('BroadcastListing');

                        logFirebaseEvent('IconButton_backend_call');

                        await widget.broadcastelements!.reference
                            .update(createBroadcastsRecordData(
                          isLive: false,
                        ));
                      },
                    ),
                    actions: [
                      ToggleIcon(
                        onPressed: () async {
                          setState(() => FFAppState().commentson =
                              !FFAppState().commentson);
                        },
                        value: FFAppState().commentson,
                        onIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 25.0,
                        ),
                        offIcon: Icon(
                          Icons.remove_red_eye,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 25.0,
                        ),
                      ),
                    ],
                    centerTitle: true,
                    elevation: 2.0,
                  )
                : null,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        StreamBuilder<List<CategoriesRecord>>(
                          stream: queryCategoriesRecord(
                            queryBuilder: (categoriesRecord) =>
                                categoriesRecord.where(
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
                            List<CategoriesRecord>
                                listViewCategoriesRecordList = snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final listViewCategoriesRecord =
                                listViewCategoriesRecordList.isNotEmpty
                                    ? listViewCategoriesRecordList.first
                                    : null;
                            return ListView(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              children: [
                                FlutterFlowMuxBroadcast(
                                  isCameraInitialized: _isCameraInitialized,
                                  isStreaming: muxBroadcastIsLive,
                                  durationString: _durationString,
                                  borderRadius: BorderRadius.circular(0.0),
                                  controller: muxBroadcastController,
                                  videoConfig: _initialVideoConfig,
                                  onCameraRotateButtonTap: () async {
                                    await switchCamera();
                                    setState(() => _isFrontCamSelected =
                                        !_isFrontCamSelected);
                                  },
                                  startButtonText: 'Start Stream',
                                  startButtonIcon: const Icon(
                                    Icons.play_arrow_rounded,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  startButtonOptions: FFButtonOptions(
                                    width: 160.0,
                                    height: 50.0,
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 0.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  liveIcon: const FaIcon(
                                    FontAwesomeIcons.solidCircle,
                                    color: Colors.red,
                                    size: 10.0,
                                  ),
                                  liveText: 'Live',
                                  liveTextStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.red,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  liveTextBackgroundColor: const Color(0x8A000000),
                                  durationTextStyle:
                                      FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: Colors.red,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                  durationTextBackgroundColor:
                                      const Color(0x8A000000),
                                  liveContainerBorderRadius:
                                      BorderRadius.circular(8.0),
                                  durationContainerBorderRadius:
                                      BorderRadius.circular(8.0),
                                  rotateButtonColor: const Color(0x8A000000),
                                  rotateButtonIcon: const Icon(
                                    Icons.flip_camera_android,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  stopButtonIcon: const Icon(
                                    Icons.stop_rounded,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                  stopButtonColor: Colors.red,
                                  onStartButtonTap: () async {
                                    await startStreaming();
                                    logFirebaseEvent(
                                        'START_BROADCAST_MuxBroadcast_tzhrf5k7_ON');
                                    logFirebaseEvent(
                                        'MuxBroadcast_backend_call');

                                    var socialpostsRecordReference =
                                        SocialpostsRecord.collection.doc();
                                    await socialpostsRecordReference.set({
                                      ...createSocialpostsRecordData(
                                        username: currentUserDisplayName,
                                        photo: currentUserPhoto,
                                        datetime: getCurrentTimestamp,
                                        posterphoto: currentUserPhoto,
                                        posttitle: widget.broadcastName,
                                        postdescription: '',
                                        postuser: currentUserReference,
                                        liveurl: muxBroadcastPlaybackUrl,
                                        islive: true,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'memberlevel':
                                              FFAppState().audienceforlives,
                                        },
                                      ),
                                    });
                                    _model.createdSocialPost =
                                        SocialpostsRecord.getDocumentFromData({
                                      ...createSocialpostsRecordData(
                                        username: currentUserDisplayName,
                                        photo: currentUserPhoto,
                                        datetime: getCurrentTimestamp,
                                        posterphoto: currentUserPhoto,
                                        posttitle: widget.broadcastName,
                                        postdescription: '',
                                        postuser: currentUserReference,
                                        liveurl: muxBroadcastPlaybackUrl,
                                        islive: true,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'memberlevel':
                                              FFAppState().audienceforlives,
                                        },
                                      ),
                                    }, socialpostsRecordReference);
                                    logFirebaseEvent(
                                        'MuxBroadcast_backend_call');

                                    var broadcastsRecordReference =
                                        BroadcastsRecord.collection.doc();
                                    await broadcastsRecordReference.set({
                                      ...createBroadcastsRecordData(
                                        isLive: true,
                                        name: widget.broadcastName,
                                        url: muxBroadcastPlaybackUrl,
                                        time: getCurrentTimestamp,
                                        linkedSocialPost:
                                            _model.createdSocialPost?.reference,
                                        description: '',
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'audience':
                                              FFAppState().audienceforlives,
                                        },
                                      ),
                                    });
                                    _model.createdDocLive =
                                        BroadcastsRecord.getDocumentFromData({
                                      ...createBroadcastsRecordData(
                                        isLive: true,
                                        name: widget.broadcastName,
                                        url: muxBroadcastPlaybackUrl,
                                        time: getCurrentTimestamp,
                                        linkedSocialPost:
                                            _model.createdSocialPost?.reference,
                                        description: '',
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'audience':
                                              FFAppState().audienceforlives,
                                        },
                                      ),
                                    }, broadcastsRecordReference);
                                    logFirebaseEvent(
                                        'MuxBroadcast_trigger_push_notification');
                                    triggerPushNotification(
                                      notificationTitle:
                                          '$currentUserDisplayName Is going live',
                                      notificationText: 'Come and join in',
                                      notificationImageUrl: currentUserPhoto,
                                      notificationSound: 'default',
                                      userRefs: widget
                                          .categorydoc!.pushnotificationson
                                          .toList(),
                                      initialPageName: 'LiveVideos',
                                      parameterData: {},
                                    );
                                    logFirebaseEvent(
                                        'MuxBroadcast_trigger_push_notification');
                                    triggerPushNotification(
                                      notificationTitle:
                                          '${currentUserDisplayName}Is going live',
                                      notificationText: 'Come and join in',
                                      notificationImageUrl: currentUserPhoto,
                                      notificationSound: 'default',
                                      userRefs: widget
                                          .categorydoc!.userswithaccess
                                          .toList(),
                                      initialPageName: 'LiveVideos',
                                      parameterData: {},
                                    );

                                    setState(() {});
                                  },
                                  onStopButtonTap: () async {
                                    stopStreaming();
                                    logFirebaseEvent(
                                        'START_BROADCAST_MuxBroadcast_tzhrf5k7_ON');
                                    logFirebaseEvent(
                                        'MuxBroadcast_backend_call');

                                    await _model.createdDocLive!.reference
                                        .update(createBroadcastsRecordData(
                                      isLive: false,
                                    ));
                                    logFirebaseEvent(
                                        'MuxBroadcast_navigate_back');
                                    context.pop();
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        if (FFAppState().commentson == true)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 400.0, 0.0, 0.0),
                            child: StreamBuilder<List<BroadcastcommentsRecord>>(
                              stream: queryBroadcastcommentsRecord(
                                parent: widget.broadcastref,
                                queryBuilder: (broadcastcommentsRecord) =>
                                    broadcastcommentsRecord
                                        .where(
                                          'broadcastrefid',
                                          isEqualTo: widget.broadcastref,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<BroadcastcommentsRecord>
                                    listViewBroadcastcommentsRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewBroadcastcommentsRecordList
                                      .length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewBroadcastcommentsRecord =
                                        listViewBroadcastcommentsRecordList[
                                            listViewIndex];
                                    return Visibility(
                                      visible: listViewBroadcastcommentsRecord
                                              .broadcastrefid ==
                                          widget.broadcastref,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                            child: Image.network(
                                              listViewBroadcastcommentsRecord
                                                  .userimage,
                                              width: 40.0,
                                              height: 40.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.75,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 8.0,
                                                                12.0, 8.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          listViewBroadcastcommentsRecord
                                                              .name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: const Color(
                                                                    0xFF14181B),
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Outfit'),
                                                              ),
                                                        ),
                                                        Text(
                                                          listViewBroadcastcommentsRecord
                                                              .comment,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: const Color(
                                                                    0xFF57636C),
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Outfit'),
                                                              ),
                                                        ),
                                                        if (listViewBroadcastcommentsRecord
                                                                    .imagecomment !=
                                                                '')
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        6.0),
                                                            child:
                                                                Image.network(
                                                              listViewBroadcastcommentsRecord
                                                                  .imagecomment,
                                                              width: double
                                                                  .infinity,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        if (listViewBroadcastcommentsRecord
                                                                    .videocomment !=
                                                                '')
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        6.0),
                                                            child:
                                                                FlutterFlowVideoPlayer(
                                                              path: listViewBroadcastcommentsRecord
                                                                  .videocomment,
                                                              videoType:
                                                                  VideoType
                                                                      .network,
                                                              autoPlay: false,
                                                              looping: true,
                                                              showControls:
                                                                  true,
                                                              allowFullScreen:
                                                                  true,
                                                              allowPlaybackSpeedMenu:
                                                                  false,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 4.0, 0.0, 0.0),
                                                child: Text(
                                                  'a min ago',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            const Color(0xFF57636C),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Outfit'),
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
                        Align(
                          alignment: const AlignmentDirectional(-0.05, -1.0),
                          child: Container(
                            width: 200.0,
                            height: 100.0,
                            decoration: const BoxDecoration(),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.04, -0.9),
                              child: Container(
                                width: double.infinity,
                                height: 100.0,
                                decoration: const BoxDecoration(),
                              ),
                            ),
                            const SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [],
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
          ),
        ));
  }

  _initCamera() async {
    muxBroadcastController = initLiveStreamController();
    await muxBroadcastController!.create(
      initialAudioConfig: _initialAudioConfig,
      initialVideoConfig: _initialVideoConfig,
    );
    setState(() => _isCameraInitialized = true);
  }

  LiveStreamController initLiveStreamController() {
    return LiveStreamController(
      onConnectionSuccess: () {
        print('Connection succeeded');
        setState(() => muxBroadcastIsLive = true);
        _startTimer();
      },
      onConnectionFailed: (error) {
        print('Connection failed: $error');
        if (mounted) setState(() {});
      },
      onDisconnection: () {
        print('Disconnected');
        if (mounted) setState(() => muxBroadcastIsLive = false);
        _stopTimer();
      },
    );
  }

  Future<void> switchCamera() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    try {
      liveStreamController.switchCamera();
    } catch (error) {
      if (error is PlatformException) {
        print('Failed to switch camera: ${error.message}');
      } else {
        print('Failed to switch camera: $error');
      }
    }
  }

  Future<void> startStreaming() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    const streamBaseURL = 'rtmps://global-live.mux.com:443/app/';
    const callName = 'createLiveStream';
    final response =
        await makeCloudCall(callName, {'latency_mode': 'standard'});
    final streamKey = response['stream_key'];
    final playbackId = response['playback_ids'][0]['id'];
    muxBroadcastPlaybackUrl = 'https://stream.mux.com/$playbackId.m3u8';
    if (streamKey != null) {
      try {
        WakelockPlus.enable();
        await liveStreamController.startStreaming(
          streamKey: streamKey,
          url: streamBaseURL,
        );
      } catch (error) {
        if (error is PlatformException) {
          print("Error: failed to start stream: ${error.message}");
        } else {
          print("Error: failed to start stream: $error");
        }
      }
    }
  }

  Future<void> stopStreaming() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    try {
      WakelockPlus.disable();
      liveStreamController.stopStreaming();
      if (mounted) setState(() => muxBroadcastIsLive = false);
      _stopTimer();
    } catch (error) {
      if (error is PlatformException) {
        print('Failed to stop stream: ${error.message}');
      } else {
        print('Failed to stop stream: $error');
      }
    }
  }

  void _startTimer() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _durationString = _getDurationString(_stopwatch.elapsed);
        });
      }
    });
  }

  void _stopTimer() {
    _stopwatch
      ..stop()
      ..reset();
    _durationString = _getDurationString(_stopwatch.elapsed);
    _timer?.cancel();
  }

  String _getDurationString(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
