import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/edit_text_block_widget.dart';
import '/components/image_gallery_widget.dart';
import '/components/video_gallery_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'darren_drawer_content_block_copy_model.dart';
export 'darren_drawer_content_block_copy_model.dart';

class DarrenDrawerContentBlockCopyWidget extends StatefulWidget {
  const DarrenDrawerContentBlockCopyWidget({
    super.key,
    this.editBlockId,
    this.action,
  });

  final String? editBlockId;
  final Future Function()? action;

  @override
  State<DarrenDrawerContentBlockCopyWidget> createState() =>
      _DarrenDrawerContentBlockCopyWidgetState();
}

class _DarrenDrawerContentBlockCopyWidgetState
    extends State<DarrenDrawerContentBlockCopyWidget> {
  late DarrenDrawerContentBlockCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DarrenDrawerContentBlockCopyModel());

    _model.blockTitleFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: StreamBuilder<List<TileBlocksRecord>>(
              stream: queryTileBlocksRecord(
                queryBuilder: (tileBlocksRecord) => tileBlocksRecord.where(
                  'block_id',
                  isEqualTo: widget.editBlockId,
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
                List<TileBlocksRecord> columnTileBlocksRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final columnTileBlocksRecord =
                    columnTileBlocksRecordList.isNotEmpty
                        ? columnTileBlocksRecordList.first
                        : null;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 24.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                width: 32.0,
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF1AADF9),
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  '1',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color: Colors.white,
                                                        fontSize: 20.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Label',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.blockTitleController ??=
                                        TextEditingController(
                                      text: columnTileBlocksRecord?.title,
                                    ),
                                    focusNode: _model.blockTitleFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.blockTitleController',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      hintText: 'Enter a name',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .btnBk,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF1AADF9),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    validator: _model
                                        .blockTitleControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 24.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 32.0,
                                            height: 32.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF1AADF9),
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              '2',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color: Colors.white,
                                                        fontSize: 20.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'DARREN_DRAWER_CONTENT_BLOCK_COPY_Text_x7');
                                            logFirebaseEvent(
                                                'Text_update_component_state');
                                            setState(() {});
                                          },
                                          child: Text(
                                            'Change Type',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 16.0, 0.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.blockTypeValueController ??=
                                              FormFieldController<String>(
                                        _model.blockTypeValue ??=
                                            columnTileBlocksRecord?.blockType,
                                      ),
                                      options: [
                                        'Text',
                                        'Image',
                                        'Video',
                                        'Audio',
                                        'Link',
                                        'File'
                                      ],
                                      onChanged: (val) => setState(
                                          () => _model.blockTypeValue = val),
                                      width: 302.0,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      hintText: 'Please select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Color(0xFF1AADF9),
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        if (valueOrDefault<bool>(
                                          _model.blockTypeValue == 'Text',
                                          false,
                                        )) {
                                          return wrapWithModel(
                                            model: _model.editTextBlockModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: EditTextBlockWidget(
                                              blockDoc: columnTileBlocksRecord,
                                            ),
                                          );
                                        } else if (valueOrDefault<bool>(
                                          _model.blockTypeValue == 'Image',
                                          false,
                                        )) {
                                          return wrapWithModel(
                                            model: _model.imageGalleryModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: ImageGalleryWidget(
                                              blockDoc: columnTileBlocksRecord,
                                            ),
                                          );
                                        } else if (valueOrDefault<bool>(
                                          _model.blockTypeValue == 'Video',
                                          false,
                                        )) {
                                          return wrapWithModel(
                                            model: _model.videoGalleryModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: VideoGalleryWidget(
                                              blockDoc: columnTileBlocksRecord!,
                                            ),
                                          );
                                        } else if (valueOrDefault<bool>(
                                          _model.blockTypeValue == 'Audio',
                                          false,
                                        )) {
                                          return Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'Audio Coming Soon...',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          );
                                        } else if (valueOrDefault<bool>(
                                          _model.blockTypeValue == 'Link',
                                          false,
                                        )) {
                                          return Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'Links Coming Soon...',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          );
                                        } else if (valueOrDefault<bool>(
                                          _model.blockTypeValue == 'File',
                                          false,
                                        )) {
                                          return Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'Files Coming Soon...',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.handPointUp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor7,
                                                size: 48.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 0.0),
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
                                                        'DARREN_DRAWER_CONTENT_BLOCK_COPY_Text_jk');
                                                    logFirebaseEvent(
                                                        'Text_update_component_state');
                                                    setState(() {});
                                                  },
                                                  child: Text(
                                                    'Choose a content ype for this block ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          useGoogleFonts:
                                                              GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Poppins'),
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }
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
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).accent3,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 24.0, 16.0, 24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'DARREN_DRAWER_CONTENT_BLOCK_COPY_CANCEL_');
                              logFirebaseEvent('Button_update_component_state');
                              _model.callbackTab = 1;
                              logFirebaseEvent('Button_execute_callback');
                              await widget.action?.call();
                            },
                            text: 'Cancel',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'DARREN_DRAWER_CONTENT_BLOCK_COPY_DELETE_');
                              logFirebaseEvent('Button_update_component_state');
                              setState(() {
                                _model.callbackTab = 1;
                              });
                              logFirebaseEvent('Button_backend_call');
                              await columnTileBlocksRecord!.reference.delete();
                              logFirebaseEvent('Button_execute_callback');
                              await widget.action?.call();
                            },
                            text: 'DELETE',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).error,
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
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'DARREN_DRAWER_CONTENT_BLOCK_COPY_SAVE_BT');
                              if (_model.blockTypeValue == 'Text') {
                                logFirebaseEvent('Button_backend_call');

                                await columnTileBlocksRecord!.reference.update({
                                  ...createTileBlocksRecordData(
                                    updatedTime: getCurrentTimestamp,
                                    blockTitle:
                                        _model.blockTitleController.text,
                                    blockType: _model.blockTypeValue,
                                    blockStatus: 'Published',
                                    blockLayout: _model
                                        .editTextBlockModel.textIOptionsValue,
                                    text: valueOrDefault<String>(
                                      () {
                                        if (_model.editTextBlockModel
                                                .textIOptionsValue ==
                                            'Body') {
                                          return _model.editTextBlockModel
                                              .paragraphController.text;
                                        } else if (_model.editTextBlockModel
                                                .textIOptionsValue ==
                                            'Header') {
                                          return _model.editTextBlockModel
                                              .headerController.text;
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      '-',
                                    ),
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'textList': _model.editTextBlockModel
                                          .textListModel.dynamicTextFieldModels
                                          .getValues(
                                        (m) => m.bulletListFieldController.text,
                                      ),
                                    },
                                  ),
                                });
                              } else if (_model.blockTypeValue == 'Image') {
                                logFirebaseEvent('Button_backend_call');

                                await columnTileBlocksRecord!.reference.update({
                                  ...createTileBlocksRecordData(
                                    updatedTime: getCurrentTimestamp,
                                    blockTitle:
                                        _model.blockTitleController.text,
                                    blockType: 'Image',
                                    blockStatus: 'Published',
                                    blockLayout: 'Gallery',
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'image_gallery':
                                          _model.imageGalleryModel.imageGallery,
                                      'textList': _model.imageGalleryModel
                                          .dynamicTextFieldModels
                                          .getValues(
                                        (m) => m.bulletListFieldController.text,
                                      ),
                                    },
                                  ),
                                });
                              } else if (_model.blockTypeValue == 'Video') {
                                logFirebaseEvent('Button_backend_call');

                                await columnTileBlocksRecord!.reference.update({
                                  ...createTileBlocksRecordData(
                                    updatedTime: getCurrentTimestamp,
                                    blockTitle:
                                        _model.blockTitleController.text,
                                    blockType: 'Video',
                                    blockStatus: 'Published',
                                    blockLayout: 'Gallery',
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'video_gallery':
                                          _model.videoGalleryModel.videoGallery,
                                      'textList': _model.videoGalleryModel
                                          .dynamicTextFieldModels
                                          .getValues(
                                        (m) => m.bulletListFieldController.text,
                                      ),
                                    },
                                  ),
                                });
                              }

                              logFirebaseEvent('Button_update_component_state');
                              _model.callbackTab = 1;
                              logFirebaseEvent('Button_execute_callback');
                              await widget.action?.call();
                            },
                            text: 'Save',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF1AADF9),
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          if (widget.editBlockId == null || widget.editBlockId == '')
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('DARREN_DRAWER_CONTENT_BLOCK_COPY_SELECT_');
                logFirebaseEvent('Button_update_component_state');
                _model.callbackTab = 1;
                logFirebaseEvent('Button_execute_callback');
                await widget.action?.call();
              },
              text: 'Select a Block',
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily),
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).customColor7,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
        ],
      ),
    );
  }
}
