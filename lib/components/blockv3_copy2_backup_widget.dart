import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'blockv3_copy2_backup_model.dart';
export 'blockv3_copy2_backup_model.dart';

class Blockv3Copy2BackupWidget extends StatefulWidget {
  const Blockv3Copy2BackupWidget({
    super.key,
    required this.tileBlock,
    this.action,
  });

  final TileBlocksRecord? tileBlock;
  final Future Function()? action;

  @override
  State<Blockv3Copy2BackupWidget> createState() =>
      _Blockv3Copy2BackupWidgetState();
}

class _Blockv3Copy2BackupWidgetState extends State<Blockv3Copy2BackupWidget> {
  late Blockv3Copy2BackupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Blockv3Copy2BackupModel());

    _model.textEntryController ??=
        TextEditingController(text: widget.tileBlock?.text);
    _model.textEntryFocusNode ??= FocusNode();

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
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: valueOrDefault<bool>(
                              FFAppState().showEdit == true,
                              false,
                            ) &&
                            (FFAppState().selectedBlockID ==
                                widget.tileBlock?.blockId)
                        ? FlutterFlowTheme.of(context).accent4
                        : Color(0x00000000),
                    width: 3.0,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 800.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Visibility(
                                        visible: (_model.showEdit == true) &&
                                            (FFAppState().showEdit == true),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'BLOCKV3_COPY2_BACKUP_Row_bab9thn7_ON_TAP');
                                            logFirebaseEvent(
                                                'Row_update_component_state');
                                            setState(() {
                                              _model.showEdit =
                                                  valueOrDefault<bool>(
                                                _model.showEdit == false,
                                                false,
                                              );
                                            });
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 0.0),
                                                  child: Container(
                                                    width: 300.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textEntryController,
                                                      focusNode: _model
                                                          .textEntryFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.textEntryController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () async {
                                                          logFirebaseEvent(
                                                              'BLOCKV3_COPY2_BACKUP_TextEntry_ON_TEXTFI');
                                                          logFirebaseEvent(
                                                              'TextEntry_update_component_state');
                                                          _model.updatePage(() {
                                                            _model.changedText =
                                                                _model
                                                                    .textEntryController
                                                                    .text;
                                                          });
                                                        },
                                                      ),
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Text Here',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsets.all(6.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  widget
                                                                      .tileBlock
                                                                      ?.fontSettings
                                                                      ?.fontSizeDouble,
                                                                  14.0,
                                                                ),
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                      maxLines: null,
                                                      minLines: 3,
                                                      maxLength: 2000,
                                                      validator: _model
                                                          .textEntryControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 800.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Visibility(
                                        visible: valueOrDefault<bool>(
                                          widget.tileBlock?.blockLayout ==
                                              'Paragraph',
                                          false,
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'BLOCKV3_COPY2_BACKUP_Row_qhjdf341_ON_TAP');
                                            logFirebaseEvent(
                                                'Row_update_component_state');
                                            setState(() {
                                              _model.showEdit =
                                                  valueOrDefault<bool>(
                                                _model.showEdit == false,
                                                false,
                                              );
                                            });
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (!((_model.showEdit == true) &&
                                                  (FFAppState().showEdit ==
                                                      true)))
                                                Expanded(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      widget.tileBlock?.text,
                                                      'This is where the paragraph text will go',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          fontSize:
                                                              valueOrDefault<
                                                                  double>(
                                                            _model.fontSettingsWidget
                                                                        ?.fontSizeDouble !=
                                                                    null
                                                                ? valueOrDefault<
                                                                    double>(
                                                                    _model
                                                                        .fontSettingsWidget
                                                                        ?.fontSizeDouble,
                                                                    12.0,
                                                                  )
                                                                : valueOrDefault<
                                                                    double>(
                                                                    widget
                                                                        .tileBlock
                                                                        ?.fontSettings
                                                                        ?.fontSizeDouble,
                                                                    14.0,
                                                                  ),
                                                            14.0,
                                                          ),
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeFamily),
                                                        ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                constraints: BoxConstraints(
                                  maxWidth: 640.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                            ],
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            curve: Curves.easeInOut,
                            constraints: BoxConstraints(
                              maxWidth: 960.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [],
                            ),
                          ),
                          if (valueOrDefault<bool>(
                            (FFAppState().showEdit == true) &&
                                (FFAppState().selectedBlockID ==
                                    widget.tileBlock?.blockId),
                            false,
                          ))
                            Container(
                              width: 960.0,
                              height: 40.0,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(
                                        _model.dropDownValue ??= widget
                                            .tileBlock
                                            ?.fontSettings
                                            ?.fontSizeDouble
                                            ?.toString(),
                                      ),
                                      options: [
                                        '12',
                                        '14',
                                        '16',
                                        '18',
                                        '20',
                                        '22',
                                        '24',
                                        '26',
                                        '28',
                                        '30',
                                        '32',
                                        '34',
                                        '36',
                                        '38',
                                        '40',
                                        '42',
                                        '44',
                                        '46',
                                        '48'
                                      ],
                                      onChanged: (val) async {
                                        setState(
                                            () => _model.dropDownValue = val);
                                        logFirebaseEvent(
                                            'BLOCKV3_COPY2_BACKUP_DropDown_c3c3cs7j_O');
                                        logFirebaseEvent(
                                            'DropDown_update_component_state');
                                        _model.updatePage(() {
                                          _model.updateFontSettingsWidgetStruct(
                                            (e) => e
                                              ..fontSizeDouble =
                                                  functions.stringToDouble(
                                                      _model.dropDownValue!),
                                          );
                                        });
                                      },
                                      width: 100.0,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 48.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .darkSeaGreen,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 38.0,
                                            hoverColor:
                                                FlutterFlowTheme.of(context)
                                                    .darkSeaGreen,
                                            hoverIconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            icon: Icon(
                                              Icons.refresh_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .darkSeaGreen,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'BLOCKV3_COPY2_BACKUP_refresh_outlined_IC');
                                              logFirebaseEvent(
                                                  'IconButton_update_app_state');
                                              setState(() {
                                                FFAppState().selectedBlockID =
                                                    widget.tileBlock!.blockId;
                                                FFAppState().showChangedType =
                                                    true;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 48.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .darkSeaGreen,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 38.0,
                                            hoverColor:
                                                FlutterFlowTheme.of(context)
                                                    .darkSeaGreen,
                                            hoverIconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            icon: Icon(
                                              Icons.post_add,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .darkSeaGreen,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'BLOCKV3_COPY2_BACKUP_post_add_ICN_ON_TAP');
                                              logFirebaseEvent(
                                                  'IconButton_backend_call');

                                              var tileBlocksRecordReference =
                                                  TileBlocksRecord.collection
                                                      .doc();
                                              await tileBlocksRecordReference
                                                  .set({
                                                ...createTileBlocksRecordData(
                                                  createdTime:
                                                      getCurrentTimestamp,
                                                  updatedTime:
                                                      getCurrentTimestamp,
                                                  user: currentUserReference,
                                                  uid: currentUserUid,
                                                  blockId: '',
                                                  blockType: 'Text',
                                                  blockIndex:
                                                      valueOrDefault<int>(
                                                    (valueOrDefault<int>(
                                                              widget.tileBlock
                                                                  ?.blockIndex,
                                                              0,
                                                            ) -
                                                            1) ??
                                                        0,
                                                    0,
                                                  ),
                                                  blockName: 'Block -  ',
                                                  blockStatus: 'Draft',
                                                  tileId:
                                                      widget.tileBlock?.tileId,
                                                  image: '',
                                                  thumbnail: '',
                                                  isDefaultTheme: true,
                                                  blockLayout: 'Header',
                                                  blockTitle:
                                                      '${valueOrDefault<String>(
                                                    widget.tileBlock?.blockType,
                                                    'default',
                                                  )}: ${valueOrDefault<String>(
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
                                                    'audio_gallery': functions
                                                        .emptyAudioList(),
                                                    'video_gallery': functions
                                                        .emptyVideoList(),
                                                    'textList': [],
                                                    'image_gallery': functions
                                                        .emptyImageList(),
                                                  },
                                                ),
                                              });
                                              _model.newInlineBlockEnd =
                                                  TileBlocksRecord
                                                      .getDocumentFromData({
                                                ...createTileBlocksRecordData(
                                                  createdTime:
                                                      getCurrentTimestamp,
                                                  updatedTime:
                                                      getCurrentTimestamp,
                                                  user: currentUserReference,
                                                  uid: currentUserUid,
                                                  blockId: '',
                                                  blockType: 'Text',
                                                  blockIndex:
                                                      valueOrDefault<int>(
                                                    (valueOrDefault<int>(
                                                              widget.tileBlock
                                                                  ?.blockIndex,
                                                              0,
                                                            ) -
                                                            1) ??
                                                        0,
                                                    0,
                                                  ),
                                                  blockName: 'Block -  ',
                                                  blockStatus: 'Draft',
                                                  tileId:
                                                      widget.tileBlock?.tileId,
                                                  image: '',
                                                  thumbnail: '',
                                                  isDefaultTheme: true,
                                                  blockLayout: 'Header',
                                                  blockTitle:
                                                      '${valueOrDefault<String>(
                                                    widget.tileBlock?.blockType,
                                                    'default',
                                                  )}: ${valueOrDefault<String>(
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
                                                    'audio_gallery': functions
                                                        .emptyAudioList(),
                                                    'video_gallery': functions
                                                        .emptyVideoList(),
                                                    'textList': [],
                                                    'image_gallery': functions
                                                        .emptyImageList(),
                                                  },
                                                ),
                                              }, tileBlocksRecordReference);
                                              logFirebaseEvent(
                                                  'IconButton_backend_call');

                                              await _model
                                                  .newInlineBlockEnd!.reference
                                                  .update(
                                                      createTileBlocksRecordData(
                                                blockId: _model
                                                    .newInlineBlockEnd
                                                    ?.reference
                                                    .id,
                                              ));
                                              logFirebaseEvent(
                                                  'IconButton_update_app_state');
                                              _model.updatePage(() {
                                                FFAppState().drawerBlockId =
                                                    _model.newInlineBlockEnd!
                                                        .reference.id;
                                                FFAppState().blockCreateMode =
                                                    true;
                                              });

                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 8.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 34.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            hoverColor:
                                                FlutterFlowTheme.of(context)
                                                    .grayIcon,
                                            hoverIconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            icon: Icon(
                                              Icons.close,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grayIcon,
                                              size: 18.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'BLOCKV3_COPY2_BACKUP_close_ICN_ON_TAP');
                                              logFirebaseEvent(
                                                  'IconButton_update_component_state');
                                              setState(() {
                                                _model.showEdit = false;
                                              });
                                              logFirebaseEvent(
                                                  'IconButton_update_app_state');
                                              setState(() {
                                                FFAppState().showEdit = false;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .success,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 34.0,
                                            icon: Icon(
                                              Icons.check,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              size: 18.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'BLOCKV3_COPY2_BACKUP_check_ICN_ON_TAP');
                                              final firestoreBatch =
                                                  FirebaseFirestore.instance
                                                      .batch();
                                              try {
                                                if ((FFAppState()
                                                            .selectedEditItem ==
                                                        'Text') ||
                                                    (widget.tileBlock
                                                            ?.blockType ==
                                                        'Text')) {
                                                  logFirebaseEvent(
                                                      'IconButton_backend_call');

                                                  firestoreBatch.update(
                                                      widget
                                                          .tileBlock!.reference,
                                                      createTileBlocksRecordData(
                                                        updatedTime:
                                                            getCurrentTimestamp,
                                                        blockType: 'Text',
                                                        blockStatus:
                                                            'Published',
                                                        blockLayout:
                                                            'Paragraph',
                                                        fontSettings:
                                                            createFontSettingsStruct(
                                                          fontSizeDouble: _model
                                                              .fontSettingsWidget
                                                              ?.fontSizeDouble,
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                        text: _model.changedText !=
                                                                    null &&
                                                                _model.changedText !=
                                                                    ''
                                                            ? _model
                                                                .textEntryController
                                                                .text
                                                            : null,
                                                      ));
                                                } else if (FFAppState()
                                                        .selectedEditItem ==
                                                    'Image') {
                                                  logFirebaseEvent(
                                                      'IconButton_backend_call');

                                                  firestoreBatch.update(
                                                      widget
                                                          .tileBlock!.reference,
                                                      createTileBlocksRecordData(
                                                        updatedTime:
                                                            getCurrentTimestamp,
                                                        blockType: 'Image',
                                                        blockStatus:
                                                            'Published',
                                                        blockLayout: 'Gallery',
                                                      ));
                                                } else if (FFAppState()
                                                        .selectedEditItem ==
                                                    'Video') {
                                                  logFirebaseEvent(
                                                      'IconButton_backend_call');

                                                  firestoreBatch.update(
                                                      widget
                                                          .tileBlock!.reference,
                                                      createTileBlocksRecordData(
                                                        updatedTime:
                                                            getCurrentTimestamp,
                                                        blockType: 'Video',
                                                        blockStatus:
                                                            'Published',
                                                        blockLayout: 'Gallery',
                                                      ));
                                                }

                                                logFirebaseEvent(
                                                    'IconButton_update_component_state');
                                                _model.updatePage(() {
                                                  _model.showEdit =
                                                      valueOrDefault<bool>(
                                                    _model.showEdit
                                                        ? false
                                                        : true,
                                                    true,
                                                  );
                                                  _model.changedText =
                                                      false.toString();
                                                  _model.fontSettingsWidget =
                                                      null;
                                                });
                                                logFirebaseEvent(
                                                    'IconButton_update_app_state');
                                                setState(() {
                                                  FFAppState().showEdit =
                                                      valueOrDefault<bool>(
                                                    FFAppState().showEdit
                                                        ? false
                                                        : true,
                                                    true,
                                                  );
                                                });
                                                logFirebaseEvent(
                                                    'IconButton_update_app_state');
                                                setState(() {
                                                  FFAppState()
                                                          .fontChangeInProgress =
                                                      false;
                                                });
                                              } finally {
                                                await firestoreBatch.commit();
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 48.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 34.0,
                                            hoverColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                            hoverIconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            icon: Icon(
                                              Icons.delete,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              size: 18.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'BLOCKV3_COPY2_BACKUP_delete_ICN_ON_TAP');
                                              logFirebaseEvent(
                                                  'IconButton_backend_call');
                                              await widget.tileBlock!.reference
                                                  .delete();
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            hoverColor:
                                FlutterFlowTheme.of(context).customColor7,
                            hoverIconColor:
                                FlutterFlowTheme.of(context).primary,
                            icon: Icon(
                              Icons.edit_off,
                              color: FlutterFlowTheme.of(context).grayIcon,
                              size: 20.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BLOCKV3_COPY2_BACKUP_edit_off_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_update_app_state');
                              setState(() {
                                FFAppState().selectedBlockID = '';
                                FFAppState().drawerBlockId = '';
                                FFAppState().selectedEditItem =
                                    valueOrDefault<String>(
                                  widget.tileBlock?.blockType,
                                  'Text',
                                );
                              });
                              logFirebaseEvent('IconButton_update_app_state');
                              setState(() {
                                FFAppState().selectedBlockID =
                                    widget.tileBlock!.blockId;
                                FFAppState().drawerBlockId =
                                    widget.tileBlock!.blockId;
                              });
                              logFirebaseEvent('IconButton_update_app_state');
                              _model.updatePage(() {
                                FFAppState().showEdit = valueOrDefault<bool>(
                                  FFAppState().showEdit ? false : true,
                                  true,
                                );
                              });
                              logFirebaseEvent(
                                  'IconButton_update_component_state');
                              _model.updatePage(() {
                                _model.showEdit = valueOrDefault<bool>(
                                  _model.showEdit ? false : true,
                                  true,
                                );
                                _model.fontSettingsWidget = null;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (FFAppState().showEdit == true)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 250.0,
                          height: 50.0,
                          decoration: BoxDecoration(),
                          child: Visibility(
                            visible: valueOrDefault<bool>(
                              valueOrDefault<bool>(
                                    (FFAppState().selectedBlockID ==
                                            widget.tileBlock?.blockId) &&
                                        (FFAppState().showChangedType == true),
                                    false,
                                  ) ||
                                  ((widget.tileBlock?.blockIndex == 0) &&
                                      valueOrDefault<bool>(
                                        widget.tileBlock?.text == null ||
                                            widget.tileBlock?.text == '',
                                        false,
                                      )),
                              false,
                            ),
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData('Text'),
                                ChipData('Image'),
                                ChipData('Video')
                              ],
                              onChanged: (val) async {
                                setState(() => _model.blockTypeChipsValue =
                                    val?.firstOrNull);
                                logFirebaseEvent(
                                    'BLOCKV3_COPY2_BACKUP_BlockTypeChips_ON_F');
                                logFirebaseEvent(
                                    'BlockTypeChips_update_app_state');
                                setState(() {
                                  FFAppState().selectedEditItem =
                                      valueOrDefault<String>(
                                    _model.blockTypeChipsValue,
                                    'Text',
                                  );
                                });
                              },
                              selectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).customColor7,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                iconColor: FlutterFlowTheme.of(context).white,
                                iconSize: 18.0,
                                elevation: 0.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).customColor7,
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
                              initialized: _model.blockTypeChipsValue != null,
                              alignment: WrapAlignment.start,
                              controller:
                                  _model.blockTypeChipsValueController ??=
                                      FormFieldController<List<String>>(
                                [
                                  valueOrDefault<String>(
                                    widget.tileBlock?.blockType,
                                    'Text',
                                  )
                                ],
                              ),
                              wrapped: false,
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
        if (FFAppState().showEdit)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (valueOrDefault<bool>(
                    widget.tileBlock?.video != null &&
                        widget.tileBlock?.video != '',
                    false,
                  ) ||
                  valueOrDefault<bool>(
                    widget.tileBlock?.hasVideo() != null,
                    false,
                  ))
                ClipRRect(
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: 400.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final video =
                              widget.tileBlock?.videoGallery?.toList() ?? [];
                          return Container(
                            width: 640.0,
                            height: 400.0,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 50.0),
                                  child: PageView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    controller: _model.pageViewController ??=
                                        PageController(
                                            initialPage:
                                                min(0, video.length - 1)),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: video.length,
                                    itemBuilder: (context, videoIndex) {
                                      final videoItem = video[videoIndex];
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: FlutterFlowVideoPlayer(
                                            path:
                                                widget.tileBlock!.videoGallery[
                                                    valueOrDefault<int>(
                                              _model.pageViewCurrentIndex,
                                              0,
                                            )],
                                            videoType: VideoType.network,
                                            autoPlay: false,
                                            looping: true,
                                            showControls: true,
                                            allowFullScreen: true,
                                            allowPlaybackSpeedMenu: false,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 16.0),
                                    child: smooth_page_indicator
                                        .SmoothPageIndicator(
                                      controller: _model.pageViewController ??=
                                          PageController(
                                              initialPage:
                                                  min(0, video.length - 1)),
                                      count: video.length,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) async {
                                        await _model.pageViewController!
                                            .animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      },
                                      effect: smooth_page_indicator.SlideEffect(
                                        spacing: 12.0,
                                        radius: 16.0,
                                        dotWidth: 16.0,
                                        dotHeight: 12.0,
                                        dotColor:
                                            FlutterFlowTheme.of(context).btnBk,
                                        activeDotColor: Color(0xFF1A5AF9),
                                        paintStyle: PaintingStyle.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              if (valueOrDefault<bool>(
                widget.tileBlock?.blockType == 'Image',
                false,
              ))
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          100.0, 0.0, 100.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          width: 800.0,
                          constraints: BoxConstraints(
                            maxHeight: 400.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'BLOCKV3_COPY2_BACKUP_Image_js955ety_ON_T');
                                logFirebaseEvent('Image_expand_image');
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: FlutterFlowExpandedImageView(
                                      image: Image.network(
                                        widget.tileBlock!.imageGallery[
                                            _model.viewImageIndex],
                                        fit: BoxFit.contain,
                                      ),
                                      allowRotation: false,
                                      tag: widget.tileBlock!
                                          .imageGallery[_model.viewImageIndex],
                                      useHeroAnimation: true,
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: widget.tileBlock!
                                    .imageGallery[_model.viewImageIndex],
                                transitionOnUserGestures: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    widget.tileBlock!
                                        .imageGallery[_model.viewImageIndex],
                                    width: double.infinity,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (valueOrDefault<bool>(
                          widget.tileBlock?.blockLayout == 'Gallery',
                          false,
                        ))
                          Text(
                            valueOrDefault<String>(
                              widget.tileBlock?.textList?[valueOrDefault<int>(
                                () {
                                  if (widget.tileBlock?.blockType == 'Video') {
                                    return _model.pageViewCurrentIndex;
                                  } else if (widget.tileBlock?.blockType ==
                                      'Image') {
                                    return _model.viewImageIndex;
                                  } else {
                                    return 0;
                                  }
                                }(),
                                0,
                              )],
                              'Gallery',
                            ),
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                      ],
                    ),
                    if (valueOrDefault<bool>(
                      widget.tileBlock!.imageGallery.length > 1,
                      false,
                    ))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final image =
                                widget.tileBlock?.imageGallery?.toList() ?? [];
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(image.length, (imageIndex) {
                                  final imageItem = image[imageIndex];
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Container(
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: _model.viewImageIndex ==
                                                  imageIndex
                                              ? FlutterFlowTheme.of(context)
                                                  .customColor7
                                              : Color(0x00000000),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 20.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'BLOCKV3_COPY2_BACKUP_Image_0kp229ij_ON_T');
                                            logFirebaseEvent(
                                                'Image_update_component_state');
                                            setState(() {
                                              _model.viewImageIndex =
                                                  imageIndex;
                                            });
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              imageItem,
                                              width: 200.0,
                                              height: 100.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 640.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (valueOrDefault<bool>(
                          widget.tileBlock?.blockLayout == 'Body',
                          false,
                        ))
                          Text(
                            functions.formatText(widget.tileBlock?.text),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 16.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                  lineHeight: 1.8,
                                ),
                          ),
                      ],
                    ),
                  ),
                  if (valueOrDefault<bool>(
                    widget.tileBlock?.blockLayout == 'List',
                    false,
                  ))
                    Builder(
                      builder: (context) {
                        final textList =
                            widget.tileBlock?.textList?.toList() ?? [];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children:
                              List.generate(textList.length, (textListIndex) {
                            final textListItem = textList[textListIndex];
                            return Container(
                              constraints: BoxConstraints(
                                maxWidth: 640.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Container(
                                        width: 12.0,
                                        height: 12.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        textListItem,
                                        textAlign: TextAlign.start,
                                        maxLines: 3,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                              lineHeight: 1.6,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (valueOrDefault<bool>(
                    widget.tileBlock?.blockLayout == 'Header',
                    false,
                  ))
                    Text(
                      widget.tileBlock!.text,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleLargeFamily,
                            color: FlutterFlowTheme.of(context).customColor7,
                            fontSize: 28.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleLargeFamily),
                          ),
                    ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [],
              ),
            ],
          ),
      ],
    );
  }
}
