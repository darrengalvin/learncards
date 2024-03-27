import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/testpage/components/detailedcomment/detailedcomment_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'viewbroadcast_model.dart';
export 'viewbroadcast_model.dart';

class ViewbroadcastWidget extends StatefulWidget {
  const ViewbroadcastWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
  });

  final String? parameter1;
  final DocumentReference? parameter2;
  final UsersRecord? parameter3;

  @override
  State<ViewbroadcastWidget> createState() => _ViewbroadcastWidgetState();
}

class _ViewbroadcastWidgetState extends State<ViewbroadcastWidget> {
  late ViewbroadcastModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewbroadcastModel());

    _model.commentController ??= TextEditingController();
    _model.commentFocusNode ??= FocusNode();

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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -0.88),
                  child: FlutterFlowVideoPlayer(
                    path: widget.parameter1!,
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
                        alignment: const AlignmentDirectional(0.0, 0.1),
                        child: Container(
                          width: double.infinity,
                          height: 300.0,
                          decoration: const BoxDecoration(),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                StreamBuilder<List<BroadcastcommentsRecord>>(
                                  stream: queryBroadcastcommentsRecord(
                                    parent: widget.parameter2,
                                    queryBuilder: (broadcastcommentsRecord) =>
                                        broadcastcommentsRecord
                                            .where(
                                              'broadcastrefid',
                                              isEqualTo: widget.parameter2,
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
                                              FlutterFlowTheme.of(context)
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
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewBroadcastcommentsRecord =
                                            listViewBroadcastcommentsRecordList[
                                                listViewIndex];
                                        return Visibility(
                                          visible:
                                              listViewBroadcastcommentsRecord
                                                      .broadcastrefid ==
                                                  widget.parameter2,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
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
                                              SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.75,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0xFFDBE2E7),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      8.0,
                                                                      12.0,
                                                                      8.0),
                                                          child: Column(
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
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: const Color(
                                                                          0xFF14181B),
                                                                      fontSize:
                                                                          14.0,
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
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: const Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14.0,
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
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          6.0),
                                                                  child: Image
                                                                      .network(
                                                                    listViewBroadcastcommentsRecord
                                                                        .imagecomment,
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        200.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              if (listViewBroadcastcommentsRecord
                                                                          .videocomment !=
                                                                      '')
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
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
                                                                    autoPlay:
                                                                        false,
                                                                    looping:
                                                                        true,
                                                                    showControls:
                                                                        true,
                                                                    allowFullScreen:
                                                                        true,
                                                                    allowPlaybackSpeedMenu:
                                                                        false,
                                                                    lazyLoad:
                                                                        true,
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'a min ago',
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
            alignment: const AlignmentDirectional(0.0, 0.5),
            child: Container(
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              13.0, 0.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.commentController,
                            focusNode: _model.commentFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Quick Comment',
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
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
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.commentControllerValidator
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
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'VIEWBROADCAST_insert_comment_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: FlutterFlowTheme.of(context).white,
                            barrierColor: const Color(0x00000000),
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: DetailedcommentWidget(
                                    broadcastref: widget.parameter2,
                                    users: widget.parameter3,
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
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'VIEWBROADCAST_send_outlined_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_backend_call');

                          await BroadcastcommentsRecord.createDoc(
                                  widget.parameter2!)
                              .set(createBroadcastcommentsRecordData(
                            time: getCurrentTimestamp,
                            comment: _model.commentController.text,
                            uid: currentUserReference,
                            name: currentUserDisplayName,
                            userimage: currentUserPhoto,
                            broadcastrefid: widget.parameter2,
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
    );
  }
}
