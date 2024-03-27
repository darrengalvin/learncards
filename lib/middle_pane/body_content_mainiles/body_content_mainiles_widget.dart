import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/drawer_empty_list_tiles_widget.dart';
import '/components/editing_a_tile_widget.dart';
import '/components/video_viewer_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/testpage/components/edit_document_tile/edit_document_tile_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'body_content_mainiles_model.dart';
export 'body_content_mainiles_model.dart';

class BodyContentMainilesWidget extends StatefulWidget {
  const BodyContentMainilesWidget({
    super.key,
    required this.companyDoc,
    required this.sessionId,
  });

  final CompaniesRecord? companyDoc;
  final SessionsRecord? sessionId;

  @override
  State<BodyContentMainilesWidget> createState() =>
      _BodyContentMainilesWidgetState();
}

class _BodyContentMainilesWidgetState extends State<BodyContentMainilesWidget> {
  late BodyContentMainilesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BodyContentMainilesModel());

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
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            StreamBuilder<List<TilesRecord>>(
              stream: queryTilesRecord(
                queryBuilder: (tilesRecord) => tilesRecord
                    .where(
                      'parent_id',
                      isEqualTo: FFAppState().viewTileContentId != ''
                          ? FFAppState().viewTileContentId
                          : null,
                    )
                    .where(
                      'companyId',
                      isEqualTo: widget.companyDoc?.reference.id != ''
                          ? widget.companyDoc?.reference.id
                          : null,
                    ),
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
                List<TilesRecord> containerTilesRecordList = snapshot.data!;
                return Container(
                  decoration: const BoxDecoration(),
                  child: Builder(
                    builder: (context) {
                      final childTilesInside =
                          containerTilesRecordList.toList();
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(childTilesInside.length,
                              (childTilesInsideIndex) {
                            final childTilesInsideItem =
                                childTilesInside[childTilesInsideIndex];
                            return Container(
                              width: 360.0,
                              height: 100.0,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'BODY_CONTENT_MAINILES_COMP_tile_ON_TAP');
                                    logFirebaseEvent('tile_update_app_state');
                                    FFAppState().selectedTopic =
                                        containerTilesRecordList.first.title;
                                    FFAppState().selectedReadingItem =
                                        containerTilesRecordList.first.title;
                                    FFAppState().middleColumnShow = true;
                                    logFirebaseEvent('tile_update_app_state');
                                    setState(() {
                                      FFAppState().NewTileJustCreated = false;
                                    });
                                    logFirebaseEvent('tile_update_app_state');
                                    setState(() {
                                      FFAppState().updateTileNavStruct(
                                        (e) => e
                                          ..tier2Id = null
                                          ..tier3Id = null
                                          ..tier4Id = null,
                                      );
                                      FFAppState().viewTileContentId =
                                          childTilesInsideItem.reference.id;
                                      FFAppState().navPath = FFAppState()
                                          .navPath
                                          .take(2)
                                          .toList()
                                          .cast<String>();
                                    });
                                    logFirebaseEvent('tile_update_app_state');
                                    _model.updatePage(() {
                                      FFAppState().middlePane =
                                          'bodyContentMainTiles';
                                      FFAppState().leftPane =
                                          valueOrDefault<String>(
                                        () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return '-';
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return (FFAppState().leftPane == ''
                                                ? 'appMenu'
                                                : FFAppState().leftPane);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return (FFAppState().leftPane == ''
                                                ? 'appMenu'
                                                : FFAppState().leftPane);
                                          } else {
                                            return FFAppState().leftPane;
                                          }
                                        }(),
                                        '-',
                                      );
                                      FFAppState().rightPane =
                                          valueOrDefault<String>(
                                        () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return '-';
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return (FFAppState().rightPane == ''
                                                ? 'learnCards'
                                                : FFAppState().rightPane);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return (FFAppState().rightPane == ''
                                                ? 'learnCards'
                                                : FFAppState().rightPane);
                                          } else {
                                            return '-';
                                          }
                                        }(),
                                        '-',
                                      );
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xB2FAFAFA),
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          FFAppState().tileNav.tier2Id ==
                                                  childTilesInsideItem
                                                      .reference.id
                                              ? FlutterFlowTheme.of(context)
                                                  .customColor7
                                              : FlutterFlowTheme.of(context)
                                                  .accent3,
                                          FlutterFlowTheme.of(context).accent3,
                                        ),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Opacity(
                                                  opacity: 0.4,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      childTilesInsideItem
                                                          .image,
                                                      width: 60.0,
                                                      height: 60.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 4.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      childTilesInsideItem
                                                          .title,
                                                      'title',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
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
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                            tabletLandscape: false,
                                            desktop: false,
                                          ))
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 8.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Icon(
                                                      Icons.settings_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayIcon,
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
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
                                                              'BODY_CONTENT_MAINILES_Icon_r7jmgg4n_ON_T');
                                                          logFirebaseEvent(
                                                              'Icon_alert_dialog');
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                          title:
                                                                              const Text('Delete Tile?'),
                                                                          content:
                                                                              const Text('If you continue this tile will be deleted forever'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: const Text('Cancel'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: const Text('Confirm'),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            logFirebaseEvent(
                                                                'Icon_backend_call');
                                                            await containerTilesRecordList
                                                                .first.reference
                                                                .delete();
                                                          }
                                                        },
                                                        child: Icon(
                                                          Icons.delete_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor3,
                                                          size: 18.0,
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
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                StreamBuilder<List<TileblocksRecord>>(
                                  stream: queryTileblocksRecord(
                                    queryBuilder: (tileblocksRecord) =>
                                        tileblocksRecord
                                            .where(
                                              'companyId',
                                              isEqualTo: widget
                                                  .companyDoc?.reference.id,
                                            )
                                            .orderBy('id'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<TileblocksRecord>
                                        containerTileblocksRecordList =
                                        snapshot.data!;
                                    return Container(
                                      constraints: const BoxConstraints(
                                        maxHeight: 1400.0,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Color(0xB2F6F6F6),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Builder(
                                              builder: (context) {
                                                final tileBlocksFilteredBySelecxted =
                                                    containerTileblocksRecordList
                                                        .where((e) =>
                                                            e.tilerefid ==
                                                            FFAppState()
                                                                .viewTileContentId)
                                                        .toList();
                                                if (tileBlocksFilteredBySelecxted
                                                    .isEmpty) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 640.0,
                                                      child:
                                                          DrawerEmptyListTilesWidget(
                                                        action: () async {},
                                                      ),
                                                    ),
                                                  );
                                                }
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      tileBlocksFilteredBySelecxted
                                                          .length,
                                                  itemBuilder: (context,
                                                      tileBlocksFilteredBySelecxtedIndex) {
                                                    final tileBlocksFilteredBySelecxtedItem =
                                                        tileBlocksFilteredBySelecxted[
                                                            tileBlocksFilteredBySelecxtedIndex];
                                                    return Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if (valueOrDefault<
                                                                    bool>(
                                                                  FFAppState()
                                                                          .debugCount >=
                                                                      3,
                                                                  false,
                                                                ))
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (FFAppState()
                                                                              .debugCount >=
                                                                          3)
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            SelectionArea(
                                                                                child: Text(
                                                                              'viewTileContentId : ${FFAppState().viewTileContentId}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            )),
                                                                            SelectionArea(
                                                                                child: Text(
                                                                              'Block Id : ${tileBlocksFilteredBySelecxtedItem.reference.id}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            )),
                                                                            SelectionArea(
                                                                                child: Text(
                                                                              'Title: ${tileBlocksFilteredBySelecxtedItem.title}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            )),
                                                                            SelectionArea(
                                                                                child: Text(
                                                                              'TileRefId: ${tileBlocksFilteredBySelecxtedItem.tilerefid}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            )),
                                                                          ],
                                                                        ),
                                                                    ],
                                                                  ),
                                                                EditingATileWidget(
                                                                  key: Key(
                                                                      'Keytnq_${tileBlocksFilteredBySelecxtedIndex}_of_${tileBlocksFilteredBySelecxted.length}'),
                                                                  tileBlock:
                                                                      tileBlocksFilteredBySelecxtedItem,
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
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              15.0),
                                                                      child:
                                                                          Container(
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxWidth:
                                                                              () {
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
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              15.0),
                                                                      child:
                                                                          Container(
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxWidth:
                                                                              () {
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
                                                                        decoration:
                                                                            const BoxDecoration(),
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
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              15.0),
                                                                      child:
                                                                          Container(
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxWidth:
                                                                              () {
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
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            Text(
                                                                          tileBlocksFilteredBySelecxtedItem
                                                                              .headertext,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                fontSize: 22.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              15.0),
                                                                      child:
                                                                          Container(
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxWidth:
                                                                              () {
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
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            Text(
                                                                          tileBlocksFilteredBySelecxtedItem
                                                                              .textblock,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                fontSize: 18.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        TileBlockItemsRecord>>(
                                                                  stream:
                                                                      queryTileBlockItemsRecord(
                                                                    queryBuilder: (tileBlockItemsRecord) =>
                                                                        tileBlockItemsRecord
                                                                            .where(
                                                                              'blockId',
                                                                              isEqualTo: tileBlocksFilteredBySelecxtedItem.reference.id,
                                                                            )
                                                                            .orderBy('positionId'),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<TileBlockItemsRecord>
                                                                        tileBlockItemsTileBlockItemsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return Container(
                                                                      width:
                                                                          700.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent3,
                                                                      ),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final tileBlockItems =
                                                                              tileBlockItemsTileBlockItemsRecordList.toList();
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                List.generate(tileBlockItems.length, (tileBlockItemsIndex) {
                                                                              final tileBlockItemsItem = tileBlockItems[tileBlockItemsIndex];
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 48.0, 0.0),
                                                                                      child: FlutterFlowIconButton(
                                                                                        borderColor: FlutterFlowTheme.of(context).error,
                                                                                        borderRadius: 30.0,
                                                                                        borderWidth: 1.0,
                                                                                        buttonSize: 34.0,
                                                                                        hoverColor: FlutterFlowTheme.of(context).error,
                                                                                        hoverIconColor: FlutterFlowTheme.of(context).primary,
                                                                                        icon: Icon(
                                                                                          Icons.delete,
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          size: 18.0,
                                                                                        ),
                                                                                        onPressed: () async {
                                                                                          logFirebaseEvent('BODY_CONTENT_MAINILES_delete_ICN_ON_TAP');
                                                                                          logFirebaseEvent('IconButton_alert_dialog');
                                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                                context: context,
                                                                                                builder: (alertDialogContext) {
                                                                                                  return WebViewAware(
                                                                                                    child: AlertDialog(
                                                                                                      title: const Text('Delete this content?'),
                                                                                                      content: const Text('Are you sure'),
                                                                                                      actions: [
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                          child: const Text('Cancel'),
                                                                                                        ),
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                          child: const Text('Confirm'),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ) ??
                                                                                              false;
                                                                                          if (confirmDialogResponse) {
                                                                                            logFirebaseEvent('IconButton_backend_call');
                                                                                            await tileBlockItemsItem.reference.delete();
                                                                                          } else {
                                                                                            return;
                                                                                          }
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      if (valueOrDefault<bool>(
                                                                                        valueOrDefault<String>(
                                                                                                  tileBlockItemsItem.theText.theText,
                                                                                                  'theText',
                                                                                                ) !=
                                                                                                '',
                                                                                        false,
                                                                                      ))
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            tileBlockItemsItem.theText.theText,
                                                                                            'theText',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                fontSize: 35.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      if (valueOrDefault<bool>(
                                                                                        tileBlockItemsItem.theImage != null,
                                                                                        false,
                                                                                      ))
                                                                                        ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          child: Image.network(
                                                                                            tileBlockItemsItem.theImage.image,
                                                                                            width: 300.0,
                                                                                            height: 200.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      if (valueOrDefault<bool>(
                                                                                        tileBlockItemsItem.theVideo != null,
                                                                                        false,
                                                                                      ))
                                                                                        FlutterFlowVideoPlayer(
                                                                                          path: valueOrDefault<String>(
                                                                                            tileBlockItemsItem.theVideo.theVideo,
                                                                                            '.mp4',
                                                                                          ),
                                                                                          videoType: VideoType.network,
                                                                                          autoPlay: false,
                                                                                          looping: true,
                                                                                          showControls: true,
                                                                                          allowFullScreen: true,
                                                                                          allowPlaybackSpeedMenu: false,
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            }),
                                                                          );
                                                                        },
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                            if (valueOrDefault<
                                                                bool>(
                                                              FFAppState()
                                                                      .debugCount >=
                                                                  3,
                                                              false,
                                                            ))
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        SelectionArea(
                                                                            child:
                                                                                Text(
                                                                          'These are videos you should be seeing in :  ${valueOrDefault<String>(
                                                                            tileBlocksFilteredBySelecxtedItem.reference.id,
                                                                            'docidnotset',
                                                                          )}',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        )),
                                                                      ],
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final listOfVideosFromTilEBlock = tileBlocksFilteredBySelecxtedItem
                                                                            .videolisttitle
                                                                            .toList();
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: List.generate(
                                                                              listOfVideosFromTilEBlock.length,
                                                                              (listOfVideosFromTilEBlockIndex) {
                                                                            final listOfVideosFromTilEBlockItem =
                                                                                listOfVideosFromTilEBlock[listOfVideosFromTilEBlockIndex];
                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    SelectionArea(
                                                                                        child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        listOfVideosFromTilEBlockItem,
                                                                                        'no videos found in video list',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    )),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            );
                                                                          }),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                          15.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: 200.0,
                                                                                decoration: const BoxDecoration(),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: 200.0,
                                                                                decoration: const BoxDecoration(),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (valueOrDefault<
                                                                              bool>(
                                                                            tileBlocksFilteredBySelecxtedItem.image != '',
                                                                            false,
                                                                          ))
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.network(
                                                                                tileBlocksFilteredBySelecxtedItem.image,
                                                                                width: 300.0,
                                                                                height: 200.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      constraints:
                                                                          const BoxConstraints(
                                                                        maxWidth:
                                                                            800.0,
                                                                      ),
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      constraints:
                                                                          const BoxConstraints(
                                                                        maxWidth:
                                                                            800.0,
                                                                      ),
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: 200.0,
                                                                              decoration: const BoxDecoration(),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: 200.0,
                                                                              decoration: const BoxDecoration(),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    StreamBuilder<
                                                                        List<
                                                                            VideosRecord>>(
                                                                      stream:
                                                                          queryVideosRecord(),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
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
                                                                        List<VideosRecord>
                                                                            containerVideosRecordList =
                                                                            snapshot.data!;
                                                                        return Container(
                                                                          decoration:
                                                                              const BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  final videoTitle = containerVideosRecordList.toList();
                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: List.generate(videoTitle.length, (videoTitleIndex) {
                                                                                      final videoTitleItem = videoTitle[videoTitleIndex];
                                                                                      return Visibility(
                                                                                        visible: valueOrDefault<bool>(
                                                                                          tileBlocksFilteredBySelecxtedItem.videolisttitle.contains(videoTitleItem.title) == true,
                                                                                          false,
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsets.all(15.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('BODY_CONTENT_MAINILES_Row_m2nsjpni_ON_TA');
                                                                                              logFirebaseEvent('Row_firestore_query');
                                                                                              _model.videoWithTitle = await queryVideosRecordOnce(
                                                                                                queryBuilder: (videosRecord) => videosRecord.where(
                                                                                                  'title',
                                                                                                  isEqualTo: videoTitleItem.title,
                                                                                                ),
                                                                                                singleRecord: true,
                                                                                              ).then((s) => s.firstOrNull);
                                                                                              logFirebaseEvent('Row_bottom_sheet');
                                                                                              await showModalBottomSheet(
                                                                                                isScrollControlled: true,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                enableDrag: false,
                                                                                                context: context,
                                                                                                builder: (context) {
                                                                                                  return WebViewAware(
                                                                                                    child: Padding(
                                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                                      child: VideoViewerWidget(
                                                                                                        tileBlockVideo: videoTitleItem,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ).then((value) => safeSetState(() {}));

                                                                                              setState(() {});
                                                                                            },
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                if (valueOrDefault<bool>(
                                                                                                  tileBlocksFilteredBySelecxtedItem.videolisttitle.contains(videoTitleItem.title) == true,
                                                                                                  false,
                                                                                                ))
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              ClipRRect(
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                child: Image.network(
                                                                                                                  valueOrDefault<String>(
                                                                                                                    videoTitleItem.videoThumbnail,
                                                                                                                    'https://upload.wikimedia.org/wikipedia/commons/a/ae/Writing_Wikipedia_Articles_video_placeholder_image.png',
                                                                                                                  ),
                                                                                                                  width: 150.0,
                                                                                                                  height: 150.0,
                                                                                                                  fit: BoxFit.cover,
                                                                                                                  errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                                                    'assets/images/error_image.png',
                                                                                                                    width: 150.0,
                                                                                                                    height: 150.0,
                                                                                                                    fit: BoxFit.cover,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  valueOrDefault<String>(
                                                                                                                    videoTitleItem.title,
                                                                                                                    'no title set',
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        fontSize: 22.0,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          if (valueOrDefault<bool>(
                                                                                                            FFAppState().debugCount >= 3,
                                                                                                            false,
                                                                                                          ))
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      videoTitleItem.reference.id,
                                                                                                                      'no doc set',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          if (FFAppState().debugCount >= 3)
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      videoTitleItem.pageRef?.id,
                                                                                                                      'no pageRef set',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                                                      );
                                                                                    }),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                                const Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    StreamBuilder<
                                                                        List<
                                                                            DocumentsRecord>>(
                                                                      stream:
                                                                          queryDocumentsRecord(
                                                                        queryBuilder: (documentsRecord) => documentsRecord.whereIn(
                                                                            'documenttitle',
                                                                            tileBlocksFilteredBySelecxtedItem.doclistitle),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
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
                                                                        List<DocumentsRecord>
                                                                            containerDocumentsRecordList =
                                                                            snapshot.data!;
                                                                        return Container(
                                                                          decoration:
                                                                              const BoxDecoration(),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final tileBlockDocs = containerDocumentsRecordList.toList();
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(tileBlockDocs.length, (tileBlockDocsIndex) {
                                                                                  final tileBlockDocsItem = tileBlockDocs[tileBlockDocsIndex];
                                                                                  return Visibility(
                                                                                    visible: tileBlocksFilteredBySelecxtedItem.doclistitle.isNotEmpty,
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(26.0, 6.0, 26.0, 6.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          logFirebaseEvent('BODY_CONTENT_MAINILES_COMP_tile_ON_TAP');
                                                                                          if (tileBlockDocsItem.documenturl != '') {
                                                                                            logFirebaseEvent('tile_launch_u_r_l');
                                                                                            await launchURL(tileBlockDocsItem.documenturl);
                                                                                          } else if (tileBlockDocsItem.documentupload != '') {
                                                                                            logFirebaseEvent('tile_launch_u_r_l');
                                                                                            await launchURL(tileBlockDocsItem.documentupload);
                                                                                          }
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Colors.white,
                                                                                            boxShadow: const [
                                                                                              BoxShadow(
                                                                                                blurRadius: 3.0,
                                                                                                color: Color(0x411D2429),
                                                                                                offset: Offset(0.0, 1.0),
                                                                                              )
                                                                                            ],
                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsets.all(3.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 14.0, 0.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      FaIcon(
                                                                                                        FontAwesomeIcons.book,
                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                        size: 44.0,
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        SelectionArea(
                                                                                                            child: Text(
                                                                                                          tileBlockDocsItem.documenttitle,
                                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                fontFamily: 'Outfit',
                                                                                                                color: const Color(0xFF090F13),
                                                                                                                fontSize: 18.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                              ),
                                                                                                        )),
                                                                                                        Expanded(
                                                                                                          child: Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 8.0, 0.0),
                                                                                                            child: AutoSizeText(
                                                                                                              tileBlockDocsItem.documenttitle.maybeHandleOverflow(
                                                                                                                maxChars: 70,
                                                                                                                replacement: '…',
                                                                                                              ),
                                                                                                              textAlign: TextAlign.start,
                                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                    fontFamily: 'Outfit',
                                                                                                                    color: const Color(0xFF7C8791),
                                                                                                                    fontSize: 14.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        if (valueOrDefault<bool>(
                                                                                                          valueOrDefault<bool>(currentUserDocument?.isadmin, false) == true,
                                                                                                          false,
                                                                                                        ))
                                                                                                          AuthUserStreamWidget(
                                                                                                            builder: (context) => Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                if (valueOrDefault<bool>(currentUserDocument?.isadmin, false) == true)
                                                                                                                  Padding(
                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: const EdgeInsets.all(4.0),
                                                                                                                          child: InkWell(
                                                                                                                            splashColor: Colors.transparent,
                                                                                                                            focusColor: Colors.transparent,
                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                            onTap: () async {
                                                                                                                              logFirebaseEvent('BODY_CONTENT_MAINILES_Icon_4qh892rg_ON_T');
                                                                                                                              logFirebaseEvent('Icon_alert_dialog');
                                                                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                    context: context,
                                                                                                                                    builder: (alertDialogContext) {
                                                                                                                                      return WebViewAware(
                                                                                                                                        child: AlertDialog(
                                                                                                                                          title: const Text('Are you sure you wish to delete this Document ?'),
                                                                                                                                          content: const Text('This will delete the document, if you are just loooking to remove it from this tile block then use. the edit button on the tile block instead.'),
                                                                                                                                          actions: [
                                                                                                                                            TextButton(
                                                                                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                              child: const Text('Cancel'),
                                                                                                                                            ),
                                                                                                                                            TextButton(
                                                                                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                              child: const Text('Confirm '),
                                                                                                                                            ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      );
                                                                                                                                    },
                                                                                                                                  ) ??
                                                                                                                                  false;
                                                                                                                              if (confirmDialogResponse) {
                                                                                                                                logFirebaseEvent('Icon_backend_call');
                                                                                                                                await tileBlockDocsItem.reference.delete();
                                                                                                                              }
                                                                                                                            },
                                                                                                                            child: const Icon(
                                                                                                                              Icons.delete_forever_outlined,
                                                                                                                              color: Color(0xFF57636C),
                                                                                                                              size: 24.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Padding(
                                                                                                                          padding: const EdgeInsets.all(4.0),
                                                                                                                          child: InkWell(
                                                                                                                            splashColor: Colors.transparent,
                                                                                                                            focusColor: Colors.transparent,
                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                            onTap: () async {
                                                                                                                              logFirebaseEvent('BODY_CONTENT_MAINILES_Icon_634ozyhg_ON_T');
                                                                                                                              logFirebaseEvent('Icon_backend_call');

                                                                                                                              await tileBlockDocsItem.reference.update({
                                                                                                                                ...mapToFirestore(
                                                                                                                                  {
                                                                                                                                    'id': FieldValue.increment(-1),
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              });
                                                                                                                            },
                                                                                                                            child: const Icon(
                                                                                                                              Icons.upload_sharp,
                                                                                                                              color: Color(0xFF57636C),
                                                                                                                              size: 24.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Padding(
                                                                                                                          padding: const EdgeInsets.all(4.0),
                                                                                                                          child: InkWell(
                                                                                                                            splashColor: Colors.transparent,
                                                                                                                            focusColor: Colors.transparent,
                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                            onTap: () async {
                                                                                                                              logFirebaseEvent('BODY_CONTENT_MAINILES_Icon_go617qly_ON_T');
                                                                                                                              logFirebaseEvent('Icon_backend_call');

                                                                                                                              await tileBlockDocsItem.reference.update({
                                                                                                                                ...mapToFirestore(
                                                                                                                                  {
                                                                                                                                    'id': FieldValue.increment(1),
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              });
                                                                                                                            },
                                                                                                                            child: const Icon(
                                                                                                                              Icons.download_outlined,
                                                                                                                              color: Color(0xFF57636C),
                                                                                                                              size: 24.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                if (valueOrDefault<bool>(currentUserDocument?.isadmin, false) == true)
                                                                                                                  FlutterFlowIconButton(
                                                                                                                    borderColor: Colors.transparent,
                                                                                                                    borderRadius: 30.0,
                                                                                                                    borderWidth: 1.0,
                                                                                                                    buttonSize: 60.0,
                                                                                                                    icon: Icon(
                                                                                                                      Icons.edit_outlined,
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      size: 30.0,
                                                                                                                    ),
                                                                                                                    onPressed: () async {
                                                                                                                      logFirebaseEvent('BODY_CONTENT_MAINILES_edit_outlined_ICN_');
                                                                                                                      logFirebaseEvent('IconButton_bottom_sheet');
                                                                                                                      await showModalBottomSheet(
                                                                                                                        isScrollControlled: true,
                                                                                                                        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                        barrierColor: const Color(0x00000000),
                                                                                                                        context: context,
                                                                                                                        builder: (context) {
                                                                                                                          return WebViewAware(
                                                                                                                            child: Padding(
                                                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                                                              child: SizedBox(
                                                                                                                                height: 600.0,
                                                                                                                                child: EditDocumentTileWidget(
                                                                                                                                  document: tileBlockDocsItem,
                                                                                                                                  docref: tileBlockDocsItem.reference,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          );
                                                                                                                        },
                                                                                                                      ).then((value) => safeSetState(() {}));
                                                                                                                    },
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
                                                                                    ),
                                                                                  );
                                                                                }),
                                                                              );
                                                                            },
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    constraints:
                                                                        const BoxConstraints(
                                                                      maxWidth:
                                                                          800.0,
                                                                    ),
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    constraints:
                                                                        const BoxConstraints(
                                                                      maxWidth:
                                                                          800.0,
                                                                    ),
                                                                    decoration:
                                                                        const BoxDecoration(),
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
                                                                      .stretch,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                  child:
                                                                      Container(
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 450.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 600.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 900.0;
                                                                        } else {
                                                                          return 1550.0;
                                                                        }
                                                                      }(),
                                                                    ),
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [],
                        ),
                      ],
                    ),
                    if (valueOrDefault<bool>(
                      () {
                        if (valueOrDefault<bool>(
                          valueOrDefault<bool>(
                                loggedIn != true,
                                false,
                              ) &&
                              !valueOrDefault<bool>(
                                (currentUserDocument?.hasaccess.toList() ?? [])
                                    .contains(
                                        FFAppState().selectedCategoryName),
                                false,
                              ),
                          false,
                        )) {
                          return true;
                        } else if (valueOrDefault<bool>(
                          valueOrDefault<bool>(
                                loggedIn != true,
                                false,
                              ) &&
                              valueOrDefault<bool>(
                                (valueOrDefault(
                                            currentUserDocument
                                                ?.categoryselected,
                                            '') ==
                                        'Community') ||
                                    (FFAppState().selectedCategoryName ==
                                        'Community') ||
                                    (FFAppState().selectedcategory ==
                                        'Community'),
                                false,
                              ),
                          false,
                        )) {
                          return false;
                        } else if (valueOrDefault<bool>(
                          valueOrDefault<bool>(
                                loggedIn != true,
                                false,
                              ) &&
                              valueOrDefault<bool>(
                                !valueOrDefault<bool>(
                                      (currentUserDocument?.hasaccess
                                                  .toList() ??
                                              [])
                                          .contains(FFAppState()
                                              .selectedCategoryName),
                                      false,
                                    ) ||
                                    valueOrDefault<bool>(
                                      valueOrDefault<bool>(
                                            widget.sessionId?.hasAccess
                                                .contains(FFAppState()
                                                    .selectedcategory),
                                            false,
                                          ) ||
                                          valueOrDefault<bool>(
                                            widget.sessionId?.hasAccess
                                                .contains(FFAppState()
                                                    .selectedCategoryName),
                                            false,
                                          ),
                                      false,
                                    ),
                                true,
                              ),
                          false,
                        )) {
                          return false;
                        } else {
                          return false;
                        }
                      }(),
                      false,
                    ))
                      AuthUserStreamWidget(
                        builder: (context) => Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Opacity(
                              opacity: 0.95,
                              child: Container(
                                width: 100.0,
                                constraints: const BoxConstraints(
                                  maxHeight: 3000.0,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).customColor5,
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
      ],
    );
  }
}
