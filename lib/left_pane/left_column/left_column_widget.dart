import '/backend/backend.dart';
import '/components/learn_cards_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/left_pane/desktop_tile_nav_a_your_saved/desktop_tile_nav_a_your_saved_widget.dart';
import '/left_pane/desktop_tile_nav_ai_this_week/desktop_tile_nav_ai_this_week_widget.dart';
import '/left_pane/event_app_tiles/event_app_tiles_widget.dart';
import '/left_pane/main_app_tiles/main_app_tiles_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'left_column_model.dart';
export 'left_column_model.dart';

class LeftColumnWidget extends StatefulWidget {
  const LeftColumnWidget({
    super.key,
    bool? isLeftShow,
    this.sessionsDoc,
    this.companiesDoc,
  }) : isLeftShow = isLeftShow ?? false;

  final bool isLeftShow;
  final SessionsRecord? sessionsDoc;
  final CompaniesRecord? companiesDoc;

  @override
  State<LeftColumnWidget> createState() => _LeftColumnWidgetState();
}

class _LeftColumnWidgetState extends State<LeftColumnWidget> {
  late LeftColumnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeftColumnModel());

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
      visible: FFAppState().leftColumnShow == true,
      child: Align(
        alignment: const AlignmentDirectional(-1.0, -1.0),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: () {
              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                return 420.0;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                return 550.0;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                return 550.0;
              } else {
                return 550.0;
              }
            }(),
          ),
          decoration: const BoxDecoration(),
          alignment: const AlignmentDirectional(-1.0, -1.0),
          child: Align(
            alignment: const AlignmentDirectional(-1.0, -1.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder<List<Tilesv2Record>>(
                        stream: queryTilesv2Record(
                          queryBuilder: (tilesv2Record) => tilesv2Record
                              .where(
                                'companyDocId',
                                isEqualTo: widget.companiesDoc?.reference.id,
                              )
                              .orderBy('tile_index'),
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
                          List<Tilesv2Record> containerTilesv2RecordList =
                              snapshot.data!;
                          return Container(
                            constraints: const BoxConstraints(
                              maxWidth: 850.0,
                            ),
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  StreamBuilder<
                                                      List<CategoriesRecord>>(
                                                    stream:
                                                        queryCategoriesRecord(),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      List<CategoriesRecord>
                                                          containerCatCategoriesRecordList =
                                                          snapshot.data!;
                                                      return Container(
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                        ),
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final categoriesMemberLevel =
                                                                containerCatCategoriesRecordList
                                                                    .toList();
                                                            return SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: List.generate(
                                                                    categoriesMemberLevel
                                                                        .length,
                                                                    (categoriesMemberLevelIndex) {
                                                                  final categoriesMemberLevelItem =
                                                                      categoriesMemberLevel[
                                                                          categoriesMemberLevelIndex];
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      if (valueOrDefault<
                                                                          bool>(
                                                                        categoriesMemberLevelItem.accessToMemberLevelsId.contains(FFAppState().selectedMemberLevel) ==
                                                                            true,
                                                                        false,
                                                                      ))
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              7.0,
                                                                              0.0,
                                                                              7.0,
                                                                              4.0),
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
                                                                              logFirebaseEvent('LEFT_COLUMN_Container_d5m4qwt1_ON_TAP');
                                                                              logFirebaseEvent('Container_update_app_state');
                                                                              FFAppState().update(() {
                                                                                FFAppState().showLearnCard = false;
                                                                                FFAppState().selectedCategoryId = categoriesMemberLevelItem.reference.id;
                                                                                FFAppState().selectedCategoryName = categoriesMemberLevelItem.categoryname;
                                                                              });
                                                                              if ((categoriesMemberLevelItem.categoryname == 'Learning Journeys') || (categoriesMemberLevelItem.categoryname == 'Group Journeys')) {
                                                                                logFirebaseEvent('Container_update_app_state');
                                                                                FFAppState().update(() {
                                                                                  FFAppState().leftPane = 'aiMenu';
                                                                                  FFAppState().leftColumnShow = true;
                                                                                  FFAppState().middlePane = 'bodyContent';
                                                                                  FFAppState().middleColumnShow = valueOrDefault<bool>(
                                                                                    () {
                                                                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                        return false;
                                                                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                        return true;
                                                                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                        return true;
                                                                                      } else {
                                                                                        return true;
                                                                                      }
                                                                                    }(),
                                                                                    true,
                                                                                  );
                                                                                });
                                                                              } else if ((categoriesMemberLevelItem.categoryname == 'Vault') || (categoriesMemberLevelItem.categoryname == 'Info')) {
                                                                                logFirebaseEvent('Container_update_app_state');
                                                                                _model.updatePage(() {
                                                                                  FFAppState().leftPane = 'appMenu';
                                                                                  FFAppState().leftColumnShow = true;
                                                                                  FFAppState().middleColumnShow = valueOrDefault<bool>(
                                                                                    () {
                                                                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                        return false;
                                                                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                        return true;
                                                                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                        return true;
                                                                                      } else {
                                                                                        return true;
                                                                                      }
                                                                                    }(),
                                                                                    true,
                                                                                  );
                                                                                  FFAppState().middlePane = 'bodyContentMainTiles';
                                                                                });
                                                                              } else if (categoriesMemberLevelItem.categoryname == 'Events') {
                                                                                logFirebaseEvent('Container_update_app_state');
                                                                                _model.updatePage(() {
                                                                                  FFAppState().leftPane = 'events';
                                                                                  FFAppState().leftColumnShow = true;
                                                                                  FFAppState().middleColumnShow = valueOrDefault<bool>(
                                                                                    () {
                                                                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                        return false;
                                                                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                        return true;
                                                                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                        return true;
                                                                                      } else {
                                                                                        return true;
                                                                                      }
                                                                                    }(),
                                                                                    true,
                                                                                  );
                                                                                  FFAppState().middlePane = 'bodyContentMainTiles';
                                                                                  FFAppState().selectedParentId = 'Events';
                                                                                  FFAppState().selectedcategory = 'Events';
                                                                                  FFAppState().selectedCategoryName = 'Events';
                                                                                });
                                                                              } else if (categoriesMemberLevelItem.categoryname == 'Chat') {
                                                                                logFirebaseEvent('Container_firestore_query');
                                                                                _model.companycheckforbottomchat = await queryCompaniesRecordOnce(
                                                                                  queryBuilder: (companiesRecord) => companiesRecord.where(
                                                                                    'companyCode',
                                                                                    isEqualTo: FFAppState().companySecretCode,
                                                                                  ),
                                                                                  singleRecord: true,
                                                                                ).then((s) => s.firstOrNull);
                                                                              } else if (categoriesMemberLevelItem.categoryname == 'Personalised Journeys') {
                                                                                logFirebaseEvent('Container_update_app_state');
                                                                                FFAppState().update(() {
                                                                                  FFAppState().leftPane = 'aiMenu';
                                                                                  FFAppState().leftColumnShow = true;
                                                                                  FFAppState().middlePane = 'bodyContent';
                                                                                  FFAppState().middleColumnShow = valueOrDefault<bool>(
                                                                                    () {
                                                                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                        return false;
                                                                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                        return true;
                                                                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                        return true;
                                                                                      } else {
                                                                                        return true;
                                                                                      }
                                                                                    }(),
                                                                                    true,
                                                                                  );
                                                                                });
                                                                              } else {
                                                                                logFirebaseEvent('Container_alert_dialog');
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return WebViewAware(
                                                                                      child: AlertDialog(
                                                                                        title: const Text('Coming Soon... '),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: const Text('Ok'),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              }

                                                                              if ((FFAppState().selectedcategory == '') ||
                                                                                  valueOrDefault<bool>(
                                                                                    FFAppState().selectedCategoryName == '',
                                                                                    false,
                                                                                  )) {
                                                                                logFirebaseEvent('Container_update_app_state');
                                                                                _model.updatePage(() {
                                                                                  FFAppState().selectedcategory = 'Community';
                                                                                  FFAppState().selectedCategoryName = 'Community';
                                                                                  FFAppState().selectedCategoryId = categoriesMemberLevelItem.reference.id;
                                                                                });
                                                                              }

                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(17.0),
                                                                              child: AnimatedContainer(
                                                                                duration: const Duration(milliseconds: 100),
                                                                                curve: Curves.easeIn,
                                                                                height: 35.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  image: DecorationImage(
                                                                                    fit: BoxFit.cover,
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    image: Image.network(
                                                                                      '',
                                                                                    ).image,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(17.0),
                                                                                  border: Border.all(
                                                                                    color: Colors.transparent,
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                    child: Text(
                                                                                      categoriesMemberLevelItem.categoryname,
                                                                                      textAlign: TextAlign.center,
                                                                                      maxLines: 2,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
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
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 7.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiary400,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  '${valueOrDefault<String>(
                                    FFAppState().selectedMemberLevelName,
                                    '-',
                                  )} > ${valueOrDefault<String>(
                                    FFAppState().selectedCategoryName,
                                    '-',
                                  )}',
                                  '-',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w800,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (FFAppState().leftPane == 'aiMenu') {
                        return SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 500.0,
                                ),
                                decoration: const BoxDecoration(),
                                child: SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, -1.0),
                                        child: wrapWithModel(
                                          model: _model
                                              .desktopTileNavAiThisWeekModel,
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: DesktopTileNavAiThisWeekWidget(
                                            sessionDoc: widget.sessionsDoc,
                                            companyDoc: widget.companiesDoc!,
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
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Your Saved Content',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium,
                                              ),
                                              Text(
                                                'Your Saved Content',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium,
                                              ),
                                              Expanded(
                                                child: wrapWithModel(
                                                  model: _model
                                                      .desktopTileNavAYourSavedModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child:
                                                      DesktopTileNavAYourSavedWidget(
                                                    sessionId: widget
                                                        .sessionsDoc
                                                        ?.reference
                                                        .id,
                                                    sessionDoc:
                                                        widget.sessionsDoc,
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
                            ],
                          ),
                        );
                      } else if (FFAppState().leftPane == 'appMenu') {
                        return SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 400.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 500.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 600.0;
                                    } else {
                                      return 400.0;
                                    }
                                  }(),
                                ),
                                decoration: const BoxDecoration(),
                                child: wrapWithModel(
                                  model: _model.mainAppTilesModel,
                                  updateCallback: () => setState(() {}),
                                  child: MainAppTilesWidget(
                                    categorySelected:
                                        FFAppState().selectedCategoryName,
                                    companyDoc: widget.companiesDoc!,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (FFAppState().leftPane == 'learnCards') {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.easeInOut,
                              constraints: BoxConstraints(
                                maxWidth: () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return 400.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return 500.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return 600.0;
                                  } else {
                                    return 400.0;
                                  }
                                }(),
                              ),
                              decoration: const BoxDecoration(),
                              child: wrapWithModel(
                                model: _model.learnCardsModel,
                                updateCallback: () => setState(() {}),
                                child: LearnCardsWidget(
                                  sessionsDoc: widget.sessionsDoc!,
                                  companyDoc: widget.companiesDoc!,
                                  showRight: FFAppState().leftColumnShow,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (FFAppState().leftPane == 'events') {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return 400.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return 500.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return 600.0;
                                  } else {
                                    return 400.0;
                                  }
                                }(),
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: wrapWithModel(
                                model: _model.eventAppTilesModel,
                                updateCallback: () => setState(() {}),
                                child: EventAppTilesWidget(
                                  categorySelected:
                                      FFAppState().selectedCategoryName,
                                  companyDoc: widget.companiesDoc!,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
