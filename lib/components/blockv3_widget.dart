import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/document_widget.dart';
import '/components/image_gallery_widget.dart';
import '/components/video_gallery_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'blockv3_model.dart';
export 'blockv3_model.dart';

class Blockv3Widget extends StatefulWidget {
  const Blockv3Widget({
    super.key,
    this.tileBlock,
    String? topicItem,
    this.readingItem,
    required this.sessionId,
    required this.companyDoc,
    this.tileDocOriginal,
  }) : this.topicItem = topicItem ?? 'topicItem';

  final TileBlocksRecord? tileBlock;
  final String topicItem;
  final String? readingItem;
  final SessionsRecord? sessionId;
  final CompaniesRecord? companyDoc;
  final TilesRecord? tileDocOriginal;

  @override
  State<Blockv3Widget> createState() => _Blockv3WidgetState();
}

class _Blockv3WidgetState extends State<Blockv3Widget> {
  late Blockv3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Blockv3Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BLOCKV3_COMP_blockv3_ON_INIT_STATE');
      logFirebaseEvent('blockv3_update_app_state');
      setState(() {
        FFAppState().QuizReadyToMoveOn = true;
      });
    });

    _model.textController1 ??=
        TextEditingController(text: widget.tileBlock?.imageH?.toString());
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget.tileBlock?.imageW?.toString());
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??=
        TextEditingController(text: widget.tileBlock?.imageH?.toString());
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??=
        TextEditingController(text: widget.tileBlock?.imageW?.toString());
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.tesitEditController ??= TextEditingController(
        text: _model.changedText != null && _model.changedText != ''
            ? _model.changedText
            : valueOrDefault<String>(
                widget.tileBlock?.text,
                'text',
              ));
    _model.tesitEditFocusNode ??= FocusNode();

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
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if ((loggedIn == true) &&
                                valueOrDefault<bool>(
                                    currentUserDocument?.isadmin, false))
                              AuthUserStreamWidget(
                                builder: (context) => Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 48.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                  borderRadius: 30.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 34.0,
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                  hoverIconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    size: 18.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'BLOCKV3_COMP_delete_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_alert_dialog');
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    title: Text(
                                                                        'Delete this block?'),
                                                                    content: Text(
                                                                        'Are you sure'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'Cancel'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            'Confirm'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (confirmDialogResponse) {
                                                      logFirebaseEvent(
                                                          'IconButton_backend_call');
                                                      await widget
                                                          .tileBlock!.reference
                                                          .delete();
                                                    } else {
                                                      return;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 50.0,
                                                hoverColor:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor7,
                                                hoverIconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                icon: Icon(
                                                  Icons.edit_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  size: 20.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'BLOCKV3_COMP_IconEdit_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconEdit_update_app_state');
                                                  setState(() {
                                                    FFAppState()
                                                        .selectedBlockID = '';
                                                    FFAppState().drawerBlockId =
                                                        '';
                                                    FFAppState()
                                                            .selectedEditItem =
                                                        valueOrDefault<String>(
                                                      widget
                                                          .tileBlock?.blockType,
                                                      'Text',
                                                    );
                                                  });
                                                  logFirebaseEvent(
                                                      'IconEdit_update_app_state');
                                                  setState(() {
                                                    FFAppState()
                                                            .selectedBlockID =
                                                        widget
                                                            .tileBlock!.blockId;
                                                    FFAppState().drawerBlockId =
                                                        widget
                                                            .tileBlock!.blockId;
                                                  });
                                                  logFirebaseEvent(
                                                      'IconEdit_update_component_state');
                                                  _model.updatePage(() {
                                                    _model.fontSettingsWidget =
                                                        null;
                                                    _model.changedText = '';
                                                    _model.showEdit =
                                                        valueOrDefault<bool>(
                                                      _model.showEdit
                                                          ? false
                                                          : true,
                                                      true,
                                                    );
                                                  });
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 15.0, 0.0),
                                              child: Text(
                                                'Edit  ${widget.tileBlock?.blockType}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 50.0,
                                      decoration: BoxDecoration(),
                                      child: FlutterFlowChoiceChips(
                                        options: [
                                          ChipData('Text'),
                                          ChipData('Image'),
                                          ChipData('Video'),
                                          ChipData('Document'),
                                          ChipData('AI'),
                                          ChipData('HTML')
                                        ],
                                        onChanged: (val) async {
                                          setState(() =>
                                              _model.blockTypeChipsValue =
                                                  val?.firstOrNull);
                                          logFirebaseEvent(
                                              'BLOCKV3_BlockTypeChips_ON_FORM_WIDGET_SE');
                                          if (widget.tileBlock?.blockId ==
                                              FFAppState().drawerBlockId) {
                                            logFirebaseEvent(
                                                'BlockTypeChips_backend_call');

                                            await widget.tileBlock!.reference
                                                .update(
                                                    createTileBlocksRecordData(
                                              blockType:
                                                  _model.blockTypeChipsValue,
                                            ));
                                          } else {
                                            logFirebaseEvent(
                                                'BlockTypeChips_update_app_state');
                                            setState(() {
                                              FFAppState().selectedBlockID =
                                                  widget.tileBlock!.blockId;
                                              FFAppState().drawerBlockId =
                                                  widget.tileBlock!.blockId;
                                            });
                                          }
                                        },
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .customColor7,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .white,
                                          iconSize: 18.0,
                                          elevation: 0.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .customColor7,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        unselectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          iconSize: 18.0,
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        chipSpacing: 12.0,
                                        rowSpacing: 12.0,
                                        multiselect: false,
                                        initialized:
                                            _model.blockTypeChipsValue != null,
                                        alignment: WrapAlignment.start,
                                        controller: _model
                                                .blockTypeChipsValueController ??=
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
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            48.0,
                                                                            0.0),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .darkSeaGreen,
                                                                      borderRadius:
                                                                          30.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          38.0,
                                                                      hoverColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .darkSeaGreen,
                                                                      hoverIconColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .post_add,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .darkSeaGreen,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'BLOCKV3_COMP_post_add_ICN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'IconButton_backend_call');

                                                                        var tileBlocksRecordReference = TileBlocksRecord
                                                                            .collection
                                                                            .doc();
                                                                        await tileBlocksRecordReference
                                                                            .set({
                                                                          ...createTileBlocksRecordData(
                                                                            createdTime:
                                                                                getCurrentTimestamp,
                                                                            updatedTime:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            uid:
                                                                                currentUserUid,
                                                                            blockId:
                                                                                '',
                                                                            blockType:
                                                                                'Text',
                                                                            blockIndex:
                                                                                valueOrDefault<int>(
                                                                              (valueOrDefault<int>(
                                                                                        widget.tileBlock?.blockIndex,
                                                                                        0,
                                                                                      ) -
                                                                                      1) ??
                                                                                  0,
                                                                              0,
                                                                            ),
                                                                            blockName:
                                                                                'Block -  ',
                                                                            blockStatus:
                                                                                'Draft',
                                                                            tileId:
                                                                                widget.tileBlock?.tileId,
                                                                            image:
                                                                                '',
                                                                            thumbnail:
                                                                                '',
                                                                            isDefaultTheme:
                                                                                true,
                                                                            blockLayout:
                                                                                'Header',
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
                                                                            blockSubtitle:
                                                                                '',
                                                                            video:
                                                                                '',
                                                                            audio:
                                                                                '',
                                                                            text:
                                                                                '',
                                                                            header:
                                                                                '',
                                                                            subtitle:
                                                                                '',
                                                                            title:
                                                                                'title',
                                                                            fontSettings:
                                                                                createFontSettingsStruct(
                                                                              fontSizeDouble: 14.0,
                                                                              clearUnsetFields: false,
                                                                              create: true,
                                                                            ),
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'audio_gallery': functions.emptyAudioList(),
                                                                              'video_gallery': functions.emptyVideoList(),
                                                                              'textList': [],
                                                                              'image_gallery': functions.emptyImageList(),
                                                                            },
                                                                          ),
                                                                        });
                                                                        _model.newInlineBlockEnd =
                                                                            TileBlocksRecord.getDocumentFromData({
                                                                          ...createTileBlocksRecordData(
                                                                            createdTime:
                                                                                getCurrentTimestamp,
                                                                            updatedTime:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            uid:
                                                                                currentUserUid,
                                                                            blockId:
                                                                                '',
                                                                            blockType:
                                                                                'Text',
                                                                            blockIndex:
                                                                                valueOrDefault<int>(
                                                                              (valueOrDefault<int>(
                                                                                        widget.tileBlock?.blockIndex,
                                                                                        0,
                                                                                      ) -
                                                                                      1) ??
                                                                                  0,
                                                                              0,
                                                                            ),
                                                                            blockName:
                                                                                'Block -  ',
                                                                            blockStatus:
                                                                                'Draft',
                                                                            tileId:
                                                                                widget.tileBlock?.tileId,
                                                                            image:
                                                                                '',
                                                                            thumbnail:
                                                                                '',
                                                                            isDefaultTheme:
                                                                                true,
                                                                            blockLayout:
                                                                                'Header',
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
                                                                            blockSubtitle:
                                                                                '',
                                                                            video:
                                                                                '',
                                                                            audio:
                                                                                '',
                                                                            text:
                                                                                '',
                                                                            header:
                                                                                '',
                                                                            subtitle:
                                                                                '',
                                                                            title:
                                                                                'title',
                                                                            fontSettings:
                                                                                createFontSettingsStruct(
                                                                              fontSizeDouble: 14.0,
                                                                              clearUnsetFields: false,
                                                                              create: true,
                                                                            ),
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'audio_gallery': functions.emptyAudioList(),
                                                                              'video_gallery': functions.emptyVideoList(),
                                                                              'textList': [],
                                                                              'image_gallery': functions.emptyImageList(),
                                                                            },
                                                                          ),
                                                                        }, tileBlocksRecordReference);
                                                                        logFirebaseEvent(
                                                                            'IconButton_backend_call');

                                                                        await _model
                                                                            .newInlineBlockEnd!
                                                                            .reference
                                                                            .update(createTileBlocksRecordData(
                                                                          blockId: _model
                                                                              .newInlineBlockEnd
                                                                              ?.reference
                                                                              .id,
                                                                        ));
                                                                        logFirebaseEvent(
                                                                            'IconButton_update_app_state');
                                                                        _model.updatePage(
                                                                            () {
                                                                          FFAppState().drawerBlockId = _model
                                                                              .newInlineBlockEnd!
                                                                              .reference
                                                                              .id;
                                                                          FFAppState().blockCreateMode =
                                                                              true;
                                                                        });

                                                                        setState(
                                                                            () {});
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      borderRadius:
                                                                          30.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          34.0,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      hoverColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .grayIcon,
                                                                      hoverIconColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .close,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .grayIcon,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'BLOCKV3_COMP_close_ICN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'IconButton_update_component_state');
                                                                        setState(
                                                                            () {
                                                                          _model.showEdit =
                                                                              false;
                                                                        });
                                                                        logFirebaseEvent(
                                                                            'IconButton_update_app_state');
                                                                        setState(
                                                                            () {
                                                                          FFAppState().selectedBlockID =
                                                                              '';
                                                                          FFAppState().drawerBlockId =
                                                                              '';
                                                                          FFAppState().selectedEditItem =
                                                                              valueOrDefault<String>(
                                                                            widget.tileBlock?.blockType,
                                                                            'Text',
                                                                          );
                                                                        });
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .success,
                                                                      borderRadius:
                                                                          30.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          34.0,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .check,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .success,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'BLOCKV3_COMP_check_ICN_ON_TAP');
                                                                        final firestoreBatch = FirebaseFirestore
                                                                            .instance
                                                                            .batch();
                                                                        try {
                                                                          if ((_model.blockTypeChipsValue == 'Text') ||
                                                                              (widget.tileBlock?.blockType ==
                                                                                  'Text')) {
                                                                            logFirebaseEvent('IconButton_backend_call');

                                                                            firestoreBatch.update(
                                                                                widget.tileBlock!.reference,
                                                                                createTileBlocksRecordData(
                                                                                  updatedTime: getCurrentTimestamp,
                                                                                  blockType: 'Text',
                                                                                  blockStatus: 'Published',
                                                                                  blockLayout: 'Paragraph',
                                                                                  fontSettings: createFontSettingsStruct(
                                                                                    fontSizeDouble: _model.fontSettingsWidget?.fontSizeDouble,
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                  text: _model.changedText != null && _model.changedText != '' ? _model.tesitEditController.text : widget.tileBlock?.text,
                                                                                ));
                                                                          } else if ((_model.blockTypeChipsValue == 'Image') ||
                                                                              (widget.tileBlock?.blockType ==
                                                                                  'Image')) {
                                                                            logFirebaseEvent('IconButton_backend_call');

                                                                            firestoreBatch.update(
                                                                                widget.tileBlock!.reference,
                                                                                createTileBlocksRecordData(
                                                                                  updatedTime: getCurrentTimestamp,
                                                                                  blockType: 'Image',
                                                                                  blockStatus: 'Published',
                                                                                ));
                                                                          } else if ((_model.blockTypeChipsValue == 'Video') ||
                                                                              (widget.tileBlock?.blockType == 'Video')) {
                                                                            logFirebaseEvent('IconButton_backend_call');

                                                                            firestoreBatch.update(
                                                                                widget.tileBlock!.reference,
                                                                                createTileBlocksRecordData(
                                                                                  updatedTime: getCurrentTimestamp,
                                                                                  blockType: 'Video',
                                                                                  blockStatus: 'Published',
                                                                                  blockLayout: 'Gallery',
                                                                                ));
                                                                          }

                                                                          logFirebaseEvent(
                                                                              'IconButton_update_component_state');
                                                                          _model
                                                                              .updatePage(() {
                                                                            _model.showEdit =
                                                                                valueOrDefault<bool>(
                                                                              _model.showEdit ? false : true,
                                                                              true,
                                                                            );
                                                                          });
                                                                          logFirebaseEvent(
                                                                              'IconButton_update_app_state');
                                                                          setState(
                                                                              () {
                                                                            FFAppState().drawerBlockId =
                                                                                '';
                                                                          });
                                                                        } finally {
                                                                          await firestoreBatch
                                                                              .commit();
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 40.0,
                                                                  child:
                                                                      VerticalDivider(
                                                                    thickness:
                                                                        1.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2,
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
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
                                                                    hoverColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .customColor7,
                                                                    hoverIconColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .library_add,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .grayIcon,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'BLOCKV3_COMP_library_add_ICN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'IconButton_bottom_sheet');
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: Container(
                                                                                height: 450.0,
                                                                                child: ImageGalleryWidget(
                                                                                  blockDoc: widget.tileBlock,
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
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
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
                                                                    hoverColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .customColor7,
                                                                    hoverIconColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .video_settings,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .grayIcon,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'BLOCKV3_COMP_video_settings_ICN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'IconButton_bottom_sheet');
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: Container(
                                                                                height: 450.0,
                                                                                child: VideoGalleryWidget(
                                                                                  blockDoc: widget.tileBlock!,
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
                                                                ),
                                                              ],
                                                            ),
                                                          ],
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
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      if ((loggedIn == true) &&
                          valueOrDefault<bool>(
                              currentUserDocument?.isadmin, false))
                        AuthUserStreamWidget(
                          builder: (context) => Container(
                            decoration: BoxDecoration(),
                          ),
                        ),
                    ],
                  ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Text(
                      FFAppState().videoControlType,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Text(
                      FFAppState().analyticsLocal.sessionId,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Text(
                      FFAppState().analyticsLocal.videoDuration.toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Text(
                      FFAppState().analyticsLocal.videoWatchedTime.toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  if (valueOrDefault<bool>(
                    (widget.tileBlock?.blockType == 'Text') &&
                        valueOrDefault<bool>(
                          (FFAppState().selectedcategory !=
                                  'Learning Journeys') ||
                              (FFAppState().selectedCategoryName !=
                                  'Learning Journeys'),
                          false,
                        ),
                    false,
                  ))
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          60.0, 30.0, 60.0, 30.0),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return 530.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return 650.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return 850.0;
                            } else {
                              return 1200.0;
                            }
                          }(),
                        ),
                        decoration: BoxDecoration(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.isadmin, false))
                                AuthUserStreamWidget(
                                  builder: (context) => Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownValueController ??=
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
                                                setState(() =>
                                                    _model.dropDownValue = val);
                                                logFirebaseEvent(
                                                    'BLOCKV3_DropDown_um5wyusl_ON_FORM_WIDGET');
                                                logFirebaseEvent(
                                                    'DropDown_update_component_state');
                                                _model.updatePage(() {
                                                  _model
                                                      .updateFontSettingsWidgetStruct(
                                                    (e) => e
                                                      ..fontSizeDouble = functions
                                                          .stringToDouble(_model
                                                              .dropDownValue!),
                                                  );
                                                });
                                              },
                                              width: 100.0,
                                              height: 50.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              borderWidth: 2.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 4.0),
                                              hidesUnderline: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .customColor7,
                                                  hoverIconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  icon: Icon(
                                                    Icons.library_add,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayIcon,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'BLOCKV3_COMP_library_add_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_bottom_sheet');
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child: Container(
                                                              height: 450.0,
                                                              child:
                                                                  ImageGalleryWidget(
                                                                blockDoc: widget
                                                                    .tileBlock,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    widget.tileBlock!.text,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 22.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (widget.tileBlock?.blockType == 'Image')
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          60.0, 20.0, 60.0, 20.0),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return 530.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return 550.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return 750.0;
                            } else {
                              return 1200.0;
                            }
                          }(),
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 200.0,
                                              child: Visibility(
                                                visible: widget
                                                        .tileBlock?.blockType ==
                                                    'Image',
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: Container(
                                                    width: 75.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textController1,
                                                      focusNode: _model
                                                          .textFieldFocusNode1,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.textController1',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () async {
                                                          logFirebaseEvent(
                                                              'BLOCKV3_TextField_rkm1fb4n_ON_TEXTFIELD_');
                                                          logFirebaseEvent(
                                                              'TextField_backend_call');

                                                          await widget
                                                              .tileBlock!
                                                              .reference
                                                              .update(
                                                                  createTileBlocksRecordData(
                                                            imageH: int
                                                                .tryParse(_model
                                                                    .textController1
                                                                    .text),
                                                          ));
                                                        },
                                                      ),
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Height PX',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        enabledBorder:
                                                            UnderlineInputBorder(
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
                                                            UnderlineInputBorder(
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
                                                            UnderlineInputBorder(
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
                                                            UnderlineInputBorder(
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
                                                            EdgeInsets.all(5.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      validator: _model
                                                          .textController1Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 200.0,
                                              child: Visibility(
                                                visible: widget
                                                        .tileBlock?.blockType ==
                                                    'Image',
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: Container(
                                                    width: 75.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textController2,
                                                      focusNode: _model
                                                          .textFieldFocusNode2,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.textController2',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () async {
                                                          logFirebaseEvent(
                                                              'BLOCKV3_TextField_0e4uprzj_ON_TEXTFIELD_');
                                                          logFirebaseEvent(
                                                              'TextField_backend_call');

                                                          await widget
                                                              .tileBlock!
                                                              .reference
                                                              .update(
                                                                  createTileBlocksRecordData(
                                                            imageW: int
                                                                .tryParse(_model
                                                                    .textController2
                                                                    .text),
                                                          ));
                                                        },
                                                      ),
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Width PX',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        enabledBorder:
                                                            UnderlineInputBorder(
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
                                                            UnderlineInputBorder(
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
                                                            UnderlineInputBorder(
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
                                                            UnderlineInputBorder(
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
                                                            EdgeInsets.all(5.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      validator: _model
                                                          .textController2Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              widget.tileBlock?.image,
                                              'https://res.cloudinary.com/dplpckpbm/image/upload/v1703535226/learningPathwaysBright_b3strj.webp',
                                            ),
                                            width: 300.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 800.0,
                                    ),
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 800.0,
                                    ),
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (widget.tileBlock?.blockType == 'Video')
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          60.0, 20.0, 60.0, 20.0),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return 530.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return 550.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return 750.0;
                            } else {
                              return 1200.0;
                            }
                          }(),
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 200.0,
                                              decoration: BoxDecoration(),
                                              child: Visibility(
                                                visible: widget
                                                        .tileBlock?.blockType ==
                                                    'Image',
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: Container(
                                                    width: 75.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textController3,
                                                      focusNode: _model
                                                          .textFieldFocusNode3,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.textController3',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () async {
                                                          logFirebaseEvent(
                                                              'BLOCKV3_TextField_pi2wdac5_ON_TEXTFIELD_');
                                                          logFirebaseEvent(
                                                              'TextField_backend_call');

                                                          await widget
                                                              .tileBlock!
                                                              .reference
                                                              .update(
                                                                  createTileBlocksRecordData(
                                                            imageH: int
                                                                .tryParse(_model
                                                                    .textController3
                                                                    .text),
                                                          ));
                                                        },
                                                      ),
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Height PX',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        enabledBorder:
                                                            UnderlineInputBorder(
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
                                                            UnderlineInputBorder(
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
                                                            UnderlineInputBorder(
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
                                                            UnderlineInputBorder(
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
                                                            EdgeInsets.all(5.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      validator: _model
                                                          .textController3Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 200.0,
                                              child: Visibility(
                                                visible: widget
                                                        .tileBlock?.blockType ==
                                                    'Image',
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: Container(
                                                    width: 75.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textController4,
                                                      focusNode: _model
                                                          .textFieldFocusNode4,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.textController4',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () async {
                                                          logFirebaseEvent(
                                                              'BLOCKV3_TextField_hrntf61r_ON_TEXTFIELD_');
                                                          logFirebaseEvent(
                                                              'TextField_backend_call');

                                                          await widget
                                                              .tileBlock!
                                                              .reference
                                                              .update(
                                                                  createTileBlocksRecordData(
                                                            imageW: int
                                                                .tryParse(_model
                                                                    .textController4
                                                                    .text),
                                                          ));
                                                        },
                                                      ),
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Width PX',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        enabledBorder:
                                                            UnderlineInputBorder(
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
                                                            UnderlineInputBorder(
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
                                                            UnderlineInputBorder(
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
                                                            UnderlineInputBorder(
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
                                                            EdgeInsets.all(5.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      validator: _model
                                                          .textController4Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                'https://picsum.photos/seed/754/600',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Video Name',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Video description',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ],
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
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 800.0,
                                    ),
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 800.0,
                                    ),
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 600.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (valueOrDefault<bool>(
                              () {
                                if (widget.tileBlock?.blockType == 'Text') {
                                  return true;
                                } else if (widget.tileBlock?.blockType !=
                                    'Text') {
                                  return false;
                                } else if (_model.blockTypeChipsValue ==
                                    'Text') {
                                  return true;
                                } else if (_model.blockTypeChipsValue !=
                                    'Text') {
                                  return false;
                                } else {
                                  return false;
                                }
                              }(),
                              false,
                            ))
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (_model.showEdit == true)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 15.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .tesitEditController,
                                                    focusNode: _model
                                                        .tesitEditFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.tesitEditController',
                                                      Duration(
                                                          milliseconds: 2000),
                                                      () async {
                                                        logFirebaseEvent(
                                                            'BLOCKV3_tesitEdit_ON_TEXTFIELD_CHANGE');
                                                        logFirebaseEvent(
                                                            'tesitEdit_update_component_state');
                                                        setState(() {
                                                          _model.changedText =
                                                              _model
                                                                  .tesitEditController
                                                                  .text;
                                                        });
                                                      },
                                                    ),
                                                    obscureText: false,
                                                    decoration: InputDecoration(
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
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE0E0E0),
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
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
                                                                      .bodyMediumFamily),
                                                        ),
                                                    maxLines: null,
                                                    validator: _model
                                                        .tesitEditControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                    ),
                                  ),
                                ],
                              ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.sizeOf(context).width * 1.0,
                                ),
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Visibility(
                                        visible: valueOrDefault<bool>(
                                          () {
                                            if (widget.tileBlock?.blockType ==
                                                'Document') {
                                              return true;
                                            } else if (widget
                                                    .tileBlock?.blockType !=
                                                'Document') {
                                              return false;
                                            } else if (_model
                                                    .blockTypeChipsValue ==
                                                'Document') {
                                              return true;
                                            } else if (_model
                                                    .blockTypeChipsValue !=
                                                'Document') {
                                              return false;
                                            } else {
                                              return false;
                                            }
                                          }(),
                                          false,
                                        ),
                                        child: wrapWithModel(
                                          model: _model.documentModel,
                                          updateCallback: () => setState(() {}),
                                          child: DocumentWidget(
                                            tileBlock: widget.tileBlock!,
                                            isEditPassed: _model.showEdit,
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
