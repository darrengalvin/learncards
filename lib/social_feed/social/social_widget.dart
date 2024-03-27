import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/no_access_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/social_feed/reply_to_post/reply_to_post_widget.dart';
import '/testpage/components/post_comment_functions/post_comment_functions_widget.dart';
import '/testpage/components/post_functions/post_functions_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'social_model.dart';
export 'social_model.dart';

class SocialWidget extends StatefulWidget {
  const SocialWidget({
    super.key,
    this.tilesdoc,
    this.tilesdocref,
    this.categoryref,
    required this.tileblockref,
  });

  final TilesRecord? tilesdoc;
  final DocumentReference? tilesdocref;
  final DocumentReference? categoryref;
  final DocumentReference? tileblockref;

  @override
  State<SocialWidget> createState() => _SocialWidgetState();
}

class _SocialWidgetState extends State<SocialWidget>
    with TickerProviderStateMixin {
  late SocialModel _model;

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
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
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return StreamBuilder<List<SocialfeedRecord>>(
      stream: querySocialfeedRecord(
        queryBuilder: (socialfeedRecord) => socialfeedRecord.where(
          'linkedtile',
          isEqualTo: widget.tilesdocref,
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
        List<SocialfeedRecord> containerSocialfeedRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final containerSocialfeedRecord =
            containerSocialfeedRecordList.isNotEmpty
                ? containerSocialfeedRecordList.first
                : null;
        return Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(15.0),
          ),
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
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if ((currentUserDocument?.hasaccess
                                                ?.toList() ??
                                            [])
                                        .contains(
                                            FFAppState().selectedcategory))
                                      AuthUserStreamWidget(
                                        builder: (context) => StreamBuilder<
                                            List<SocialfeedRecord>>(
                                          stream: querySocialfeedRecord(
                                            queryBuilder: (socialfeedRecord) =>
                                                socialfeedRecord
                                                    .where(
                                                      'category',
                                                      isEqualTo: FFAppState()
                                                          .selectedcategory,
                                                    )
                                                    .where(
                                                      'socialfeedref',
                                                      isEqualTo:
                                                          containerSocialfeedRecord
                                                              ?.reference,
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
                                            List<SocialfeedRecord>
                                                listViewSocialfeedRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final listViewSocialfeedRecord =
                                                listViewSocialfeedRecordList
                                                        .isNotEmpty
                                                    ? listViewSocialfeedRecordList
                                                        .first
                                                    : null;
                                            return ListView(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (FFAppState()
                                                                            .readytopost ==
                                                                        false)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              30.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              50.0,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.post_add_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                30.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('SOCIAL_COMP_post_add_rounded_ICN_ON_TAP');
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
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (FFAppState()
                                                                            .readytopost ==
                                                                        true)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              30.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              50.0,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_up_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                30.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('SOCIAL_keyboard_arrow_up_sharp_ICN_ON_TA');
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
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Stack(
                                                  children: [
                                                    if ((currentUserDocument
                                                                    ?.hasaccess
                                                                    ?.toList() ??
                                                                [])
                                                            .contains(FFAppState()
                                                                .selectedcategory) !=
                                                        false)
                                                      wrapWithModel(
                                                        model: _model
                                                            .noAccessModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child: NoAccessWidget(),
                                                      ),
                                                    if (FFAppState()
                                                            .readytopost ==
                                                        true)
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.95,
                                                                      0.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        30.0,
                                                                        20.0,
                                                                        30.0,
                                                                        0.0),
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
                                                                          12.0,
                                                                          12.0,
                                                                          12.0,
                                                                          8.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              currentUserPhoto,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: TextFormField(
                                                                                controller: _model.textController,
                                                                                focusNode: _model.textFieldFocusNode,
                                                                                onChanged: (_) => EasyDebounce.debounce(
                                                                                  '_model.textController',
                                                                                  Duration(milliseconds: 2000),
                                                                                  () => setState(() {}),
                                                                                ),
                                                                                autofocus: true,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  hintText: 'Write something...',
                                                                                  hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: Color(0xFF57636C),
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                      ),
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
                                                                                  focusedErrorBorder: UnderlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 8.0, 12.0),
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          4.0,
                                                                          12.0,
                                                                          12.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                child: FlutterFlowIconButton(
                                                                                  borderColor: Colors.transparent,
                                                                                  borderRadius: 30.0,
                                                                                  borderWidth: 1.0,
                                                                                  buttonSize: 40.0,
                                                                                  icon: Icon(
                                                                                    Icons.photo_outlined,
                                                                                    color: Color(0xFF57636C),
                                                                                    size: 20.0,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    logFirebaseEvent('SOCIAL_COMP_photo_outlined_ICN_ON_TAP');
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
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                child: FlutterFlowIconButton(
                                                                                  borderColor: Colors.transparent,
                                                                                  borderRadius: 30.0,
                                                                                  borderWidth: 1.0,
                                                                                  buttonSize: 40.0,
                                                                                  icon: Icon(
                                                                                    Icons.video_call,
                                                                                    color: Color(0xFF57636C),
                                                                                    size: 20.0,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    logFirebaseEvent('SOCIAL_COMP_video_call_ICN_ON_TAP');
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
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                150.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FlutterFlowIconButton(
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
                                                                                logFirebaseEvent('SOCIAL_COMP_close_outlined_ICN_ON_TAP');
                                                                                logFirebaseEvent('IconButton_update_app_state');
                                                                                FFAppState().update(() {
                                                                                  FFAppState().readytopost = false;
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                          FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('SOCIAL_COMP_POST_BTN_ON_TAP');
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
                                                                                  socialfeedref: listViewSocialfeedRecord?.reference,
                                                                                ),
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'memberlevel': [
                                                                                      FFAppState().selectedcategory
                                                                                    ],
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
                                                                                  socialfeedref: listViewSocialfeedRecord?.reference,
                                                                                ),
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'memberlevel': [
                                                                                      FFAppState().selectedcategory
                                                                                    ],
                                                                                  },
                                                                                ),
                                                                              }, socialpostsRecordReference);
                                                                              logFirebaseEvent('Button_update_app_state');
                                                                              FFAppState().update(() {
                                                                                FFAppState().readytopost = false;
                                                                              });

                                                                              setState(() {});
                                                                            },
                                                                            text:
                                                                                'Post',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 70.0,
                                                                              height: 30.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Colors.white,
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                  ),
                                                                              elevation: 2.0,
                                                                              borderSide: BorderSide(
                                                                                color: Colors.transparent,
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    if ((_model.uploadedFileUrl2 !=
                                                                                null &&
                                                                            _model.uploadedFileUrl2 !=
                                                                                '') ||
                                                                        (_model.uploadedFileUrl1 !=
                                                                                null &&
                                                                            _model.uploadedFileUrl1 !=
                                                                                ''))
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.stretch,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            child:
                                                                                Stack(
                                                                              alignment: AlignmentDirectional(0.050000000000000044, 0.0),
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Visibility(
                                                                                      visible: _model.uploadedFileUrl1 != null && _model.uploadedFileUrl1 != '',
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0.0, -1.67),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 30.0),
                                                                                          child: Image.network(
                                                                                            _model.uploadedFileUrl2,
                                                                                            width: double.infinity,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                if (_model.uploadedFileUrl2 != null && _model.uploadedFileUrl2 != '')
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
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
                      ).animateOnPageLoad(
                          animationsMap['columnOnPageLoadAnimation']!),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Visibility(
                                visible: (currentUserDocument?.hasaccess
                                            ?.toList() ??
                                        [])
                                    .contains(FFAppState().selectedcategory),
                                child: AuthUserStreamWidget(
                                  builder: (context) =>
                                      StreamBuilder<List<SocialpostsRecord>>(
                                    stream: querySocialpostsRecord(
                                      queryBuilder: (socialpostsRecord) =>
                                          socialpostsRecord
                                              .where(
                                                'memberlevel',
                                                arrayContains: FFAppState()
                                                    .selectedcategory,
                                              )
                                              .where(
                                                'socialfeedref',
                                                isEqualTo:
                                                    containerSocialfeedRecord
                                                        ?.reference,
                                              )
                                              .orderBy('datetime',
                                                  descending: true),
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
                                      List<SocialpostsRecord>
                                          listViewSocialpostsRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listViewSocialpostsRecordList
                                            .length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewSocialpostsRecord =
                                              listViewSocialpostsRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 9.0, 0.0, 9.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                    FlutterFlowTheme.of(context)
                                                        .secondary
                                                  ],
                                                  stops: [0.0, 1.0],
                                                  begin: AlignmentDirectional(
                                                      0.0, -1.0),
                                                  end: AlignmentDirectional(
                                                      0, 1.0),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                ),
                                              ),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  7.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40.0),
                                                            child:
                                                                Image.network(
                                                              listViewSocialpostsRecord
                                                                  .posterphoto,
                                                              width: 60.0,
                                                              height: 60.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          listViewSocialpostsRecord
                                                              .username,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall,
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  dateTimeFormat(
                                                                      'relative',
                                                                      listViewSocialpostsRecord
                                                                          .datetime!),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey('Outfit'),
                                                                      ),
                                                                ),
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .keyboard_control_rounded,
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    size: 20.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'SOCIAL_keyboard_control_rounded_ICN_ON_T');
                                                                    logFirebaseEvent(
                                                                        'IconButton_bottom_sheet');
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      barrierColor:
                                                                          Color(
                                                                              0x00000000),
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                Container(
                                                                              height: 200.0,
                                                                              child: PostFunctionsWidget(
                                                                                postdetailsref: listViewSocialpostsRecord.reference,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  17.0,
                                                                  7.0,
                                                                  7.0,
                                                                  7.0),
                                                      child: Text(
                                                        listViewSocialpostsRecord
                                                            .postdescription,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    if (listViewSocialpostsRecord
                                                                .video !=
                                                            null &&
                                                        listViewSocialpostsRecord
                                                                .video !=
                                                            '')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowVideoPlayer(
                                                          path:
                                                              listViewSocialpostsRecord
                                                                  .video,
                                                          videoType:
                                                              VideoType.network,
                                                          width: 500.0,
                                                          autoPlay: false,
                                                          looping: true,
                                                          showControls: true,
                                                          allowFullScreen: true,
                                                          allowPlaybackSpeedMenu:
                                                              false,
                                                        ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            InkWell(
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
                                                                    'SOCIAL_COMP_Container_h66o5utj_ON_TAP');
                                                              },
                                                              child: Container(
                                                                width: 40.0,
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    width: 0.0,
                                                                  ),
                                                                ),
                                                                child:
                                                                    ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    final likesElement =
                                                                        currentUserReference;
                                                                    final likesUpdate = listViewSocialpostsRecord
                                                                            .likes
                                                                            .contains(
                                                                                likesElement)
                                                                        ? FieldValue
                                                                            .arrayRemove([
                                                                            likesElement
                                                                          ])
                                                                        : FieldValue
                                                                            .arrayUnion([
                                                                            likesElement
                                                                          ]);
                                                                    await listViewSocialpostsRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'likes':
                                                                              likesUpdate,
                                                                        },
                                                                      ),
                                                                    });
                                                                  },
                                                                  value: listViewSocialpostsRecord
                                                                      .likes
                                                                      .contains(
                                                                          currentUserReference),
                                                                  onIcon: Icon(
                                                                    Icons
                                                                        .favorite,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 25.0,
                                                                  ),
                                                                  offIcon: Icon(
                                                                    Icons
                                                                        .favorite_border,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    size: 25.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                listViewSocialpostsRecord
                                                                    .likes
                                                                    .length
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
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
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'likes',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
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
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .mode_comment_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Text(
                                                                listViewSocialpostsRecord
                                                                    .numbercomments
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
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
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          25.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
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
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'SOCIAL_COMP_Row_gwnmlvry_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Row_bottom_sheet');
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    barrierColor:
                                                                        Color(
                                                                            0x00000000),
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                300.0,
                                                                            child:
                                                                                ReplyToPostWidget(
                                                                              postid: listViewSocialpostsRecord.reference,
                                                                              posterdetails: listViewSocialpostsRecord,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                },
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'Reply',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey('Outfit'),
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .reply_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
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
                                                    if (listViewSocialpostsRecord
                                                                .photo !=
                                                            null &&
                                                        listViewSocialpostsRecord
                                                                .photo !=
                                                            '')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                          child: Image.network(
                                                            listViewSocialpostsRecord
                                                                .photo,
                                                            width: 500.0,
                                                            height: 500.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: StreamBuilder<
                                                          List<
                                                              SocialCommentsRecord>>(
                                                        stream:
                                                            querySocialCommentsRecord(
                                                          parent:
                                                              listViewSocialpostsRecord
                                                                  .reference,
                                                          queryBuilder:
                                                              (socialCommentsRecord) =>
                                                                  socialCommentsRecord
                                                                      .where(
                                                                        'postid',
                                                                        isEqualTo:
                                                                            listViewSocialpostsRecord.reference,
                                                                      )
                                                                      .orderBy(
                                                                          'timeposted'),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<SocialCommentsRecord>
                                                              listViewCommentsSocialCommentsRecordList =
                                                              snapshot.data!;
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewCommentsSocialCommentsRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewCommentsIndex) {
                                                              final listViewCommentsSocialCommentsRecord =
                                                                  listViewCommentsSocialCommentsRecordList[
                                                                      listViewCommentsIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
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
                                                                    Column(
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
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                500.0,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: MediaQuery.sizeOf(context).width * 0.85,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsets.all(7.0),
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
                                                                                                padding: EdgeInsets.all(5.0),
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
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 0.0),
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
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 0.0),
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
                                                                                            icon: Icon(
                                                                                              Icons.keyboard_control_rounded,
                                                                                              color: Color(0xFF57636C),
                                                                                              size: 20.0,
                                                                                            ),
                                                                                            onPressed: () async {
                                                                                              logFirebaseEvent('SOCIAL_keyboard_control_rounded_ICN_ON_T');
                                                                                              logFirebaseEvent('IconButton_bottom_sheet');
                                                                                              await showModalBottomSheet(
                                                                                                isScrollControlled: true,
                                                                                                backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                barrierColor: Color(0x00000000),
                                                                                                context: context,
                                                                                                builder: (context) {
                                                                                                  return WebViewAware(
                                                                                                    child: Padding(
                                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                                      child: Container(
                                                                                                        height: 200.0,
                                                                                                        child: PostCommentFunctionsWidget(
                                                                                                          commentposterref: listViewCommentsSocialCommentsRecord.reference,
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
                                                                                        padding: EdgeInsets.all(15.0),
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
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('SOCIAL_COMP_Row_uekj9dc9_ON_TAP');
                                                                                      logFirebaseEvent('Row_bottom_sheet');
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                        barrierColor: Color(0x00000000),
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return WebViewAware(
                                                                                            child: Padding(
                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                              child: Container(
                                                                                                height: 300.0,
                                                                                                child: ReplyToPostWidget(
                                                                                                  postid: listViewSocialpostsRecord.reference,
                                                                                                  posterdetails: listViewSocialpostsRecord,
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
                                                                                        Padding(
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
                          Container(
                            width: double.infinity,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
