import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'socialcreate_posts_model.dart';
export 'socialcreate_posts_model.dart';

class SocialcreatePostsWidget extends StatefulWidget {
  const SocialcreatePostsWidget({
    super.key,
    this.postname,
    this.imageurl,
    this.usersrecord,
    this.notificationsdoc,
    this.categoriesdoc,
    this.socialposts,
    this.socialfeedref,
    this.socialfeeddoc,
  });

  final String? postname;
  final String? imageurl;
  final UsersRecord? usersrecord;
  final PushnotificationRecord? notificationsdoc;
  final CategoriesRecord? categoriesdoc;
  final SocialpostsRecord? socialposts;
  final DocumentReference? socialfeedref;
  final SocialfeedRecord? socialfeeddoc;

  @override
  State<SocialcreatePostsWidget> createState() =>
      _SocialcreatePostsWidgetState();
}

class _SocialcreatePostsWidgetState extends State<SocialcreatePostsWidget> {
  late SocialcreatePostsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialcreatePostsModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 100.0),
          child: Container(
            width: double.infinity,
            height: 450.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5.0,
                  color: Color(0x162D3A21),
                  offset: Offset(0.0, 3.0),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => Text(
                          'Hi, $currentUserDisplayName',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuthUserStreamWidget(
                          builder: (context) => Container(
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
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
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
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: const Color(0xFF57636C),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Outfit'),
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
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 8.0, 12.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: const Color(0xFF101213),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Outfit'),
                                  ),
                              maxLines: 3,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 12.0,
                    thickness: 2.0,
                    color: Color(0xFFF1F4F8),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 4.0, 0.0),
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
                                  logFirebaseEvent(
                                      'SOCIALCREATE_POSTS_photo_outlined_ICN_ON');
                                  logFirebaseEvent(
                                      'IconButton_upload_media_to_firebase');
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading1 = true);
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
                                      _model.isDataUploading1 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile1 =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl1 =
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
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 4.0, 0.0),
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
                                  logFirebaseEvent(
                                      'SOCIALCREATE_POSTS_video_call_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_upload_media_to_firebase');
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading2 = true);
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
                                      _model.isDataUploading2 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile2 =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl2 =
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
                              ),
                            ),
                          ],
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'SOCIALCREATE_POSTS_COMP_POST_BTN_ON_TAP');
                            logFirebaseEvent('Button_backend_call');

                            var socialpostsRecordReference =
                                SocialpostsRecord.collection.doc();
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
                                  'memberlevel': [
                                    FFAppState().selectedcategory
                                  ],
                                },
                              ),
                            });
                            _model.createdpost =
                                SocialpostsRecord.getDocumentFromData({
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
                                  'memberlevel': [
                                    FFAppState().selectedcategory
                                  ],
                                },
                              ),
                            }, socialpostsRecordReference);
                            logFirebaseEvent('Button_bottom_sheet');
                            Navigator.pop(context);

                            setState(() {});
                          },
                          text: 'Post',
                          options: FFButtonOptions(
                            width: 70.0,
                            height: 30.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF4B39EF),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts:
                                      GoogleFonts.asMap().containsKey('Outfit'),
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          if (_model.uploadedFileUrl2 != '')
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowVideoPlayer(
                                path: _model.uploadedFileUrl2,
                                videoType: VideoType.network,
                                autoPlay: false,
                                looping: true,
                                showControls: true,
                                allowFullScreen: true,
                                allowPlaybackSpeedMenu: false,
                              ),
                            ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, -1.67),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 30.0),
                              child: Image.network(
                                _model.uploadedFileUrl1,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
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
  }
}
