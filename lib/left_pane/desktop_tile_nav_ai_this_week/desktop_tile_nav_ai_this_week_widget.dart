import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/not_today_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
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
    extends State<DesktopTileNavAiThisWeekWidget>
    with TickerProviderStateMixin {
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

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxHeight: 1000.0,
          ),
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              Align(
                alignment: const Alignment(0.0, 0),
                child: TabBar(
                  labelColor: widget.companyDoc?.colors.primaryTextColor,
                  unselectedLabelColor:
                      FlutterFlowTheme.of(context).secondaryText,
                  labelStyle: FlutterFlowTheme.of(context).titleMedium,
                  unselectedLabelStyle: const TextStyle(),
                  indicatorColor: FlutterFlowTheme.of(context).primary,
                  padding: const EdgeInsets.all(4.0),
                  tabs: const [
                    Tab(
                      text: 'Group Journeys',
                    ),
                    Tab(
                      text: 'Personalised',
                    ),
                  ],
                  controller: _model.tabBarController,
                  onTap: (i) async {
                    [
                      () async {
                        logFirebaseEvent(
                            'DESKTOP_TILE_NAV_AI_THIS_WEEK_Tab_671she');
                        logFirebaseEvent('Tab_update_app_state');
                        setState(() {
                          FFAppState().selectedCategoryName = 'Group Journeys';
                        });
                      },
                      () async {
                        logFirebaseEvent(
                            'DESKTOP_TILE_NAV_AI_THIS_WEEK_Tab_ybodxb');
                        logFirebaseEvent('Tab_update_app_state');
                        setState(() {
                          FFAppState().selectedCategoryName =
                              'Personalised Journey';
                        });
                      }
                    ][i]();
                  },
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _model.tabBarController,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 7.0, 0.0, 0.0),
                            child: StreamBuilder<List<Tilesv2Record>>(
                              stream: queryTilesv2Record(
                                queryBuilder: (tilesv2Record) => tilesv2Record
                                    .where(
                                      'companyDocId',
                                      isEqualTo:
                                          widget.companyDoc?.reference.id,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<Tilesv2Record>
                                    desktopTileNavTilesv2RecordList =
                                    snapshot.data!;
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.easeInOut,
                                  width: double.infinity,
                                  height: double.infinity,
                                  constraints: BoxConstraints(
                                    maxHeight:
                                        MediaQuery.sizeOf(context).height * 0.6,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    height: double.infinity,
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
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
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(16.0),
                                                  topRight:
                                                      Radius.circular(16.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                    child:
                                                                        AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final navTile1Desktop = desktopTileNavTilesv2RecordList
                                                                              .where((e) => valueOrDefault<bool>(
                                                                                    valueOrDefault<bool>(
                                                                                          e.tileTier > 0,
                                                                                          false,
                                                                                        ) &&
                                                                                        valueOrDefault<bool>(
                                                                                          (e.triggerWeekly == true) ||
                                                                                              valueOrDefault<bool>(
                                                                                                (loggedIn == true) && (valueOrDefault<bool>(currentUserDocument?.isadmin, false) == true),
                                                                                                false,
                                                                                              ),
                                                                                          false,
                                                                                        ) &&
                                                                                        (e.showToAll != false),
                                                                                    false,
                                                                                  ))
                                                                              .toList();
                                                                          return ListView
                                                                              .builder(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            primary:
                                                                                false,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                navTile1Desktop.length,
                                                                            itemBuilder:
                                                                                (context, navTile1DesktopIndex) {
                                                                              final navTile1DesktopItem = navTile1Desktop[navTile1DesktopIndex];
                                                                              return Align(
                                                                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 2.0, 4.0, 2.0),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                    child: AnimatedContainer(
                                                                                      duration: const Duration(milliseconds: 170),
                                                                                      curve: Curves.easeInOut,
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                      ),
                                                                                      alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                      child: SingleChildScrollView(
                                                                                        primary: false,
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(7.0, 7.0, 7.0, 7.0),
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
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
                                                                                                    FFAppState().isAParent = true;
                                                                                                    FFAppState().showLearnCard = false;
                                                                                                  });
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
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
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 5.0, 8.0, 5.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Opacity(
                                                                                                                        opacity: 0.6,
                                                                                                                        child: Padding(
                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                                          child: StreamBuilder<List<Tilesv2Record>>(
                                                                                                                            stream: queryTilesv2Record(
                                                                                                                              queryBuilder: (tilesv2Record) => tilesv2Record
                                                                                                                                  .where(
                                                                                                                                    'triggerWeekly',
                                                                                                                                    isEqualTo: true,
                                                                                                                                  )
                                                                                                                                  .where(
                                                                                                                                    'showToAll',
                                                                                                                                    isNotEqualTo: false,
                                                                                                                                  )
                                                                                                                                  .where(
                                                                                                                                    'companyDocId',
                                                                                                                                    isEqualTo: widget.companyDoc?.companyDocId,
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
                                                                                                                              List<Tilesv2Record> containerTilesv2RecordList = snapshot.data!;
                                                                                                                              return Container(
                                                                                                                                decoration: BoxDecoration(
                                                                                                                                  color: FlutterFlowTheme.of(context).accent4,
                                                                                                                                  borderRadius: BorderRadius.circular(17.0),
                                                                                                                                ),
                                                                                                                                child: Padding(
                                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
                                                                                                                                  child: Container(
                                                                                                                                    width: double.infinity,
                                                                                                                                    color: const Color(0x00000000),
                                                                                                                                    child: ExpandableNotifier(
                                                                                                                                      initialExpanded: false,
                                                                                                                                      child: ExpandablePanel(
                                                                                                                                        header: Padding(
                                                                                                                                          padding: const EdgeInsets.all(7.0),
                                                                                                                                          child: Text(
                                                                                                                                            'This weeks focus topic is ${valueOrDefault<String>(
                                                                                                                                              containerTilesv2RecordList.first.title,
                                                                                                                                              '-',
                                                                                                                                            )}',
                                                                                                                                            style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                                                                                  fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                                                                                                  color: Colors.black,
                                                                                                                                                  fontSize: 18.0,
                                                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        collapsed: Container(),
                                                                                                                                        expanded: Column(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          children: [
                                                                                                                                            Padding(
                                                                                                                                              padding: const EdgeInsets.all(7.0),
                                                                                                                                              child: Text(
                                                                                                                                                'Each week, ${valueOrDefault<String>(
                                                                                                                                                  widget.companyDoc?.companyname,
                                                                                                                                                  '-',
                                                                                                                                                )}  is excited to present a new and thrilling topic for your exploration. These topics, carefully selected, unfold over five days, with each day bringing a unique activity designed to spark your curiosity and engagement. Your in-app coach and mentor, enhanced with insights directly from ${valueOrDefault<String>(
                                                                                                                                                  widget.companyDoc?.companyname,
                                                                                                                                                  '-',
                                                                                                                                                )} will guide you on this exploratory journey. While you will primarily interact with an AI, the information and guidance you receive are rooted directly in  ${valueOrDefault<String>(
                                                                                                                                                  widget.companyDoc?.companyname,
                                                                                                                                                  '-',
                                                                                                                                                )}\'s expertise. If you come across a padlocked topic, it indicates that it\'s either exclusive or scheduled for a later release, ensuring the learning material is presented at an optimal pace. Within each subject, the \'LearnCard Activity\' awaits, offering a deep dive into understanding and hands-on experience.',
                                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                                      color: const Color(0x8A000000),
                                                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                        theme: const ExpandableThemeData(
                                                                                                                                          tapHeaderToExpand: true,
                                                                                                                                          tapBodyToExpand: false,
                                                                                                                                          tapBodyToCollapse: false,
                                                                                                                                          headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                                                                          hasIcon: true,
                                                                                                                                          expandIcon: Icons.info_sharp,
                                                                                                                                          collapseIcon: Icons.close_fullscreen,
                                                                                                                                        ),
                                                                                                                                      ),
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
                                                                                              opacity: 0.8,
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                child: AnimatedContainer(
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
                                                                                                                    FFAppState().viewTileContentId = tileTier2Item.reference.id;
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
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 7.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) =>
                                  StreamBuilder<List<Tilesv2Record>>(
                                stream: queryTilesv2Record(
                                  queryBuilder: (tilesv2Record) => tilesv2Record
                                      .where(
                                        'companyDocId',
                                        isEqualTo:
                                            widget.companyDoc?.reference.id,
                                      )
                                      .where(
                                        'sessionIdUser',
                                        isEqualTo: loggedIn
                                            ? valueOrDefault(
                                                currentUserDocument
                                                    ?.lastSessionId,
                                                '')
                                            : widget.sessionDoc?.reference.id,
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<Tilesv2Record>
                                      desktopTileNavTilesv2RecordList =
                                      snapshot.data!;
                                  return AnimatedContainer(
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.easeInOut,
                                    width: double.infinity,
                                    height: double.infinity,
                                    constraints: BoxConstraints(
                                      maxHeight:
                                          MediaQuery.sizeOf(context).height *
                                              0.6,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Container(
                                      height: double.infinity,
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(16.0),
                                                    topRight:
                                                        Radius.circular(16.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child:
                                                                        Align(
                                                                      alignment: const AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(14.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final navTile1Desktop = desktopTileNavTilesv2RecordList
                                                                                .where((e) => valueOrDefault<bool>(
                                                                                      valueOrDefault<bool>(
                                                                                            e.tileTier > 0,
                                                                                            false,
                                                                                          ) &&
                                                                                          valueOrDefault<bool>(
                                                                                            (e.triggerWeekly == true) ||
                                                                                                valueOrDefault<bool>(
                                                                                                  (loggedIn == true) && (valueOrDefault<bool>(currentUserDocument?.isadmin, false) == true),
                                                                                                  false,
                                                                                                ),
                                                                                            false,
                                                                                          ) &&
                                                                                          (e.showToAll == false),
                                                                                      false,
                                                                                    ))
                                                                                .toList();
                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: navTile1Desktop.length,
                                                                              itemBuilder: (context, navTile1DesktopIndex) {
                                                                                final navTile1DesktopItem = navTile1Desktop[navTile1DesktopIndex];
                                                                                return Align(
                                                                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(4.0, 2.0, 4.0, 2.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                      child: AnimatedContainer(
                                                                                        duration: const Duration(milliseconds: 170),
                                                                                        curve: Curves.easeInOut,
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                        child: SingleChildScrollView(
                                                                                          primary: false,
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(7.0, 7.0, 7.0, 7.0),
                                                                                                child: InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
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
                                                                                                      FFAppState().isAParent = true;
                                                                                                    });
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
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
                                                                                                                Expanded(
                                                                                                                  child: Padding(
                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 5.0, 8.0, 5.0),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Opacity(
                                                                                                                          opacity: 0.6,
                                                                                                                          child: Padding(
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                                                                                                                            child: StreamBuilder<List<Tilesv2Record>>(
                                                                                                                              stream: queryTilesv2Record(
                                                                                                                                queryBuilder: (tilesv2Record) => tilesv2Record
                                                                                                                                    .where(
                                                                                                                                      'triggerWeekly',
                                                                                                                                      isEqualTo: true,
                                                                                                                                    )
                                                                                                                                    .where(
                                                                                                                                      'showToAll',
                                                                                                                                      isEqualTo: false,
                                                                                                                                    )
                                                                                                                                    .where(
                                                                                                                                      'companyDocId',
                                                                                                                                      isEqualTo: widget.companyDoc?.companyDocId,
                                                                                                                                    )
                                                                                                                                    .where(
                                                                                                                                      'sessionIdUser',
                                                                                                                                      isEqualTo: widget.sessionDoc?.reference.id,
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
                                                                                                                                List<Tilesv2Record> containerTilesv2RecordList = snapshot.data!;
                                                                                                                                return Container(
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: FlutterFlowTheme.of(context).accent4,
                                                                                                                                    borderRadius: BorderRadius.circular(17.0),
                                                                                                                                  ),
                                                                                                                                  child: Padding(
                                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                                    child: Container(
                                                                                                                                      width: double.infinity,
                                                                                                                                      color: const Color(0x00000000),
                                                                                                                                      child: ExpandableNotifier(
                                                                                                                                        initialExpanded: false,
                                                                                                                                        child: ExpandablePanel(
                                                                                                                                          header: Padding(
                                                                                                                                            padding: const EdgeInsets.all(10.0),
                                                                                                                                            child: Text(
                                                                                                                                              valueOrDefault<String>(
                                                                                                                                                containerTilesv2RecordList.first.title,
                                                                                                                                                '-',
                                                                                                                                              ),
                                                                                                                                              style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                                                                                    fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                                                                                                    color: Colors.black,
                                                                                                                                                    fontSize: 18.0,
                                                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                                                                                                  ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                          collapsed: Container(),
                                                                                                                                          expanded: Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              Padding(
                                                                                                                                                padding: const EdgeInsets.all(7.0),
                                                                                                                                                child: Text(
                                                                                                                                                  valueOrDefault<String>(
                                                                                                                                                    containerTilesv2RecordList.first.whyChosen,
                                                                                                                                                    '-',
                                                                                                                                                  ),
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                                        color: const Color(0x8A000000),
                                                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                                                      ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                              Divider(
                                                                                                                                                thickness: 1.0,
                                                                                                                                                color: FlutterFlowTheme.of(context).accent4,
                                                                                                                                              ),
                                                                                                                                              Padding(
                                                                                                                                                padding: const EdgeInsets.all(7.0),
                                                                                                                                                child: Text(
                                                                                                                                                  '\nA personalised journey is precisely tailored to meet your unique needs and aspirations, guiding you towards achieving your goals. Week by week, this journey unfolds with a new and captivating topic selected just for you, ensuring that each step you take is aligned with addressing your most immediate priorities and advancing your personal growth.',
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                                        color: const Color(0x8A000000),
                                                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                                                      ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                          theme: const ExpandableThemeData(
                                                                                                                                            tapHeaderToExpand: true,
                                                                                                                                            tapBodyToExpand: false,
                                                                                                                                            tapBodyToCollapse: false,
                                                                                                                                            headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                                                                            hasIcon: true,
                                                                                                                                            expandIcon: Icons.info_sharp,
                                                                                                                                            collapseIcon: Icons.close_fullscreen_outlined,
                                                                                                                                          ),
                                                                                                                                        ),
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
                                                                                                opacity: 0.8,
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                  child: AnimatedContainer(
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
                                                                                                                    _model.companyQuery11 = await queryCompaniesRecordOnce(
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
      ],
    );
  }
}
