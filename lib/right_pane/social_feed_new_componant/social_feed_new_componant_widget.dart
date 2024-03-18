import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/no_access_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/search_pages/live_video/broadcast_name_input/broadcast_name_input_widget.dart';
import '/social_feed/reply_to_comment/reply_to_comment_widget.dart';
import '/testpage/components/detailedcomment/detailedcomment_widget.dart';
import '/testpage/components/post_comment_functions/post_comment_functions_widget.dart';
import '/testpage/components/post_functions/post_functions_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'social_feed_new_componant_model.dart';
export 'social_feed_new_componant_model.dart';

class SocialFeedNewComponantWidget extends StatefulWidget {
  const SocialFeedNewComponantWidget({super.key});

  @override
  State<SocialFeedNewComponantWidget> createState() =>
      _SocialFeedNewComponantWidgetState();
}

class _SocialFeedNewComponantWidgetState
    extends State<SocialFeedNewComponantWidget> with TickerProviderStateMixin {
  late SocialFeedNewComponantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialFeedNewComponantModel());

    _model.socialPostTextController ??= TextEditingController();
    _model.socialPostTextFocusNode ??= FocusNode();

    _model.clouDinaryController ??= TextEditingController();
    _model.clouDinaryFocusNode ??= FocusNode();

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: 500.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 5.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 50.0,
                                icon: Icon(
                                  Icons.chevron_left,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'SOCIAL_FEED_NEW_COMPONANT_chevron_left_I');
                                  logFirebaseEvent(
                                      'IconButton_update_app_state');
                                  FFAppState().update(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 50.0,
                              height: 50.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.socialPostTextController,
                                focusNode: _model.socialPostTextFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.socialPostTextController',
                                  Duration(milliseconds: 2000),
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
                                        color: Color(0xFF57636C),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Outfit'),
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
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 8.0, 12.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Outfit'),
                                    ),
                                maxLines: 3,
                                validator: _model
                                    .socialPostTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 20.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.close_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'SOCIAL_FEED_NEW_COMPONANT_close_outlined');
                                        logFirebaseEvent(
                                            'IconButton_update_app_state');
                                        FFAppState().update(() {});
                                      },
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'SOCIAL_FEED_NEW_COMPONANT_socialPostPost');
                                      logFirebaseEvent(
                                          'socialPostPost_backend_call');

                                      var socialpostsRecordReference =
                                          SocialpostsRecord.collection.doc();
                                      await socialpostsRecordReference.set({
                                        ...createSocialpostsRecordData(
                                          photo: _model.uploadedFileUrl1,
                                          username: currentUserDisplayName,
                                          datetime: getCurrentTimestamp,
                                          posterphoto: currentUserPhoto,
                                          postuser: currentUserReference,
                                          postdescription: _model
                                              .socialPostTextController.text,
                                          video2: valueOrDefault<String>(
                                            _model.clouDinaryController.text !=
                                                        null &&
                                                    _model.clouDinaryController
                                                            .text !=
                                                        ''
                                                ? _model
                                                    .clouDinaryController.text
                                                : _model.uploadedFileUrl2,
                                            'l',
                                          ),
                                          video: '',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'memberlevel': [
                                              _model.radioButtonValue
                                            ],
                                          },
                                        ),
                                      });
                                      _model.createdpost1 = SocialpostsRecord
                                          .getDocumentFromData({
                                        ...createSocialpostsRecordData(
                                          photo: _model.uploadedFileUrl1,
                                          username: currentUserDisplayName,
                                          datetime: getCurrentTimestamp,
                                          posterphoto: currentUserPhoto,
                                          postuser: currentUserReference,
                                          postdescription: _model
                                              .socialPostTextController.text,
                                          video2: valueOrDefault<String>(
                                            _model.clouDinaryController.text !=
                                                        null &&
                                                    _model.clouDinaryController
                                                            .text !=
                                                        ''
                                                ? _model
                                                    .clouDinaryController.text
                                                : _model.uploadedFileUrl2,
                                            'l',
                                          ),
                                          video: '',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'memberlevel': [
                                              _model.radioButtonValue
                                            ],
                                          },
                                        ),
                                      }, socialpostsRecordReference);
                                      logFirebaseEvent(
                                          'socialPostPost_update_app_state');
                                      FFAppState().update(() {});
                                      logFirebaseEvent(
                                          'socialPostPost_clear_uploaded_data');
                                      setState(() {
                                        _model.isDataUploading1 = false;
                                        _model.uploadedLocalFile1 =
                                            FFUploadedFile(
                                                bytes: Uint8List.fromList([]));
                                        _model.uploadedFileUrl1 = '';
                                      });

                                      logFirebaseEvent(
                                          'socialPostPost_clear_uploaded_data');
                                      setState(() {
                                        _model.isDataUploading2 = false;
                                        _model.uploadedLocalFile2 =
                                            FFUploadedFile(
                                                bytes: Uint8List.fromList([]));
                                        _model.uploadedFileUrl2 = '';
                                      });

                                      setState(() {});
                                    },
                                    text: 'Post',
                                    options: FFButtonOptions(
                                      width: 70.0,
                                      height: 30.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Outfit'),
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  if (valueOrDefault<bool>(
                                          currentUserDocument?.isadmin,
                                          false) ==
                                      true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'SOCIAL_FEED_NEW_COMPONANT_GO_LIVE_BTN_ON');
                                            logFirebaseEvent(
                                                'Button_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              barrierColor: Color(0x00000000),
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: Container(
                                                      height: 650.0,
                                                      child:
                                                          BroadcastNameInputWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          text: 'Go Live',
                                          icon: Icon(
                                            Icons.settings_input_antenna,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: 120.0,
                                            height: 30.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily),
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
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
                                        logFirebaseEvent(
                                            'SOCIAL_FEED_NEW_COMPONANT_photo_outlined');
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
                                          setState(() =>
                                              _model.isDataUploading1 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            showUploadMessage(
                                              context,
                                              'Uploading file...',
                                              showLoading: true,
                                            );
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
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
                                            showUploadMessage(
                                                context, 'Success!');
                                          } else {
                                            setState(() {});
                                            showUploadMessage(context,
                                                'Failed to upload data');
                                            return;
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
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
                                        logFirebaseEvent(
                                            'SOCIAL_FEED_NEW_COMPONANT_video_call_ICN');
                                        logFirebaseEvent(
                                            'IconButton_upload_media_to_firebase');
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          allowPhoto: false,
                                          allowVideo: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading2 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            showUploadMessage(
                                              context,
                                              'Uploading file...',
                                              showLoading: true,
                                            );
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
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
                                            showUploadMessage(
                                                context, 'Success!');
                                          } else {
                                            setState(() {});
                                            showUploadMessage(context,
                                                'Failed to upload data');
                                            return;
                                          }
                                        }

                                        logFirebaseEvent(
                                            'IconButton_update_component_state');
                                        setState(() {});
                                        logFirebaseEvent(
                                            'IconButton_update_app_state');
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 700.0,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.clouDinaryController,
                                        focusNode: _model.clouDinaryFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Cloudinary Url',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        validator: _model
                                            .clouDinaryControllerValidator
                                            .asValidator(context),
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
                    AuthUserStreamWidget(
                      builder: (context) => FlutterFlowRadioButton(
                        options:
                            (currentUserDocument?.hasaccess?.toList() ?? [])
                                .toList(),
                        onChanged: (val) async {
                          setState(() {});
                          logFirebaseEvent(
                              'SOCIAL_FEED_NEW_COMPONANT_RadioButton_d7');
                          logFirebaseEvent('RadioButton_update_app_state');
                          setState(() {});
                        },
                        controller: _model.radioButtonValueController ??=
                            FormFieldController<String>('Community'),
                        optionHeight: 32.0,
                        textStyle: FlutterFlowTheme.of(context).labelMedium,
                        selectedTextStyle:
                            FlutterFlowTheme.of(context).bodyMedium,
                        buttonPosition: RadioButtonPosition.left,
                        direction: Axis.horizontal,
                        radioButtonColor: FlutterFlowTheme.of(context).primary,
                        inactiveRadioButtonColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        toggleable: false,
                        horizontalAlignment: WrapAlignment.start,
                        verticalAlignment: WrapCrossAlignment.start,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            child: Stack(
                              alignment: AlignmentDirectional(
                                  0.050000000000000044, 0.0),
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 0.0, 30.0, 0.0),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 1000.0,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible: valueOrDefault<bool>(
                                        (_model.uploadedFileUrl1 != null &&
                                                _model.uploadedFileUrl1 !=
                                                    '') ||
                                            valueOrDefault<bool>(
                                              _model.uploadedFileUrl2 != null &&
                                                  _model.uploadedFileUrl2 != '',
                                              false,
                                            ),
                                        false,
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.67),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 30.0),
                                          child: Image.network(
                                            _model.uploadedFileUrl1,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (valueOrDefault<bool>(
                                  _model.uploadedFileUrl2 != null &&
                                      _model.uploadedFileUrl2 != '',
                                  false,
                                ))
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: FlutterFlowVideoPlayer(
                                      path: _model.uploadedFileUrl2,
                                      videoType: VideoType.network,
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      autoPlay: false,
                                      looping: true,
                                      showControls: true,
                                      allowFullScreen: true,
                                      allowPlaybackSpeedMenu: false,
                                    ),
                                  ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 900.0,
                                    maxHeight: 1500.0,
                                  ),
                                  decoration: BoxDecoration(),
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
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -0.88),
                                                child: FlutterFlowVideoPlayer(
                                                  path:
                                                      'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.1),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 300.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              40.0),
                                                                      child: Image
                                                                          .network(
                                                                        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              constraints: BoxConstraints(
                                                                                maxWidth: MediaQuery.sizeOf(context).width * 0.75,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFDBE2E7),
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Randy Alcorn',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            color: Color(0xFF14181B),
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      'I\'m not really sure about this section here aI think you should do soemthing cool!',
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            color: Color(0xFF57636C),
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
                                                                                      child: Image.network(
                                                                                        'https://picsum.photos/seed/217/600',
                                                                                        width: double.infinity,
                                                                                        height: 200.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
                                                                                      child: FlutterFlowVideoPlayer(
                                                                                        path: 'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
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
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'a min ago',
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
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
                                          alignment:
                                              AlignmentDirectional(0.0, 0.5),
                                          child: Container(
                                            width: double.infinity,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    13.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .commentController,
                                                          focusNode: _model
                                                              .commentFocusNode,
                                                          autofocus: true,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'Quick Comment',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                            enabledBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                          validator: _model
                                                              .commentControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 60.0,
                                                      icon: Icon(
                                                        Icons.insert_comment,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'SOCIAL_FEED_NEW_COMPONANT_insert_comment');
                                                        logFirebaseEvent(
                                                            'IconButton_bottom_sheet');
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                          barrierColor:
                                                              Color(0x00000000),
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    DetailedcommentWidget(),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 60.0,
                                                      icon: Icon(
                                                        Icons.send_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'SOCIAL_FEED_NEW_COMPONANT_send_outlined_');
                                                        logFirebaseEvent(
                                                            'IconButton_clear_text_fields_pin_codes');
                                                        setState(() {
                                                          _model
                                                              .commentController
                                                              ?.clear();
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 0.0),
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth:
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      1.0,
                                            ),
                                            decoration: BoxDecoration(),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        StreamBuilder<
                                                            List<
                                                                BroadcastsRecord>>(
                                                          stream:
                                                              queryBroadcastsRecord(
                                                            queryBuilder: (broadcastsRecord) =>
                                                                broadcastsRecord
                                                                    .where(
                                                                      'audience',
                                                                      arrayContains:
                                                                          _model
                                                                              .radioButtonValue,
                                                                    )
                                                                    .where(
                                                                      'is_live',
                                                                      isEqualTo:
                                                                          true,
                                                                    )
                                                                    .orderBy(
                                                                        'time',
                                                                        descending:
                                                                            true),
                                                            singleRecord: true,
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
                                                            List<BroadcastsRecord>
                                                                listViewBroadcastsRecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final listViewBroadcastsRecord =
                                                                listViewBroadcastsRecordList
                                                                        .isNotEmpty
                                                                    ? listViewBroadcastsRecordList
                                                                        .first
                                                                    : null;
                                                            return ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              children: [
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
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
                                                                        'SOCIAL_FEED_NEW_COMPONANT_Card_1n1nxmqh_');
                                                                    if (listViewBroadcastsRecord!
                                                                        .isLive) {
                                                                      logFirebaseEvent(
                                                                          'Card_update_app_state');
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Card_backend_call');
                                                                      _model.nEWliveStreamIdResult = await MuxVideoGroup
                                                                          .newGetLiveStreamIDCall
                                                                          .call(
                                                                        playbackIds:
                                                                            functions.getPlaybackIdFromUrl(listViewBroadcastsRecord!.url),
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Card_update_app_state');
                                                                      setState(
                                                                          () {});
                                                                      if ((_model
                                                                              .nEWliveStreamIdResult
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        logFirebaseEvent(
                                                                            'Card_backend_call');
                                                                        _model.nEWpastLiveStreamResult = await MuxVideoGroup
                                                                            .newGetPastLiveStreamCall
                                                                            .call(
                                                                          streamId: MuxVideoGroup
                                                                              .newGetLiveStreamIDCall
                                                                              .streamid(
                                                                            (_model.nEWliveStreamIdResult?.jsonBody ??
                                                                                ''),
                                                                          ),
                                                                        );
                                                                        if ((_model.nEWpastLiveStreamResult?.succeeded ??
                                                                            true)) {
                                                                          logFirebaseEvent(
                                                                              'Card_update_app_state');
                                                                          FFAppState()
                                                                              .update(() {});
                                                                        }
                                                                      }
                                                                    }

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Card(
                                                                    clipBehavior:
                                                                        Clip.antiAliasWithSaveLayer,
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          SingleChildScrollView(
                                                                            child:
                                                                                Column(
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
                                                                                                      if (listViewBroadcastsRecord?.isLive ?? true)
                                                                                                        InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            logFirebaseEvent('SOCIAL_FEED_NEW_COMPONANT_Icon_tlmuz0l6_');
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
                                                                                                            logFirebaseEvent('SOCIAL_FEED_NEW_COMPONANT_delete_ICN_ON_');
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
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
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
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          dateTimeFormat('MMMMEEEEd', listViewBroadcastsRecord!.time!),
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
                          child: AuthUserStreamWidget(
                            builder: (context) =>
                                StreamBuilder<List<SocialpostsRecord>>(
                              stream: querySocialpostsRecord(
                                queryBuilder: (socialpostsRecord) =>
                                    socialpostsRecord
                                        .whereArrayContainsAny(
                                            'memberlevel',
                                            (currentUserDocument?.hasaccess
                                                            ?.toList() ??
                                                        []) !=
                                                    ''
                                                ? (currentUserDocument
                                                        ?.hasaccess
                                                        ?.toList() ??
                                                    [])
                                                : null)
                                        .orderBy('datetime', descending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return NoAccessWidget();
                                }
                                List<SocialpostsRecord>
                                    listViewSocialPostsSocialpostsRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewSocialPostsSocialpostsRecordList
                                          .length,
                                  itemBuilder:
                                      (context, listViewSocialPostsIndex) {
                                    final listViewSocialPostsSocialpostsRecord =
                                        listViewSocialPostsSocialpostsRecordList[
                                            listViewSocialPostsIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                            begin:
                                                AlignmentDirectional(0.0, -1.0),
                                            end: AlignmentDirectional(0, 1.0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(7.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                      child: Image.network(
                                                        listViewSocialPostsSocialpostsRecord
                                                            .posterphoto,
                                                        width: 60.0,
                                                        height: 60.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    listViewSocialPostsSocialpostsRecord
                                                        .username,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    listViewSocialPostsSocialpostsRecord
                                                                        .memberlevel
                                                                        .first,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey('Outfit'),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    dateTimeFormat(
                                                                        'relative',
                                                                        listViewSocialPostsSocialpostsRecord
                                                                            .datetime!),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey('Outfit'),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
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
                                                                  'SOCIAL_FEED_NEW_COMPONANT_keyboard_contr');
                                                              logFirebaseEvent(
                                                                  'IconButton_bottom_sheet');
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                barrierColor: Color(
                                                                    0x00000000),
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            200.0,
                                                                        child:
                                                                            PostFunctionsWidget(
                                                                          postdetailsref:
                                                                              listViewSocialPostsSocialpostsRecord.reference,
                                                                          postdetailsdoc:
                                                                              listViewSocialPostsSocialpostsRecord,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        17.0, 7.0, 7.0, 7.0),
                                                child: Text(
                                                  listViewSocialPostsSocialpostsRecord
                                                      .postdescription,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: FlutterFlowVideoPlayer(
                                                  path:
                                                      'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                                                  videoType: VideoType.network,
                                                  width: 500.0,
                                                  autoPlay: false,
                                                  looping: true,
                                                  showControls: true,
                                                  allowFullScreen: true,
                                                  allowPlaybackSpeedMenu: false,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'SOCIAL_FEED_NEW_COMPONANT_Container_2ost');
                                                          },
                                                          child: Container(
                                                            width: 40.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                width: 0.0,
                                                              ),
                                                            ),
                                                            child: ToggleIcon(
                                                              onPressed:
                                                                  () async {
                                                                final likesElement =
                                                                    currentUserReference;
                                                                final likesUpdate = listViewSocialPostsSocialpostsRecord
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
                                                                await listViewSocialPostsSocialpostsRecord
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
                                                              value: listViewSocialPostsSocialpostsRecord
                                                                  .likes
                                                                  .contains(
                                                                      currentUserReference),
                                                              onIcon: Icon(
                                                                Icons.favorite,
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
                                                                    .primaryText,
                                                                size: 25.0,
                                                              ),
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
                                                          listViewSocialPostsSocialpostsRecord
                                                              .likes.length
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
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
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                          listViewSocialPostsSocialpostsRecord
                                                              .numbercomments
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
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
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Padding(
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
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'SOCIAL_FEED_NEW_COMPONANT_Row_3h325yif_O');
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey('Outfit'),
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .reply_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 24.0,
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
                                              ),
                                              Container(
                                                constraints: BoxConstraints(
                                                  maxWidth: 1000.0,
                                                ),
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    if (listViewSocialPostsSocialpostsRecord
                                                                .photo !=
                                                            null &&
                                                        listViewSocialPostsSocialpostsRecord
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
                                                            listViewSocialPostsSocialpostsRecord
                                                                .photo,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 20.0),
                                                child: StreamBuilder<
                                                    List<
                                                        SocialFeedsCommentNewRecord>>(
                                                  stream:
                                                      querySocialFeedsCommentNewRecord(),
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
                                                    List<SocialFeedsCommentNewRecord>
                                                        listViewCommentsSocialFeedsCommentNewRecordList =
                                                        snapshot.data!;
                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          listViewCommentsSocialFeedsCommentNewRecordList
                                                              .length,
                                                      itemBuilder: (context,
                                                          listViewCommentsIndex) {
                                                        final listViewCommentsSocialFeedsCommentNewRecord =
                                                            listViewCommentsSocialFeedsCommentNewRecordList[
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
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
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
                                                                              MediaQuery.sizeOf(context).width * 0.75,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                MediaQuery.sizeOf(context).width * 0.85,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
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
                                                                                                  'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDB8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
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
                                                                                            listViewSocialPostsSocialpostsRecord.username,
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
                                                                                            logFirebaseEvent('SOCIAL_FEED_NEW_COMPONANT_keyboard_contr');
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
                                                                                                      child: PostCommentFunctionsWidget(),
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
                                                                                            'I\'m not really sure about this section here aI think you should do soemthing cool!',
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
                                                                                    Stack(
                                                                                      children: [
                                                                                        if (valueOrDefault<bool>(
                                                                                          listViewSocialPostsSocialpostsRecord.video != null && listViewSocialPostsSocialpostsRecord.video != '',
                                                                                          false,
                                                                                        ))
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: FlutterFlowVideoPlayer(
                                                                                              path: listViewSocialPostsSocialpostsRecord.video,
                                                                                              videoType: VideoType.network,
                                                                                              autoPlay: false,
                                                                                              looping: true,
                                                                                              showControls: true,
                                                                                              allowFullScreen: true,
                                                                                              allowPlaybackSpeedMenu: false,
                                                                                            ),
                                                                                          ),
                                                                                        if (valueOrDefault<bool>(
                                                                                          listViewSocialPostsSocialpostsRecord.photo != null && listViewSocialPostsSocialpostsRecord.photo != '',
                                                                                          false,
                                                                                        ))
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, -1.67),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 30.0),
                                                                                              child: Image.network(
                                                                                                listViewSocialPostsSocialpostsRecord.photo,
                                                                                                width: double.infinity,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
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
                                                                                    logFirebaseEvent('SOCIAL_FEED_NEW_COMPONANT_Row_s9dgqfo2_O');
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
                                                                                              child: ReplyToCommentWidget(),
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
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Opacity(
                                                                                    opacity: 0.9,
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 20.0),
                                                                                      child: StreamBuilder<List<DeeperCommentsNewRecord>>(
                                                                                        stream: queryDeeperCommentsNewRecord(
                                                                                          queryBuilder: (deeperCommentsNewRecord) => deeperCommentsNewRecord.orderBy('datePosted', descending: true),
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
                                                                                          List<DeeperCommentsNewRecord> deeperCommentsDeeperCommentsNewRecordList = snapshot.data!;
                                                                                          return Container(
                                                                                            width: MediaQuery.sizeOf(context).width * 0.55,
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(17.0),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                                                                                              child: Builder(
                                                                                                builder: (context) {
                                                                                                  final deeperComments = deeperCommentsDeeperCommentsNewRecordList.toList();
                                                                                                  return Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: List.generate(deeperComments.length, (deeperCommentsIndex) {
                                                                                                      final deeperCommentsItem = deeperComments[deeperCommentsIndex];
                                                                                                      return Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(7.0, 7.0, 7.0, 7.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsets.all(5.0),
                                                                                                                      child: ClipRRect(
                                                                                                                        borderRadius: BorderRadius.circular(40.0),
                                                                                                                        child: Image.network(
                                                                                                                          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDB8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
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
                                                                                                                    'a min ago',
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
                                                                                                                    'a min ago',
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
                                                                                                                    logFirebaseEvent('SOCIAL_FEED_NEW_COMPONANT_keyboard_contr');
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
                                                                                                                    'I\'m not really sure about this section here aI think you should do soemthing cool!',
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
                                                                                                            Stack(
                                                                                                              children: [
                                                                                                                Align(
                                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: FlutterFlowVideoPlayer(
                                                                                                                    path: 'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                                                                                                                    videoType: VideoType.network,
                                                                                                                    autoPlay: false,
                                                                                                                    looping: true,
                                                                                                                    showControls: true,
                                                                                                                    allowFullScreen: true,
                                                                                                                    allowPlaybackSpeedMenu: false,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Align(
                                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 30.0),
                                                                                                                    child: Image.network(
                                                                                                                      'https://picsum.photos/seed/177/600',
                                                                                                                      width: double.infinity,
                                                                                                                      fit: BoxFit.cover,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      );
                                                                                                    }),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
