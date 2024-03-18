import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/dynamic_text_field_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'image_gallery_model.dart';
export 'image_gallery_model.dart';

class ImageGalleryWidget extends StatefulWidget {
  const ImageGalleryWidget({
    super.key,
    this.blockDoc,
  });

  final TileBlocksRecord? blockDoc;

  @override
  State<ImageGalleryWidget> createState() => _ImageGalleryWidgetState();
}

class _ImageGalleryWidgetState extends State<ImageGalleryWidget> {
  late ImageGalleryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageGalleryModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('IMAGE_GALLERY_imageGallery_ON_INIT_STATE');
      logFirebaseEvent('imageGallery_update_component_state');
      setState(() {
        _model.imageGallery = widget.blockDoc!.hasImageGallery()
            ? widget.blockDoc!.imageGallery
            : functions.emptyImageList().toList().cast<String>();
      });
    });

    _model.imageLinkController ??= TextEditingController();
    _model.imageLinkFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
        tabletLandscape: false,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.easeInOut,
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxHeight: 300.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).accent2,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.add_photo_alternate_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Add one of more images ',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 12.0),
                          child: FlutterFlowChoiceChips(
                            options: [
                              ChipData('Library'),
                              ChipData('Upload'),
                              ChipData('URL')
                            ],
                            onChanged: (val) => setState(() =>
                                _model.imageOptionsValue = val?.firstOrNull),
                            selectedChipStyle: ChipStyle(
                              backgroundColor: Color(0xFF1AADF9),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).white,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              iconColor: FlutterFlowTheme.of(context).white,
                              iconSize: 18.0,
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 18.0,
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            chipSpacing: 12.0,
                            rowSpacing: 12.0,
                            multiselect: false,
                            initialized: _model.imageOptionsValue != null,
                            alignment: WrapAlignment.start,
                            controller: _model.imageOptionsValueController ??=
                                FormFieldController<List<String>>(
                              ['Upload'],
                            ),
                            wrapped: false,
                          ),
                        ),
                        if (_model.imageOptionsValue == 'Library')
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 0.0),
                              child: PagedGridView<DocumentSnapshot<Object?>?,
                                  ImagesRecord>(
                                pagingController: _model.setGridViewController(
                                  ImagesRecord.collection,
                                ),
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 1.0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                builderDelegate:
                                    PagedChildBuilderDelegate<ImagesRecord>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      Center(
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
                                  ),
                                  // Customize what your widget looks like when it's loading another page.
                                  newPageProgressIndicatorBuilder: (_) =>
                                      Center(
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
                                  ),

                                  itemBuilder: (context, _, gridViewIndex) {
                                    final gridViewImagesRecord = _model
                                        .gridViewPagingController!
                                        .itemList![gridViewIndex];
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 70.0,
                                        height: 75.0,
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'IMAGE_GALLERY_COMP_Image_o86wv9jd_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Image_expand_image');
                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          FlutterFlowExpandedImageView(
                                                        image: Image.network(
                                                          gridViewImagesRecord
                                                              .uploadedimage,
                                                          fit: BoxFit.contain,
                                                        ),
                                                        allowRotation: false,
                                                        tag:
                                                            gridViewImagesRecord
                                                                .uploadedimage,
                                                        useHeroAnimation: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag: gridViewImagesRecord
                                                      .uploadedimage,
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    child: Image.network(
                                                      gridViewImagesRecord
                                                          .uploadedimage,
                                                      width: 70.0,
                                                      height: 50.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (_model.imageGallery.contains(
                                                gridViewImagesRecord
                                                    .uploadedimage))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.2, -1.25),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'IMAGE_GALLERY_COMP_Icon_g3n1jggv_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_update_component_state');
                                                    setState(() {
                                                      _model.removeFromImageGallery(
                                                          gridViewImagesRecord
                                                              .uploadedimage);
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.remove_circle_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            if (!_model.imageGallery.contains(
                                                gridViewImagesRecord
                                                    .uploadedimage))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'IMAGE_GALLERY_COMP_Text_rfo3zvg3_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Text_update_component_state');
                                                    setState(() {
                                                      _model.addToImageGallery(
                                                          gridViewImagesRecord
                                                              .uploadedimage);
                                                    });
                                                  },
                                                  child: Text(
                                                    'Add',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: TextFormField(
                            key: ValueKey('images-field'),
                            controller: _model.imageLinkController,
                            focusNode: _model.imageLinkFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.imageLinkController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintText: 'Enter a name',
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).btnBk,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
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
                            validator: _model.imageLinkControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FFButtonWidget(
                                onPressed: (_model.addStatus != 'Add')
                                    ? null
                                    : () async {
                                        logFirebaseEvent(
                                            'IMAGE_GALLERY_COMP_ADD_BTN_ON_TAP');
                                        logFirebaseEvent(
                                            'Button_update_component_state');
                                        setState(() {
                                          _model.addStatus = 'Please wait...';
                                        });
                                        logFirebaseEvent('Button_wait__delay');
                                        await Future.delayed(
                                            const Duration(milliseconds: 1500));
                                        if (_model.imageOptionsValue == 'URL') {
                                          logFirebaseEvent(
                                              'Button_update_component_state');
                                          setState(() {
                                            _model.addToImageGallery(_model
                                                .imageLinkController.text);
                                          });
                                          logFirebaseEvent(
                                              'Button_clear_text_fields_pin_codes');
                                          setState(() {
                                            _model.imageLinkController?.clear();
                                          });
                                          logFirebaseEvent(
                                              'Button_update_component_state');
                                          setState(() {
                                            _model.addStatus = 'Success';
                                          });
                                        } else if (_model.imageOptionsValue ==
                                            'Library') {
                                        } else if (_model.imageOptionsValue ==
                                            'Upload') {
                                          logFirebaseEvent(
                                              'Button_upload_media_to_firebase');
                                          final selectedMedia =
                                              await selectMedia(
                                            includeDimensions: true,
                                            mediaSource:
                                                MediaSource.photoGallery,
                                            multiImage: true,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
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
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
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
                                                _model.uploadedLocalFiles =
                                                    selectedUploadedFiles;
                                                _model.uploadedFileUrls =
                                                    downloadUrls;
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
                                              'Button_update_component_state');
                                          setState(() {
                                            _model.loopCounter = 0;
                                            _model.imageGallery = _model
                                                .uploadedFileUrls
                                                .toList()
                                                .cast<String>();
                                          });
                                          logFirebaseEvent(
                                              'Button_clear_uploaded_data');
                                          setState(() {
                                            _model.isDataUploading = false;
                                            _model.uploadedLocalFiles = [];
                                            _model.uploadedFileUrls = [];
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: valueOrDefault<Color>(
                                    () {
                                      if (_model.addStatus == 'Add') {
                                        return FlutterFlowTheme.of(context)
                                            .customColor7;
                                      } else if (_model.addStatus ==
                                          'Please wait...') {
                                        return FlutterFlowTheme.of(context)
                                            .info;
                                      } else if (_model.addStatus ==
                                          'Success') {
                                        return FlutterFlowTheme.of(context)
                                            .success;
                                      } else if (_model.addStatus == 'Error') {
                                        return FlutterFlowTheme.of(context)
                                            .error;
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
                                  borderSide: BorderSide(
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
                              FFButtonWidget(
                                onPressed: (_model.addStatus != 'Add')
                                    ? null
                                    : () async {
                                        logFirebaseEvent(
                                            'IMAGE_GALLERY_COMP_SUBMIT_BTN_ON_TAP');
                                        logFirebaseEvent('Button_backend_call');

                                        await widget.blockDoc!.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'image_gallery':
                                                  FieldValue.arrayUnion([
                                                _model.imageGallery
                                                    .take(5)
                                                    .toList()
                                                    .first
                                              ]),
                                            },
                                          ),
                                        });
                                      },
                                text: 'Submit',
                                options: FFButtonOptions(
                                  height: 32.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: valueOrDefault<Color>(
                                    () {
                                      if (_model.addStatus == 'Add') {
                                        return FlutterFlowTheme.of(context)
                                            .customColor7;
                                      } else if (_model.addStatus ==
                                          'Please wait...') {
                                        return FlutterFlowTheme.of(context)
                                            .info;
                                      } else if (_model.addStatus ==
                                          'Success') {
                                        return FlutterFlowTheme.of(context)
                                            .success;
                                      } else if (_model.addStatus == 'Error') {
                                        return FlutterFlowTheme.of(context)
                                            .error;
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
                                  borderSide: BorderSide(
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
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.photo_library_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Block Images',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final galleryImage = _model.imageGallery.toList();
                    return ReorderableListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: galleryImage.length,
                      itemBuilder: (context, galleryImageIndex) {
                        final galleryImageItem =
                            galleryImage[galleryImageIndex];
                        return Container(
                          key: ValueKey("ListView_gdlp9fsl" +
                              '_' +
                              galleryImageIndex.toString()),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 32.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: Container(
                                    width: 70.0,
                                    height: 50.0,
                                    child: Stack(
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'IMAGE_GALLERY_COMP_Image_bfwlckzz_ON_TAP');
                                            logFirebaseEvent(
                                                'Image_expand_image');
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.network(
                                                    galleryImageItem,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: galleryImageItem,
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: galleryImageItem,
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              child: Image.network(
                                                galleryImageItem,
                                                width: 70.0,
                                                height: 50.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.15, -1.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'IMAGE_GALLERY_COMP_Icon_dftfbpox_ON_TAP');
                                              logFirebaseEvent(
                                                  'Icon_update_component_state');
                                              setState(() {
                                                _model.removeFromImageGallery(
                                                    galleryImageItem);
                                              });
                                            },
                                            child: Icon(
                                              Icons.remove_circle_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 16.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.dynamicTextFieldModels
                                          .getModel(
                                        galleryImageIndex.toString(),
                                        galleryImageIndex,
                                      ),
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: DynamicTextFieldWidget(
                                        key: Key(
                                          'Keypvk_${galleryImageIndex.toString()}',
                                        ),
                                        hint: 'Name your photo',
                                        initialValue:
                                            'Image ${(valueOrDefault<int>(
                                                  galleryImageIndex,
                                                  0,
                                                ) + 1).toString()}',
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
        ),
      ),
    );
  }
}
