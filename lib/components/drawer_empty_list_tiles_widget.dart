import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'drawer_empty_list_tiles_model.dart';
export 'drawer_empty_list_tiles_model.dart';

class DrawerEmptyListTilesWidget extends StatefulWidget {
  const DrawerEmptyListTilesWidget({
    super.key,
    this.tileDoc,
    this.action,
  });

  final Tilesv2Record? tileDoc;
  final Future Function()? action;

  @override
  State<DrawerEmptyListTilesWidget> createState() =>
      _DrawerEmptyListTilesWidgetState();
}

class _DrawerEmptyListTilesWidgetState
    extends State<DrawerEmptyListTilesWidget> {
  late DrawerEmptyListTilesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawerEmptyListTilesModel());

    _model.textFieldNameController ??= TextEditingController();
    _model.textFieldNameFocusNode ??= FocusNode();

    _model.expandableController = ExpandableController(initialExpanded: false);
    _model.textFieldNewGroupController ??= TextEditingController();
    _model.textFieldNewGroupFocusNode ??= FocusNode();

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

    return Visibility(
      visible: valueOrDefault<bool>(
            (widget.tileDoc != null) == true,
            false,
          ) &&
          valueOrDefault<bool>(
            valueOrDefault<bool>(currentUserDocument?.isadmin, false),
            false,
          ),
      child: AuthUserStreamWidget(
        builder: (context) => StreamBuilder<Tilesv2Record>(
          stream: Tilesv2Record.getDocument(widget.tileDoc!.reference),
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
            final containerTilesv2Record = snapshot.data!;
            return AnimatedContainer(
              duration: Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 7.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.network(
                                            containerTilesv2Record.image,
                                          ).image,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .btnBk,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: MouseRegion(
                                        opaque: false,
                                        cursor: MouseCursor.defer ??
                                            MouseCursor.defer,
                                        child: Visibility(
                                          visible: valueOrDefault<bool>(
                                            containerTilesv2Record.image ==
                                                    null ||
                                                containerTilesv2Record.image ==
                                                    '',
                                            true,
                                          ),
                                          child: Opacity(
                                            opacity: 0.9,
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DRAWER_EMPTY_LIST_TILES_Container_677ohv');
                                                logFirebaseEvent(
                                                    'Container_upload_media_to_firebase');
                                                final selectedMedia =
                                                    await selectMedia(
                                                  mediaSource:
                                                      MediaSource.photoGallery,
                                                  multiImage: false,
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
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
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
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentSnackBar();
                                                    _model.isDataUploading =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
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

                                                logFirebaseEvent(
                                                    'Container_backend_call');

                                                await containerTilesv2Record
                                                    .reference
                                                    .update(
                                                        createTilesv2RecordData(
                                                  image: _model.uploadedFileUrl,
                                                ));
                                              },
                                              child: Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x121AADF9),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  12.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .btnBk,
                                                        borderRadius: 8.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons
                                                              .add_a_photo_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor7,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.4,
                                                      child: Text(
                                                        containerTilesv2Record
                                                                        .image !=
                                                                    null &&
                                                                containerTilesv2Record
                                                                        .image !=
                                                                    ''
                                                            ? 'Change Cover Image'
                                                            : 'Add a cover photo',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        onEnter: ((event) async {
                                          setState(() =>
                                              _model.mouseRegionHovered = true);
                                          logFirebaseEvent(
                                              'DRAWER_EMPTY_LIST_TILES_MouseRegion_4p7e');
                                          if (containerTilesv2Record.image !=
                                                  null &&
                                              containerTilesv2Record.image !=
                                                  '') {
                                            logFirebaseEvent(
                                                'MouseRegion_update_component_state');
                                            setState(() {
                                              _model.imageOpacity = 100.0;
                                            });
                                          }
                                        }),
                                        onExit: ((event) async {
                                          setState(() => _model
                                              .mouseRegionHovered = false);
                                          logFirebaseEvent(
                                              'DRAWER_EMPTY_LIST_TILES_MouseRegion_4p7e');
                                          if (containerTilesv2Record.image !=
                                                  null &&
                                              containerTilesv2Record.image !=
                                                  '') {
                                            logFirebaseEvent(
                                                'MouseRegion_update_component_state');
                                            setState(() {
                                              _model.imageOpacity = 0.0;
                                            });
                                          }
                                        }),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
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
                                                  alignment:
                                                      AlignmentDirectional(
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Name your Tile',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium,
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
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.arrow_forward_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 8.0, 24.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.textFieldNameController,
                                        focusNode:
                                            _model.textFieldNameFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textFieldNameController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            logFirebaseEvent(
                                                'DRAWER_EMPTY_LIST_TILES_TextFieldName_ON');
                                            logFirebaseEvent(
                                                'TextFieldName_backend_call');

                                            await containerTilesv2Record
                                                .reference
                                                .update(createTilesv2RecordData(
                                              tileName: _model
                                                  .textFieldNameController.text,
                                              title: _model
                                                  .textFieldNameController.text,
                                            ));
                                            logFirebaseEvent(
                                                'TextFieldName_update_component_state');
                                            setState(() {
                                              _model.isStatusTextVisible = true;
                                            });
                                            logFirebaseEvent(
                                                'TextFieldName_wait__delay');
                                            await Future.delayed(const Duration(
                                                milliseconds: 1500));
                                            logFirebaseEvent(
                                                'TextFieldName_update_component_state');
                                            setState(() {
                                              _model.isStatusTextVisible =
                                                  false;
                                            });
                                          },
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily,
                                                fontSize: 16.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily),
                                              ),
                                          hintText: widget.tileDoc != null
                                              ? widget.tileDoc?.title
                                              : 'Give it a friendly name',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily,
                                                fontSize: 16.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily),
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
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
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .customColor7,
                                        validator: _model
                                            .textFieldNameControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color: FlutterFlowTheme.of(context).accent4,
                                  ),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: ExpandableNotifier(
                                    controller: _model.expandableController,
                                    child: ExpandablePanel(
                                      header: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 24.0, 16.0, 8.0),
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: 32.0,
                                                      height: 32.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF1AADF9),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        '2',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      20.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Tile Settings',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.arrow_forward_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      collapsed: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                      expanded: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .selectTileTypeValueController ??=
                                                          FormFieldController<
                                                              String>(
                                                        _model.selectTileTypeValue ??=
                                                            valueOrDefault<
                                                                String>(
                                                          widget.tileDoc
                                                              ?.tileType,
                                                          'Content',
                                                        ),
                                                      ),
                                                      options: [
                                                        'Collection',
                                                        'Section',
                                                        'Content'
                                                      ],
                                                      onChanged: (val) async {
                                                        setState(() => _model
                                                                .selectTileTypeValue =
                                                            val);
                                                        logFirebaseEvent(
                                                            'DRAWER_EMPTY_LIST_TILES_SelectTileType_O');
                                                        logFirebaseEvent(
                                                            'SelectTileType_backend_call');

                                                        await containerTilesv2Record
                                                            .reference
                                                            .update(
                                                                createTilesv2RecordData(
                                                          type: _model
                                                              .selectTileTypeValue,
                                                        ));
                                                        logFirebaseEvent(
                                                            'SelectTileType_update_component_state');
                                                        setState(() {
                                                          _model.isStatusTextVisible =
                                                              true;
                                                        });
                                                        logFirebaseEvent(
                                                            'SelectTileType_wait__delay');
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    1500));
                                                        logFirebaseEvent(
                                                            'SelectTileType_update_component_state');
                                                        setState(() {
                                                          _model.isStatusTextVisible =
                                                              false;
                                                        });
                                                      },
                                                      width: 300.0,
                                                      height: 50.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      hintText:
                                                          'Please select...',
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          Color(0xFF1AADF9),
                                                      borderWidth: 2.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  4.0,
                                                                  16.0,
                                                                  4.0),
                                                      hidesUnderline: true,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 12.0,
                                                          16.0, 0.0),
                                                  child:
                                                      SwitchListTile.adaptive(
                                                    value: _model
                                                            .switchMembersValue ??=
                                                        containerTilesv2Record
                                                            .isPublic,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .switchMembersValue =
                                                          newValue!);
                                                      if (newValue!) {
                                                        logFirebaseEvent(
                                                            'DRAWER_EMPTY_LIST_TILES_SwitchMembers_ON');
                                                        logFirebaseEvent(
                                                            'SwitchMembers_backend_call');

                                                        await containerTilesv2Record
                                                            .reference
                                                            .update(
                                                                createTilesv2RecordData(
                                                          isPublic: true,
                                                        ));
                                                        logFirebaseEvent(
                                                            'SwitchMembers_update_component_state');
                                                        setState(() {
                                                          _model.isStatusTextVisible =
                                                              true;
                                                        });
                                                        logFirebaseEvent(
                                                            'SwitchMembers_wait__delay');
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    1500));
                                                        logFirebaseEvent(
                                                            'SwitchMembers_update_component_state');
                                                        setState(() {
                                                          _model.isStatusTextVisible =
                                                              false;
                                                        });
                                                      } else {
                                                        logFirebaseEvent(
                                                            'DRAWER_EMPTY_LIST_TILES_SwitchMembers_ON');
                                                        logFirebaseEvent(
                                                            'SwitchMembers_backend_call');

                                                        await containerTilesv2Record
                                                            .reference
                                                            .update(
                                                                createTilesv2RecordData(
                                                          isPublic: false,
                                                        ));
                                                        logFirebaseEvent(
                                                            'SwitchMembers_update_component_state');
                                                        setState(() {
                                                          _model.isStatusTextVisible =
                                                              true;
                                                        });
                                                        logFirebaseEvent(
                                                            'SwitchMembers_wait__delay');
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    1500));
                                                        logFirebaseEvent(
                                                            'SwitchMembers_update_component_state');
                                                        setState(() {
                                                          _model.isStatusTextVisible =
                                                              false;
                                                        });
                                                      }
                                                    },
                                                    title: Text(
                                                      'Members',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge,
                                                    ),
                                                    tileColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    activeColor:
                                                        Color(0xFF1AADF9),
                                                    activeTrackColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                    dense: false,
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .trailing,
                                                    contentPadding:
                                                        EdgeInsets.all(8.0),
                                                  ),
                                                ),
                                                StreamBuilder<
                                                    List<GroupsRecord>>(
                                                  stream: queryGroupsRecord(
                                                    queryBuilder:
                                                        (groupsRecord) =>
                                                            groupsRecord
                                                                .orderBy(
                                                                    'name'),
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
                                                    List<GroupsRecord>
                                                        containerGroupsRecordList =
                                                        snapshot.data!;
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (_model
                                                                    .switchMembersValue ??
                                                                true)
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              FlutterFlowDropDown<String>(
                                                                            controller: _model.selectGroupsValueController ??=
                                                                                FormFieldController<String>(null),
                                                                            options:
                                                                                List<String>.from((List<String>? var1) {
                                                                              return [
                                                                                    "+ New Membership"
                                                                                  ] +
                                                                                  (var1 ?? []);
                                                                            }(containerGroupsRecordList.map((e) => e.reference.id).toList())),
                                                                            optionLabels: (List<String>?
                                                                                var1) {
                                                                              return [
                                                                                    "+ New Membership"
                                                                                  ] +
                                                                                  (var1 ?? []);
                                                                            }(containerGroupsRecordList
                                                                                .map((e) => valueOrDefault<String>(
                                                                                      e.name,
                                                                                      'Unamed Group',
                                                                                    ))
                                                                                .toList()),
                                                                            onChanged:
                                                                                (val) async {
                                                                              setState(() => _model.selectGroupsValue = val);
                                                                              logFirebaseEvent('DRAWER_EMPTY_LIST_TILES_SelectGroups_ON_');
                                                                              logFirebaseEvent('SelectGroups_backend_call');

                                                                              await widget.tileDoc!.reference.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'access_groups': FieldValue.arrayUnion([
                                                                                      _model.selectGroupsValue
                                                                                    ]),
                                                                                  },
                                                                                ),
                                                                              });
                                                                            },
                                                                            width:
                                                                                300.0,
                                                                            height:
                                                                                50.0,
                                                                            textStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                            hintText:
                                                                                'Please select...',
                                                                            icon:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_down_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                Color(0xFF1AADF9),
                                                                            borderWidth:
                                                                                2.0,
                                                                            borderRadius:
                                                                                8.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
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
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Visibility(
                                                                        visible:
                                                                            valueOrDefault<bool>(
                                                                          _model.selectGroupsValue ==
                                                                              '+ New Membership',
                                                                          false,
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                              child: TextFormField(
                                                                                controller: _model.textFieldNewGroupController,
                                                                                focusNode: _model.textFieldNewGroupFocusNode,
                                                                                onChanged: (_) => EasyDebounce.debounce(
                                                                                  '_model.textFieldNewGroupController',
                                                                                  Duration(milliseconds: 2000),
                                                                                  () => setState(() {}),
                                                                                ),
                                                                                autofocus: true,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                        fontSize: 16.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                      ),
                                                                                  hintText: 'Give it a friendly name',
                                                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                        fontSize: 16.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                      ),
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
                                                                                validator: _model.textFieldNewGroupControllerValidator.asValidator(context),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                children: [
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      logFirebaseEvent('DRAWER_EMPTY_LIST_TILES_CANCEL_BTN_ON_TA');
                                                                                      logFirebaseEvent('Button_set_form_field');
                                                                                      setState(() {
                                                                                        _model.selectGroupsValueController?.value = '';
                                                                                      });
                                                                                    },
                                                                                    text: 'Cancel',
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                          ),
                                                                                      elevation: 0.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      logFirebaseEvent('DRAWER_EMPTY_LIST_TILES_SAVE_BTN_ON_TAP');
                                                                                      logFirebaseEvent('Button_backend_call');

                                                                                      var groupsRecordReference = GroupsRecord.collection.doc();
                                                                                      await groupsRecordReference.set({
                                                                                        ...createGroupsRecordData(
                                                                                          createdTime: getCurrentTimestamp,
                                                                                          updatedTime: getCurrentTimestamp,
                                                                                          user: currentUserReference,
                                                                                          uid: currentUserUid,
                                                                                          groupType: 'Membership',
                                                                                          groupId: '',
                                                                                          isPublic: false,
                                                                                          inviteCode: '',
                                                                                        ),
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'users': [],
                                                                                            'members': [
                                                                                              currentUserUid
                                                                                            ],
                                                                                            'admins': [
                                                                                              currentUserUid
                                                                                            ],
                                                                                            'invited': [],
                                                                                          },
                                                                                        ),
                                                                                      });
                                                                                      _model.newGroup = GroupsRecord.getDocumentFromData({
                                                                                        ...createGroupsRecordData(
                                                                                          createdTime: getCurrentTimestamp,
                                                                                          updatedTime: getCurrentTimestamp,
                                                                                          user: currentUserReference,
                                                                                          uid: currentUserUid,
                                                                                          groupType: 'Membership',
                                                                                          groupId: '',
                                                                                          isPublic: false,
                                                                                          inviteCode: '',
                                                                                        ),
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'users': [],
                                                                                            'members': [
                                                                                              currentUserUid
                                                                                            ],
                                                                                            'admins': [
                                                                                              currentUserUid
                                                                                            ],
                                                                                            'invited': [],
                                                                                          },
                                                                                        ),
                                                                                      }, groupsRecordReference);
                                                                                      logFirebaseEvent('Button_backend_call');

                                                                                      await _model.newGroup!.reference.update(createGroupsRecordData(
                                                                                        groupId: _model.newGroup?.reference.id,
                                                                                      ));
                                                                                      logFirebaseEvent('Button_backend_call');

                                                                                      await widget.tileDoc!.reference.update({
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'access_groups': FieldValue.arrayUnion([
                                                                                              _model.newInlineBlockEndCreated?.reference.id
                                                                                            ]),
                                                                                          },
                                                                                        ),
                                                                                      });
                                                                                      logFirebaseEvent('Button_clear_text_fields_pin_codes');
                                                                                      setState(() {
                                                                                        _model.textFieldNewGroupController?.clear();
                                                                                      });
                                                                                      logFirebaseEvent('Button_set_form_field');
                                                                                      setState(() {
                                                                                        _model.selectGroupsValueController?.value = _model.newGroup!.reference.id;
                                                                                      });

                                                                                      setState(() {});
                                                                                    },
                                                                                    text: 'Save',
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: Color(0xFF1AADF9),
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                            color: Colors.white,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final group = containerGroupsRecordList
                                                                            .where((e) => valueOrDefault<bool>(
                                                                                  widget.tileDoc?.accessGroups?.contains(e.reference.id),
                                                                                  false,
                                                                                ))
                                                                            .toList();
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: List.generate(
                                                                              group.length,
                                                                              (groupIndex) {
                                                                            final groupItem =
                                                                                group[groupIndex];
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 18.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Container(
                                                                                            width: 8.0,
                                                                                            height: 8.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).customColor7,
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            groupItem.name,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('DRAWER_EMPTY_LIST_TILES_Icon_5rsq5isy_ON');
                                                                                      logFirebaseEvent('Icon_backend_call');

                                                                                      await widget.tileDoc!.reference.update({
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'access_groups': FieldValue.arrayRemove([
                                                                                              groupItem.reference.id
                                                                                            ]),
                                                                                          },
                                                                                        ),
                                                                                      });
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.close,
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      size: 18.0,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          }),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 20.0, 16.0, 0.0),
                                              child: SwitchListTile.adaptive(
                                                value: _model
                                                        .switchFeaturedValue ??=
                                                    containerTilesv2Record
                                                        .isFeatured,
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                          .switchFeaturedValue =
                                                      newValue!);
                                                },
                                                title: Text(
                                                  'Featured',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge,
                                                ),
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                activeColor: Color(0xFF1AADF9),
                                                activeTrackColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                dense: false,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                contentPadding:
                                                    EdgeInsets.all(8.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      theme: ExpandableThemeData(
                                        tapHeaderToExpand: true,
                                        tapBodyToExpand: false,
                                        tapBodyToCollapse: false,
                                        headerAlignment:
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: false,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 16.0, 8.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'DRAWER_EMPTY_LIST_TILES_Row_yxwig7yn_ON_');
                                        final firestoreBatch =
                                            FirebaseFirestore.instance.batch();
                                        try {
                                          logFirebaseEvent('Row_backend_call');

                                          var tileBlocksRecordReference =
                                              TileBlocksRecord.collection.doc();
                                          firestoreBatch
                                              .set(tileBlocksRecordReference, {
                                            ...createTileBlocksRecordData(
                                              createdTime: getCurrentTimestamp,
                                              updatedTime: getCurrentTimestamp,
                                              user: currentUserReference,
                                              uid: currentUserUid,
                                              blockType: 'Text',
                                              blockIndex: 0,
                                              blockName: 'Block -  ',
                                              blockStatus: 'Published',
                                              tileId:
                                                  containerTilesv2Record.tileId,
                                              image: '',
                                              thumbnail: '',
                                              isDefaultTheme: true,
                                              blockLayout: 'Paragraph',
                                              blockTitle:
                                                  'Block: ${valueOrDefault<String>(
                                                random_data.randomString(
                                                  3,
                                                  6,
                                                  true,
                                                  false,
                                                  false,
                                                ),
                                                '123456',
                                              )}',
                                              blockSubtitle: '',
                                              video: '',
                                              audio: '',
                                              text: '',
                                              header: '',
                                              subtitle: '',
                                              title: 'title',
                                              fontSettings:
                                                  createFontSettingsStruct(
                                                fontSizeDouble: 14.0,
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'audio_gallery':
                                                    functions.emptyAudioList(),
                                                'video_gallery':
                                                    functions.emptyVideoList(),
                                                'textList': [],
                                                'image_gallery':
                                                    functions.emptyImageList(),
                                              },
                                            ),
                                          });
                                          _model.newInlineBlockEndCreated =
                                              TileBlocksRecord
                                                  .getDocumentFromData({
                                            ...createTileBlocksRecordData(
                                              createdTime: getCurrentTimestamp,
                                              updatedTime: getCurrentTimestamp,
                                              user: currentUserReference,
                                              uid: currentUserUid,
                                              blockType: 'Text',
                                              blockIndex: 0,
                                              blockName: 'Block -  ',
                                              blockStatus: 'Published',
                                              tileId:
                                                  containerTilesv2Record.tileId,
                                              image: '',
                                              thumbnail: '',
                                              isDefaultTheme: true,
                                              blockLayout: 'Paragraph',
                                              blockTitle:
                                                  'Block: ${valueOrDefault<String>(
                                                random_data.randomString(
                                                  3,
                                                  6,
                                                  true,
                                                  false,
                                                  false,
                                                ),
                                                '123456',
                                              )}',
                                              blockSubtitle: '',
                                              video: '',
                                              audio: '',
                                              text: '',
                                              header: '',
                                              subtitle: '',
                                              title: 'title',
                                              fontSettings:
                                                  createFontSettingsStruct(
                                                fontSizeDouble: 14.0,
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'audio_gallery':
                                                    functions.emptyAudioList(),
                                                'video_gallery':
                                                    functions.emptyVideoList(),
                                                'textList': [],
                                                'image_gallery':
                                                    functions.emptyImageList(),
                                              },
                                            ),
                                          }, tileBlocksRecordReference);
                                          logFirebaseEvent('Row_backend_call');

                                          firestoreBatch.update(
                                              _model.newInlineBlockEndCreated!
                                                  .reference,
                                              createTileBlocksRecordData(
                                                blockId: _model
                                                    .newInlineBlockEndCreated
                                                    ?.reference
                                                    .id,
                                              ));
                                          logFirebaseEvent(
                                              'Row_update_app_state');
                                          setState(() {
                                            FFAppState().drawerBlockId = _model
                                                .newInlineBlockEndCreated!
                                                .reference
                                                .id;
                                            FFAppState().blockCreateMode = true;
                                            FFAppState().showEdit =
                                                valueOrDefault<bool>(
                                              FFAppState().showEdit
                                                  ? false
                                                  : true,
                                              true,
                                            );
                                          });
                                          logFirebaseEvent(
                                              'Row_update_component_state');
                                          _model.updatePage(() {});
                                        } finally {
                                          await firestoreBatch.commit();
                                        }

                                        setState(() {});
                                      },
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    width: 32.0,
                                                    height: 32.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF1AADF9),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      '3',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Add a block',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium,
                                                ),
                                              ),
                                            ],
                                          ),
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
                                            child: Icon(
                                              Icons.arrow_forward_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).accent3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Container(
                          width: double.infinity,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Visibility(
                            visible: _model.isStatusTextVisible,
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'Saved!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).success,
                                      fontSize: 18.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
