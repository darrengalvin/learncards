import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/testpage/components/edit_tile/edit_tile_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'admin_tiles_model.dart';
export 'admin_tiles_model.dart';

class AdminTilesWidget extends StatefulWidget {
  const AdminTilesWidget({
    super.key,
    this.tilesref,
    this.tilesdoc,
  });

  final DocumentReference? tilesref;
  final TilesRecord? tilesdoc;

  @override
  State<AdminTilesWidget> createState() => _AdminTilesWidgetState();
}

class _AdminTilesWidgetState extends State<AdminTilesWidget> {
  late AdminTilesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminTilesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AdminTiles'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ADMIN_TILES_AdminTiles_ON_INIT_STATE');
      logFirebaseEvent('AdminTiles_update_app_state');
      FFAppState().update(() {
        FFAppState().searchterm = '';
      });
      logFirebaseEvent('AdminTiles_update_app_state');
      FFAppState().update(() {
        FFAppState().selectedsearch = FFAppState().tempsearch;
        FFAppState().searchterm = FFAppState().tempsearch;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'AdminTiles',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: responsiveVisibility(
              context: context,
              desktop: false,
            )
                ? AppBar(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    automaticallyImplyLeading: false,
                    leading: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'ADMIN_TILES_arrow_back_rounded_ICN_ON_TA');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      'Tiles',
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    ),
                    actions: const [],
                    centerTitle: true,
                    elevation: 2.0,
                  )
                : null,
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        3.0, 0.0, 3.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ADMIN_TILES_PAGE_TILES_BTN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.pushNamed(
                                                        'searchTiles');
                                                  },
                                                  text: 'Tiles',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmallFamily),
                                                            ),
                                                    elevation: 2.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              StreamBuilder<List<TilesRecord>>(
                                stream: queryTilesRecord(
                                  queryBuilder: (tilesRecord) =>
                                      tilesRecord.orderBy('id'),
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
                                  List<TilesRecord> listViewTilesRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewTilesRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewTilesRecord =
                                          listViewTilesRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 8.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 3.0,
                                                color: Color(0x32000000),
                                                offset: Offset(0.0, 1.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'ADMIN_TILES_PAGE_tile_ON_TAP');
                                                  logFirebaseEvent(
                                                      'tile_update_app_state');
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                            .SelectedTileRef =
                                                        listViewTilesRecord
                                                            .reference;
                                                  });
                                                  if (!FFAppState()
                                                      .backbutton
                                                      .contains(FFAppState()
                                                          .SelectedTileRef)) {
                                                    logFirebaseEvent(
                                                        'tile_update_app_state');
                                                    FFAppState().update(() {
                                                      FFAppState().addToBackbutton(
                                                          FFAppState()
                                                              .SelectedTileRef!);
                                                    });
                                                  }
                                                  if (listViewTilesRecord
                                                      .templatelist
                                                      .contains('Calendar')) {}
                                                  if (listViewTilesRecord
                                                          .showvideoslider ==
                                                      true) {
                                                    logFirebaseEvent(
                                                        'tile_update_app_state');
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .slideronpage = true;
                                                    });
                                                  } else {
                                                    logFirebaseEvent(
                                                        'tile_update_app_state');
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .slideronpage = false;
                                                    });
                                                  }

                                                  if (listViewTilesRecord
                                                          .showtextblocks ==
                                                      true) {
                                                    logFirebaseEvent(
                                                        'tile_update_app_state');
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .textblockonpage =
                                                          true;
                                                    });
                                                  } else {
                                                    logFirebaseEvent(
                                                        'tile_update_app_state');
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .textblockonpage =
                                                          false;
                                                    });
                                                  }

                                                  if (listViewTilesRecord
                                                          .showdocs ==
                                                      true) {
                                                    logFirebaseEvent(
                                                        'tile_update_app_state');
                                                    FFAppState().update(() {
                                                      FFAppState().docsonpage =
                                                          true;
                                                    });
                                                  } else {
                                                    logFirebaseEvent(
                                                        'tile_update_app_state');
                                                    FFAppState().update(() {
                                                      FFAppState().docsonpage =
                                                          false;
                                                    });
                                                  }

                                                  if (listViewTilesRecord
                                                          .showLinks ==
                                                      true) {
                                                    logFirebaseEvent(
                                                        'tile_update_app_state');
                                                    FFAppState().update(() {
                                                      FFAppState().linksonpage =
                                                          true;
                                                    });
                                                  } else {
                                                    logFirebaseEvent(
                                                        'tile_update_app_state');
                                                    FFAppState().update(() {
                                                      FFAppState().linksonpage =
                                                          false;
                                                    });
                                                  }

                                                  if (listViewTilesRecord
                                                          .showsubtiles ==
                                                      true) {
                                                    logFirebaseEvent(
                                                        'tile_update_app_state');
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .subtilesonpage =
                                                          true;
                                                    });
                                                  } else {
                                                    logFirebaseEvent(
                                                        'tile_update_app_state');
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .subtilesonpage =
                                                          false;
                                                    });
                                                  }

                                                  if (listViewTilesRecord
                                                          .showbuttons ==
                                                      true) {
                                                    logFirebaseEvent(
                                                        'tile_update_app_state');
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .buttonsonpage = true;
                                                    });
                                                  } else {
                                                    logFirebaseEvent(
                                                        'tile_update_app_state');
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .buttonsonpage =
                                                          false;
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 3.0,
                                                        color:
                                                            Color(0x411D2429),
                                                        offset:
                                                            Offset(0.0, 1.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      1.0,
                                                                      1.0,
                                                                      1.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            child:
                                                                Image.network(
                                                              listViewTilesRecord
                                                                  .image,
                                                              width: 110.0,
                                                              height: 90.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        8.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  listViewTilesRecord
                                                                      .title,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: const Color(
                                                                            0xFF090F13),
                                                                        fontSize:
                                                                            18.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey('Outfit'),
                                                                      ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        AutoSizeText(
                                                                      listViewTilesRecord
                                                                          .summary
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            70,
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
                                                                            color:
                                                                                const Color(0xFF7C8791),
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey('Outfit'),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        if (valueOrDefault<
                                                                    bool>(
                                                                currentUserDocument
                                                                    ?.isadmin,
                                                                false) ==
                                                            true)
                                                          AuthUserStreamWidget(
                                                            builder:
                                                                (context) =>
                                                                    Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'ADMIN_TILES_PAGE_Icon_s2xmix4s_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Icon_alert_dialog');
                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      title: const Text('Delete Tile'),
                                                                                      content: const Text('Are you sure you wish to delete this tile?'),
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
                                                                            await listViewTilesRecord.reference.delete();
                                                                          }
                                                                        },
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .delete_forever_outlined,
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'ADMIN_TILES_PAGE_Icon_niazft1j_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Icon_bottom_sheet');
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            barrierColor:
                                                                                const Color(0x00000000),
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return WebViewAware(
                                                                                child: GestureDetector(
                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: SizedBox(
                                                                                      height: 600.0,
                                                                                      child: EditTileWidget(
                                                                                        tilesdoc: listViewTilesRecord,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .edit_outlined,
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    ToggleIcon(
                                                                      onPressed:
                                                                          () async {
                                                                        await listViewTilesRecord
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'show': !listViewTilesRecord.show,
                                                                            },
                                                                          ),
                                                                        });
                                                                      },
                                                                      value: listViewTilesRecord
                                                                          .show,
                                                                      onIcon:
                                                                          Icon(
                                                                        Icons
                                                                            .remove_red_eye_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor1,
                                                                        size:
                                                                            25.0,
                                                                      ),
                                                                      offIcon:
                                                                          Icon(
                                                                        Icons
                                                                            .remove_red_eye_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor3,
                                                                        size:
                                                                            25.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'ADMIN_TILES_PAGE_Icon_l6p3v2ya_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Icon_backend_call');

                                                                          await listViewTilesRecord
                                                                              .reference
                                                                              .update({
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'id': FieldValue.increment(-1),
                                                                              },
                                                                            ),
                                                                          });
                                                                        },
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .upload_sharp,
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'ADMIN_TILES_PAGE_Icon_rzyem9ib_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Icon_backend_call');

                                                                          await listViewTilesRecord
                                                                              .reference
                                                                              .update({
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'id': FieldValue.increment(1),
                                                                              },
                                                                            ),
                                                                          });
                                                                        },
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .download_outlined,
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          size:
                                                                              24.0,
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
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
