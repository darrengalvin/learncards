import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_video_to_s_tab_bar_model.dart';
export 'edit_video_to_s_tab_bar_model.dart';

class EditVideoToSTabBarWidget extends StatefulWidget {
  const EditVideoToSTabBarWidget({
    super.key,
    this.video,
    this.videoref,
  });

  final VideosRecord? video;
  final DocumentReference? videoref;

  @override
  State<EditVideoToSTabBarWidget> createState() =>
      _EditVideoToSTabBarWidgetState();
}

class _EditVideoToSTabBarWidgetState extends State<EditVideoToSTabBarWidget>
    with TickerProviderStateMixin {
  late EditVideoToSTabBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditVideoToSTabBarModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 1,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.videotitleController ??=
        TextEditingController(text: widget.video?.title);
    _model.videotitleFocusNode ??= FocusNode();

    _model.videosummaryController ??=
        TextEditingController(text: widget.video?.videosummary);
    _model.videosummaryFocusNode ??= FocusNode();

    _model.videoURLController ??= TextEditingController();
    _model.videoURLFocusNode ??= FocusNode();

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

    return Column(
      children: [
        Align(
          alignment: const Alignment(0.0, 0),
          child: TabBar(
            isScrollable: true,
            labelColor: FlutterFlowTheme.of(context).primary,
            labelStyle: FlutterFlowTheme.of(context).bodyMedium,
            unselectedLabelStyle: const TextStyle(),
            indicatorColor: FlutterFlowTheme.of(context).secondary,
            tabs: const [
              Tab(
                text: 'Update Video',
              ),
            ],
            controller: _model.tabBarController,
            onTap: (i) async {
              [() async {}][i]();
            },
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _model.tabBarController,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'EDIT_VIDEO_TO_S_TAB_BAR_Icon_lyt27jxt_ON');
                            logFirebaseEvent('Icon_bottom_sheet');
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.cancel_outlined,
                            color: Colors.black,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: _model.videotitleController,
                          focusNode: _model.videotitleFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Video Title',
                            hintStyle: FlutterFlowTheme.of(context).bodySmall,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          validator: _model.videotitleControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: _model.videosummaryController,
                          focusNode: _model.videosummaryFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Summary',
                            hintStyle: FlutterFlowTheme.of(context).bodySmall,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          maxLines: 3,
                          keyboardType: TextInputType.multiline,
                          validator: _model.videosummaryControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: _model.videoURLController,
                          focusNode: _model.videoURLFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'For Longer Videos use URL here ',
                            hintStyle: FlutterFlowTheme.of(context).bodySmall,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          keyboardType: TextInputType.multiline,
                          validator: _model.videoURLControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Image.asset(
                                  'assets/images/video.png',
                                  width: 50.0,
                                  height: 50.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'EDIT_VIDEO_TO_S_TAB_BAR_UPLOAD_HEADER_VI');
                                    logFirebaseEvent(
                                        'Button_upload_media_to_firebase');
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      allowPhoto: true,
                                      allowVideo: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isDataUploading = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        showUploadMessage(
                                          context,
                                          'Uploading file...',
                                          showLoading: true,
                                        );
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        _model.isDataUploading = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl =
                                              downloadUrls.first;
                                        });
                                        showUploadMessage(context, 'Success!');
                                      } else {
                                        setState(() {});
                                        showUploadMessage(
                                            context, 'Failed to upload data');
                                        return;
                                      }
                                    }
                                  },
                                  text: 'Upload Header Video',
                                  options: FFButtonOptions(
                                    width: 230.0,
                                    height: 30.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
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
                                    elevation: 2.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (_model.uploadedFileUrl != '')
                        FlutterFlowVideoPlayer(
                          path: widget.video!.videofromurl,
                          videoType: VideoType.network,
                          autoPlay: false,
                          looping: true,
                          showControls: true,
                          allowFullScreen: true,
                          allowPlaybackSpeedMenu: false,
                        ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'EDIT_VIDEO_TO_S_TAB_BAR_UPDATE_BTN_ON_TA');
                            logFirebaseEvent('Button_backend_call');

                            await widget.video!.reference
                                .update(createVideosRecordData(
                              title: widget.video?.title,
                              uploadedvideos: _model.uploadedFileUrl,
                              videofromurl: _model.videoURLController.text,
                              linkedtotile: FFAppState().selectedTile,
                              linkedtotab: FFAppState().selectedtab,
                              videosummary: _model.videosummaryController.text,
                            ));
                          },
                          text: 'Update',
                          options: FFButtonOptions(
                            width: 150.0,
                            height: 30.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: Colors.white,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 2.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
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
    );
  }
}
