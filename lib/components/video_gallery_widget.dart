import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/dynamic_text_field_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_gallery_model.dart';
export 'video_gallery_model.dart';

class VideoGalleryWidget extends StatefulWidget {
  const VideoGalleryWidget({
    super.key,
    required this.blockDoc,
  });

  final TileBlocksRecord? blockDoc;

  @override
  State<VideoGalleryWidget> createState() => _VideoGalleryWidgetState();
}

class _VideoGalleryWidgetState extends State<VideoGalleryWidget> {
  late VideoGalleryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoGalleryModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VIDEO_GALLERY_VideoGallery_ON_INIT_STATE');
      logFirebaseEvent('VideoGallery_update_component_state');
      setState(() {
        _model.videoGallery = widget.blockDoc!.hasImageGallery()
            ? widget.blockDoc!.videoGallery
            : functions.emptyVideoList().toList().cast<String>();
      });
    });

    _model.videoLinkController ??= TextEditingController();
    _model.videoLinkFocusNode ??= FocusNode();

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

    return Container(
      constraints: const BoxConstraints(
        maxWidth: 500.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              width: double.infinity,
              constraints: const BoxConstraints(
                maxHeight: 300.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: FFAppState().showEdit != true
                      ? FlutterFlowTheme.of(context).accent2
                      : FlutterFlowTheme.of(context).primary,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.ondemand_video,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Add one of more videos',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                      child: FlutterFlowChoiceChips(
                        options: const [
                          ChipData('Library'),
                          ChipData('Upload'),
                          ChipData('URL')
                        ],
                        onChanged: (val) => setState(
                            () => _model.videoOptionsValue = val?.firstOrNull),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: const Color(0xFF1AADF9),
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).white,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          iconColor: FlutterFlowTheme.of(context).white,
                          iconSize: 18.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 18.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        chipSpacing: 12.0,
                        rowSpacing: 12.0,
                        multiselect: false,
                        initialized: _model.videoOptionsValue != null,
                        alignment: WrapAlignment.start,
                        controller: _model.videoOptionsValueController ??=
                            FormFieldController<List<String>>(
                          ['URL'],
                        ),
                        wrapped: false,
                      ),
                    ),
                    if (valueOrDefault<bool>(
                          _model.videoOptionsValue == 'Library',
                          false,
                        ) &&
                        responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                      Flexible(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(
                            minHeight: 180.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final libraryVideo = _model.videoGallery.toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: libraryVideo.length,
                                itemBuilder: (context, libraryVideoIndex) {
                                  final libraryVideoItem =
                                      libraryVideo[libraryVideoIndex];
                                  return Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                    child: CheckboxListTile(
                                      value: _model.checkboxListTileValueMap[
                                          libraryVideoItem] ??= true,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.checkboxListTileValueMap[
                                                libraryVideoItem] = newValue!);
                                      },
                                      title: Text(
                                        libraryVideoIndex.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily,
                                              fontSize: 16.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeFamily),
                                            ),
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor: FlutterFlowTheme.of(context)
                                          .customColor7,
                                      checkColor:
                                          FlutterFlowTheme.of(context).primary,
                                      dense: true,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    if (_model.videoOptionsValue == 'URL')
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: TextFormField(
                          controller: _model.videoLinkController,
                          focusNode: _model.videoLinkFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.videoLinkController',
                            const Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintText: 'Link to your video...',
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).btnBk,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF1AADF9),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          validator: _model.videoLinkControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FFButtonWidget(
                            onPressed: (_model.addStatus != 'Add')
                                ? null
                                : () async {
                                    logFirebaseEvent(
                                        'VIDEO_GALLERY_COMP_ADD_BTN_ON_TAP');
                                    logFirebaseEvent(
                                        'Button_update_component_state');
                                    setState(() {
                                      _model.addStatus = 'Please wait...';
                                    });
                                    logFirebaseEvent('Button_wait__delay');
                                    await Future.delayed(
                                        const Duration(milliseconds: 1500));
                                    if (_model.videoOptionsValue == 'URL') {
                                      logFirebaseEvent(
                                          'Button_update_component_state');
                                      _model.addToVideoGallery(
                                          _model.videoLinkController.text);
                                      logFirebaseEvent(
                                          'Button_clear_text_fields_pin_codes');
                                      setState(() {
                                        _model.videoLinkController?.clear();
                                      });
                                      logFirebaseEvent(
                                          'Button_update_component_state');
                                      setState(() {
                                        _model.addStatus = 'Success';
                                      });
                                    } else if (_model.videoOptionsValue ==
                                        'Library') {
                                      logFirebaseEvent(
                                          'Button_update_component_state');
                                      setState(() {
                                        _model.addStatus = 'Success';
                                      });
                                      logFirebaseEvent(
                                          'Button_update_component_state');
                                      setState(() {
                                        _model.addStatus = 'Success';
                                      });
                                    } else if (_model.videoOptionsValue ==
                                        'Upload') {
                                      logFirebaseEvent(
                                          'Button_upload_media_to_firebase');
                                      final selectedMedia = await selectMedia(
                                        isVideo: true,
                                        mediaSource: MediaSource.videoGallery,
                                        multiImage: false,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading = true);
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
                                                    height:
                                                        m.dimensions?.height,
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
                                          showUploadMessage(
                                              context, 'Success!');
                                        } else {
                                          setState(() {});
                                          showUploadMessage(
                                              context, 'Failed to upload data');
                                          return;
                                        }
                                      }

                                      logFirebaseEvent(
                                          'Button_update_component_state');
                                      _model.addToVideoGallery(
                                          _model.uploadedFileUrl);
                                      _model.loopCounter = 0;
                                      logFirebaseEvent(
                                          'Button_clear_uploaded_data');
                                      setState(() {
                                        _model.isDataUploading = false;
                                        _model.uploadedLocalFile =
                                            FFUploadedFile(
                                                bytes: Uint8List.fromList([]));
                                        _model.uploadedFileUrl = '';
                                      });

                                      logFirebaseEvent(
                                          'Button_update_component_state');
                                      setState(() {
                                        _model.addStatus = 'Success';
                                      });
                                    } else {
                                      logFirebaseEvent(
                                          'Button_update_component_state');
                                      setState(() {
                                        _model.addStatus = 'Error';
                                      });
                                    }

                                    logFirebaseEvent('Button_wait__delay');
                                    await Future.delayed(
                                        const Duration(milliseconds: 3000));
                                    logFirebaseEvent(
                                        'Button_update_component_state');
                                    setState(() {
                                      _model.addStatus = 'Add';
                                    });
                                  },
                            text: 'Add',
                            options: FFButtonOptions(
                              height: 32.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: valueOrDefault<Color>(
                                () {
                                  if (_model.addStatus == 'Add') {
                                    return FlutterFlowTheme.of(context)
                                        .customColor7;
                                  } else if (_model.addStatus ==
                                      'Please wait...') {
                                    return FlutterFlowTheme.of(context).info;
                                  } else if (_model.addStatus == 'Success') {
                                    return FlutterFlowTheme.of(context).success;
                                  } else if (_model.addStatus == 'Error') {
                                    return FlutterFlowTheme.of(context).error;
                                  } else {
                                    return FlutterFlowTheme.of(context)
                                        .customColor7;
                                  }
                                }(),
                                FlutterFlowTheme.of(context).customColor7,
                              ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
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
                              borderRadius: BorderRadius.circular(8.0),
                              disabledColor:
                                  FlutterFlowTheme.of(context).accent2,
                              disabledTextColor:
                                  FlutterFlowTheme.of(context).primary,
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
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Icon(
                    Icons.video_collection_outlined,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Block Videos',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: Builder(
              builder: (context) {
                final gallerVideo = _model.videoGallery.toList();
                return ReorderableListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: gallerVideo.length,
                  itemBuilder: (context, gallerVideoIndex) {
                    final gallerVideoItem = gallerVideo[gallerVideoIndex];
                    return Container(
                      key: ValueKey("ListView_26kkqu13" '_' +
                          gallerVideoIndex.toString()),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: SizedBox(
                                width: 70.0,
                                height: 50.0,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.video_call,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(1.25, -1.5),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'VIDEO_GALLERY_COMP_Icon_q6b1885f_ON_TAP');
                                          logFirebaseEvent(
                                              'Icon_update_component_state');
                                          setState(() {
                                            _model.removeFromVideoGallery(
                                                gallerVideoItem);
                                          });
                                        },
                                        child: Icon(
                                          Icons.remove_circle_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 16.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.dynamicTextFieldModels.getModel(
                                    gallerVideoIndex.toString(),
                                    gallerVideoIndex,
                                  ),
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: DynamicTextFieldWidget(
                                    key: Key(
                                      'Keyc6a_${gallerVideoIndex.toString()}',
                                    ),
                                    hint: 'Name your photo',
                                    initialValue:
                                        'Video ${'Image ${(gallerVideoIndex + 1).toString()}'}',
                                    action: () async {},
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  onReorder: (int reorderableOldIndex,
                      int reorderableNewIndex) async {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
