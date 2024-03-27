import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/noaccesspopup_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'main_app_tiles_model.dart';
export 'main_app_tiles_model.dart';

class MainAppTilesWidget extends StatefulWidget {
  const MainAppTilesWidget({
    super.key,
    required this.categorySelected,
    required this.companyDoc,
  });

  final String? categorySelected;
  final CompaniesRecord? companyDoc;

  @override
  State<MainAppTilesWidget> createState() => _MainAppTilesWidgetState();
}

class _MainAppTilesWidgetState extends State<MainAppTilesWidget>
    with TickerProviderStateMixin {
  late MainAppTilesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainAppTilesModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MAIN_APP_TILES_MainAppTiles_ON_INIT_STAT');
      logFirebaseEvent('MainAppTiles_firestore_query');
      _model.tilesOriginal = await queryTilesRecordOnce();
      logFirebaseEvent('MainAppTiles_update_app_state');
      setState(() {
        FFAppState().viewTileContentId =
            _model.tilesOriginal!.first.reference.id;
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.expandableController1 = ExpandableController(initialExpanded: false);
    _model.expandableController2 = ExpandableController(initialExpanded: false);
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
                  isScrollable: true,
                  labelColor: valueOrDefault<Color>(
                    widget.companyDoc?.colors.secondaryTextColor,
                    FlutterFlowTheme.of(context).secondary,
                  ),
                  unselectedLabelColor: valueOrDefault<Color>(
                    widget.companyDoc?.colors.secondaryTextColor,
                    FlutterFlowTheme.of(context).secondary,
                  ),
                  labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleMediumFamily,
                        fontSize: 12.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleMediumFamily),
                      ),
                  unselectedLabelStyle:
                      FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            fontSize: 12.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleMediumFamily),
                          ),
                  indicatorColor: FlutterFlowTheme.of(context).primary,
                  padding: const EdgeInsets.all(4.0),
                  tabs: [
                    Tab(
                      text: valueOrDefault<String>(
                        widget.companyDoc?.tabNames
                            .where((e) => e.position == 3)
                            .toList()
                            .first
                            .name,
                        '1',
                      ),
                    ),
                    const Tab(
                      text: 'SMART',
                    ),
                    const Tab(
                      text: 'Mastermind',
                    ),
                  ],
                  controller: _model.tabBarController,
                  onTap: (i) async {
                    [
                      () async {
                        logFirebaseEvent(
                            'MAIN_APP_TILES_COMP_Tab_kc5vipgo_ON_TAP');
                        logFirebaseEvent('Tab_update_app_state');
                        setState(() {
                          FFAppState().selectedCategoryName = 'Non-Member';
                          FFAppState().selectedtab = 'Community';
                          FFAppState().selectedMemberLevel = 'Community';
                          FFAppState().selectedMemberLevelName = 'Community';
                        });
                      },
                      () async {
                        logFirebaseEvent(
                            'MAIN_APP_TILES_COMP_Tab_w76nao1r_ON_TAP');
                        logFirebaseEvent('Tab_update_app_state');
                        setState(() {
                          FFAppState().selectedCategoryName = 'SMART';
                          FFAppState().selectedtab = 'SMART';
                          FFAppState().selectedMemberLevelName = 'SMART';
                        });
                      },
                      () async {
                        logFirebaseEvent(
                            'MAIN_APP_TILES_COMP_Tab_h6jz6onu_ON_TAP');
                        logFirebaseEvent('Tab_update_app_state');
                        setState(() {
                          FFAppState().selectedCategoryName = 'Mastermind';
                          FFAppState().selectedtab = 'Mastermind';
                          FFAppState().selectedMemberLevelName = 'Mastermind';
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
                    KeepAliveWidgetWrapper(
                      builder: (context) => Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Opacity(
                            opacity: 0.8,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
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
                                        isEqualTo:
                                            widget.companyDoc?.companyDocId,
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
                                      containerTilesv2RecordList =
                                      snapshot.data!;
                                  return Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      borderRadius: BorderRadius.circular(17.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          25.0, 0.0, 25.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        color: const Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller:
                                              _model.expandableController1,
                                          child: ExpandablePanel(
                                            header: Padding(
                                              padding: const EdgeInsets.all(7.0),
                                              child: Text(
                                                'The Non -Members Vault',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displaySmallFamily,
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmallFamily),
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
                                                    'The non-members vault is accessible to all users, offering valuable information and resources. Here, you can explore a wide range of content made available to everyone, ensuring you have the tools and knowledge at your fingertips, regardless of membership status.\n',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color:
                                                              const Color(0x8A000000),
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
                                            theme: const ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: false,
                                              tapBodyToCollapse: false,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              hasIcon: true,
                                              expandIcon: Icons.info_sharp,
                                              collapseIcon:
                                                  Icons.close_fullscreen,
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
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: StreamBuilder<List<TilesRecord>>(
                              stream: queryTilesRecord(
                                queryBuilder: (tilesRecord) =>
                                    tilesRecord.where(
                                  'companyId',
                                  isEqualTo: widget.companyDoc?.reference.id,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<TilesRecord>
                                    desktopTileNavTilesRecordList =
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
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: Align(
                                    alignment: const AlignmentDirectional(-1.0, -1.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: const BoxDecoration(),
                                      alignment:
                                          const AlignmentDirectional(-1.0, -1.0),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, -1.0),
                                        child: Builder(
                                          builder: (context) {
                                            final tilesParents =
                                                desktopTileNavTilesRecordList
                                                    .where((e) =>
                                                        valueOrDefault<bool>(
                                                          (e.parentId ==
                                                                  'PRIMARY') &&
                                                              (e.memberlevels.contains(
                                                                      FFAppState()
                                                                          .selectedMemberLevelName) ==
                                                                  true),
                                                          false,
                                                        ))
                                                    .toList()
                                                    .sortedList((e) => e.id)
                                                    .toList();
                                            return SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: List.generate(
                                                    tilesParents.length,
                                                    (tilesParentsIndex) {
                                                  final tilesParentsItem =
                                                      tilesParents[
                                                          tilesParentsIndex];
                                                  return Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            7.0,
                                                                            7.0,
                                                                            7.0,
                                                                            7.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
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
                                                                        'MAIN_APP_TILES_COMP_tileTier_ON_TAP');
                                                                    if (FFAppState()
                                                                            .tileNav
                                                                            .tier1Id ==
                                                                        tilesParentsItem
                                                                            .reference
                                                                            .id) {
                                                                      logFirebaseEvent(
                                                                          'tileTier_update_app_state');
                                                                      setState(
                                                                          () {
                                                                        FFAppState()
                                                                            .updateTileNavStruct(
                                                                          (e) => e
                                                                            ..tier2Id =
                                                                                null
                                                                            ..tier3Id =
                                                                                null
                                                                            ..tier4Id = null,
                                                                        );
                                                                        FFAppState().viewTileContentId = tilesParentsItem
                                                                            .reference
                                                                            .id;
                                                                        FFAppState().navPath = FFAppState()
                                                                            .navPath
                                                                            .take(2)
                                                                            .toList()
                                                                            .cast<String>();
                                                                        FFAppState().selectedParentRef =
                                                                            tilesParentsItem.reference;
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'tileTier_update_app_state');
                                                                      setState(
                                                                          () {
                                                                        FFAppState().NewTileJustCreated =
                                                                            false;
                                                                      });
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'tileTier_update_app_state');
                                                                      FFAppState()
                                                                          .updateTileNavStruct(
                                                                        (e) => e
                                                                          ..tier1Id = tilesParentsItem
                                                                              .reference
                                                                              .id
                                                                          ..tier2Id =
                                                                              null
                                                                          ..tier3Id =
                                                                              null
                                                                          ..tier4Id =
                                                                              null,
                                                                      );
                                                                      FFAppState()
                                                                              .viewTileContentId =
                                                                          tilesParentsItem
                                                                              .reference
                                                                              .id;
                                                                      FFAppState().navPath = FFAppState()
                                                                          .navPath
                                                                          .take(
                                                                              1)
                                                                          .toList()
                                                                          .cast<
                                                                              String>();
                                                                      FFAppState()
                                                                              .selectedParentRef =
                                                                          tilesParentsItem
                                                                              .reference;
                                                                      logFirebaseEvent(
                                                                          'tileTier_update_app_state');
                                                                      _model.updatePage(
                                                                          () {
                                                                        FFAppState().addToNavPath(tilesParentsItem
                                                                            .reference
                                                                            .id);
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'tileTier_update_app_state');
                                                                      setState(
                                                                          () {
                                                                        FFAppState().NewTileJustCreated =
                                                                            false;
                                                                      });
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        90.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: widget
                                                                          .companyDoc
                                                                          ?.colors
                                                                          .primaryColor,
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(13.0),
                                                                        bottomRight:
                                                                            Radius.circular(13.0),
                                                                        topLeft:
                                                                            Radius.circular(13.0),
                                                                        topRight:
                                                                            Radius.circular(13.0),
                                                                      ),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          FFAppState().tileNav.tier1Id == tilesParentsItem.reference.id
                                                                              ? FlutterFlowTheme.of(context).customColor7
                                                                              : FlutterFlowTheme.of(context).selectedButton,
                                                                          FlutterFlowTheme.of(context)
                                                                              .selectedButton,
                                                                        ),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          16.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                                                              tilesParentsItem.image,
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
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                AutoSizeText(
                                                                                                  valueOrDefault<String>(
                                                                                                    'Generated: ${dateTimeFormat('relative', desktopTileNavTilesRecordList.first.createdTime)}',
                                                                                                    'not set',
                                                                                                  ),
                                                                                                  textAlign: TextAlign.start,
                                                                                                  maxLines: 3,
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                        color: widget.companyDoc?.colors.primaryTextColor,
                                                                                                        fontSize: 12.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            if (FFAppState().debugCount >= 3)
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  AutoSizeText(
                                                                                                    valueOrDefault<String>(
                                                                                                      'Tile Id: ${desktopTileNavTilesRecordList.first.reference.id}',
                                                                                                      'not set',
                                                                                                    ),
                                                                                                    textAlign: TextAlign.start,
                                                                                                    maxLines: 3,
                                                                                                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                          color: widget.companyDoc?.colors.primaryTextColor,
                                                                                                          fontSize: 12.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              AutoSizeText(
                                                                                                tilesParentsItem.title,
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
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                if (valueOrDefault<bool>(
                                                                                  (loggedIn == true) && valueOrDefault<bool>(currentUserDocument?.isadmin, false) ? true : false,
                                                                                  false,
                                                                                ))
                                                                                  AuthUserStreamWidget(
                                                                                    builder: (context) => InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('MAIN_APP_TILES_COMP_Icon_vaf43386_ON_TAP');
                                                                                        logFirebaseEvent('Icon_update_app_state');
                                                                                        FFAppState().update(() {
                                                                                          FFAppState().drawerStartTab = 1;
                                                                                          FFAppState().drawerCurrentId = tilesParentsItem.reference.id;
                                                                                          FFAppState().selectedParentId = tilesParentsItem.reference.id;
                                                                                          FFAppState().selectedParentRef = tilesParentsItem.reference;
                                                                                        });
                                                                                        logFirebaseEvent('Icon_drawer');
                                                                                        Scaffold.of(context).openEndDrawer();
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.settings_outlined,
                                                                                        color: FlutterFlowTheme.of(context).grayIcon,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (valueOrDefault<bool>(
                                                                                  (loggedIn == true) && valueOrDefault<bool>(currentUserDocument?.isadmin, false) ? true : false,
                                                                                  false,
                                                                                ))
                                                                                  AuthUserStreamWidget(
                                                                                    builder: (context) => InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('MAIN_APP_TILES_COMP_Icon_tcg1h48i_ON_TAP');
                                                                                        logFirebaseEvent('Icon_alert_dialog');
                                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return WebViewAware(
                                                                                                  child: AlertDialog(
                                                                                                    title: const Text('Delete Tile?'),
                                                                                                    content: const Text('If you continue this tile will be deleted forever'),
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
                                                                                          logFirebaseEvent('Icon_backend_call');
                                                                                          await tilesParentsItem.reference.delete();
                                                                                        }
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.delete_outlined,
                                                                                        color: FlutterFlowTheme.of(context).customColor3,
                                                                                        size: 24.0,
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
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                    child:
                                                                        AnimatedContainer(
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              100),
                                                                      curve: Curves
                                                                          .easeInOut,
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: widget
                                                                            .companyDoc
                                                                            ?.colors
                                                                            .primaryColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(17.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Colors.transparent,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final tileTier2 =
                                                                                desktopTileNavTilesRecordList.where((e) => e.parent == tilesParentsItem.reference).toList();
                                                                            return SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(tileTier2.length, (tileTier2Index) {
                                                                                  final tileTier2Item = tileTier2[tileTier2Index];
                                                                                  return Visibility(
                                                                                    visible: tileTier2Item.parent == FFAppState().selectedParentRef,
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          logFirebaseEvent('MAIN_APP_TILES_COMP_tile_ON_TAP');
                                                                                          if (FFAppState().tileNav.tier2Id == tileTier2Item.reference.id) {
                                                                                            logFirebaseEvent('tile_update_app_state');
                                                                                            setState(() {
                                                                                              FFAppState().updateTileNavStruct(
                                                                                                (e) => e
                                                                                                  ..tier2Id = null
                                                                                                  ..tier3Id = null
                                                                                                  ..tier4Id = null,
                                                                                              );
                                                                                              FFAppState().viewTileContentId = tileTier2Item.reference.id;
                                                                                              FFAppState().navPath = FFAppState().navPath.take(2).toList().cast<String>();
                                                                                            });
                                                                                            logFirebaseEvent('tile_update_app_state');
                                                                                            setState(() {
                                                                                              FFAppState().NewTileJustCreated = false;
                                                                                            });
                                                                                          } else {
                                                                                            logFirebaseEvent('tile_update_app_state');
                                                                                            FFAppState().updateTileNavStruct(
                                                                                              (e) => e..tier2Id = tileTier2Item.reference.id,
                                                                                            );
                                                                                            FFAppState().viewTileContentId = tileTier2Item.reference.id;
                                                                                            FFAppState().navPath = FFAppState().navPath.take(1).toList().cast<String>();
                                                                                            logFirebaseEvent('tile_update_app_state');
                                                                                            _model.updatePage(() {
                                                                                              FFAppState().addToNavPath(tileTier2Item.reference.id);
                                                                                            });
                                                                                            logFirebaseEvent('tile_update_app_state');
                                                                                            setState(() {
                                                                                              FFAppState().NewTileJustCreated = false;
                                                                                            });
                                                                                          }

                                                                                          logFirebaseEvent('tile_update_app_state');
                                                                                          FFAppState().selectedTopic = tileTier2Item.title;
                                                                                          FFAppState().selectedReadingItem = tileTier2Item.title;
                                                                                          FFAppState().middleColumnShow = true;
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
                                                                                          logFirebaseEvent('tile_update_app_state');
                                                                                          _model.updatePage(() {
                                                                                            FFAppState().middlePane = 'bodyContentMainTiles';
                                                                                          });
                                                                                          if (!() {
                                                                                            if ((loggedIn == true) &&
                                                                                                valueOrDefault<bool>(
                                                                                                  (currentUserDocument?.hasaccess.toList() ?? []).contains(widget.categorySelected),
                                                                                                  false,
                                                                                                )) {
                                                                                              return true;
                                                                                            } else if ((loggedIn != true) && (widget.categorySelected == 'Community')) {
                                                                                              return true;
                                                                                            } else if (valueOrDefault<bool>(
                                                                                                  loggedIn == true,
                                                                                                  false,
                                                                                                ) &&
                                                                                                (widget.categorySelected == 'Community')) {
                                                                                              return true;
                                                                                            } else {
                                                                                              return false;
                                                                                            }
                                                                                          }()) {
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
                                                                                                    child: const NoaccesspopupWidget(),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => safeSetState(() {}));
                                                                                          }
                                                                                        },
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: const Color(0xB2FAFAFA),
                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                            border: Border.all(
                                                                                              color: valueOrDefault<Color>(
                                                                                                FFAppState().tileNav.tier2Id == tileTier2Item.reference.id ? FlutterFlowTheme.of(context).customColor7 : FlutterFlowTheme.of(context).accent3,
                                                                                                FlutterFlowTheme.of(context).accent3,
                                                                                              ),
                                                                                              width: 1.0,
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
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              tileTier2Item.title,
                                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                    fontFamily: 'Outfit',
                                                                                                                    color: valueOrDefault<Color>(
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
                                                                                                        if (FFAppState().debugCount >= 3)
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                tileTier2Item.reference.id,
                                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                      fontFamily: 'Outfit',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 15.0,
                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
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
                                                                                                      if (valueOrDefault<bool>(
                                                                                                        (loggedIn == true) && valueOrDefault<bool>(currentUserDocument?.isadmin, false) ? true : false,
                                                                                                        false,
                                                                                                      ))
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                          child: AuthUserStreamWidget(
                                                                                                            builder: (context) => InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                logFirebaseEvent('MAIN_APP_TILES_COMP_Icon_mxspdduo_ON_TAP');
                                                                                                                logFirebaseEvent('Icon_update_app_state');
                                                                                                                setState(() {
                                                                                                                  FFAppState().drawerStartTab = 1;
                                                                                                                  FFAppState().drawerCurrentId = tileTier2Item.reference.id;
                                                                                                                });
                                                                                                                logFirebaseEvent('Icon_drawer');
                                                                                                                Scaffold.of(context).openEndDrawer();
                                                                                                              },
                                                                                                              child: Icon(
                                                                                                                Icons.settings_outlined,
                                                                                                                color: FlutterFlowTheme.of(context).grayIcon,
                                                                                                                size: 18.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      if (valueOrDefault<bool>(
                                                                                                        (loggedIn == true) && valueOrDefault<bool>(currentUserDocument?.isadmin, false) ? true : false,
                                                                                                        false,
                                                                                                      ))
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                          child: AuthUserStreamWidget(
                                                                                                            builder: (context) => InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                logFirebaseEvent('MAIN_APP_TILES_COMP_Icon_zdy3wfu9_ON_TAP');
                                                                                                                logFirebaseEvent('Icon_alert_dialog');
                                                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                                                      context: context,
                                                                                                                      builder: (alertDialogContext) {
                                                                                                                        return WebViewAware(
                                                                                                                          child: AlertDialog(
                                                                                                                            title: const Text('Delete Tile?'),
                                                                                                                            content: const Text('If you continue this tile will be deleted forever'),
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
                                                                                                                  logFirebaseEvent('Icon_backend_call');
                                                                                                                  await tileTier2Item.reference.delete();
                                                                                                                }
                                                                                                              },
                                                                                                              child: Icon(
                                                                                                                Icons.delete_outlined,
                                                                                                                color: FlutterFlowTheme.of(context).customColor3,
                                                                                                                size: 18.0,
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
                                                }),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    KeepAliveWidgetWrapper(
                      builder: (context) => Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Opacity(
                            opacity: 0.8,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
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
                                        isEqualTo:
                                            widget.companyDoc?.companyDocId,
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
                                      containerTilesv2RecordList =
                                      snapshot.data!;
                                  return Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      borderRadius: BorderRadius.circular(17.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          25.0, 0.0, 25.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        color: const Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller:
                                              _model.expandableController2,
                                          child: ExpandablePanel(
                                            header: Padding(
                                              padding: const EdgeInsets.all(7.0),
                                              child: Text(
                                                '${FFAppState().selectedCategoryName} Vault',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displaySmallFamily,
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmallFamily),
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
                                                    'In the exclusive members\' vault, you will discover a wealth of premium content and resources tailored specifically for our members. This area is dedicated to providing you with advanced tools and in-depth knowledge to further enrich your experience and support your journey, accessible only to those with membership privileges.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color:
                                                              const Color(0x8A000000),
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
                                            theme: const ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: false,
                                              tapBodyToCollapse: false,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              hasIcon: true,
                                              expandIcon: Icons.info_sharp,
                                              collapseIcon:
                                                  Icons.close_fullscreen,
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
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: StreamBuilder<List<TilesRecord>>(
                              stream: queryTilesRecord(
                                queryBuilder: (tilesRecord) =>
                                    tilesRecord.where(
                                  'companyId',
                                  isEqualTo: widget.companyDoc?.reference.id,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<TilesRecord>
                                    desktopTileNavTilesRecordList =
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
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: Align(
                                    alignment: const AlignmentDirectional(-1.0, -1.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: const BoxDecoration(),
                                      alignment:
                                          const AlignmentDirectional(-1.0, -1.0),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, -1.0),
                                        child: Builder(
                                          builder: (context) {
                                            final tilesParents =
                                                desktopTileNavTilesRecordList
                                                    .where((e) =>
                                                        valueOrDefault<bool>(
                                                          (e.parentId ==
                                                                  'PRIMARY') &&
                                                              (e.memberlevels.contains(
                                                                      FFAppState()
                                                                          .selectedMemberLevelName) ==
                                                                  true),
                                                          false,
                                                        ))
                                                    .toList()
                                                    .sortedList((e) => e.id)
                                                    .toList();
                                            return SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: List.generate(
                                                    tilesParents.length,
                                                    (tilesParentsIndex) {
                                                  final tilesParentsItem =
                                                      tilesParents[
                                                          tilesParentsIndex];
                                                  return Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            7.0,
                                                                            7.0,
                                                                            7.0,
                                                                            7.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
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
                                                                        'MAIN_APP_TILES_COMP_tileTier_ON_TAP');
                                                                    if (FFAppState()
                                                                            .tileNav
                                                                            .tier1Id ==
                                                                        tilesParentsItem
                                                                            .reference
                                                                            .id) {
                                                                      logFirebaseEvent(
                                                                          'tileTier_update_app_state');
                                                                      setState(
                                                                          () {
                                                                        FFAppState()
                                                                            .updateTileNavStruct(
                                                                          (e) => e
                                                                            ..tier2Id =
                                                                                null
                                                                            ..tier3Id =
                                                                                null
                                                                            ..tier4Id = null,
                                                                        );
                                                                        FFAppState().viewTileContentId = tilesParentsItem
                                                                            .reference
                                                                            .id;
                                                                        FFAppState().navPath = FFAppState()
                                                                            .navPath
                                                                            .take(2)
                                                                            .toList()
                                                                            .cast<String>();
                                                                        FFAppState().selectedParentRef =
                                                                            tilesParentsItem.reference;
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'tileTier_update_app_state');
                                                                      setState(
                                                                          () {
                                                                        FFAppState().NewTileJustCreated =
                                                                            false;
                                                                      });
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'tileTier_update_app_state');
                                                                      FFAppState()
                                                                          .updateTileNavStruct(
                                                                        (e) => e
                                                                          ..tier1Id = tilesParentsItem
                                                                              .reference
                                                                              .id
                                                                          ..tier2Id =
                                                                              null
                                                                          ..tier3Id =
                                                                              null
                                                                          ..tier4Id =
                                                                              null,
                                                                      );
                                                                      FFAppState()
                                                                              .viewTileContentId =
                                                                          tilesParentsItem
                                                                              .reference
                                                                              .id;
                                                                      FFAppState().navPath = FFAppState()
                                                                          .navPath
                                                                          .take(
                                                                              1)
                                                                          .toList()
                                                                          .cast<
                                                                              String>();
                                                                      FFAppState()
                                                                              .selectedParentRef =
                                                                          tilesParentsItem
                                                                              .reference;
                                                                      logFirebaseEvent(
                                                                          'tileTier_update_app_state');
                                                                      _model.updatePage(
                                                                          () {
                                                                        FFAppState().addToNavPath(tilesParentsItem
                                                                            .reference
                                                                            .id);
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'tileTier_update_app_state');
                                                                      setState(
                                                                          () {
                                                                        FFAppState().NewTileJustCreated =
                                                                            false;
                                                                      });
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        90.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: widget
                                                                          .companyDoc
                                                                          ?.colors
                                                                          .primaryColor,
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(13.0),
                                                                        bottomRight:
                                                                            Radius.circular(13.0),
                                                                        topLeft:
                                                                            Radius.circular(13.0),
                                                                        topRight:
                                                                            Radius.circular(13.0),
                                                                      ),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          FFAppState().tileNav.tier1Id == tilesParentsItem.reference.id
                                                                              ? FlutterFlowTheme.of(context).customColor7
                                                                              : FlutterFlowTheme.of(context).selectedButton,
                                                                          FlutterFlowTheme.of(context)
                                                                              .selectedButton,
                                                                        ),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          16.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                                                              tilesParentsItem.image,
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
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                AutoSizeText(
                                                                                                  valueOrDefault<String>(
                                                                                                    'Generated: ${dateTimeFormat('relative', desktopTileNavTilesRecordList.first.createdTime)}',
                                                                                                    'not set',
                                                                                                  ),
                                                                                                  textAlign: TextAlign.start,
                                                                                                  maxLines: 3,
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                        color: widget.companyDoc?.colors.primaryTextColor,
                                                                                                        fontSize: 12.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            if (FFAppState().debugCount >= 3)
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  AutoSizeText(
                                                                                                    valueOrDefault<String>(
                                                                                                      'Tile Id: ${desktopTileNavTilesRecordList.first.reference.id}',
                                                                                                      'not set',
                                                                                                    ),
                                                                                                    textAlign: TextAlign.start,
                                                                                                    maxLines: 3,
                                                                                                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                          color: widget.companyDoc?.colors.primaryTextColor,
                                                                                                          fontSize: 12.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              AutoSizeText(
                                                                                                tilesParentsItem.title,
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
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                if (valueOrDefault<bool>(
                                                                                  (loggedIn == true) && valueOrDefault<bool>(currentUserDocument?.isadmin, false) ? true : false,
                                                                                  false,
                                                                                ))
                                                                                  AuthUserStreamWidget(
                                                                                    builder: (context) => InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('MAIN_APP_TILES_COMP_Icon_n2ej6khi_ON_TAP');
                                                                                        logFirebaseEvent('Icon_update_app_state');
                                                                                        FFAppState().update(() {
                                                                                          FFAppState().drawerStartTab = 1;
                                                                                          FFAppState().drawerCurrentId = tilesParentsItem.reference.id;
                                                                                          FFAppState().selectedParentId = tilesParentsItem.reference.id;
                                                                                          FFAppState().selectedParentRef = tilesParentsItem.reference;
                                                                                        });
                                                                                        logFirebaseEvent('Icon_drawer');
                                                                                        Scaffold.of(context).openEndDrawer();
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.settings_outlined,
                                                                                        color: FlutterFlowTheme.of(context).grayIcon,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (valueOrDefault<bool>(
                                                                                  (loggedIn == true) && valueOrDefault<bool>(currentUserDocument?.isadmin, false) ? true : false,
                                                                                  false,
                                                                                ))
                                                                                  AuthUserStreamWidget(
                                                                                    builder: (context) => InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('MAIN_APP_TILES_COMP_Icon_9ufaw89m_ON_TAP');
                                                                                        logFirebaseEvent('Icon_alert_dialog');
                                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return WebViewAware(
                                                                                                  child: AlertDialog(
                                                                                                    title: const Text('Delete Tile?'),
                                                                                                    content: const Text('If you continue this tile will be deleted forever'),
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
                                                                                          logFirebaseEvent('Icon_backend_call');
                                                                                          await tilesParentsItem.reference.delete();
                                                                                        }
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.delete_outlined,
                                                                                        color: FlutterFlowTheme.of(context).customColor3,
                                                                                        size: 24.0,
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
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                    child:
                                                                        AnimatedContainer(
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              100),
                                                                      curve: Curves
                                                                          .easeInOut,
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: widget
                                                                            .companyDoc
                                                                            ?.colors
                                                                            .primaryColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(17.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Colors.transparent,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final tileTier2 =
                                                                                desktopTileNavTilesRecordList.where((e) => e.parent == tilesParentsItem.reference).toList();
                                                                            return SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(tileTier2.length, (tileTier2Index) {
                                                                                  final tileTier2Item = tileTier2[tileTier2Index];
                                                                                  return Visibility(
                                                                                    visible: tileTier2Item.parent == FFAppState().selectedParentRef,
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          logFirebaseEvent('MAIN_APP_TILES_COMP_tile_ON_TAP');
                                                                                          if (FFAppState().tileNav.tier2Id == tileTier2Item.reference.id) {
                                                                                            logFirebaseEvent('tile_update_app_state');
                                                                                            setState(() {
                                                                                              FFAppState().updateTileNavStruct(
                                                                                                (e) => e
                                                                                                  ..tier2Id = null
                                                                                                  ..tier3Id = null
                                                                                                  ..tier4Id = null,
                                                                                              );
                                                                                              FFAppState().viewTileContentId = tileTier2Item.reference.id;
                                                                                              FFAppState().navPath = FFAppState().navPath.take(2).toList().cast<String>();
                                                                                            });
                                                                                            logFirebaseEvent('tile_update_app_state');
                                                                                            setState(() {
                                                                                              FFAppState().NewTileJustCreated = false;
                                                                                            });
                                                                                          } else {
                                                                                            logFirebaseEvent('tile_update_app_state');
                                                                                            FFAppState().updateTileNavStruct(
                                                                                              (e) => e..tier2Id = tileTier2Item.reference.id,
                                                                                            );
                                                                                            FFAppState().viewTileContentId = tileTier2Item.reference.id;
                                                                                            FFAppState().navPath = FFAppState().navPath.take(1).toList().cast<String>();
                                                                                            logFirebaseEvent('tile_update_app_state');
                                                                                            _model.updatePage(() {
                                                                                              FFAppState().addToNavPath(tileTier2Item.reference.id);
                                                                                            });
                                                                                            logFirebaseEvent('tile_update_app_state');
                                                                                            setState(() {
                                                                                              FFAppState().NewTileJustCreated = false;
                                                                                            });
                                                                                          }

                                                                                          logFirebaseEvent('tile_update_app_state');
                                                                                          FFAppState().selectedTopic = tileTier2Item.title;
                                                                                          FFAppState().selectedReadingItem = tileTier2Item.title;
                                                                                          FFAppState().middleColumnShow = true;
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
                                                                                          logFirebaseEvent('tile_update_app_state');
                                                                                          _model.updatePage(() {
                                                                                            FFAppState().middlePane = 'bodyContentMainTiles';
                                                                                          });
                                                                                          if (!() {
                                                                                            if ((loggedIn == true) &&
                                                                                                valueOrDefault<bool>(
                                                                                                  (currentUserDocument?.hasaccess.toList() ?? []).contains(widget.categorySelected),
                                                                                                  false,
                                                                                                )) {
                                                                                              return false;
                                                                                            } else if ((loggedIn != true) && (widget.categorySelected == 'Community') && (widget.categorySelected == 'Group Journeys') && (widget.categorySelected == 'Non-Members')) {
                                                                                              return true;
                                                                                            } else if (valueOrDefault<bool>(
                                                                                                  loggedIn == true,
                                                                                                  false,
                                                                                                ) &&
                                                                                                (widget.categorySelected == 'Community')) {
                                                                                              return true;
                                                                                            } else {
                                                                                              return false;
                                                                                            }
                                                                                          }()) {
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
                                                                                                    child: const NoaccesspopupWidget(),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => safeSetState(() {}));
                                                                                          }
                                                                                        },
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: const Color(0xB2FAFAFA),
                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                            border: Border.all(
                                                                                              color: valueOrDefault<Color>(
                                                                                                FFAppState().tileNav.tier2Id == tileTier2Item.reference.id ? FlutterFlowTheme.of(context).customColor7 : FlutterFlowTheme.of(context).accent3,
                                                                                                FlutterFlowTheme.of(context).accent3,
                                                                                              ),
                                                                                              width: 1.0,
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
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              tileTier2Item.title,
                                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                    fontFamily: 'Outfit',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 15.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        if (FFAppState().debugCount >= 3)
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                tileTier2Item.reference.id,
                                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                      fontFamily: 'Outfit',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 15.0,
                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 8.0, 0.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      logFirebaseEvent('MAIN_APP_TILES_Column_2bl2mk0s_ON_TAP');
                                                                                                      logFirebaseEvent('Column_backend_call');

                                                                                                      var tileBlocksRecordReference = TileBlocksRecord.collection.doc();
                                                                                                      await tileBlocksRecordReference.set(createTileBlocksRecordData(
                                                                                                        createdTime: getCurrentTimestamp,
                                                                                                        updatedTime: getCurrentTimestamp,
                                                                                                        tileId: FFAppState().viewTileContentId,
                                                                                                        blockIndex: 0,
                                                                                                      ));
                                                                                                      _model.createdBlock1Copy = TileBlocksRecord.getDocumentFromData(
                                                                                                          createTileBlocksRecordData(
                                                                                                            createdTime: getCurrentTimestamp,
                                                                                                            updatedTime: getCurrentTimestamp,
                                                                                                            tileId: FFAppState().viewTileContentId,
                                                                                                            blockIndex: 0,
                                                                                                          ),
                                                                                                          tileBlocksRecordReference);
                                                                                                      logFirebaseEvent('Column_backend_call');

                                                                                                      await _model.createdBlock1Copy!.reference.update(createTileBlocksRecordData());
                                                                                                      logFirebaseEvent('Column_update_app_state');
                                                                                                      setState(() {
                                                                                                        FFAppState().middleColumnShow = true;
                                                                                                        FFAppState().leftColumnShow = false;
                                                                                                        FFAppState().middlePane = 'appMenu';
                                                                                                      });
                                                                                                      logFirebaseEvent('Column_alert_dialog');
                                                                                                      await showDialog(
                                                                                                        context: context,
                                                                                                        builder: (alertDialogContext) {
                                                                                                          return WebViewAware(
                                                                                                            child: AlertDialog(
                                                                                                              title: const Text('Created Block'),
                                                                                                              content: Text(_model.createdBlock1Copy!.reference.id),
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

                                                                                                      setState(() {});
                                                                                                    },
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        if (valueOrDefault<bool>(
                                                                                                          (loggedIn == true) && valueOrDefault<bool>(currentUserDocument?.isadmin, false) ? true : false,
                                                                                                          false,
                                                                                                        ))
                                                                                                          AuthUserStreamWidget(
                                                                                                            builder: (context) => InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                logFirebaseEvent('MAIN_APP_TILES_COMP_Icon_unlo4xmy_ON_TAP');
                                                                                                                logFirebaseEvent('Icon_backend_call');

                                                                                                                var tileBlocksRecordReference = TileBlocksRecord.collection.doc();
                                                                                                                await tileBlocksRecordReference.set(createTileBlocksRecordData(
                                                                                                                  createdTime: getCurrentTimestamp,
                                                                                                                  updatedTime: getCurrentTimestamp,
                                                                                                                  tileId: FFAppState().viewTileContentId,
                                                                                                                  blockIndex: 0,
                                                                                                                ));
                                                                                                                _model.createdBlock1 = TileBlocksRecord.getDocumentFromData(
                                                                                                                    createTileBlocksRecordData(
                                                                                                                      createdTime: getCurrentTimestamp,
                                                                                                                      updatedTime: getCurrentTimestamp,
                                                                                                                      tileId: FFAppState().viewTileContentId,
                                                                                                                      blockIndex: 0,
                                                                                                                    ),
                                                                                                                    tileBlocksRecordReference);
                                                                                                                logFirebaseEvent('Icon_backend_call');

                                                                                                                await _model.createdBlock1!.reference.update(createTileBlocksRecordData());
                                                                                                                logFirebaseEvent('Icon_update_app_state');
                                                                                                                setState(() {
                                                                                                                  FFAppState().middleColumnShow = true;
                                                                                                                  FFAppState().leftColumnShow = false;
                                                                                                                  FFAppState().middlePane = 'appMenu';
                                                                                                                });
                                                                                                                logFirebaseEvent('Icon_alert_dialog');
                                                                                                                await showDialog(
                                                                                                                  context: context,
                                                                                                                  builder: (alertDialogContext) {
                                                                                                                    return WebViewAware(
                                                                                                                      child: AlertDialog(
                                                                                                                        title: const Text('Created Block'),
                                                                                                                        content: Text(valueOrDefault<String>(
                                                                                                                          _model.createdBlock1?.reference.id,
                                                                                                                          '0',
                                                                                                                        )),
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

                                                                                                                setState(() {});
                                                                                                              },
                                                                                                              child: Icon(
                                                                                                                Icons.add,
                                                                                                                color: FlutterFlowTheme.of(context).grayIcon,
                                                                                                                size: 24.0,
                                                                                                              ),
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
                                                                                                      if (valueOrDefault<bool>(
                                                                                                        (loggedIn == true) && valueOrDefault<bool>(currentUserDocument?.isadmin, false) ? true : false,
                                                                                                        false,
                                                                                                      ))
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                          child: AuthUserStreamWidget(
                                                                                                            builder: (context) => InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                logFirebaseEvent('MAIN_APP_TILES_COMP_Icon_mftd0gsz_ON_TAP');
                                                                                                                logFirebaseEvent('Icon_update_app_state');
                                                                                                                setState(() {
                                                                                                                  FFAppState().drawerStartTab = 1;
                                                                                                                  FFAppState().drawerCurrentId = tileTier2Item.reference.id;
                                                                                                                });
                                                                                                                logFirebaseEvent('Icon_drawer');
                                                                                                                Scaffold.of(context).openEndDrawer();
                                                                                                              },
                                                                                                              child: Icon(
                                                                                                                Icons.settings_outlined,
                                                                                                                color: FlutterFlowTheme.of(context).grayIcon,
                                                                                                                size: 18.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      if (valueOrDefault<bool>(
                                                                                                        (loggedIn == true) && valueOrDefault<bool>(currentUserDocument?.isadmin, false) ? true : false,
                                                                                                        false,
                                                                                                      ))
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                          child: AuthUserStreamWidget(
                                                                                                            builder: (context) => InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                logFirebaseEvent('MAIN_APP_TILES_COMP_Icon_t16h1mt5_ON_TAP');
                                                                                                                logFirebaseEvent('Icon_alert_dialog');
                                                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                                                      context: context,
                                                                                                                      builder: (alertDialogContext) {
                                                                                                                        return WebViewAware(
                                                                                                                          child: AlertDialog(
                                                                                                                            title: const Text('Delete Tile?'),
                                                                                                                            content: const Text('If you continue this tile will be deleted forever'),
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
                                                                                                                  logFirebaseEvent('Icon_backend_call');
                                                                                                                  await tileTier2Item.reference.delete();
                                                                                                                }
                                                                                                              },
                                                                                                              child: Icon(
                                                                                                                Icons.delete_outlined,
                                                                                                                color: FlutterFlowTheme.of(context).customColor3,
                                                                                                                size: 18.0,
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
                                                }),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    KeepAliveWidgetWrapper(
                      builder: (context) => Align(
                        alignment: const AlignmentDirectional(-1.0, -1.0),
                        child: StreamBuilder<List<TilesRecord>>(
                          stream: queryTilesRecord(
                            queryBuilder: (tilesRecord) => tilesRecord.where(
                              'companyId',
                              isEqualTo: widget.companyDoc?.reference.id,
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
                            List<TilesRecord> desktopTileNavTilesRecordList =
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
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: const BoxDecoration(),
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: Align(
                                    alignment: const AlignmentDirectional(-1.0, -1.0),
                                    child: Builder(
                                      builder: (context) {
                                        final tilesParents =
                                            desktopTileNavTilesRecordList
                                                .where(
                                                    (e) => valueOrDefault<bool>(
                                                          (e.parentId ==
                                                                  'PRIMARY') &&
                                                              (e.memberlevels.contains(
                                                                      FFAppState()
                                                                          .selectedMemberLevelName) ==
                                                                  true),
                                                          false,
                                                        ))
                                                .toList()
                                                .sortedList((e) => e.id)
                                                .toList();
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                tilesParents.length,
                                                (tilesParentsIndex) {
                                              final tilesParentsItem =
                                                  tilesParents[
                                                      tilesParentsIndex];
                                              return Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Container(
                                                  decoration: const BoxDecoration(),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child:
                                                        SingleChildScrollView(
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
                                                                        7.0,
                                                                        7.0,
                                                                        7.0,
                                                                        7.0),
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
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'MAIN_APP_TILES_COMP_tileTier_ON_TAP');
                                                                if (FFAppState()
                                                                        .tileNav
                                                                        .tier1Id ==
                                                                    tilesParentsItem
                                                                        .reference
                                                                        .id) {
                                                                  logFirebaseEvent(
                                                                      'tileTier_update_app_state');
                                                                  setState(() {
                                                                    FFAppState()
                                                                        .updateTileNavStruct(
                                                                      (e) => e
                                                                        ..tier2Id =
                                                                            null
                                                                        ..tier3Id =
                                                                            null
                                                                        ..tier4Id =
                                                                            null,
                                                                    );
                                                                    FFAppState()
                                                                            .viewTileContentId =
                                                                        tilesParentsItem
                                                                            .reference
                                                                            .id;
                                                                    FFAppState().navPath = FFAppState()
                                                                        .navPath
                                                                        .take(2)
                                                                        .toList()
                                                                        .cast<
                                                                            String>();
                                                                    FFAppState()
                                                                            .selectedParentRef =
                                                                        tilesParentsItem
                                                                            .reference;
                                                                  });
                                                                  logFirebaseEvent(
                                                                      'tileTier_update_app_state');
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .NewTileJustCreated =
                                                                        false;
                                                                  });
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'tileTier_update_app_state');
                                                                  FFAppState()
                                                                      .updateTileNavStruct(
                                                                    (e) => e
                                                                      ..tier1Id =
                                                                          tilesParentsItem
                                                                              .reference
                                                                              .id
                                                                      ..tier2Id =
                                                                          null
                                                                      ..tier3Id =
                                                                          null
                                                                      ..tier4Id =
                                                                          null,
                                                                  );
                                                                  FFAppState()
                                                                          .viewTileContentId =
                                                                      tilesParentsItem
                                                                          .reference
                                                                          .id;
                                                                  FFAppState()
                                                                          .navPath =
                                                                      FFAppState()
                                                                          .navPath
                                                                          .take(
                                                                              1)
                                                                          .toList()
                                                                          .cast<
                                                                              String>();
                                                                  FFAppState()
                                                                          .selectedParentRef =
                                                                      tilesParentsItem
                                                                          .reference;
                                                                  logFirebaseEvent(
                                                                      'tileTier_update_app_state');
                                                                  _model
                                                                      .updatePage(
                                                                          () {
                                                                    FFAppState().addToNavPath(
                                                                        tilesParentsItem
                                                                            .reference
                                                                            .id);
                                                                  });
                                                                  logFirebaseEvent(
                                                                      'tileTier_update_app_state');
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .NewTileJustCreated =
                                                                        false;
                                                                  });
                                                                }
                                                              },
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 90.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: widget
                                                                      .companyDoc
                                                                      ?.colors
                                                                      .primaryColor,
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            13.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            13.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            13.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            13.0),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      FFAppState().tileNav.tier1Id ==
                                                                              tilesParentsItem
                                                                                  .reference.id
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .customColor7
                                                                          : FlutterFlowTheme.of(context)
                                                                              .selectedButton,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .selectedButton,
                                                                    ),
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
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
                                                                                          tilesParentsItem.image,
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
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                'Generated: ${dateTimeFormat('relative', desktopTileNavTilesRecordList.first.createdTime)}',
                                                                                                'not set',
                                                                                              ),
                                                                                              textAlign: TextAlign.start,
                                                                                              maxLines: 3,
                                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                    color: widget.companyDoc?.colors.primaryTextColor,
                                                                                                    fontSize: 12.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        if (FFAppState().debugCount >= 3)
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              AutoSizeText(
                                                                                                valueOrDefault<String>(
                                                                                                  'Tile Id: ${desktopTileNavTilesRecordList.first.reference.id}',
                                                                                                  'not set',
                                                                                                ),
                                                                                                textAlign: TextAlign.start,
                                                                                                maxLines: 3,
                                                                                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                      color: widget.companyDoc?.colors.primaryTextColor,
                                                                                                      fontSize: 12.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          AutoSizeText(
                                                                                            tilesParentsItem.title,
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
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            if (valueOrDefault<bool>(
                                                                              (loggedIn == true) && valueOrDefault<bool>(currentUserDocument?.isadmin, false) ? true : false,
                                                                              false,
                                                                            ))
                                                                              AuthUserStreamWidget(
                                                                                builder: (context) => InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('MAIN_APP_TILES_COMP_Icon_eut2nm9j_ON_TAP');
                                                                                    logFirebaseEvent('Icon_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().drawerStartTab = 1;
                                                                                      FFAppState().drawerCurrentId = tilesParentsItem.reference.id;
                                                                                      FFAppState().selectedParentId = tilesParentsItem.reference.id;
                                                                                      FFAppState().selectedParentRef = tilesParentsItem.reference;
                                                                                    });
                                                                                    logFirebaseEvent('Icon_drawer');
                                                                                    Scaffold.of(context).openEndDrawer();
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.settings_outlined,
                                                                                    color: FlutterFlowTheme.of(context).grayIcon,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (valueOrDefault<bool>(
                                                                              (loggedIn == true) && valueOrDefault<bool>(currentUserDocument?.isadmin, false) ? true : false,
                                                                              false,
                                                                            ))
                                                                              AuthUserStreamWidget(
                                                                                builder: (context) => InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('MAIN_APP_TILES_COMP_Icon_ebwffe8h_ON_TAP');
                                                                                    logFirebaseEvent('Icon_alert_dialog');
                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return WebViewAware(
                                                                                              child: AlertDialog(
                                                                                                title: const Text('Delete Tile?'),
                                                                                                content: const Text('If you continue this tile will be deleted forever'),
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
                                                                                      logFirebaseEvent('Icon_backend_call');
                                                                                      await tilesParentsItem.reference.delete();
                                                                                    }
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.delete_outlined,
                                                                                    color: FlutterFlowTheme.of(context).customColor3,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            if (valueOrDefault<bool>(
                                                                              (loggedIn == true) && valueOrDefault<bool>(currentUserDocument?.isadmin, false) ? true : false,
                                                                              false,
                                                                            ))
                                                                              AuthUserStreamWidget(
                                                                                builder: (context) => InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('MAIN_APP_TILES_COMP_Icon_d2rud8ls_ON_TAP');
                                                                                    logFirebaseEvent('Icon_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().drawerStartTab = 1;
                                                                                      FFAppState().drawerCurrentId = tilesParentsItem.reference.id;
                                                                                      FFAppState().selectedParentId = tilesParentsItem.reference.id;
                                                                                      FFAppState().selectedParentRef = tilesParentsItem.reference;
                                                                                    });
                                                                                    logFirebaseEvent('Icon_drawer');
                                                                                    Scaffold.of(context).openEndDrawer();
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.settings_outlined,
                                                                                    color: FlutterFlowTheme.of(context).grayIcon,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (valueOrDefault<bool>(
                                                                              (loggedIn == true) && valueOrDefault<bool>(currentUserDocument?.isadmin, false) ? true : false,
                                                                              false,
                                                                            ))
                                                                              AuthUserStreamWidget(
                                                                                builder: (context) => InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('MAIN_APP_TILES_COMP_Icon_xztnjz3e_ON_TAP');
                                                                                    logFirebaseEvent('Icon_alert_dialog');
                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return WebViewAware(
                                                                                              child: AlertDialog(
                                                                                                title: const Text('Delete Tile?'),
                                                                                                content: const Text('If you continue this tile will be deleted forever'),
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
                                                                                      logFirebaseEvent('Icon_backend_call');
                                                                                      await tilesParentsItem.reference.delete();
                                                                                    }
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.delete_outlined,
                                                                                    color: FlutterFlowTheme.of(context).customColor3,
                                                                                    size: 24.0,
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
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                child:
                                                                    AnimatedContainer(
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          100),
                                                                  curve: Curves
                                                                      .easeInOut,
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: widget
                                                                        .companyDoc
                                                                        ?.colors
                                                                        .primaryColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            17.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .transparent,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final tileTier2 = desktopTileNavTilesRecordList
                                                                            .where((e) =>
                                                                                e.parent ==
                                                                                tilesParentsItem.reference)
                                                                            .toList();
                                                                        return SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                List.generate(tileTier2.length, (tileTier2Index) {
                                                                              final tileTier2Item = tileTier2[tileTier2Index];
                                                                              return Visibility(
                                                                                visible: tileTier2Item.parent == FFAppState().selectedParentRef,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('MAIN_APP_TILES_COMP_tile_ON_TAP');
                                                                                      if (FFAppState().tileNav.tier2Id == tileTier2Item.reference.id) {
                                                                                        logFirebaseEvent('tile_update_app_state');
                                                                                        setState(() {
                                                                                          FFAppState().updateTileNavStruct(
                                                                                            (e) => e
                                                                                              ..tier2Id = null
                                                                                              ..tier3Id = null
                                                                                              ..tier4Id = null,
                                                                                          );
                                                                                          FFAppState().viewTileContentId = tileTier2Item.reference.id;
                                                                                          FFAppState().navPath = FFAppState().navPath.take(2).toList().cast<String>();
                                                                                        });
                                                                                        logFirebaseEvent('tile_update_app_state');
                                                                                        setState(() {
                                                                                          FFAppState().NewTileJustCreated = false;
                                                                                        });
                                                                                      } else {
                                                                                        logFirebaseEvent('tile_update_app_state');
                                                                                        FFAppState().updateTileNavStruct(
                                                                                          (e) => e..tier2Id = tileTier2Item.reference.id,
                                                                                        );
                                                                                        FFAppState().viewTileContentId = tileTier2Item.reference.id;
                                                                                        FFAppState().navPath = FFAppState().navPath.take(1).toList().cast<String>();
                                                                                        logFirebaseEvent('tile_update_app_state');
                                                                                        _model.updatePage(() {
                                                                                          FFAppState().addToNavPath(tileTier2Item.reference.id);
                                                                                        });
                                                                                        logFirebaseEvent('tile_update_app_state');
                                                                                        setState(() {
                                                                                          FFAppState().NewTileJustCreated = false;
                                                                                        });
                                                                                      }

                                                                                      logFirebaseEvent('tile_update_app_state');
                                                                                      FFAppState().selectedTopic = tileTier2Item.title;
                                                                                      FFAppState().selectedReadingItem = tileTier2Item.title;
                                                                                      FFAppState().middleColumnShow = true;
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
                                                                                      logFirebaseEvent('tile_update_app_state');
                                                                                      _model.updatePage(() {
                                                                                        FFAppState().middlePane = 'bodyContentMainTiles';
                                                                                      });
                                                                                      if (!() {
                                                                                        if ((loggedIn == true) &&
                                                                                            valueOrDefault<bool>(
                                                                                              (currentUserDocument?.hasaccess.toList() ?? []).contains(widget.categorySelected),
                                                                                              false,
                                                                                            )) {
                                                                                          return true;
                                                                                        } else if ((loggedIn != true) && (widget.categorySelected == 'Community')) {
                                                                                          return true;
                                                                                        } else if (valueOrDefault<bool>(
                                                                                              loggedIn == true,
                                                                                              false,
                                                                                            ) &&
                                                                                            (widget.categorySelected == 'Community')) {
                                                                                          return true;
                                                                                        } else {
                                                                                          return false;
                                                                                        }
                                                                                      }()) {
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
                                                                                                child: const NoaccesspopupWidget(),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => safeSetState(() {}));
                                                                                      }
                                                                                    },
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: const Color(0xB2FAFAFA),
                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                        border: Border.all(
                                                                                          color: valueOrDefault<Color>(
                                                                                            FFAppState().tileNav.tier2Id == tileTier2Item.reference.id ? FlutterFlowTheme.of(context).customColor7 : FlutterFlowTheme.of(context).accent3,
                                                                                            FlutterFlowTheme.of(context).accent3,
                                                                                          ),
                                                                                          width: 1.0,
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
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          tileTier2Item.title,
                                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                fontFamily: 'Outfit',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 15.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    if (FFAppState().debugCount >= 3)
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            tileTier2Item.reference.id,
                                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                  fontFamily: 'Outfit',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 15.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
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
                                                                                                  if (valueOrDefault<bool>(
                                                                                                    (loggedIn == true) && valueOrDefault<bool>(currentUserDocument?.isadmin, false) ? true : false,
                                                                                                    false,
                                                                                                  ))
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                      child: AuthUserStreamWidget(
                                                                                                        builder: (context) => InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            logFirebaseEvent('MAIN_APP_TILES_COMP_Icon_bbcmdby3_ON_TAP');
                                                                                                            logFirebaseEvent('Icon_update_app_state');
                                                                                                            setState(() {
                                                                                                              FFAppState().drawerStartTab = 1;
                                                                                                              FFAppState().drawerCurrentId = tileTier2Item.reference.id;
                                                                                                            });
                                                                                                            logFirebaseEvent('Icon_drawer');
                                                                                                            Scaffold.of(context).openEndDrawer();
                                                                                                          },
                                                                                                          child: Icon(
                                                                                                            Icons.settings_outlined,
                                                                                                            color: FlutterFlowTheme.of(context).grayIcon,
                                                                                                            size: 18.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  if (valueOrDefault<bool>(
                                                                                                    (loggedIn == true) && valueOrDefault<bool>(currentUserDocument?.isadmin, false) ? true : false,
                                                                                                    false,
                                                                                                  ))
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                      child: AuthUserStreamWidget(
                                                                                                        builder: (context) => InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            logFirebaseEvent('MAIN_APP_TILES_COMP_Icon_3khw9icp_ON_TAP');
                                                                                                            logFirebaseEvent('Icon_alert_dialog');
                                                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                                                  context: context,
                                                                                                                  builder: (alertDialogContext) {
                                                                                                                    return WebViewAware(
                                                                                                                      child: AlertDialog(
                                                                                                                        title: const Text('Delete Tile?'),
                                                                                                                        content: const Text('If you continue this tile will be deleted forever'),
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
                                                                                                              logFirebaseEvent('Icon_backend_call');
                                                                                                              await tileTier2Item.reference.delete();
                                                                                                            }
                                                                                                          },
                                                                                                          child: Icon(
                                                                                                            Icons.delete_outlined,
                                                                                                            color: FlutterFlowTheme.of(context).customColor3,
                                                                                                            size: 18.0,
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
                                            }),
                                          ),
                                        );
                                      },
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
            ],
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-1.0, -1.0),
          child: StreamBuilder<List<TilesRecord>>(
            stream: queryTilesRecord(
              queryBuilder: (tilesRecord) => tilesRecord.where(
                'companyId',
                isEqualTo: widget.companyDoc?.reference.id,
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
              List<TilesRecord> desktopTileNavTilesRecordList = snapshot.data!;
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
                alignment: const AlignmentDirectional(-1.0, -1.0),
                child: Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(),
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Align(
                      alignment: const AlignmentDirectional(-1.0, -1.0),
                      child: Builder(
                        builder: (context) {
                          final tilesParents = desktopTileNavTilesRecordList
                              .where((e) => valueOrDefault<bool>(
                                    (e.parentId == 'PRIMARY') &&
                                        (e.memberlevels.contains(FFAppState()
                                                .selectedMemberLevelName) ==
                                            true),
                                    false,
                                  ))
                              .toList()
                              .sortedList((e) => e.id)
                              .toList();
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(tilesParents.length,
                                  (tilesParentsIndex) {
                                final tilesParentsItem =
                                    tilesParents[tilesParentsIndex];
                                return Align(
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    alignment: const AlignmentDirectional(-1.0, -1.0),
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, -1.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(7.0, 7.0, 7.0, 7.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'MAIN_APP_TILES_COMP_tileTier_ON_TAP');
                                                  if (FFAppState()
                                                          .tileNav
                                                          .tier1Id ==
                                                      tilesParentsItem
                                                          .reference.id) {
                                                    logFirebaseEvent(
                                                        'tileTier_update_app_state');
                                                    setState(() {
                                                      FFAppState()
                                                          .updateTileNavStruct(
                                                        (e) => e
                                                          ..tier2Id = null
                                                          ..tier3Id = null
                                                          ..tier4Id = null,
                                                      );
                                                      FFAppState()
                                                              .viewTileContentId =
                                                          tilesParentsItem
                                                              .reference.id;
                                                      FFAppState().navPath =
                                                          FFAppState()
                                                              .navPath
                                                              .take(2)
                                                              .toList()
                                                              .cast<String>();
                                                      FFAppState()
                                                              .selectedParentRef =
                                                          tilesParentsItem
                                                              .reference;
                                                    });
                                                    logFirebaseEvent(
                                                        'tileTier_update_app_state');
                                                    setState(() {
                                                      FFAppState()
                                                              .NewTileJustCreated =
                                                          false;
                                                    });
                                                  } else {
                                                    logFirebaseEvent(
                                                        'tileTier_update_app_state');
                                                    FFAppState()
                                                        .updateTileNavStruct(
                                                      (e) => e
                                                        ..tier1Id =
                                                            tilesParentsItem
                                                                .reference.id
                                                        ..tier2Id = null
                                                        ..tier3Id = null
                                                        ..tier4Id = null,
                                                    );
                                                    FFAppState()
                                                            .viewTileContentId =
                                                        tilesParentsItem
                                                            .reference.id;
                                                    FFAppState().navPath =
                                                        FFAppState()
                                                            .navPath
                                                            .take(1)
                                                            .toList()
                                                            .cast<String>();
                                                    FFAppState()
                                                            .selectedParentRef =
                                                        tilesParentsItem
                                                            .reference;
                                                    logFirebaseEvent(
                                                        'tileTier_update_app_state');
                                                    _model.updatePage(() {
                                                      FFAppState().addToNavPath(
                                                          tilesParentsItem
                                                              .reference.id);
                                                    });
                                                    logFirebaseEvent(
                                                        'tileTier_update_app_state');
                                                    setState(() {
                                                      FFAppState()
                                                              .NewTileJustCreated =
                                                          false;
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 90.0,
                                                  decoration: BoxDecoration(
                                                    color: widget.companyDoc
                                                        ?.colors.primaryColor,
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(13.0),
                                                      bottomRight:
                                                          Radius.circular(13.0),
                                                      topLeft:
                                                          Radius.circular(13.0),
                                                      topRight:
                                                          Radius.circular(13.0),
                                                    ),
                                                    border: Border.all(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        FFAppState()
                                                                    .tileNav
                                                                    .tier1Id ==
                                                                tilesParentsItem
                                                                    .reference
                                                                    .id
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor7
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .selectedButton,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .selectedButton,
                                                      ),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 16.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Flexible(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
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
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Visibility(
                                                                        visible:
                                                                            responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                          tablet:
                                                                              false,
                                                                          tabletLandscape:
                                                                              false,
                                                                          desktop:
                                                                              false,
                                                                        ),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            tilesParentsItem.image,
                                                                            width:
                                                                                70.0,
                                                                            height:
                                                                                70.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
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
                                                                          8.0,
                                                                          5.0,
                                                                          8.0,
                                                                          5.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              AutoSizeText(
                                                                                valueOrDefault<String>(
                                                                                  'Generated: ${dateTimeFormat('relative', desktopTileNavTilesRecordList.first.createdTime)}',
                                                                                  'not set',
                                                                                ),
                                                                                textAlign: TextAlign.start,
                                                                                maxLines: 3,
                                                                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                      color: widget.companyDoc?.colors.primaryTextColor,
                                                                                      fontSize: 12.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          if (FFAppState().debugCount >=
                                                                              3)
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                AutoSizeText(
                                                                                  valueOrDefault<String>(
                                                                                    'Tile Id: ${desktopTileNavTilesRecordList.first.reference.id}',
                                                                                    'not set',
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  maxLines: 3,
                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                        color: widget.companyDoc?.colors.primaryTextColor,
                                                                                        fontSize: 12.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            AutoSizeText(
                                                                              tilesParentsItem.title,
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
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              if (valueOrDefault<
                                                                  bool>(
                                                                (loggedIn ==
                                                                            true) &&
                                                                        valueOrDefault<bool>(
                                                                            currentUserDocument?.isadmin,
                                                                            false)
                                                                    ? true
                                                                    : false,
                                                                false,
                                                              ))
                                                                AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'MAIN_APP_TILES_COMP_Icon_uwhuwl5s_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Icon_update_app_state');
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState()
                                                                            .drawerStartTab = 1;
                                                                        FFAppState().drawerCurrentId = tilesParentsItem
                                                                            .reference
                                                                            .id;
                                                                        FFAppState().selectedParentId = tilesParentsItem
                                                                            .reference
                                                                            .id;
                                                                        FFAppState().selectedParentRef =
                                                                            tilesParentsItem.reference;
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'Icon_drawer');
                                                                      Scaffold.of(
                                                                              context)
                                                                          .openEndDrawer();
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .settings_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .grayIcon,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (valueOrDefault<
                                                                  bool>(
                                                                (loggedIn ==
                                                                            true) &&
                                                                        valueOrDefault<bool>(
                                                                            currentUserDocument?.isadmin,
                                                                            false)
                                                                    ? true
                                                                    : false,
                                                                false,
                                                              ))
                                                                AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'MAIN_APP_TILES_COMP_Icon_mfmnvkrg_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Icon_alert_dialog');
                                                                      var confirmDialogResponse = await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return WebViewAware(
                                                                                child: AlertDialog(
                                                                                  title: const Text('Delete Tile?'),
                                                                                  content: const Text('If you continue this tile will be deleted forever'),
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
                                                                        await tilesParentsItem
                                                                            .reference
                                                                            .delete();
                                                                      }
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .delete_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor3,
                                                                      size:
                                                                          24.0,
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
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 4.0, 0.0),
                                                  child: AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    curve: Curves.easeInOut,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: widget
                                                          .companyDoc
                                                          ?.colors
                                                          .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              17.0),
                                                      border: Border.all(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final tileTier2 =
                                                              desktopTileNavTilesRecordList
                                                                  .where((e) =>
                                                                      e.parent ==
                                                                      tilesParentsItem
                                                                          .reference)
                                                                  .toList();
                                                          return SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  tileTier2
                                                                      .length,
                                                                  (tileTier2Index) {
                                                                final tileTier2Item =
                                                                    tileTier2[
                                                                        tileTier2Index];
                                                                return Visibility(
                                                                  visible: tileTier2Item
                                                                          .parent ==
                                                                      FFAppState()
                                                                          .selectedParentRef,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            12.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'MAIN_APP_TILES_COMP_tile_ON_TAP');
                                                                        if (FFAppState().tileNav.tier2Id ==
                                                                            tileTier2Item.reference.id) {
                                                                          logFirebaseEvent(
                                                                              'tile_update_app_state');
                                                                          setState(
                                                                              () {
                                                                            FFAppState().updateTileNavStruct(
                                                                              (e) => e
                                                                                ..tier2Id = null
                                                                                ..tier3Id = null
                                                                                ..tier4Id = null,
                                                                            );
                                                                            FFAppState().viewTileContentId =
                                                                                tileTier2Item.reference.id;
                                                                            FFAppState().navPath =
                                                                                FFAppState().navPath.take(2).toList().cast<String>();
                                                                          });
                                                                          logFirebaseEvent(
                                                                              'tile_update_app_state');
                                                                          setState(
                                                                              () {
                                                                            FFAppState().NewTileJustCreated =
                                                                                false;
                                                                          });
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'tile_update_app_state');
                                                                          FFAppState()
                                                                              .updateTileNavStruct(
                                                                            (e) => e
                                                                              ..tier2Id = tileTier2Item.reference.id,
                                                                          );
                                                                          FFAppState().viewTileContentId = tileTier2Item
                                                                              .reference
                                                                              .id;
                                                                          FFAppState().navPath = FFAppState()
                                                                              .navPath
                                                                              .take(1)
                                                                              .toList()
                                                                              .cast<String>();
                                                                          logFirebaseEvent(
                                                                              'tile_update_app_state');
                                                                          _model
                                                                              .updatePage(() {
                                                                            FFAppState().addToNavPath(tileTier2Item.reference.id);
                                                                          });
                                                                          logFirebaseEvent(
                                                                              'tile_update_app_state');
                                                                          setState(
                                                                              () {
                                                                            FFAppState().NewTileJustCreated =
                                                                                false;
                                                                          });
                                                                        }

                                                                        logFirebaseEvent(
                                                                            'tile_update_app_state');
                                                                        FFAppState().selectedTopic =
                                                                            tileTier2Item.title;
                                                                        FFAppState().selectedReadingItem =
                                                                            tileTier2Item.title;
                                                                        FFAppState().middleColumnShow =
                                                                            true;
                                                                        FFAppState().rightColumnShow =
                                                                            () {
                                                                          if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall) {
                                                                            return false;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointMedium) {
                                                                            return true;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointLarge) {
                                                                            return true;
                                                                          } else {
                                                                            return true;
                                                                          }
                                                                        }();
                                                                        FFAppState().rightPane =
                                                                            'learnCards';
                                                                        FFAppState().leftColumnShow =
                                                                            () {
                                                                          if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall) {
                                                                            return false;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointMedium) {
                                                                            return true;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointLarge) {
                                                                            return true;
                                                                          } else {
                                                                            return true;
                                                                          }
                                                                        }();
                                                                        logFirebaseEvent(
                                                                            'tile_update_app_state');
                                                                        _model.updatePage(
                                                                            () {
                                                                          FFAppState().middlePane =
                                                                              'bodyContentMainTiles';
                                                                        });
                                                                        if (!() {
                                                                          if ((loggedIn == true) &&
                                                                              valueOrDefault<bool>(
                                                                                (currentUserDocument?.hasaccess.toList() ?? []).contains(widget.categorySelected),
                                                                                false,
                                                                              )) {
                                                                            return true;
                                                                          } else if ((loggedIn != true) && (widget.categorySelected == 'Community')) {
                                                                            return true;
                                                                          } else if (valueOrDefault<bool>(
                                                                                loggedIn == true,
                                                                                false,
                                                                              ) &&
                                                                              (widget.categorySelected == 'Community')) {
                                                                            return true;
                                                                          } else {
                                                                            return false;
                                                                          }
                                                                        }()) {
                                                                          logFirebaseEvent(
                                                                              'tile_bottom_sheet');
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
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: const NoaccesspopupWidget(),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        }
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              const Color(0xB2FAFAFA),
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              FFAppState().tileNav.tier2Id == tileTier2Item.reference.id ? FlutterFlowTheme.of(context).customColor7 : FlutterFlowTheme.of(context).accent3,
                                                                              FlutterFlowTheme.of(context).accent3,
                                                                            ),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
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
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            tileTier2Item.title,
                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontSize: 15.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      if (FFAppState().debugCount >= 3)
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              tileTier2Item.reference.id,
                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: 'Outfit',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 15.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                  ),
                                                                                            ),
                                                                                          ],
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
                                                                                    if (valueOrDefault<bool>(
                                                                                      (loggedIn == true) && valueOrDefault<bool>(currentUserDocument?.isadmin, false) ? true : false,
                                                                                      false,
                                                                                    ))
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                        child: AuthUserStreamWidget(
                                                                                          builder: (context) => InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('MAIN_APP_TILES_COMP_Icon_m22i2ew3_ON_TAP');
                                                                                              logFirebaseEvent('Icon_update_app_state');
                                                                                              setState(() {
                                                                                                FFAppState().drawerStartTab = 1;
                                                                                                FFAppState().drawerCurrentId = tileTier2Item.reference.id;
                                                                                              });
                                                                                              logFirebaseEvent('Icon_drawer');
                                                                                              Scaffold.of(context).openEndDrawer();
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.settings_outlined,
                                                                                              color: FlutterFlowTheme.of(context).grayIcon,
                                                                                              size: 18.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    if (valueOrDefault<bool>(
                                                                                      (loggedIn == true) && valueOrDefault<bool>(currentUserDocument?.isadmin, false) ? true : false,
                                                                                      false,
                                                                                    ))
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                        child: AuthUserStreamWidget(
                                                                                          builder: (context) => InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('MAIN_APP_TILES_COMP_Icon_1ujw18by_ON_TAP');
                                                                                              logFirebaseEvent('Icon_alert_dialog');
                                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                                    context: context,
                                                                                                    builder: (alertDialogContext) {
                                                                                                      return WebViewAware(
                                                                                                        child: AlertDialog(
                                                                                                          title: const Text('Delete Tile?'),
                                                                                                          content: const Text('If you continue this tile will be deleted forever'),
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
                                                                                                logFirebaseEvent('Icon_backend_call');
                                                                                                await tileTier2Item.reference.delete();
                                                                                              }
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.delete_outlined,
                                                                                              color: FlutterFlowTheme.of(context).customColor3,
                                                                                              size: 18.0,
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
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
