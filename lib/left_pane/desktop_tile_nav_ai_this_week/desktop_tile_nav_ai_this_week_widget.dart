import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/not_today_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'desktop_tile_nav_ai_this_week_model.dart';
export 'desktop_tile_nav_ai_this_week_model.dart';

class DesktopTileNavAiThisWeekWidget extends StatefulWidget {
  const DesktopTileNavAiThisWeekWidget({
    super.key,
    this.sessionId,
    this.sessionDoc,
    required this.companyDoc,
  });

  final String? sessionId;
  final SessionsRecord? sessionDoc;
  final CompaniesRecord? companyDoc;

  @override
  State<DesktopTileNavAiThisWeekWidget> createState() =>
      _DesktopTileNavAiThisWeekWidgetState();
}

class _DesktopTileNavAiThisWeekWidgetState
    extends State<DesktopTileNavAiThisWeekWidget> {
  late DesktopTileNavAiThisWeekModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DesktopTileNavAiThisWeekModel());

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

    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
        child: StreamBuilder<List<Tilesv2Record>>(
          stream: queryTilesv2Record(
            queryBuilder: (tilesv2Record) => tilesv2Record
                .where(
                  'companyDocId',
                  isEqualTo: widget.companyDoc?.reference.id,
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
            List<Tilesv2Record> desktopTileNavTilesv2RecordList =
                snapshot.data!;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              width: double.infinity,
              height: double.infinity,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.6,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) => Builder(
                                                    builder: (context) {
                                                      final navTile1Desktop =
                                                          desktopTileNavTilesv2RecordList
                                                              .where((e) =>
                                                                  valueOrDefault<
                                                                      bool>(
                                                                    valueOrDefault<
                                                                            bool>(
                                                                          e.tileTier >
                                                                              0,
                                                                          false,
                                                                        ) &&
                                                                        valueOrDefault<
                                                                            bool>(
                                                                          (e.triggerWeekly == true) ||
                                                                              valueOrDefault<bool>(
                                                                                (loggedIn == true) && (valueOrDefault<bool>(currentUserDocument?.isadmin, false) == true),
                                                                                false,
                                                                              ),
                                                                          false,
                                                                        ),
                                                                    false,
                                                                  ))
                                                              .toList();
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            navTile1Desktop
                                                                .length,
                                                        itemBuilder: (context,
                                                            navTile1DesktopIndex) {
                                                          final navTile1DesktopItem =
                                                              navTile1Desktop[
                                                                  navTile1DesktopIndex];
                                                          return Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          2.0,
                                                                          4.0,
                                                                          2.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                                child:
                                                                    AnimatedContainer(
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          170),
                                                                  curve: Curves
                                                                      .easeInOut,
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    primary:
                                                                        false,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              7.0,
                                                                              7.0,
                                                                              7.0,
                                                                              7.0),
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
                                                                              logFirebaseEvent('DESKTOP_TILE_NAV_AI_THIS_WEEK_tileTier_O');
                                                                              logFirebaseEvent('tileTier_update_app_state');
                                                                              _model.updatePage(() {
                                                                                FFAppState().viewTileContentId = navTile1DesktopItem.reference.id;
                                                                              });
                                                                              if (FFAppState().tileNav.tier1Id == navTile1DesktopItem.reference.id) {
                                                                                logFirebaseEvent('tileTier_update_app_state');
                                                                                setState(() {
                                                                                  FFAppState().updateTileNavStruct(
                                                                                    (e) => e
                                                                                      ..tier2Id = null
                                                                                      ..tier3Id = null
                                                                                      ..tier4Id = null,
                                                                                  );
                                                                                  FFAppState().viewTileContentId = navTile1DesktopItem.reference.id;
                                                                                  FFAppState().navPath = FFAppState().navPath.take(2).toList().cast<String>();
                                                                                });
                                                                                logFirebaseEvent('tileTier_update_app_state');
                                                                                setState(() {
                                                                                  FFAppState().NewTileJustCreated = false;
                                                                                });
                                                                              } else {
                                                                                logFirebaseEvent('tileTier_update_app_state');
                                                                                FFAppState().updateTileNavStruct(
                                                                                  (e) => e
                                                                                    ..tier1Id = navTile1DesktopItem.reference.id
                                                                                    ..tier2Id = null
                                                                                    ..tier3Id = null
                                                                                    ..tier4Id = null,
                                                                                );
                                                                                FFAppState().viewTileContentId = navTile1DesktopItem.reference.id;
                                                                                FFAppState().navPath = FFAppState().navPath.take(1).toList().cast<String>();
                                                                                logFirebaseEvent('tileTier_update_app_state');
                                                                                _model.updatePage(() {
                                                                                  FFAppState().addToNavPath(navTile1DesktopItem.reference.id);
                                                                                });
                                                                                logFirebaseEvent('tileTier_update_app_state');
                                                                                setState(() {
                                                                                  FFAppState().NewTileJustCreated = false;
                                                                                });
                                                                              }

                                                                              logFirebaseEvent('tileTier_update_app_state');
                                                                              _model.updatePage(() {
                                                                                FFAppState().selectedTopic = valueOrDefault<String>(
                                                                                  navTile1DesktopItem.title,
                                                                                  'primary tile',
                                                                                );
                                                                                FFAppState().selectedReadingItem = navTile1DesktopItem.title;
                                                                                FFAppState().middleColumnShow = true;
                                                                                FFAppState().leftColumnShow = valueOrDefault<bool>(
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
                                                                                FFAppState().middlePane = 'bodyContent';
                                                                                FFAppState().rightColumnShow = () {
                                                                                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                    return false;
                                                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                    return true;
                                                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                    return true;
                                                                                  } else {
                                                                                    return true;
                                                                                  }
                                                                                }();
                                                                                FFAppState().rightPane = 'learnCards';
                                                                                FFAppState().isAParent = true;
                                                                                FFAppState().showLearnCard = false;
                                                                              });
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              height: 90.0,
                                                                              decoration: BoxDecoration(
                                                                                color: widget.companyDoc?.colors.primaryColor,
                                                                                borderRadius: const BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(13.0),
                                                                                  bottomRight: Radius.circular(13.0),
                                                                                  topLeft: Radius.circular(13.0),
                                                                                  topRight: Radius.circular(13.0),
                                                                                ),
                                                                                border: Border.all(
                                                                                  color: valueOrDefault<Color>(
                                                                                    FFAppState().tileNav.tier1Id == navTile1DesktopItem.reference.id ? FlutterFlowTheme.of(context).customColor7 : FlutterFlowTheme.of(context).selectedButton,
                                                                                    FlutterFlowTheme.of(context).selectedButton,
                                                                                  ),
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  child: Visibility(
                                                                                                    visible: responsiveVisibility(
                                                                                                      context: context,
                                                                                                      phone: false,
                                                                                                      tablet: false,
                                                                                                      tabletLandscape: false,
                                                                                                      desktop: false,
                                                                                                    ),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                      child: Image.network(
                                                                                                        valueOrDefault<String>(
                                                                                                          navTile1DesktopItem.image,
                                                                                                          'https://firebasestorage.googleapis.com/v0/b/tony-morris-internationa-1b480.appspot.com/o/Screenshot%202023-09-18%20at%2003.42.png?alt=media&token=060d0210-4a99-4b7f-a5ff-ce9ab70a4849',
                                                                                                        ),
                                                                                                        width: 70.0,
                                                                                                        height: 70.0,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 5.0, 8.0, 5.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      AutoSizeText(
                                                                                                        'This weeks focus topic:',
                                                                                                        textAlign: TextAlign.start,
                                                                                                        maxLines: 3,
                                                                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                              color: widget.companyDoc?.colors.secondaryTextColor,
                                                                                                              fontSize: 12.0,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        AutoSizeText(
                                                                                                          navTile1DesktopItem.title,
                                                                                                          textAlign: TextAlign.start,
                                                                                                          maxLines: 3,
                                                                                                          style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                                color: widget.companyDoc?.colors.secondaryTextColor,
                                                                                                                fontSize: 16.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
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
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Opacity(
                                                                          opacity:
                                                                              0.8,
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                AnimatedContainer(
                                                                              duration: const Duration(milliseconds: 100),
                                                                              curve: Curves.easeInOut,
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: widget.companyDoc?.colors.primaryColor,
                                                                                borderRadius: BorderRadius.circular(17.0),
                                                                                border: Border.all(
                                                                                  color: Colors.transparent,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    final tileTier2 = desktopTileNavTilesv2RecordList
                                                                                        .where((e) => valueOrDefault<bool>(
                                                                                              e.parentId == navTile1DesktopItem.reference.id,
                                                                                              false,
                                                                                            ))
                                                                                        .toList();
                                                                                    return Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: List.generate(tileTier2.length, (tileTier2Index) {
                                                                                        final tileTier2Item = tileTier2[tileTier2Index];
                                                                                        return Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('DESKTOP_TILE_NAV_AI_THIS_WEEK_tile_ON_TA');
                                                                                              var shouldSetState = false;
                                                                                              logFirebaseEvent('tile_firestore_query');
                                                                                              _model.companyQuery = await queryCompaniesRecordOnce(
                                                                                                queryBuilder: (companiesRecord) => companiesRecord.where(
                                                                                                  'companyCode',
                                                                                                  isEqualTo: FFAppState().companySecretCode,
                                                                                                ),
                                                                                                singleRecord: true,
                                                                                              ).then((s) => s.firstOrNull);
                                                                                              shouldSetState = true;
                                                                                              logFirebaseEvent('tile_backend_call');

                                                                                              await widget.sessionDoc!.reference.update(createSessionsRecordData(
                                                                                                activeDailyTopic: tileTier2Item.title,
                                                                                              ));
                                                                                              logFirebaseEvent('tile_update_app_state');
                                                                                              _model.updatePage(() {
                                                                                                FFAppState().viewTileContentId = navTile1DesktopItem.reference.id;
                                                                                              });
                                                                                              if (tileTier2Item.tileToday != true) {
                                                                                                logFirebaseEvent('tile_bottom_sheet');
                                                                                                await showModalBottomSheet(
                                                                                                  isScrollControlled: true,
                                                                                                  backgroundColor: Colors.transparent,
                                                                                                  enableDrag: false,
                                                                                                  context: context,
                                                                                                  builder: (context) {
                                                                                                    return WebViewAware(
                                                                                                      child: Padding(
                                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                                        child: SizedBox(
                                                                                                          height: 300.0,
                                                                                                          child: NotTodayWidget(
                                                                                                            tileDoc: tileTier2Item,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => safeSetState(() {}));

                                                                                                if (shouldSetState) setState(() {});
                                                                                                return;
                                                                                              }
                                                                                              logFirebaseEvent('tile_update_app_state');
                                                                                              _model.updatePage(() {
                                                                                                FFAppState().middleColumnShow = true;
                                                                                                FFAppState().isAParent = false;
                                                                                                FFAppState().middlePane = 'bodyContent';
                                                                                                FFAppState().leftColumnShow = () {
                                                                                                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                                    return false;
                                                                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                                    return true;
                                                                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                                    return true;
                                                                                                  } else {
                                                                                                    return true;
                                                                                                  }
                                                                                                }();
                                                                                                FFAppState().rightColumnShow = () {
                                                                                                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                                    return false;
                                                                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                                    return true;
                                                                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                                    return true;
                                                                                                  } else {
                                                                                                    return true;
                                                                                                  }
                                                                                                }();
                                                                                                FFAppState().showLearnCard = false;
                                                                                              });
                                                                                              if (FFAppState().tileNav.tier2Id == tileTier2Item.reference.id) {
                                                                                                logFirebaseEvent('tile_update_app_state');
                                                                                                _model.updatePage(() {
                                                                                                  FFAppState().updateTileNavStruct(
                                                                                                    (e) => e
                                                                                                      ..tier3Id = null
                                                                                                      ..tier4Id = null,
                                                                                                  );
                                                                                                  FFAppState().viewTileContentId = valueOrDefault<String>(
                                                                                                    tileTier2Item.reference.id,
                                                                                                    '000',
                                                                                                  );
                                                                                                  FFAppState().navPath = FFAppState().navPath.take(3).toList().cast<String>();
                                                                                                });
                                                                                                logFirebaseEvent('tile_update_app_state');
                                                                                                setState(() {
                                                                                                  FFAppState().NewTileJustCreated = false;
                                                                                                });
                                                                                              } else {
                                                                                                logFirebaseEvent('tile_update_app_state');
                                                                                                FFAppState().updateTileNavStruct(
                                                                                                  (e) => e
                                                                                                    ..tier2Id = tileTier2Item.reference.id
                                                                                                    ..tier3Id = null
                                                                                                    ..tier4Id = null,
                                                                                                );
                                                                                                FFAppState().viewTileContentId = valueOrDefault<String>(
                                                                                                  tileTier2Item.reference.id,
                                                                                                  '000',
                                                                                                );
                                                                                                FFAppState().navPath = FFAppState().navPath.take(2).toList().cast<String>();
                                                                                                logFirebaseEvent('tile_update_app_state');
                                                                                                _model.updatePage(() {
                                                                                                  FFAppState().addToNavPath(tileTier2Item.reference.id);
                                                                                                });
                                                                                                logFirebaseEvent('tile_update_app_state');
                                                                                                setState(() {
                                                                                                  FFAppState().NewTileJustCreated = false;
                                                                                                });
                                                                                                logFirebaseEvent('tile_update_app_state');
                                                                                                setState(() {
                                                                                                  FFAppState().selectedReadingItem = tileTier2Item.title;
                                                                                                });
                                                                                              }

                                                                                              if (tileTier2Item.aiComplete != true) {
                                                                                                logFirebaseEvent('tile_backend_call');

                                                                                                await tileTier2Item.reference.update(createTilesv2RecordData(
                                                                                                  aiComplete: true,
                                                                                                ));
                                                                                                if (!loggedIn) {}
                                                                                              }
                                                                                              if (shouldSetState) setState(() {});
                                                                                            },
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: tileTier2Item.tileToday == true
                                                                                                    ? valueOrDefault<Color>(
                                                                                                        widget.companyDoc?.colors.secondaryColor,
                                                                                                        FlutterFlowTheme.of(context).greenish,
                                                                                                      )
                                                                                                    : valueOrDefault<Color>(
                                                                                                        widget.companyDoc?.colors.primaryColor,
                                                                                                        FlutterFlowTheme.of(context).secondary,
                                                                                                      ),
                                                                                                borderRadius: BorderRadius.circular(6.0),
                                                                                                border: Border.all(
                                                                                                  color: valueOrDefault<Color>(
                                                                                                    FFAppState().tileNav.tier2Id == tileTier2Item.reference.id ? FlutterFlowTheme.of(context).customColor7 : FlutterFlowTheme.of(context).accent3,
                                                                                                    FlutterFlowTheme.of(context).accent3,
                                                                                                  ),
                                                                                                  width: 2.0,
                                                                                                ),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsets.all(8.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    if (valueOrDefault<bool>(
                                                                                                      tileTier2Item.image != '',
                                                                                                      false,
                                                                                                    ))
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Opacity(
                                                                                                              opacity: 0.4,
                                                                                                              child: ClipRRect(
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                child: Image.network(
                                                                                                                  tileTier2Item.image,
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
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              tileTier2Item.title,
                                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                    fontFamily: 'Outfit',
                                                                                                                    color: tileTier2Item.tileToday == true
                                                                                                                        ? valueOrDefault<Color>(
                                                                                                                            widget.companyDoc?.colors.secondaryTextColor,
                                                                                                                            FlutterFlowTheme.of(context).secondary,
                                                                                                                          )
                                                                                                                        : valueOrDefault<Color>(
                                                                                                                            widget.companyDoc?.colors.secondaryTextColor,
                                                                                                                            FlutterFlowTheme.of(context).secondary,
                                                                                                                          ),
                                                                                                                    fontSize: 15.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 8.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                child: Container(
                                                                                                                  width: 40.0,
                                                                                                                  height: 40.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                  child: Visibility(
                                                                                                                    visible: valueOrDefault<bool>(
                                                                                                                      tileTier2Item.tileToday != true,
                                                                                                                      false,
                                                                                                                    ),
                                                                                                                    child: FlutterFlowIconButton(
                                                                                                                      borderColor: FlutterFlowTheme.of(context).primary,
                                                                                                                      borderRadius: 20.0,
                                                                                                                      borderWidth: 1.0,
                                                                                                                      buttonSize: 40.0,
                                                                                                                      fillColor: const Color(0xFFCEBB57),
                                                                                                                      icon: FaIcon(
                                                                                                                        FontAwesomeIcons.lock,
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        size: 24.0,
                                                                                                                      ),
                                                                                                                      onPressed: () {
                                                                                                                        print('IconButton pressed ...');
                                                                                                                      },
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
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }),
                                                                                    );
                                                                                  },
                                                                                ),
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
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
