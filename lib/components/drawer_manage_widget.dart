import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/drawer_content_widget.dart';
import '/components/dynamic_toggle_icon_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'drawer_manage_model.dart';
export 'drawer_manage_model.dart';

class DrawerManageWidget extends StatefulWidget {
  const DrawerManageWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
    this.parameter6,
  });

  final String? parameter1;
  final String? parameter2;
  final int? parameter3;
  final String? parameter4;
  final int? parameter5;
  final List<Tilesv2Record>? parameter6;

  @override
  State<DrawerManageWidget> createState() => _DrawerManageWidgetState();
}

class _DrawerManageWidgetState extends State<DrawerManageWidget> {
  late DrawerManageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawerManageModel());

    _model.textController ??= TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().viewTileContentId != null &&
              FFAppState().viewTileContentId != ''
          ? widget.parameter2
          : valueOrDefault<String>(
              'New ${valueOrDefault<String>(
                FFAppState().drawerView,
                'Tile',
              )} ${valueOrDefault<String>(
                ((widget.parameter3!) + 1).toString(),
                '1',
              )}',
              'New Tile 1',
            ),
      'New Tile',
    ));
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

    return StreamBuilder<List<Tilesv2Record>>(
      stream: queryTilesv2Record(),
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
        List<Tilesv2Record> containerTilesv2RecordList = snapshot.data!;
        return Container(
          width: 350.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: StreamBuilder<List<TileBlocksRecord>>(
            stream: queryTileBlocksRecord(),
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
              List<TileBlocksRecord> containerTileBlocksRecordList =
                  snapshot.data!;
              return Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 50.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 20.0, 0.0),
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.arrow_back_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'DRAWER_MANAGE_arrow_back_outlined_ICN_ON');
                                      logFirebaseEvent(
                                          'IconButton_close_dialog,_drawer,_etc');
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ),
                              Text(
                                'Admin Panel',
                                style:
                                    FlutterFlowTheme.of(context).headlineLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 20.0, 12.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3.0,
                              color: Color(0x411D2429),
                              offset: Offset(0.0, 1.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 70.0,
                                height: 70.0,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      if (valueOrDefault<bool>(
                                        FFAppState().viewTileContentId ==
                                            'DrawerAdmin',
                                        false,
                                      )) {
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'DRAWER_MANAGE_COMP_Image_gstpj40f_ON_TAP');
                                            logFirebaseEvent(
                                                'Image_upload_media_to_firebase');
                                            final selectedMedia =
                                                await selectMediaWithSourceBottomSheet(
                                              context: context,
                                              maxWidth: 400.00,
                                              maxHeight: 400.00,
                                              allowPhoto: true,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              setState(() => _model
                                                  .isDataUploading = true);
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
                                                        .map((m) =>
                                                            FFUploadedFile(
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

                                                downloadUrls =
                                                    (await Future.wait(
                                                  selectedMedia.map(
                                                    (m) async =>
                                                        await uploadData(
                                                            m.storagePath,
                                                            m.bytes),
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
                                              if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length &&
                                                  downloadUrls.length ==
                                                      selectedMedia.length) {
                                                setState(() {
                                                  _model.uploadedLocalFile =
                                                      selectedUploadedFiles
                                                          .first;
                                                  _model.uploadedFileUrl =
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
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                _model.uploadedFileUrl !=
                                                            null &&
                                                        _model.uploadedFileUrl !=
                                                            ''
                                                    ? valueOrDefault<String>(
                                                        _model.uploadedFileUrl,
                                                        'https://firebasestorage.googleapis.com/v0/b/tony-morris-internationa-1b480.appspot.com/o/assets%2Fdefault_app.png?alt=media&token=a875e4be-e40f-4d8e-b595-6605c82e7510',
                                                      )
                                                    : 'https://firebasestorage.googleapis.com/v0/b/tony-morris-internationa-1b480.appspot.com/o/assets%2Fdefault_app.png?alt=media&token=a875e4be-e40f-4d8e-b595-6605c82e7510',
                                                'https://firebasestorage.googleapis.com/v0/b/tony-morris-internationa-1b480.appspot.com/o/assets%2Fdefault_app.png?alt=media&token=a875e4be-e40f-4d8e-b595-6605c82e7510',
                                              ),
                                              width: 80.0,
                                              height: 80.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      } else if (valueOrDefault<bool>(
                                        FFAppState().drawerView == 'Tile',
                                        false,
                                      )) {
                                        return Container(
                                          width: 80.0,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF1AADF9),
                                                Color(0xA41A5AF9)
                                              ],
                                              stops: [0.31, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.dashboard_customize_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 48.0,
                                            ),
                                          ),
                                        );
                                      } else if (valueOrDefault<bool>(
                                        FFAppState().drawerView == 'Block',
                                        false,
                                      )) {
                                        return Container(
                                          width: 80.0,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF1AADF9),
                                                Color(0xA41A5AF9)
                                              ],
                                              stops: [0.31, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.featured_play_list_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 48.0,
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          width: 80.0,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF1AADF9),
                                                Color(0xA41A5AF9)
                                              ],
                                              stops: [0.31, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.dashboard_customize_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 48.0,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 4.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            '${valueOrDefault<String>(
                                              widget.parameter1 != null &&
                                                      widget.parameter1 != ''
                                                  ? 'Edit Tile'
                                                  : 'New Tile',
                                              'New Tile',
                                            )}',
                                            'New Tile',
                                          ),
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF090F13),
                                                fontSize: 32.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts:
                                                    GoogleFonts.asMap()
                                                        .containsKey('Outfit'),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.dynamicToggleIconModel,
                                updateCallback: () => setState(() {}),
                                child: DynamicToggleIconWidget(
                                  initalValue: false,
                                  toggleOn: Icon(
                                    Icons.check,
                                    color: FlutterFlowTheme.of(context).success,
                                    size: 24.0,
                                  ),
                                  toggleOff: Icon(
                                    Icons.mode_edit,
                                    color: FlutterFlowTheme.of(context).accent2,
                                    size: 24.0,
                                  ),
                                  action: () async {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Builder(
                                  builder: (context) {
                                    if (valueOrDefault<bool>(
                                      FFAppState().callbackAction ==
                                          'AdminDrawer',
                                      false,
                                    )) {
                                      return wrapWithModel(
                                        model: _model.drawerContentModel,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: DrawerContentWidget(),
                                      );
                                    } else if (valueOrDefault<bool>(
                                      true,
                                      true,
                                    )) {
                                      return Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 24.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Builder(
                                                    builder: (context) {
                                                      if (valueOrDefault<bool>(
                                                        true,
                                                        true,
                                                      )) {
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          24.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Container(
                                                                                width: 32.0,
                                                                                height: 32.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFF1AADF9),
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  '1',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: Colors.white,
                                                                                        fontSize: 20.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'Name',
                                                                              style: FlutterFlowTheme.of(context).titleMedium,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if (valueOrDefault<bool>(
                                                                              false,
                                                                              false,
                                                                            )) {
                                                                              return InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('DRAWER_MANAGE_COMP_Icon_33s5d3to_ON_TAP');
                                                                                  logFirebaseEvent('Icon_reset_form_fields');
                                                                                  setState(() {
                                                                                    _model.textController?.text = valueOrDefault<String>(
                                                                                      FFAppState().viewTileContentId != null && FFAppState().viewTileContentId != ''
                                                                                          ? widget.parameter2
                                                                                          : valueOrDefault<String>(
                                                                                              'New ${valueOrDefault<String>(
                                                                                                FFAppState().drawerView,
                                                                                                'Tile',
                                                                                              )} ${valueOrDefault<String>(
                                                                                                ((widget.parameter3!) + 1).toString(),
                                                                                                '1',
                                                                                              )}',
                                                                                              'New Tile 1',
                                                                                            ),
                                                                                      'New Tile',
                                                                                    );
                                                                                  });
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.cancel,
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  size: 24.0,
                                                                                ),
                                                                              );
                                                                            } else if (valueOrDefault<bool>(
                                                                              _model.textController.text != null && _model.textController.text != '',
                                                                              false,
                                                                            )) {
                                                                              return InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('DRAWER_MANAGE_COMP_Icon_450dvmrm_ON_TAP');
                                                                                  logFirebaseEvent('Icon_update_component_state');
                                                                                  setState(() {});
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.check,
                                                                                  color: FlutterFlowTheme.of(context).success,
                                                                                  size: 24.0,
                                                                                ),
                                                                              );
                                                                            } else {
                                                                              return Container(
                                                                                width: 100.0,
                                                                                height: 100.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                              );
                                                                            }
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          8.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textController,
                                                                    focusNode:
                                                                        _model
                                                                            .textFieldFocusNode,
                                                                    onChanged: (_) =>
                                                                        EasyDebounce
                                                                            .debounce(
                                                                      '_model.textController',
                                                                      Duration(
                                                                          milliseconds:
                                                                              2000),
                                                                      () => setState(
                                                                          () {}),
                                                                    ),
                                                                    autofocus:
                                                                        true,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelText:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        FFAppState()
                                                                            .drawerView,
                                                                        'Tile',
                                                                      ),
                                                                      labelStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMedium,
                                                                      hintStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMedium,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).btnBk,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0xFF1AADF9),
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                    validator: _model
                                                                        .textControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          24.0,
                                                                          16.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Container(
                                                                                width: 32.0,
                                                                                height: 32.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFF1AADF9),
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  '2',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: Colors.white,
                                                                                        fontSize: 20.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'Choose type',
                                                                              style: FlutterFlowTheme.of(context).titleMedium,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child:
                                                                      FlutterFlowDropDown<
                                                                          int>(
                                                                    controller: _model
                                                                            .dropDownTypeValueController ??=
                                                                        FormFieldController<
                                                                            int>(
                                                                      _model.dropDownTypeValue ??=
                                                                          valueOrDefault<
                                                                              int>(
                                                                        FFAppState().viewTileContentId != null &&
                                                                                FFAppState().viewTileContentId != ''
                                                                            ? widget.parameter5
                                                                            : 0,
                                                                        0,
                                                                      ),
                                                                    ),
                                                                    options: List<
                                                                        int>.from([
                                                                      0,
                                                                      1,
                                                                      2
                                                                    ]),
                                                                    optionLabels: [
                                                                      'Page',
                                                                      'Section',
                                                                      'Tie'
                                                                    ],
                                                                    onChanged: (val) =>
                                                                        setState(() =>
                                                                            _model.dropDownTypeValue =
                                                                                val),
                                                                    width:
                                                                        300.0,
                                                                    height:
                                                                        50.0,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                    hintText:
                                                                        'Please select...',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        Color(
                                                                            0xFF1AADF9),
                                                                    borderWidth:
                                                                        2.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            16.0,
                                                                            4.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            24.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 32.0,
                                                                                  height: 32.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFF1AADF9),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    '3',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: Colors.white,
                                                                                          fontSize: 20.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('DRAWER_MANAGE_COMP_Text_lyfryn8a_ON_TAP');
                                                                                  logFirebaseEvent('Text_update_component_state');
                                                                                  setState(() {});
                                                                                },
                                                                                child: Text(
                                                                                  'Options',
                                                                                  style: FlutterFlowTheme.of(context).titleMedium,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        ListView(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      children: [
                                                                        SwitchListTile
                                                                            .adaptive(
                                                                          value: _model.switchListTileValue1 ??=
                                                                              true,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            setState(() =>
                                                                                _model.switchListTileValue1 = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            'Members',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).titleLarge,
                                                                          ),
                                                                          tileColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          activeColor:
                                                                              Color(0xFF1AADF9),
                                                                          activeTrackColor:
                                                                              FlutterFlowTheme.of(context).accent1,
                                                                          dense:
                                                                              false,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                        AnimatedContainer(
                                                                          duration:
                                                                              Duration(milliseconds: 160),
                                                                          curve:
                                                                              Curves.easeIn,
                                                                          width:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              SwitchListTile.adaptive(
                                                                                value: _model.switchListTileValue2 ??= false,
                                                                                onChanged: (newValue) async {
                                                                                  setState(() => _model.switchListTileValue2 = newValue!);
                                                                                },
                                                                                title: Text(
                                                                                  'Subscriptions',
                                                                                  style: FlutterFlowTheme.of(context).titleLarge,
                                                                                ),
                                                                                tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                activeTrackColor: FlutterFlowTheme.of(context).accent1,
                                                                                dense: false,
                                                                                controlAffinity: ListTileControlAffinity.trailing,
                                                                              ),
                                                                              if (_model.switchListTileValue2 ?? true)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                                                                                  child: FlutterFlowDropDown<String>(
                                                                                    controller: _model.dropDownGroupValueController ??= FormFieldController<String>(
                                                                                      _model.dropDownGroupValue ??= valueOrDefault<String>(
                                                                                        FFAppState().viewTileContentId != null && FFAppState().viewTileContentId != ''
                                                                                            ? widget.parameter4
                                                                                            : valueOrDefault<String>(
                                                                                                'New ${valueOrDefault<String>(
                                                                                                  FFAppState().drawerView,
                                                                                                  'Tile',
                                                                                                )} ${valueOrDefault<String>(
                                                                                                  ((widget.parameter3!) + 1).toString(),
                                                                                                  '1',
                                                                                                )}',
                                                                                                'New Tile 1',
                                                                                              ),
                                                                                        'New Tile',
                                                                                      ),
                                                                                    ),
                                                                                    options: [
                                                                                      'Basic',
                                                                                      'Pro',
                                                                                      'All Access'
                                                                                    ],
                                                                                    onChanged: (val) => setState(() => _model.dropDownGroupValue = val),
                                                                                    width: 300.0,
                                                                                    height: 50.0,
                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    hintText: 'Please select...',
                                                                                    icon: Icon(
                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    elevation: 2.0,
                                                                                    borderColor: Color(0xFF1AADF9),
                                                                                    borderWidth: 2.0,
                                                                                    borderRadius: 8.0,
                                                                                    margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                    hidesUnderline: true,
                                                                                    isSearchable: false,
                                                                                    isMultiSelect: false,
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SwitchListTile
                                                                            .adaptive(
                                                                          value: _model.switchListTileValue3 ??=
                                                                              false,
                                                                          onChanged:
                                                                              (newValue) async {
                                                                            setState(() =>
                                                                                _model.switchListTileValue3 = newValue!);
                                                                          },
                                                                          title:
                                                                              Text(
                                                                            'Livestreams',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).titleLarge,
                                                                          ),
                                                                          tileColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          activeColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          activeTrackColor:
                                                                              FlutterFlowTheme.of(context).accent1,
                                                                          dense:
                                                                              false,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.trailing,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      } else {
                                                        return Builder(
                                                          builder: (context) {
                                                            final tiles =
                                                                containerTilesv2RecordList
                                                                    .toList();
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  tiles.length,
                                                              itemBuilder:
                                                                  (context,
                                                                      tilesIndex) {
                                                                final tilesItem =
                                                                    tiles[
                                                                        tilesIndex];
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          20.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).btnBk,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: 80.0,
                                                                                height: 80.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  image: DecorationImage(
                                                                                    fit: BoxFit.cover,
                                                                                    image: Image.network(
                                                                                      tilesItem.thumbnail,
                                                                                    ).image,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.featured_video,
                                                                                    color: Color(0x591AADF9),
                                                                                    size: 48.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              tilesItem.tileTier.toString(),
                                                                                              '0',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  color: Color(0xFF090F13),
                                                                                                  fontSize: 18.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 10.0,
                                                                                              height: 10.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0xFF1AADF9),
                                                                                                shape: BoxShape.circle,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            tilesItem.title,
                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  color: Color(0xFF090F13),
                                                                                                  fontSize: 18.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 8.0, 0.0),
                                                                                              child: AutoSizeText(
                                                                                                tilesItem.type.maybeHandleOverflow(
                                                                                                  maxChars: 70,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                                textAlign: TextAlign.start,
                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                      fontFamily: 'Outfit',
                                                                                                      color: valueOrDefault<Color>(
                                                                                                        () {
                                                                                                          if (tilesItem.isPublished == true) {
                                                                                                            return FlutterFlowTheme.of(context).success;
                                                                                                          } else if (tilesItem.isPublished == false) {
                                                                                                            return FlutterFlowTheme.of(context).warning;
                                                                                                          } else if (tilesItem.isPublished == false) {
                                                                                                            return FlutterFlowTheme.of(context).error;
                                                                                                          } else {
                                                                                                            return Color(0xFF7C8791);
                                                                                                          }
                                                                                                        }(),
                                                                                                        Color(0xFF7C8791),
                                                                                                      ),
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 50.0,
                                                                                              height: 50.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              ),
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Builder(
                                                                                                builder: (context) {
                                                                                                  if (true) {
                                                                                                    return InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        logFirebaseEvent('DRAWER_MANAGE_COMP_Icon_qgte7gfh_ON_TAP');
                                                                                                        logFirebaseEvent('Icon_update_component_state');
                                                                                                        setState(() {});
                                                                                                      },
                                                                                                      child: Icon(
                                                                                                        Icons.close,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        size: 24.0,
                                                                                                      ),
                                                                                                    );
                                                                                                  } else {
                                                                                                    return Container(
                                                                                                      width: 100.0,
                                                                                                      height: 100.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ],
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
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  32.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'DRAWER_MANAGE_COMP_CANCEL_BTN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Button_drawer');
                                                          if (Scaffold.of(
                                                                      context)
                                                                  .isDrawerOpen ||
                                                              Scaffold.of(
                                                                      context)
                                                                  .isEndDrawerOpen) {
                                                            Navigator.pop(
                                                                context);
                                                          }
                                                        },
                                                        text: 'Cancel',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .selectedButton,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: Colors
                                                                        .white,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
                                                                  ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  32.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'DRAWER_MANAGE_COMP_CREATE_APP_BTN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Button_backend_call');

                                                          var tilesv2RecordReference =
                                                              Tilesv2Record
                                                                  .collection
                                                                  .doc();
                                                          await tilesv2RecordReference
                                                              .set({
                                                            ...createTilesv2RecordData(
                                                              createdTime:
                                                                  getCurrentTimestamp,
                                                              updatedTime:
                                                                  getCurrentTimestamp,
                                                              user:
                                                                  currentUserReference,
                                                              uid:
                                                                  currentUserUid,
                                                              type: 'Text',
                                                              title: _model
                                                                  .textController
                                                                  .text,
                                                              subtitle: '',
                                                              details: '',
                                                              image: '',
                                                              thumbnail: '',
                                                              isPublished: true,
                                                              layout: '',
                                                              category: '',
                                                              isPublic: true,
                                                              isPinned: false,
                                                              isFeatured: false,
                                                              parentId: FFAppState()
                                                                              .drawerCurrentId !=
                                                                          null &&
                                                                      FFAppState()
                                                                              .drawerCurrentId !=
                                                                          ''
                                                                  ? FFAppState()
                                                                      .drawerCurrentId
                                                                  : '',
                                                              tileTier: 0,
                                                              isContent: true,
                                                              tileIndex: 0,
                                                            ),
                                                            ...mapToFirestore(
                                                              {
                                                                'tags': [''],
                                                                'access_groups':
                                                                    [''],
                                                                'access_users':
                                                                    [''],
                                                                'admin_users': [
                                                                  currentUserUid
                                                                ],
                                                              },
                                                            ),
                                                          });
                                                          _model.newTile =
                                                              Tilesv2Record
                                                                  .getDocumentFromData({
                                                            ...createTilesv2RecordData(
                                                              createdTime:
                                                                  getCurrentTimestamp,
                                                              updatedTime:
                                                                  getCurrentTimestamp,
                                                              user:
                                                                  currentUserReference,
                                                              uid:
                                                                  currentUserUid,
                                                              type: 'Text',
                                                              title: _model
                                                                  .textController
                                                                  .text,
                                                              subtitle: '',
                                                              details: '',
                                                              image: '',
                                                              thumbnail: '',
                                                              isPublished: true,
                                                              layout: '',
                                                              category: '',
                                                              isPublic: true,
                                                              isPinned: false,
                                                              isFeatured: false,
                                                              parentId: FFAppState()
                                                                              .drawerCurrentId !=
                                                                          null &&
                                                                      FFAppState()
                                                                              .drawerCurrentId !=
                                                                          ''
                                                                  ? FFAppState()
                                                                      .drawerCurrentId
                                                                  : '',
                                                              tileTier: 0,
                                                              isContent: true,
                                                              tileIndex: 0,
                                                            ),
                                                            ...mapToFirestore(
                                                              {
                                                                'tags': [''],
                                                                'access_groups':
                                                                    [''],
                                                                'access_users':
                                                                    [''],
                                                                'admin_users': [
                                                                  currentUserUid
                                                                ],
                                                              },
                                                            ),
                                                          }, tilesv2RecordReference);
                                                          logFirebaseEvent(
                                                              'Button_update_app_state');
                                                          setState(() {
                                                            FFAppState()
                                                                    .drawerCurrentId =
                                                                _model
                                                                    .newTile!
                                                                    .reference
                                                                    .id;
                                                            FFAppState()
                                                                    .viewTileContentId =
                                                                _model
                                                                    .newTile!
                                                                    .reference
                                                                    .id;
                                                          });

                                                          setState(() {});
                                                        },
                                                        text: 'Create App',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              Color(0xFF1AADF9),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: Colors
                                                                        .white,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
                                                                  ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      );
                                    }
                                  },
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
          ),
        );
      },
    );
  }
}
