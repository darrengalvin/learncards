import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/testpage/components/edit_tile/edit_tile_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'primary_tiles_colours_model.dart';
export 'primary_tiles_colours_model.dart';

class PrimaryTilesColoursWidget extends StatefulWidget {
  const PrimaryTilesColoursWidget({
    super.key,
    this.parameter1,
  });

  final bool? parameter1;

  @override
  State<PrimaryTilesColoursWidget> createState() =>
      _PrimaryTilesColoursWidgetState();
}

class _PrimaryTilesColoursWidgetState extends State<PrimaryTilesColoursWidget> {
  late PrimaryTilesColoursModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrimaryTilesColoursModel());

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
      visible: responsiveVisibility(
        context: context,
        tabletLandscape: false,
        desktop: false,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: 970.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Visibility(
                visible: (currentUserDocument?.hasaccess?.toList() ?? [])
                    .contains(FFAppState().selectedcategory),
                child: AuthUserStreamWidget(
                  builder: (context) => StreamBuilder<List<TilesRecord>>(
                    stream: queryTilesRecord(
                      queryBuilder: (tilesRecord) => tilesRecord
                          .where(
                            'memberlevels',
                            arrayContains: FFAppState().selectedcategory,
                          )
                          .where(
                            'tier',
                            isEqualTo: 0,
                          )
                          .where(
                            'show',
                            isEqualTo: true,
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
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<TilesRecord> listViewMobileTilesRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: listViewMobileTilesRecordList.length,
                        itemBuilder: (context, listViewMobileIndex) {
                          final listViewMobileTilesRecord =
                              listViewMobileTilesRecordList[
                                  listViewMobileIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 8.0),
                                child: Container(
                                  width: 300.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3.0,
                                        color: Color(0x32000000),
                                        offset: Offset(0.0, 1.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (listViewMobileTilesRecord.show ==
                                          true)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PRIMARY_TILES_COLOURS_COMP_tile_ON_TAP');
                                            logFirebaseEvent(
                                                'tile_update_app_state');
                                            FFAppState().update(() {
                                              FFAppState().SelectedTileRef =
                                                  listViewMobileTilesRecord
                                                      .reference;
                                              FFAppState().historyActive =
                                                  false;
                                            });
                                            if (listViewMobileTilesRecord
                                                    .showvideoslider ==
                                                true) {
                                              logFirebaseEvent(
                                                  'tile_update_app_state');
                                              FFAppState().update(() {
                                                FFAppState().slideronpage =
                                                    true;
                                              });
                                            } else {
                                              logFirebaseEvent(
                                                  'tile_update_app_state');
                                              FFAppState().update(() {
                                                FFAppState().slideronpage =
                                                    false;
                                              });
                                            }

                                            if (listViewMobileTilesRecord
                                                    .showtextblocks ==
                                                true) {
                                              logFirebaseEvent(
                                                  'tile_update_app_state');
                                              FFAppState().update(() {
                                                FFAppState().textblockonpage =
                                                    true;
                                              });
                                            } else {
                                              logFirebaseEvent(
                                                  'tile_update_app_state');
                                              FFAppState().update(() {
                                                FFAppState().textblockonpage =
                                                    false;
                                              });
                                            }

                                            if (listViewMobileTilesRecord
                                                    .showdocs ==
                                                true) {
                                              logFirebaseEvent(
                                                  'tile_update_app_state');
                                              FFAppState().update(() {
                                                FFAppState().docsonpage = true;
                                              });
                                            } else {
                                              logFirebaseEvent(
                                                  'tile_update_app_state');
                                              FFAppState().update(() {
                                                FFAppState().docsonpage = false;
                                              });
                                            }

                                            if (listViewMobileTilesRecord
                                                    .showLinks ==
                                                true) {
                                              logFirebaseEvent(
                                                  'tile_update_app_state');
                                              FFAppState().update(() {
                                                FFAppState().linksonpage = true;
                                              });
                                            } else {
                                              logFirebaseEvent(
                                                  'tile_update_app_state');
                                              FFAppState().update(() {
                                                FFAppState().linksonpage =
                                                    false;
                                              });
                                            }

                                            if (listViewMobileTilesRecord
                                                    .showsubtiles ==
                                                true) {
                                              logFirebaseEvent(
                                                  'tile_update_app_state');
                                              FFAppState().update(() {
                                                FFAppState().subtilesonpage =
                                                    true;
                                              });
                                            } else {
                                              logFirebaseEvent(
                                                  'tile_update_app_state');
                                              FFAppState().update(() {
                                                FFAppState().subtilesonpage =
                                                    false;
                                              });
                                            }

                                            if (listViewMobileTilesRecord
                                                    .showbuttons ==
                                                true) {
                                              logFirebaseEvent(
                                                  'tile_update_app_state');
                                              FFAppState().update(() {
                                                FFAppState().buttonsonpage =
                                                    true;
                                              });
                                            } else {
                                              logFirebaseEvent(
                                                  'tile_update_app_state');
                                              FFAppState().update(() {
                                                FFAppState().buttonsonpage =
                                                    false;
                                              });
                                            }

                                            if (widget.parameter1 == true) {
                                              logFirebaseEvent(
                                                  'tile_update_app_state');
                                              FFAppState().update(() {
                                                FFAppState()
                                                    .tilesontilesonpage = true;
                                              });
                                            } else {
                                              logFirebaseEvent(
                                                  'tile_update_app_state');
                                              FFAppState().update(() {
                                                FFAppState()
                                                    .tilesontilesonpage = false;
                                              });
                                            }
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: FFAppState()
                                                          .SelectedTileRef ==
                                                      listViewMobileTilesRecord
                                                          .reference
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 3.0,
                                                  color: Color(0x411D2429),
                                                  offset: Offset(0.0, 1.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              border: Border.all(
                                                color: FFAppState()
                                                            .SelectedTileRef ==
                                                        listViewMobileTilesRecord
                                                            .reference
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            listViewMobileTilesRecord
                                                                .title,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  fontSize:
                                                                      18.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Outfit'),
                                                                ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          8.0,
                                                                          0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                listViewMobileTilesRecord
                                                                    .summary
                                                                    .maybeHandleOverflow(
                                                                  maxChars: 70,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF7C8791),
                                                                      fontSize:
                                                                          14.0,
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
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  if (valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isadmin,
                                                          false) ==
                                                      true)
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
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
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'PRIMARY_TILES_COLOURS_Icon_cpvdgvqp_ON_T');
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
                                                                                child: AlertDialog(
                                                                                  title: Text('Delete Tile'),
                                                                                  content: Text('Are you sure you wish to delete this tile?'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancel'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Confirm '),
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
                                                                    await listViewMobileTilesRecord
                                                                        .reference
                                                                        .delete();
                                                                  }
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .delete_forever_outlined,
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
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
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'PRIMARY_TILES_COLOURS_Icon_7otfqlzq_ON_T');
                                                                  logFirebaseEvent(
                                                                      'Icon_bottom_sheet');
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    barrierColor:
                                                                        Color(
                                                                            0x00000000),
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                600.0,
                                                                            child:
                                                                                EditTileWidget(
                                                                              tilesdoc: listViewMobileTilesRecord,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .edit_outlined,
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
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
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'PRIMARY_TILES_COLOURS_Icon_lnyi1w0f_ON_T');
                                                                  logFirebaseEvent(
                                                                      'Icon_backend_call');

                                                                  await listViewMobileTilesRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'id': FieldValue.increment(
                                                                            -1),
                                                                      },
                                                                    ),
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .upload_sharp,
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
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
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'PRIMARY_TILES_COLOURS_Icon_pgzqipak_ON_T');
                                                                  logFirebaseEvent(
                                                                      'Icon_backend_call');

                                                                  await listViewMobileTilesRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'id': FieldValue
                                                                            .increment(1),
                                                                      },
                                                                    ),
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .download_outlined,
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  size: 24.0,
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
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
