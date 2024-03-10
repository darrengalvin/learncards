import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'edit_tile_block_copy_model.dart';
export 'edit_tile_block_copy_model.dart';

class EditTileBlockCopyWidget extends StatefulWidget {
  const EditTileBlockCopyWidget({
    super.key,
    String? initialTileId,
    this.tiles,
    this.blocks,
    this.iniitalBlockId,
  }) : initialTileId = initialTileId ?? '';

  final String initialTileId;
  final List<Tilesv2Record>? tiles;
  final List<TileBlocksRecord>? blocks;
  final String? iniitalBlockId;

  @override
  State<EditTileBlockCopyWidget> createState() =>
      _EditTileBlockCopyWidgetState();
}

class _EditTileBlockCopyWidgetState extends State<EditTileBlockCopyWidget> {
  late EditTileBlockCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditTileBlockCopyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EDIT_TILE_BLOCK_COPY_EditTileBlockCopy_O');
      logFirebaseEvent('EditTileBlockCopy_update_component_state');
      setState(() {
        _model.selectedTileId =
            widget.initialTileId != ''
                ? widget.initialTileId
                : '';
        _model.selectedBlockId =
            widget.iniitalBlockId != null && widget.iniitalBlockId != ''
                ? widget.iniitalBlockId
                : '';
      });
    });

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
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: StreamBuilder<List<Tilesv2Record>>(
        stream: queryTilesv2Record(
          queryBuilder: (tilesv2Record) => tilesv2Record.orderBy('tile_index'),
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
          List<Tilesv2Record> containerTilesv2RecordList = snapshot.data!;
          return Container(
            height: MediaQuery.sizeOf(context).height * 1.0,
            constraints: const BoxConstraints(
              maxHeight: 700.0,
            ),
            decoration: const BoxDecoration(
              color: Color(0x35000000),
            ),
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: StreamBuilder<List<TileBlocksRecord>>(
                        stream: queryTileBlocksRecord(
                          queryBuilder: (tileBlocksRecord) =>
                              tileBlocksRecord.orderBy('block_index'),
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
                          List<TileBlocksRecord> containerTileBlocksRecordList =
                              snapshot.data!;
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(24.0),
                            child: Container(
                              height: 600.0,
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.sizeOf(context).width * 0.9,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 7.0,
                                    color: Color(0x32171717),
                                    offset: Offset(0.0, -4.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 240),
                                      curve: Curves.easeInOut,
                                      width: 400.0,
                                      constraints: const BoxConstraints(
                                        minWidth: 60.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 60.0,
                                                icon: Icon(
                                                  Icons.grid_view_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 30.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'EDIT_TILE_BLOCK_COPY_grid_view_rounded_I');
                                                  logFirebaseEvent(
                                                      'IconButton_action_block');
                                                  await _model.animateSection(
                                                    context,
                                                    collapsedSize: 60.0,
                                                    expandedSize: 350.0,
                                                  );
                                                  setState(() {});
                                                },
                                              ),
                                              Container(
                                                width: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    60.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Transform.rotate(
                                                          angle: -1.5708,
                                                          alignment: const Alignment(
                                                              -1.0, 0.0),
                                                          origin:
                                                              const Offset(30.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        30.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Tiles',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        22.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    lineHeight:
                                                                        1.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 60.0,
                                                      icon: const Icon(
                                                        Icons.arrow_forward_ios,
                                                        color:
                                                            Color(0xFF1AADF9),
                                                        size: 30.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'EDIT_TILE_BLOCK_COPY_arrow_forward_ios_I');
                                                        logFirebaseEvent(
                                                            'IconButton_bottom_sheet');
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    if (false)
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        icon: Icon(
                                                          Icons
                                                              .grid_view_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 30.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'EDIT_TILE_BLOCK_COPY_grid_view_rounded_I');
                                                          logFirebaseEvent(
                                                              'IconButton_bottom_sheet');
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    Text(
                                                      'Manage Tiles',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Outfit'),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 18.0,
                                                          12.0, 12.0),
                                                  child: Container(
                                                    width: 300.0,
                                                    height: 600.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0x4CD0E5FF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    24.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    50.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .arrow_back_ios_new_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'EDIT_TILE_BLOCK_COPY_arrow_back_ios_new_');
                                                                  logFirebaseEvent(
                                                                      'IconButton_update_component_state');
                                                                  setState(() {
                                                                    _model.selectedTileId =
                                                                        valueOrDefault<
                                                                            String>(
                                                                      widget
                                                                          .tiles
                                                                          ?.where((e) =>
                                                                              valueOrDefault<bool>(
                                                                                e.reference.id == _model.selectedTileId,
                                                                                false,
                                                                              ))
                                                                          .toList()
                                                                          .first
                                                                          .parentId,
                                                                      '0',
                                                                    );
                                                                  });
                                                                },
                                                              ),
                                                              if (false)
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      60.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .grid_view_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 30.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'EDIT_TILE_BLOCK_COPY_grid_view_rounded_I');
                                                                    logFirebaseEvent(
                                                                        'IconButton_bottom_sheet');
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                ),
                                                              Expanded(
                                                                child: Text(
                                                                  'View Parent',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            20.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey('Outfit'),
                                                                      ),
                                                                ),
                                                              ),
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    24.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    50.0,
                                                                icon: Icon(
                                                                  Icons.add,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 30.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'EDIT_TILE_BLOCK_COPY_COMP_add_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_backend_call');

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
                                                                      type:
                                                                          'Content',
                                                                      title:
                                                                          'New Tile',
                                                                      subtitle:
                                                                          '',
                                                                      details:
                                                                          '',
                                                                      image: '',
                                                                      thumbnail:
                                                                          '',
                                                                      isPublished:
                                                                          false,
                                                                      layout:
                                                                          '',
                                                                      category:
                                                                          '',
                                                                      isPublic:
                                                                          false,
                                                                      isPinned:
                                                                          false,
                                                                      isFeatured:
                                                                          false,
                                                                      parentId:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        _model
                                                                            .selectedTileId,
                                                                        '0',
                                                                      ),
                                                                      tileTier:
                                                                          valueOrDefault<
                                                                              int>(
                                                                        () {
                                                                          if (_model.selectedTileId == null ||
                                                                              _model.selectedTileId ==
                                                                                  '') {
                                                                            return 0;
                                                                          } else if (_model.selectedTileId ==
                                                                              '0') {
                                                                            return 0;
                                                                          } else {
                                                                            return valueOrDefault<int>(
                                                                              valueOrDefault<int>(
                                                                                    widget.tiles
                                                                                        ?.where((e) => valueOrDefault<bool>(
                                                                                              e.reference.id ==
                                                                                                  valueOrDefault<String>(
                                                                                                    _model.selectedTileId,
                                                                                                    '0',
                                                                                                  ),
                                                                                              false,
                                                                                            ))
                                                                                        .toList()
                                                                                        .first
                                                                                        .tileTier,
                                                                                    0,
                                                                                  ) ??
                                                                                  0 + 1,
                                                                              0,
                                                                            );
                                                                          }
                                                                        }(),
                                                                        0,
                                                                      ),
                                                                      tileIndex:
                                                                          valueOrDefault<
                                                                              int>(
                                                                        valueOrDefault<int>(
                                                                              widget.tiles
                                                                                  ?.where((e) => valueOrDefault<bool>(
                                                                                        e.parentId ==
                                                                                            valueOrDefault<String>(
                                                                                              _model.selectedTileId,
                                                                                              '0',
                                                                                            ),
                                                                                        false,
                                                                                      ))
                                                                                  .toList()
                                                                                  .length,
                                                                              0,
                                                                            ) ??
                                                                            0,
                                                                        0,
                                                                      ),
                                                                      isContent: valueOrDefault<int>(
                                                                                () {
                                                                                  if (_model.selectedTileId == null || _model.selectedTileId == '') {
                                                                                    return 0;
                                                                                  } else if (_model.selectedTileId == '0') {
                                                                                    return 0;
                                                                                  } else {
                                                                                    return valueOrDefault<int>(
                                                                                      valueOrDefault<int>(
                                                                                            widget.tiles
                                                                                                ?.where((e) => valueOrDefault<bool>(
                                                                                                      e.reference.id ==
                                                                                                          valueOrDefault<String>(
                                                                                                            _model.selectedTileId,
                                                                                                            '0',
                                                                                                          ),
                                                                                                      false,
                                                                                                    ))
                                                                                                .toList()
                                                                                                .first
                                                                                                .tileTier,
                                                                                            0,
                                                                                          ) ??
                                                                                          0 + 1,
                                                                                      0,
                                                                                    );
                                                                                  }
                                                                                }(),
                                                                                0,
                                                                              ) <
                                                                              2
                                                                          ? false
                                                                          : true,
                                                                      tileId:
                                                                          '',
                                                                      tileType:
                                                                          'Content',
                                                                      tileName:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        'Tile${valueOrDefault<String>(
                                                                          () {
                                                                            if (_model.selectedTileId == null ||
                                                                                _model.selectedTileId == '') {
                                                                              return 0;
                                                                            } else if (_model.selectedTileId == '0') {
                                                                              return 0;
                                                                            } else {
                                                                              return valueOrDefault<int>(
                                                                                valueOrDefault<int>(
                                                                                      widget.tiles
                                                                                          ?.where((e) => valueOrDefault<bool>(
                                                                                                e.reference.id ==
                                                                                                    valueOrDefault<String>(
                                                                                                      _model.selectedTileId,
                                                                                                      '0',
                                                                                                    ),
                                                                                                false,
                                                                                              ))
                                                                                          .toList()
                                                                                          .first
                                                                                          .tileTier,
                                                                                      0,
                                                                                    ) ??
                                                                                    0 + 1,
                                                                                0,
                                                                              );
                                                                            }
                                                                          }()
                                                                              .toString(),
                                                                          '0',
                                                                        )}-${valueOrDefault<String>(
                                                                          (valueOrDefault<int>(
                                                                                    widget.tiles
                                                                                        ?.where((e) => valueOrDefault<bool>(
                                                                                              e.parentId ==
                                                                                                  valueOrDefault<String>(
                                                                                                    _model.selectedTileId,
                                                                                                    '0',
                                                                                                  ),
                                                                                              false,
                                                                                            ))
                                                                                        .toList()
                                                                                        .length,
                                                                                    0,
                                                                                  ) ??
                                                                                  0)
                                                                              .toString(),
                                                                          '0',
                                                                        )}',
                                                                        '0',
                                                                      ),
                                                                      tileStatus:
                                                                          'Draft',
                                                                    ),
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'tags':
                                                                            [
                                                                          ''
                                                                        ],
                                                                        'access_users':
                                                                            [],
                                                                        'access_groups':
                                                                            [
                                                                          _model.selectedTileId != null && _model.selectedTileId != ''
                                                                              ? widget.tiles
                                                                                  ?.where((e) => valueOrDefault<bool>(
                                                                                        e.reference.id == _model.selectedTileId,
                                                                                        false,
                                                                                      ))
                                                                                  .toList()
                                                                                  .first
                                                                                  .accessGroups
                                                                                  .first
                                                                              : ''
                                                                        ],
                                                                        'admin_users':
                                                                            [
                                                                          currentUserUid
                                                                        ],
                                                                      },
                                                                    ),
                                                                  });
                                                                  _model.newChildTile =
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
                                                                      type:
                                                                          'Content',
                                                                      title:
                                                                          'New Tile',
                                                                      subtitle:
                                                                          '',
                                                                      details:
                                                                          '',
                                                                      image: '',
                                                                      thumbnail:
                                                                          '',
                                                                      isPublished:
                                                                          false,
                                                                      layout:
                                                                          '',
                                                                      category:
                                                                          '',
                                                                      isPublic:
                                                                          false,
                                                                      isPinned:
                                                                          false,
                                                                      isFeatured:
                                                                          false,
                                                                      parentId:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        _model
                                                                            .selectedTileId,
                                                                        '0',
                                                                      ),
                                                                      tileTier:
                                                                          valueOrDefault<
                                                                              int>(
                                                                        () {
                                                                          if (_model.selectedTileId == null ||
                                                                              _model.selectedTileId ==
                                                                                  '') {
                                                                            return 0;
                                                                          } else if (_model.selectedTileId ==
                                                                              '0') {
                                                                            return 0;
                                                                          } else {
                                                                            return valueOrDefault<int>(
                                                                              valueOrDefault<int>(
                                                                                    widget.tiles
                                                                                        ?.where((e) => valueOrDefault<bool>(
                                                                                              e.reference.id ==
                                                                                                  valueOrDefault<String>(
                                                                                                    _model.selectedTileId,
                                                                                                    '0',
                                                                                                  ),
                                                                                              false,
                                                                                            ))
                                                                                        .toList()
                                                                                        .first
                                                                                        .tileTier,
                                                                                    0,
                                                                                  ) ??
                                                                                  0 + 1,
                                                                              0,
                                                                            );
                                                                          }
                                                                        }(),
                                                                        0,
                                                                      ),
                                                                      tileIndex:
                                                                          valueOrDefault<
                                                                              int>(
                                                                        valueOrDefault<int>(
                                                                              widget.tiles
                                                                                  ?.where((e) => valueOrDefault<bool>(
                                                                                        e.parentId ==
                                                                                            valueOrDefault<String>(
                                                                                              _model.selectedTileId,
                                                                                              '0',
                                                                                            ),
                                                                                        false,
                                                                                      ))
                                                                                  .toList()
                                                                                  .length,
                                                                              0,
                                                                            ) ??
                                                                            0,
                                                                        0,
                                                                      ),
                                                                      isContent: valueOrDefault<int>(
                                                                                () {
                                                                                  if (_model.selectedTileId == null || _model.selectedTileId == '') {
                                                                                    return 0;
                                                                                  } else if (_model.selectedTileId == '0') {
                                                                                    return 0;
                                                                                  } else {
                                                                                    return valueOrDefault<int>(
                                                                                      valueOrDefault<int>(
                                                                                            widget.tiles
                                                                                                ?.where((e) => valueOrDefault<bool>(
                                                                                                      e.reference.id ==
                                                                                                          valueOrDefault<String>(
                                                                                                            _model.selectedTileId,
                                                                                                            '0',
                                                                                                          ),
                                                                                                      false,
                                                                                                    ))
                                                                                                .toList()
                                                                                                .first
                                                                                                .tileTier,
                                                                                            0,
                                                                                          ) ??
                                                                                          0 + 1,
                                                                                      0,
                                                                                    );
                                                                                  }
                                                                                }(),
                                                                                0,
                                                                              ) <
                                                                              2
                                                                          ? false
                                                                          : true,
                                                                      tileId:
                                                                          '',
                                                                      tileType:
                                                                          'Content',
                                                                      tileName:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        'Tile${valueOrDefault<String>(
                                                                          () {
                                                                            if (_model.selectedTileId == null ||
                                                                                _model.selectedTileId == '') {
                                                                              return 0;
                                                                            } else if (_model.selectedTileId == '0') {
                                                                              return 0;
                                                                            } else {
                                                                              return valueOrDefault<int>(
                                                                                valueOrDefault<int>(
                                                                                      widget.tiles
                                                                                          ?.where((e) => valueOrDefault<bool>(
                                                                                                e.reference.id ==
                                                                                                    valueOrDefault<String>(
                                                                                                      _model.selectedTileId,
                                                                                                      '0',
                                                                                                    ),
                                                                                                false,
                                                                                              ))
                                                                                          .toList()
                                                                                          .first
                                                                                          .tileTier,
                                                                                      0,
                                                                                    ) ??
                                                                                    0 + 1,
                                                                                0,
                                                                              );
                                                                            }
                                                                          }()
                                                                              .toString(),
                                                                          '0',
                                                                        )}-${valueOrDefault<String>(
                                                                          (valueOrDefault<int>(
                                                                                    widget.tiles
                                                                                        ?.where((e) => valueOrDefault<bool>(
                                                                                              e.parentId ==
                                                                                                  valueOrDefault<String>(
                                                                                                    _model.selectedTileId,
                                                                                                    '0',
                                                                                                  ),
                                                                                              false,
                                                                                            ))
                                                                                        .toList()
                                                                                        .length,
                                                                                    0,
                                                                                  ) ??
                                                                                  0)
                                                                              .toString(),
                                                                          '0',
                                                                        )}',
                                                                        '0',
                                                                      ),
                                                                      tileStatus:
                                                                          'Draft',
                                                                    ),
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'tags':
                                                                            [
                                                                          ''
                                                                        ],
                                                                        'access_users':
                                                                            [],
                                                                        'access_groups':
                                                                            [
                                                                          _model.selectedTileId != null && _model.selectedTileId != ''
                                                                              ? widget.tiles
                                                                                  ?.where((e) => valueOrDefault<bool>(
                                                                                        e.reference.id == _model.selectedTileId,
                                                                                        false,
                                                                                      ))
                                                                                  .toList()
                                                                                  .first
                                                                                  .accessGroups
                                                                                  .first
                                                                              : ''
                                                                        ],
                                                                        'admin_users':
                                                                            [
                                                                          currentUserUid
                                                                        ],
                                                                      },
                                                                    ),
                                                                  }, tilesv2RecordReference);
                                                                  logFirebaseEvent(
                                                                      'IconButton_backend_call');

                                                                  await _model
                                                                      .newChildTile!
                                                                      .reference
                                                                      .update(
                                                                          createTilesv2RecordData(
                                                                    tileId: _model
                                                                        .newBlock
                                                                        ?.reference
                                                                        .id,
                                                                  ));

                                                                  setState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        12.0,
                                                                        4.0,
                                                                        4.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final tile = () {
                                                                      if (_model.selectedTileId !=
                                                                              null &&
                                                                          _model.selectedTileId !=
                                                                              '') {
                                                                        return widget
                                                                            .tiles
                                                                            ?.where((e) =>
                                                                                valueOrDefault<bool>(
                                                                                  e.parentId == _model.selectedTileId,
                                                                                  false,
                                                                                ))
                                                                            .toList();
                                                                      } else if (_model
                                                                              .selectedTileId ==
                                                                          '0') {
                                                                        return widget
                                                                            .tiles
                                                                            ?.where((e) =>
                                                                                valueOrDefault<bool>(
                                                                                  e.tileTier == 0,
                                                                                  false,
                                                                                ))
                                                                            .toList();
                                                                      } else {
                                                                        return widget
                                                                            .tiles
                                                                            ?.where((e) =>
                                                                                valueOrDefault<bool>(
                                                                                  e.tileTier == 0,
                                                                                  false,
                                                                                ))
                                                                            .toList();
                                                                      }
                                                                    }()
                                                                        ?.toList() ??
                                                                    [];
                                                                return ReorderableListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount: tile
                                                                      .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          tileIndex) {
                                                                    final tileItem =
                                                                        tile[
                                                                            tileIndex];
                                                                    return Container(
                                                                      key: ValueKey("ListView_p4yknspy" '_' +
                                                                          tileIndex
                                                                              .toString()),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              400.0,
                                                                          height:
                                                                              60.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                48.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('EDIT_TILE_BLOCK_COPY_Icon_7hcd7xe0_ON_TA');
                                                                                    logFirebaseEvent('Icon_backend_call');
                                                                                    await tileItem.reference.delete();
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.remove_circle_sharp,
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 4.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('EDIT_TILE_BLOCK_COPY_Column_5wftkxw9_ON_');
                                                                                        logFirebaseEvent('Column_update_component_state');
                                                                                        setState(() {
                                                                                          _model.selectedTileId = tileItem.reference.id;
                                                                                          _model.selectedBlockId = '';
                                                                                        });
                                                                                      },
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Flexible(
                                                                                            child: Text(
                                                                                              tileItem.title,
                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 18.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Poppins'),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Flexible(
                                                                                            child: Text(
                                                                                              'Tile${valueOrDefault<String>(
                                                                                                tileItem.tileTier.toString(),
                                                                                                '0',
                                                                                              )}-${tileItem.tileIndex.toString()}',
                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: 'Outfit',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontSize: 14.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
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
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  onReorder: (int
                                                                          reorderableOldIndex,
                                                                      int reorderableNewIndex) async {
                                                                    logFirebaseEvent(
                                                                        'EDIT_TILE_BLOCK_COPY_ListView_p4yknspy_O');
                                                                    logFirebaseEvent(
                                                                        'ListView_backend_call');

                                                                    await tile[
                                                                            reorderableOldIndex]
                                                                        .reference
                                                                        .update(
                                                                            createTilesv2RecordData(
                                                                          tileIndex:
                                                                              reorderableNewIndex,
                                                                        ));
                                                                    logFirebaseEvent(
                                                                        'ListView_update_component_state');
                                                                    setState(
                                                                        () {
                                                                      _model.loopCounter =
                                                                          valueOrDefault<
                                                                              int>(
                                                                        reorderableNewIndex >
                                                                                reorderableOldIndex
                                                                            ? reorderableOldIndex
                                                                            : reorderableNewIndex,
                                                                        0,
                                                                      );
                                                                    });
                                                                    while (_model
                                                                            .loopCounter <
                                                                        valueOrDefault<
                                                                            int>(
                                                                          () {
                                                                            if (_model.selectedTileId != null &&
                                                                                _model.selectedTileId != '') {
                                                                              return widget.tiles
                                                                                  ?.where((e) => valueOrDefault<bool>(
                                                                                        e.parentId == _model.selectedTileId,
                                                                                        false,
                                                                                      ))
                                                                                  .toList();
                                                                            } else if (_model.selectedTileId == '0') {
                                                                              return widget.tiles
                                                                                  ?.where((e) => valueOrDefault<bool>(
                                                                                        e.tileTier == 0,
                                                                                        false,
                                                                                      ))
                                                                                  .toList();
                                                                            } else {
                                                                              return widget.tiles
                                                                                  ?.where((e) => valueOrDefault<bool>(
                                                                                        e.tileTier == 0,
                                                                                        false,
                                                                                      ))
                                                                                  .toList();
                                                                            }
                                                                          }()
                                                                              ?.length,
                                                                          0,
                                                                        )) {
                                                                      logFirebaseEvent(
                                                                          'ListView_backend_call');

                                                                      await tile[_model
                                                                              .loopCounter]
                                                                          .reference
                                                                          .update(
                                                                              createTilesv2RecordData());
                                                                    }

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                );
                                                              },
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
                                        ],
                                      ),
                                    ),
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 240),
                                      curve: Curves.easeInOut,
                                      width: valueOrDefault<double>(
                                        _model.selectedTileId != null &&
                                                _model.selectedTileId != ''
                                            ? 400.0
                                            : 60.0,
                                        400.0,
                                      ),
                                      constraints: const BoxConstraints(
                                        minWidth: 60.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 60.0,
                                                icon: Icon(
                                                  Icons.list,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 30.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'EDIT_TILE_BLOCK_COPY_list_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_action_block');
                                                  await _model.animateSection(
                                                    context,
                                                    collapsedSize: 60.0,
                                                    expandedSize: 350.0,
                                                  );
                                                  setState(() {});
                                                },
                                              ),
                                              Container(
                                                width: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    80.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Transform.rotate(
                                                          angle: -1.5708,
                                                          alignment: const Alignment(
                                                              -1.0, 0.0),
                                                          origin:
                                                              const Offset(30.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        30.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Blocks',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        22.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    lineHeight:
                                                                        1.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 300.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        icon: const Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color:
                                                              Color(0xFF1AADF9),
                                                          size: 30.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'EDIT_TILE_BLOCK_COPY_arrow_forward_ios_I');
                                                          logFirebaseEvent(
                                                              'IconButton_bottom_sheet');
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                      if (false)
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 60.0,
                                                          icon: Icon(
                                                            Icons
                                                                .grid_view_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 30.0,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'EDIT_TILE_BLOCK_COPY_grid_view_rounded_I');
                                                            logFirebaseEvent(
                                                                'IconButton_bottom_sheet');
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      Text(
                                                        'Content Blocks',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      20.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Outfit'),
                                                                ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        icon: const Icon(
                                                          Icons.add,
                                                          color:
                                                              Color(0xFF1AADF9),
                                                          size: 30.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'EDIT_TILE_BLOCK_COPY_COMP_add_ICN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'IconButton_bottom_sheet');
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 18.0,
                                                          12.0, 12.0),
                                                  child: Container(
                                                    width: 300.0,
                                                    height: 600.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0x4CD0E5FF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    24.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    50.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .arrow_back_ios_new_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'EDIT_TILE_BLOCK_COPY_arrow_back_ios_new_');
                                                                  logFirebaseEvent(
                                                                      'IconButton_update_component_state');
                                                                  setState(() {
                                                                    _model.selectedTileId = widget
                                                                        .tiles
                                                                        ?.where((e) =>
                                                                            valueOrDefault<bool>(
                                                                              e.reference.id == _model.selectedTileId,
                                                                              false,
                                                                            ))
                                                                        .toList()
                                                                        .first
                                                                        .parentId;
                                                                  });
                                                                },
                                                              ),
                                                              if (false)
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      60.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .grid_view_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 30.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'EDIT_TILE_BLOCK_COPY_grid_view_rounded_I');
                                                                    logFirebaseEvent(
                                                                        'IconButton_bottom_sheet');
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                ),
                                                              Expanded(
                                                                child: Text(
                                                                  'View Parent',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            20.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey('Outfit'),
                                                                      ),
                                                                ),
                                                              ),
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    24.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    50.0,
                                                                icon: Icon(
                                                                  Icons.add,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 30.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'EDIT_TILE_BLOCK_COPY_COMP_add_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_backend_call');

                                                                  var tileBlocksRecordReference =
                                                                      TileBlocksRecord
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
                                                                          valueOrDefault<
                                                                              int>(
                                                                        widget
                                                                            .blocks
                                                                            ?.where((e) =>
                                                                                valueOrDefault<bool>(
                                                                                  _model.selectedTileId != null && _model.selectedTileId != ''
                                                                                      ? valueOrDefault<bool>(
                                                                                          e.tileId == _model.selectedTileId,
                                                                                          false,
                                                                                        )
                                                                                      : false,
                                                                                  false,
                                                                                ))
                                                                            .toList()
                                                                            .length,
                                                                        0,
                                                                      ),
                                                                      blockName:
                                                                          'Block-${valueOrDefault<String>(
                                                                        widget
                                                                            .blocks
                                                                            ?.where((e) =>
                                                                                valueOrDefault<bool>(
                                                                                  _model.selectedTileId != null && _model.selectedTileId != ''
                                                                                      ? valueOrDefault<bool>(
                                                                                          e.tileId == _model.selectedTileId,
                                                                                          false,
                                                                                        )
                                                                                      : false,
                                                                                  false,
                                                                                ))
                                                                            .toList()
                                                                            .length
                                                                            .toString(),
                                                                        '0',
                                                                      )}',
                                                                      blockStatus:
                                                                          'Draft',
                                                                      tileId: _model
                                                                          .selectedTileId,
                                                                      image: '',
                                                                      thumbnail:
                                                                          '',
                                                                      isDefaultTheme:
                                                                          true,
                                                                      blockLayout:
                                                                          'Default',
                                                                      blockTitle:
                                                                          'Block-${valueOrDefault<String>(
                                                                        widget
                                                                            .blocks
                                                                            ?.where((e) =>
                                                                                valueOrDefault<bool>(
                                                                                  _model.selectedTileId != null && _model.selectedTileId != ''
                                                                                      ? valueOrDefault<bool>(
                                                                                          e.tileId == _model.selectedTileId,
                                                                                          false,
                                                                                        )
                                                                                      : false,
                                                                                  false,
                                                                                ))
                                                                            .toList()
                                                                            .length
                                                                            .toString(),
                                                                        '0',
                                                                      )}',
                                                                      blockSubtitle:
                                                                          '',
                                                                      video: '',
                                                                      audio: '',
                                                                      text: '',
                                                                      header:
                                                                          '',
                                                                      subtitle:
                                                                          '',
                                                                      title: '',
                                                                    ),
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'audio_gallery':
                                                                            functions.emptyAudioList(),
                                                                        'video_gallery':
                                                                            functions.emptyVideoList(),
                                                                        'textList':
                                                                            [],
                                                                        'image_gallery':
                                                                            functions.emptyImageList(),
                                                                      },
                                                                    ),
                                                                  });
                                                                  _model.newBlock =
                                                                      TileBlocksRecord
                                                                          .getDocumentFromData({
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
                                                                          valueOrDefault<
                                                                              int>(
                                                                        widget
                                                                            .blocks
                                                                            ?.where((e) =>
                                                                                valueOrDefault<bool>(
                                                                                  _model.selectedTileId != null && _model.selectedTileId != ''
                                                                                      ? valueOrDefault<bool>(
                                                                                          e.tileId == _model.selectedTileId,
                                                                                          false,
                                                                                        )
                                                                                      : false,
                                                                                  false,
                                                                                ))
                                                                            .toList()
                                                                            .length,
                                                                        0,
                                                                      ),
                                                                      blockName:
                                                                          'Block-${valueOrDefault<String>(
                                                                        widget
                                                                            .blocks
                                                                            ?.where((e) =>
                                                                                valueOrDefault<bool>(
                                                                                  _model.selectedTileId != null && _model.selectedTileId != ''
                                                                                      ? valueOrDefault<bool>(
                                                                                          e.tileId == _model.selectedTileId,
                                                                                          false,
                                                                                        )
                                                                                      : false,
                                                                                  false,
                                                                                ))
                                                                            .toList()
                                                                            .length
                                                                            .toString(),
                                                                        '0',
                                                                      )}',
                                                                      blockStatus:
                                                                          'Draft',
                                                                      tileId: _model
                                                                          .selectedTileId,
                                                                      image: '',
                                                                      thumbnail:
                                                                          '',
                                                                      isDefaultTheme:
                                                                          true,
                                                                      blockLayout:
                                                                          'Default',
                                                                      blockTitle:
                                                                          'Block-${valueOrDefault<String>(
                                                                        widget
                                                                            .blocks
                                                                            ?.where((e) =>
                                                                                valueOrDefault<bool>(
                                                                                  _model.selectedTileId != null && _model.selectedTileId != ''
                                                                                      ? valueOrDefault<bool>(
                                                                                          e.tileId == _model.selectedTileId,
                                                                                          false,
                                                                                        )
                                                                                      : false,
                                                                                  false,
                                                                                ))
                                                                            .toList()
                                                                            .length
                                                                            .toString(),
                                                                        '0',
                                                                      )}',
                                                                      blockSubtitle:
                                                                          '',
                                                                      video: '',
                                                                      audio: '',
                                                                      text: '',
                                                                      header:
                                                                          '',
                                                                      subtitle:
                                                                          '',
                                                                      title: '',
                                                                    ),
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'audio_gallery':
                                                                            functions.emptyAudioList(),
                                                                        'video_gallery':
                                                                            functions.emptyVideoList(),
                                                                        'textList':
                                                                            [],
                                                                        'image_gallery':
                                                                            functions.emptyImageList(),
                                                                      },
                                                                    ),
                                                                  }, tileBlocksRecordReference);
                                                                  logFirebaseEvent(
                                                                      'IconButton_backend_call');

                                                                  await _model
                                                                      .newBlock!
                                                                      .reference
                                                                      .update(
                                                                          createTileBlocksRecordData(
                                                                    blockId: _model
                                                                        .newBlock
                                                                        ?.reference
                                                                        .id,
                                                                  ));
                                                                  logFirebaseEvent(
                                                                      'IconButton_update_component_state');
                                                                  setState(() {
                                                                    _model.selectedBlockId = _model
                                                                        .newBlock
                                                                        ?.reference
                                                                        .id;
                                                                  });

                                                                  setState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        12.0,
                                                                        4.0,
                                                                        4.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final block = widget
                                                                        .blocks
                                                                        ?.where((e) =>
                                                                            valueOrDefault<bool>(
                                                                              _model.selectedTileId != null && _model.selectedTileId != ''
                                                                                  ? valueOrDefault<bool>(
                                                                                      e.tileId == _model.selectedTileId,
                                                                                      false,
                                                                                    )
                                                                                  : false,
                                                                              false,
                                                                            ))
                                                                        .toList()
                                                                        .toList() ??
                                                                    [];
                                                                return ReorderableListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount: block
                                                                      .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          blockIndex) {
                                                                    final blockItem =
                                                                        block[
                                                                            blockIndex];
                                                                    return Container(
                                                                      key: ValueKey("ListView_d4tvtjt4" '_' +
                                                                          blockIndex
                                                                              .toString()),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              400.0,
                                                                          height:
                                                                              60.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                48.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('EDIT_TILE_BLOCK_COPY_Icon_a49fz5s4_ON_TA');
                                                                                    logFirebaseEvent('Icon_backend_call');
                                                                                    await blockItem.reference.delete();
                                                                                    logFirebaseEvent('Icon_update_component_state');
                                                                                    setState(() {
                                                                                      _model.selectedBlockId = '';
                                                                                    });
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.remove_circle_sharp,
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 4.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('EDIT_TILE_BLOCK_COPY_Column_ipcbm0z6_ON_');
                                                                                        logFirebaseEvent('Column_update_component_state');
                                                                                        setState(() {
                                                                                          _model.selectedBlockId = blockItem.reference.id;
                                                                                          _model.blockLayout = blockItem.blockType;
                                                                                        });
                                                                                      },
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Flexible(
                                                                                            child: Text(
                                                                                              blockItem.blockType,
                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 18.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Poppins'),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Flexible(
                                                                                            child: Text(
                                                                                              blockItem.blockName,
                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontSize: 14.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Poppins'),
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
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  onReorder: (int
                                                                          reorderableOldIndex,
                                                                      int reorderableNewIndex) async {},
                                                                );
                                                              },
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
                                        ],
                                      ),
                                    ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      Container(
                                        width: 400.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 60.0,
                                                  icon: Icon(
                                                    Icons.grid_on_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'EDIT_TILE_BLOCK_COPY_grid_on_outlined_IC');
                                                    logFirebaseEvent(
                                                        'IconButton_bottom_sheet');
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 18.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      80.0,
                                                                      0.0,
                                                                      0.0),
                                                          child:
                                                              Transform.rotate(
                                                            angle: -1.5708,
                                                            alignment:
                                                                const Alignment(
                                                                    -1.0, 0.0),
                                                            origin: const Offset(
                                                                30.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Block Layouts',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      lineHeight:
                                                                          1.0,
                                                                    ),
                                                              ),
                                                            ),
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
                                    if (valueOrDefault<bool>(
                                          _model.selectedBlockId != null &&
                                              _model.selectedBlockId != '',
                                          false,
                                        ) &&
                                        responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                        ))
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 60.0,
                                                    icon: const Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Color(0xFF1AADF9),
                                                      size: 30.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'EDIT_TILE_BLOCK_COPY_arrow_forward_ios_I');
                                                      logFirebaseEvent(
                                                          'IconButton_bottom_sheet');
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  if (false)
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 60.0,
                                                      icon: Icon(
                                                        Icons.grid_view_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 30.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'EDIT_TILE_BLOCK_COPY_grid_view_rounded_I');
                                                        logFirebaseEvent(
                                                            'IconButton_bottom_sheet');
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  Text(
                                                    'Block Layouts',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts:
                                                              GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Outfit'),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 18.0, 12.0, 12.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Container(
                                                  width: 300.0,
                                                  height: 600.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Divider(
                                                        thickness: 1.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .btnBk,
                                                      ),
                                                      if (valueOrDefault<bool>(
                                                        _model.blockLayout !=
                                                                null &&
                                                            _model.blockLayout !=
                                                                '',
                                                        false,
                                                      ))
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            4.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Text(
                                                                          'Settings',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).accent1,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .blockTypeValueController ??=
                                                              FormFieldController<
                                                                  String>(
                                                            _model.blockTypeValue ??=
                                                                containerTileBlocksRecordList
                                                                    .where((e) =>
                                                                        valueOrDefault<
                                                                            bool>(
                                                                          e.reference.id ==
                                                                              _model.selectedBlockId,
                                                                          false,
                                                                        ))
                                                                    .toList()
                                                                    .first
                                                                    .blockType,
                                                          ),
                                                          options: const [
                                                            'Text',
                                                            'Image',
                                                            'Video',
                                                            'Audio',
                                                            'Link',
                                                            'File'
                                                          ],
                                                          onChanged:
                                                              (val) async {
                                                            setState(() => _model
                                                                    .blockTypeValue =
                                                                val);
                                                            logFirebaseEvent(
                                                                'EDIT_TILE_BLOCK_COPY_BlockType_ON_FORM_W');
                                                            logFirebaseEvent(
                                                                'BlockType_backend_call');

                                                            await containerTileBlocksRecordList
                                                                .where((e) =>
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      e.reference
                                                                              .id ==
                                                                          _model
                                                                              .selectedBlockId,
                                                                      false,
                                                                    ))
                                                                .toList()
                                                                .first
                                                                .reference
                                                                .update(
                                                                    createTileBlocksRecordData(
                                                                  blockType: _model
                                                                      .blockTypeValue,
                                                                ));
                                                          },
                                                          width: 302.0,
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          elevation: 2.0,
                                                          borderColor:
                                                              const Color(0xFF1AADF9),
                                                          borderWidth: 2.0,
                                                          borderRadius: 8.0,
                                                          margin:
                                                              const EdgeInsetsDirectional
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
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
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
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
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
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                32.0,
                                                                            height:
                                                                                32.0,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: Color(0xFF1AADF9),
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
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
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Text',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).titleMedium,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          8.0,
                                                                          16.0,
                                                                          0.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .textController,
                                                                focusNode: _model
                                                                    .textFieldFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.textController',
                                                                  const Duration(
                                                                      milliseconds:
                                                                          2000),
                                                                  () => setState(
                                                                      () {}),
                                                                ),
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                                  hintText:
                                                                      'Block Title',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .btnBk,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Color(
                                                                          0xFF1AADF9),
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
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
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        32.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDIT_TILE_BLOCK_COPY_CANCEL_BTN_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Button_update_component_state');
                                                                setState(() {
                                                                  _model.selectedBlockId =
                                                                      '';
                                                                });
                                                              },
                                                              text: 'Cancel',
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 40.0,
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .selectedButton,
                                                                textStyle: FlutterFlowTheme.of(
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
                                                                    const BorderSide(
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
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        32.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'EDIT_TILE_BLOCK_COPY_SAVE_BTN_ON_TAP');
                                                                if (_model
                                                                        .blockTypeValue ==
                                                                    'Text') {
                                                                  logFirebaseEvent(
                                                                      'Button_backend_call');

                                                                  await containerTileBlocksRecordList
                                                                      .where((e) =>
                                                                          valueOrDefault<
                                                                              bool>(
                                                                            e.reference.id ==
                                                                                _model.selectedBlockId,
                                                                            false,
                                                                          ))
                                                                      .toList()
                                                                      .first
                                                                      .reference
                                                                      .update(
                                                                          createTileBlocksRecordData(
                                                                        text: _model
                                                                            .textController
                                                                            .text,
                                                                        title: _model
                                                                            .textController
                                                                            .text,
                                                                        subtitle: _model
                                                                            .textController
                                                                            .text,
                                                                        header: _model
                                                                            .textController
                                                                            .text,
                                                                      ));
                                                                } else if (_model
                                                                        .blockTypeValue ==
                                                                    'Image') {
                                                                  logFirebaseEvent(
                                                                      'Button_backend_call');

                                                                  await containerTileBlocksRecordList
                                                                      .where((e) =>
                                                                          valueOrDefault<
                                                                              bool>(
                                                                            e.reference.id ==
                                                                                _model.selectedBlockId,
                                                                            false,
                                                                          ))
                                                                      .toList()
                                                                      .first
                                                                      .reference
                                                                      .update(
                                                                          createTileBlocksRecordData(
                                                                        text: _model
                                                                            .textController
                                                                            .text,
                                                                        title: _model
                                                                            .textController
                                                                            .text,
                                                                        subtitle: _model
                                                                            .textController
                                                                            .text,
                                                                        header: _model
                                                                            .textController
                                                                            .text,
                                                                      ));
                                                                } else if (_model
                                                                        .blockTypeValue ==
                                                                    'Video') {
                                                                  logFirebaseEvent(
                                                                      'Button_backend_call');

                                                                  await containerTileBlocksRecordList
                                                                      .where((e) =>
                                                                          valueOrDefault<
                                                                              bool>(
                                                                            e.reference.id ==
                                                                                _model.selectedBlockId,
                                                                            false,
                                                                          ))
                                                                      .toList()
                                                                      .first
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'video_gallery':
                                                                            FieldValue.arrayUnion([
                                                                          _model
                                                                              .textController
                                                                              .text
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                  logFirebaseEvent(
                                                                      'Button_clear_text_fields_pin_codes');
                                                                  setState(() {
                                                                    _model
                                                                        .textController
                                                                        ?.clear();
                                                                  });
                                                                }
                                                              },
                                                              text: 'Save',
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 40.0,
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: const Color(
                                                                    0xFF1AADF9),
                                                                textStyle: FlutterFlowTheme.of(
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
                                                                    const BorderSide(
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
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 60.0,
                                                icon: Icon(
                                                  Icons.settings,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 30.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'EDIT_TILE_BLOCK_COPY_settings_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_bottom_sheet');
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              Text(
                                                'Customise',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      useGoogleFonts:
                                                          GoogleFonts.asMap()
                                                              .containsKey(
                                                                  'Outfit'),
                                                    ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 18.0, 12.0, 12.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Container(
                                                  width: 300.0,
                                                  height: 600.0,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0x8ED0E5FF),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  12.0,
                                                                  4.0,
                                                                  4.0),
                                                      child: ListView(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        children: [
                                                          Slidable(
                                                            endActionPane:
                                                                ActionPane(
                                                              motion:
                                                                  const ScrollMotion(),
                                                              extentRatio: 0.5,
                                                              children: [
                                                                SlidableAction(
                                                                  label: 'Bin',
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                  icon: Icons
                                                                      .delete_outline,
                                                                  onPressed:
                                                                      (_) {
                                                                    print(
                                                                        'SlidableActionWidget pressed ...');
                                                                  },
                                                                ),
                                                                SlidableAction(
                                                                  label: 'Copy',
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  icon: Icons
                                                                      .content_copy,
                                                                  onPressed:
                                                                      (_) {
                                                                    print(
                                                                        'SlidableActionWidget pressed ...');
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                            child: ListTile(
                                                              title: Text(
                                                                'Button',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleLargeFamily,
                                                                      fontSize:
                                                                          16.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleLargeFamily),
                                                                    ),
                                                              ),
                                                              subtitle: Text(
                                                                'Link to other tiles',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                              ),
                                                              trailing: Icon(
                                                                Icons
                                                                    .arrow_forward_ios,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 16.0,
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              dense: true,
                                                            ),
                                                          ),
                                                          Slidable(
                                                            endActionPane:
                                                                ActionPane(
                                                              motion:
                                                                  const ScrollMotion(),
                                                              extentRatio: 0.5,
                                                              children: [
                                                                SlidableAction(
                                                                  label: 'Bin',
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                  icon: Icons
                                                                      .delete_outline,
                                                                  onPressed:
                                                                      (_) {
                                                                    print(
                                                                        'SlidableActionWidget pressed ...');
                                                                  },
                                                                ),
                                                                SlidableAction(
                                                                  label: 'Copy',
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  icon: Icons
                                                                      .content_copy,
                                                                  onPressed:
                                                                      (_) {
                                                                    print(
                                                                        'SlidableActionWidget pressed ...');
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                            child: ListTile(
                                                              title: Text(
                                                                'Document',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleLargeFamily,
                                                                      fontSize:
                                                                          16.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleLargeFamily),
                                                                    ),
                                                              ),
                                                              subtitle: Text(
                                                                'Subtitle goes here...',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                              ),
                                                              trailing: Icon(
                                                                Icons
                                                                    .arrow_forward_ios,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 16.0,
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              dense: true,
                                                            ),
                                                          ),
                                                          Slidable(
                                                            endActionPane:
                                                                ActionPane(
                                                              motion:
                                                                  const ScrollMotion(),
                                                              extentRatio: 0.5,
                                                              children: [
                                                                SlidableAction(
                                                                  label: 'Bin',
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                  icon: Icons
                                                                      .delete_outline,
                                                                  onPressed:
                                                                      (_) {
                                                                    print(
                                                                        'SlidableActionWidget pressed ...');
                                                                  },
                                                                ),
                                                                SlidableAction(
                                                                  label: 'Copy',
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  icon: Icons
                                                                      .content_copy,
                                                                  onPressed:
                                                                      (_) {
                                                                    print(
                                                                        'SlidableActionWidget pressed ...');
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                            child: ListTile(
                                                              title: Text(
                                                                'Text',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleLargeFamily,
                                                                      fontSize:
                                                                          16.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleLargeFamily),
                                                                    ),
                                                              ),
                                                              subtitle: Text(
                                                                'Subtitle goes here...',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                              ),
                                                              trailing: Icon(
                                                                Icons
                                                                    .arrow_forward_ios,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 16.0,
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              dense: true,
                                                            ),
                                                          ),
                                                          Slidable(
                                                            endActionPane:
                                                                ActionPane(
                                                              motion:
                                                                  const ScrollMotion(),
                                                              extentRatio: 0.5,
                                                              children: [
                                                                SlidableAction(
                                                                  label: 'Bin',
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                  icon: Icons
                                                                      .delete_outline,
                                                                  onPressed:
                                                                      (_) {
                                                                    print(
                                                                        'SlidableActionWidget pressed ...');
                                                                  },
                                                                ),
                                                                SlidableAction(
                                                                  label: 'Copy',
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  icon: Icons
                                                                      .content_copy,
                                                                  onPressed:
                                                                      (_) {
                                                                    print(
                                                                        'SlidableActionWidget pressed ...');
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                            child: ListTile(
                                                              title: Text(
                                                                'Bullets',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleLargeFamily,
                                                                      fontSize:
                                                                          16.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleLargeFamily),
                                                                    ),
                                                              ),
                                                              subtitle: Text(
                                                                'Subtitle goes here...',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                              ),
                                                              trailing: Icon(
                                                                Icons
                                                                    .arrow_forward_ios,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 16.0,
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              dense: true,
                                                            ),
                                                          ),
                                                          Slidable(
                                                            endActionPane:
                                                                ActionPane(
                                                              motion:
                                                                  const ScrollMotion(),
                                                              extentRatio: 0.5,
                                                              children: [
                                                                SlidableAction(
                                                                  label: 'Bin',
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                  icon: Icons
                                                                      .delete_outline,
                                                                  onPressed:
                                                                      (_) {
                                                                    print(
                                                                        'SlidableActionWidget pressed ...');
                                                                  },
                                                                ),
                                                                SlidableAction(
                                                                  label: 'Copy',
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  icon: Icons
                                                                      .content_copy,
                                                                  onPressed:
                                                                      (_) {
                                                                    print(
                                                                        'SlidableActionWidget pressed ...');
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                            child: ListTile(
                                                              title: Text(
                                                                'Image',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleLargeFamily,
                                                                      fontSize:
                                                                          16.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleLargeFamily),
                                                                    ),
                                                              ),
                                                              subtitle: Text(
                                                                'Subtitle goes here...',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                              ),
                                                              trailing: Icon(
                                                                Icons
                                                                    .arrow_forward_ios,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 16.0,
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              dense: true,
                                                            ),
                                                          ),
                                                          Slidable(
                                                            endActionPane:
                                                                ActionPane(
                                                              motion:
                                                                  const ScrollMotion(),
                                                              extentRatio: 0.5,
                                                              children: [
                                                                SlidableAction(
                                                                  label: 'Bin',
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                  icon: Icons
                                                                      .delete_outline,
                                                                  onPressed:
                                                                      (_) {
                                                                    print(
                                                                        'SlidableActionWidget pressed ...');
                                                                  },
                                                                ),
                                                                SlidableAction(
                                                                  label: 'Copy',
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  icon: Icons
                                                                      .content_copy,
                                                                  onPressed:
                                                                      (_) {
                                                                    print(
                                                                        'SlidableActionWidget pressed ...');
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                            child: ListTile(
                                                              title: Text(
                                                                'Video',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleLargeFamily,
                                                                      fontSize:
                                                                          16.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleLargeFamily),
                                                                    ),
                                                              ),
                                                              subtitle: Text(
                                                                'Subtitle goes here...',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                              ),
                                                              trailing: Icon(
                                                                Icons
                                                                    .arrow_forward_ios,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 16.0,
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              dense: true,
                                                            ),
                                                          ),
                                                          Slidable(
                                                            endActionPane:
                                                                ActionPane(
                                                              motion:
                                                                  const ScrollMotion(),
                                                              extentRatio: 0.5,
                                                              children: [
                                                                SlidableAction(
                                                                  label: 'Bin',
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                  icon: Icons
                                                                      .delete_outline,
                                                                  onPressed:
                                                                      (_) {
                                                                    print(
                                                                        'SlidableActionWidget pressed ...');
                                                                  },
                                                                ),
                                                                SlidableAction(
                                                                  label: 'Copy',
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  icon: Icons
                                                                      .content_copy,
                                                                  onPressed:
                                                                      (_) {
                                                                    print(
                                                                        'SlidableActionWidget pressed ...');
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                            child: ListTile(
                                                              title: Text(
                                                                'Comments',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleLargeFamily,
                                                                      fontSize:
                                                                          16.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleLargeFamily),
                                                                    ),
                                                              ),
                                                              subtitle: Text(
                                                                'Subtitle goes here...',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                              ),
                                                              trailing: Icon(
                                                                Icons
                                                                    .arrow_forward_ios,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 16.0,
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              dense: true,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
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
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
