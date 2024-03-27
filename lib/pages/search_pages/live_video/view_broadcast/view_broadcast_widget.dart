import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/testpage/components/detailedcomment/detailedcomment_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'view_broadcast_model.dart';
export 'view_broadcast_model.dart';

class ViewBroadcastWidget extends StatefulWidget {
  const ViewBroadcastWidget({
    super.key,
    this.url,
    this.broadcastdocument,
    this.broadcastcomment,
    this.broadcastdocref,
    this.users,
    this.whosonlinelive,
  });

  final String? url;
  final BroadcastsRecord? broadcastdocument;
  final BroadcastcommentsRecord? broadcastcomment;
  final DocumentReference? broadcastdocref;
  final UsersRecord? users;
  final UsersonlineliveRecord? whosonlinelive;

  @override
  State<ViewBroadcastWidget> createState() => _ViewBroadcastWidgetState();
}

class _ViewBroadcastWidgetState extends State<ViewBroadcastWidget> {
  late ViewBroadcastModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewBroadcastModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ViewBroadcast'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VIEW_BROADCAST_ViewBroadcast_ON_INIT_STA');
      logFirebaseEvent('ViewBroadcast_backend_call');

      await LivecommentsRecord.collection
          .doc()
          .set(createLivecommentsRecordData(
            videoid: widget.broadcastdocument?.reference,
            user: currentUserReference,
            time: getCurrentTimestamp,
            userimage: currentUserPhoto,
            broadcastID: widget.broadcastdocument?.reference,
            comments:
                '${currentUserDisplayName} has just joined the live video',
          ));
      logFirebaseEvent('ViewBroadcast_backend_call');

      await widget.broadcastdocref!.update({
        ...mapToFirestore(
          {
            'online': FieldValue.arrayUnion([currentUserReference]),
          },
        ),
      });
    });

    _model.commentController ??= TextEditingController();
    _model.commentFocusNode ??= FocusNode();

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
        title: 'ViewBroadcast',
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
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'VIEW_BROADCAST_arrow_back_rounded_ICN_ON');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
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
                          Icons.remove_red_eye_rounded,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 25.0,
                        ),
                        offIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxHeight: 700.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -0.88),
                            child: FlutterFlowVideoPlayer(
                              path: widget.url!,
                              videoType: VideoType.network,
                              autoPlay: true,
                              looping: true,
                              showControls: true,
                              allowFullScreen: true,
                              allowPlaybackSpeedMenu: false,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (FFAppState().commentson == true)
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.1),
                                  child: Container(
                                    width: double.infinity,
                                    height: 300.0,
                                    decoration: BoxDecoration(),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          StreamBuilder<
                                              List<BroadcastcommentsRecord>>(
                                            stream:
                                                queryBroadcastcommentsRecord(
                                              parent: widget.broadcastdocref,
                                              queryBuilder:
                                                  (broadcastcommentsRecord) =>
                                                      broadcastcommentsRecord
                                                          .where(
                                                            'broadcastrefid',
                                                            isEqualTo: widget
                                                                .broadcastdocref,
                                                          )
                                                          .orderBy('time',
                                                              descending: true),
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
                                              List<BroadcastcommentsRecord>
                                                  listViewBroadcastcommentsRecordList =
                                                  snapshot.data!;
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewBroadcastcommentsRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewBroadcastcommentsRecord =
                                                      listViewBroadcastcommentsRecordList[
                                                          listViewIndex];
                                                  return Visibility(
                                                    visible:
                                                        listViewBroadcastcommentsRecord
                                                                .broadcastrefid ==
                                                            widget
                                                                .broadcastdocref,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                          child: Image.network(
                                                            listViewBroadcastcommentsRecord
                                                                .userimage,
                                                            width: 40.0,
                                                            height: 40.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        MediaQuery.sizeOf(context).width *
                                                                            0.75,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFFDBE2E7),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            8.0,
                                                                            12.0,
                                                                            8.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          listViewBroadcastcommentsRecord
                                                                              .name,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF14181B),
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          listViewBroadcastcommentsRecord
                                                                              .comment,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF57636C),
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                              ),
                                                                        ),
                                                                        if (listViewBroadcastcommentsRecord.imagecomment !=
                                                                                null &&
                                                                            listViewBroadcastcommentsRecord.imagecomment !=
                                                                                '')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                6.0,
                                                                                0.0,
                                                                                6.0),
                                                                            child:
                                                                                Image.network(
                                                                              listViewBroadcastcommentsRecord.imagecomment,
                                                                              width: double.infinity,
                                                                              height: 200.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        if (listViewBroadcastcommentsRecord.videocomment !=
                                                                                null &&
                                                                            listViewBroadcastcommentsRecord.videocomment !=
                                                                                '')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                6.0,
                                                                                0.0,
                                                                                6.0),
                                                                            child:
                                                                                FlutterFlowVideoPlayer(
                                                                              path: listViewBroadcastcommentsRecord.videocomment,
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
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'a min ago',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey('Outfit'),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
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
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.5),
                      child: Container(
                        width: double.infinity,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        13.0, 0.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.commentController,
                                      focusNode: _model.commentFocusNode,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Quick Comment',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model
                                          .commentControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  icon: Icon(
                                    Icons.insert_comment,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'VIEW_BROADCAST_insert_comment_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).white,
                                      barrierColor: Color(0x00000000),
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: DetailedcommentWidget(
                                                broadcastref:
                                                    widget.broadcastdocref,
                                                users: widget.users,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  icon: Icon(
                                    Icons.send_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'VIEW_BROADCAST_send_outlined_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_backend_call');

                                    await BroadcastcommentsRecord.createDoc(
                                            widget.broadcastdocref!)
                                        .set(createBroadcastcommentsRecordData(
                                      time: getCurrentTimestamp,
                                      comment: _model.commentController.text,
                                      uid: currentUserReference,
                                      name: currentUserDisplayName,
                                      userimage: currentUserPhoto,
                                      broadcastrefid: widget.broadcastdocref,
                                    ));
                                    logFirebaseEvent(
                                        'IconButton_clear_text_fields_pin_codes');
                                    setState(() {
                                      _model.commentController?.clear();
                                    });
                                  },
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
        ));
  }
}
