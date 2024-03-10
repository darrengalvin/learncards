import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/blockv3_widget.dart';
import '/components/chat_widget.dart';
import '/components/drawer_tile_tree_widget.dart';
import '/components/header_container_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/main_pages/edit_tile_block_copy/edit_tile_block_copy_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'featured_page_model.dart';
export 'featured_page_model.dart';

class FeaturedPageWidget extends StatefulWidget {
  const FeaturedPageWidget({super.key});

  @override
  State<FeaturedPageWidget> createState() => _FeaturedPageWidgetState();
}

class _FeaturedPageWidgetState extends State<FeaturedPageWidget>
    with TickerProviderStateMixin {
  late FeaturedPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 700.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 700.ms,
          duration: 600.ms,
          begin: const Offset(81.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 700.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeaturedPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'featuredPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FEATURED_featuredPage_ON_INIT_STATE');
      logFirebaseEvent('featuredPage_update_app_state');
      setState(() {
        FFAppState().navPath = [];
        FFAppState().tileNav = TileNavStruct.fromSerializableMap(jsonDecode(
            '{\"tier0_id\":\"0\",\"tier1_id\":\"0\",\"tier2_id\":\"0\",\"tier3_id\":\"0\",\"tier4_id\":\"0\"}'));
        FFAppState().viewTileContentId = 'id';
      });
    });

    _model.tileNameController ??= TextEditingController();
    _model.tileNameFocusNode ??= FocusNode();

    _model.blockNameController ??= TextEditingController();
    _model.blockNameFocusNode ??= FocusNode();

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

    return StreamBuilder<List<Tilesv2Record>>(
      stream: queryTilesv2Record(
        queryBuilder: (tilesv2Record) => tilesv2Record.orderBy('tile_index'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<Tilesv2Record> featuredPageTilesv2RecordList = snapshot.data!;
        return Title(
            title: 'featuredPage',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                floatingActionButton: FloatingActionButton(
                  onPressed: () async {
                    logFirebaseEvent(
                        'FEATURED_FloatingActionButton_7ip0rcvp_O');
                    logFirebaseEvent('FloatingActionButton_scroll_to');
                    await _model.mainBody?.animateTo(
                      0,
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.ease,
                    );
                  },
                  backgroundColor: FlutterFlowTheme.of(context).customColor7,
                  elevation: 8.0,
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 32.0,
                    ),
                  ),
                ),
                drawer: Drawer(
                  elevation: 16.0,
                  child: WebViewAware(
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.sideMenuModel,
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: SideMenuWidget(
                              action: () async {
                                logFirebaseEvent(
                                    'FEATURED_Container_8lz5ecw5_CALLBACK');
                                logFirebaseEvent('sideMenu_drawer');
                                scaffoldKey.currentState!.openEndDrawer();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                endDrawer: SizedBox(
                  width: 400.0,
                  child: Drawer(
                    elevation: 16.0,
                    child: WebViewAware(
                      child: wrapWithModel(
                        model: _model.drawerTileTreeModel,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: DrawerTileTreeWidget(
                          isHeader: true,
                          startTab: valueOrDefault<int>(
                            FFAppState().drawerStartTab,
                            0,
                          ),
                          itemId: valueOrDefault<String>(
                            FFAppState().viewTileContentId,
                            '0',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                body: SafeArea(
                  top: true,
                  child: StreamBuilder<List<SessionsRecord>>(
                    stream: querySessionsRecord(
                      queryBuilder: (sessionsRecord) => sessionsRecord.where(
                        'sessionId',
                        isEqualTo: FFAppState().nonLoggedInSessionId,
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
                      List<SessionsRecord> containerSessionsRecordList =
                          snapshot.data!;
                      return Container(
                        decoration: const BoxDecoration(),
                        child: StreamBuilder<List<CompaniesRecord>>(
                          stream: queryCompaniesRecord(
                            queryBuilder: (companiesRecord) =>
                                companiesRecord.where(
                              'companyCode',
                              isEqualTo: FFAppState().companySecretCode,
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
                            List<CompaniesRecord> containerCompaniesRecordList =
                                snapshot.data!;
                            return Container(
                              decoration: const BoxDecoration(),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'FEATURED_PAGE_PAGE_Row_ab7utwuw_ON_TAP');
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: StreamBuilder<
                                                      List<TileBlocksRecord>>(
                                                    stream:
                                                        queryTileBlocksRecord(),
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
                                                      List<TileBlocksRecord>
                                                          containerTileBlocksRecordList =
                                                          snapshot.data!;
                                                      return Container(
                                                        width: 100.0,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            wrapWithModel(
                                                              model: _model
                                                                  .headerContainerModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  HeaderContainerWidget(
                                                                action:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'FEATURED_Container_q073vun4_CALLBACK');
                                                                  if (FFAppState()
                                                                          .callbackAction ==
                                                                      'Drawer') {
                                                                    logFirebaseEvent(
                                                                        'HeaderContainer_drawer');
                                                                    scaffoldKey
                                                                        .currentState!
                                                                        .openDrawer();
                                                                  } else if (FFAppState()
                                                                          .callbackAction ==
                                                                      'NewTile') {
                                                                    logFirebaseEvent(
                                                                        'HeaderContainer_update_app_state');
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .drawerState =
                                                                          'New';
                                                                      FFAppState()
                                                                              .drawerView =
                                                                          'Tile';
                                                                      FFAppState()
                                                                              .drawerMode =
                                                                          'Admin';
                                                                      FFAppState()
                                                                              .drawerCurrentId =
                                                                          FFAppState()
                                                                              .viewTileContentId;
                                                                      FFAppState()
                                                                          .drawerStartTab = 0;
                                                                    });
                                                                    logFirebaseEvent(
                                                                        'HeaderContainer_drawer');
                                                                    scaffoldKey
                                                                        .currentState!
                                                                        .openEndDrawer();
                                                                  } else if (FFAppState()
                                                                          .callbackAction ==
                                                                      'AdminDrawer') {
                                                                    logFirebaseEvent(
                                                                        'HeaderContainer_drawer');
                                                                    scaffoldKey
                                                                        .currentState!
                                                                        .openEndDrawer();
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            1.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  controller: _model
                                                                      .mainBody,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color:
                                                                                Color(0xFFF4F7FC),
                                                                          ),
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                constraints: const BoxConstraints(
                                                                                  maxWidth: 1200.0,
                                                                                ),
                                                                                decoration: BoxDecoration(
                                                                                  color: const Color(0xFFF4F7FC),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color:
                                                                                Color(0xFFF4F7FC),
                                                                          ),
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                height: 520.0,
                                                                                constraints: const BoxConstraints(
                                                                                  maxWidth: 1200.0,
                                                                                ),
                                                                                decoration: BoxDecoration(
                                                                                  color: const Color(0xFFF4F7FC),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                child: ListView(
                                                                                  padding: EdgeInsets.zero,
                                                                                  scrollDirection: Axis.horizontal,
                                                                                  controller: _model.listViewController1,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.all(10.0),
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: 120.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          borderRadius: BorderRadius.circular(13.0),
                                                                                        ),
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            final featuredTiles = featuredPageTilesv2RecordList
                                                                                                .where((e) => valueOrDefault<bool>(
                                                                                                      e.parentId == FFAppState().tileNav.tier0Id,
                                                                                                      false,
                                                                                                    ))
                                                                                                .toList();
                                                                                            return ListView.builder(
                                                                                              padding: EdgeInsets.zero,
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              itemCount: featuredTiles.length,
                                                                                              itemBuilder: (context, featuredTilesIndex) {
                                                                                                final featuredTilesItem = featuredTiles[featuredTilesIndex];
                                                                                                return Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 8.0),
                                                                                                  child: Material(
                                                                                                    color: Colors.transparent,
                                                                                                    elevation: 4.0,
                                                                                                    shape: RoundedRectangleBorder(
                                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                                    ),
                                                                                                    child: Container(
                                                                                                      width: 320.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        boxShadow: const [
                                                                                                          BoxShadow(
                                                                                                            blurRadius: 4.0,
                                                                                                            color: Color(0x33000000),
                                                                                                            offset: Offset(0.0, 2.0),
                                                                                                          )
                                                                                                        ],
                                                                                                        gradient: LinearGradient(
                                                                                                          colors: [
                                                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            FlutterFlowTheme.of(context).alternate
                                                                                                          ],
                                                                                                          stops: const [0.0, 1.0],
                                                                                                          begin: const AlignmentDirectional(0.0, -1.0),
                                                                                                          end: const AlignmentDirectional(0, 1.0),
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: const EdgeInsets.all(12.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Padding(
                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                                                    child: Container(
                                                                                                                      width: double.infinity,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                                      ),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Align(
                                                                                                                            alignment: const AlignmentDirectional(0.0, 1.0),
                                                                                                                            child: Padding(
                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(6.0, 4.0, 24.0, 0.0),
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                                                children: [
                                                                                                                                  Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Padding(
                                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                                        child: Text(
                                                                                                                                          featuredTilesItem.title,
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                fontFamily: 'Outfit',
                                                                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                                fontSize: 14.0,
                                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                  Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Padding(
                                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                                        child: Text(
                                                                                                                                          'Dismiss',
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                                fontWeight: FontWeight.w300,
                                                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      FlutterFlowIconButton(
                                                                                                                                        borderColor: Colors.transparent,
                                                                                                                                        borderRadius: 30.0,
                                                                                                                                        borderWidth: 1.0,
                                                                                                                                        buttonSize: 30.0,
                                                                                                                                        icon: Icon(
                                                                                                                                          Icons.close_sharp,
                                                                                                                                          color: FlutterFlowTheme.of(context).grayIcon,
                                                                                                                                          size: 20.0,
                                                                                                                                        ),
                                                                                                                                        onPressed: () {
                                                                                                                                          print('IconButton pressed ...');
                                                                                                                                        },
                                                                                                                                      ),
                                                                                                                                      if (valueOrDefault<bool>(currentUserDocument?.isadmin, false) == true)
                                                                                                                                        AuthUserStreamWidget(
                                                                                                                                          builder: (context) => FlutterFlowIconButton(
                                                                                                                                            borderColor: Colors.transparent,
                                                                                                                                            borderRadius: 30.0,
                                                                                                                                            borderWidth: 1.0,
                                                                                                                                            buttonSize: 30.0,
                                                                                                                                            icon: FaIcon(
                                                                                                                                              FontAwesomeIcons.edit,
                                                                                                                                              color: FlutterFlowTheme.of(context).grayIcon,
                                                                                                                                              size: 20.0,
                                                                                                                                            ),
                                                                                                                                            onPressed: () {
                                                                                                                                              print('IconButton pressed ...');
                                                                                                                                            },
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      if (valueOrDefault<bool>(currentUserDocument?.isadmin, false) == true)
                                                                                                                                        AuthUserStreamWidget(
                                                                                                                                          builder: (context) => FlutterFlowIconButton(
                                                                                                                                            borderColor: Colors.transparent,
                                                                                                                                            borderRadius: 30.0,
                                                                                                                                            borderWidth: 1.0,
                                                                                                                                            buttonSize: 30.0,
                                                                                                                                            icon: FaIcon(
                                                                                                                                              FontAwesomeIcons.solidTrashAlt,
                                                                                                                                              color: FlutterFlowTheme.of(context).grayIcon,
                                                                                                                                              size: 20.0,
                                                                                                                                            ),
                                                                                                                                            onPressed: () {
                                                                                                                                              print('IconButton pressed ...');
                                                                                                                                            },
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Align(
                                                                                                                            alignment: const AlignmentDirectional(0.0, 1.0),
                                                                                                                            child: Padding(
                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(6.0, 4.0, 24.0, 0.0),
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                                                children: [
                                                                                                                                  Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Padding(
                                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                                        child: Text(
                                                                                                                                          'Date',
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                fontFamily: 'Outfit',
                                                                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                                fontSize: 14.0,
                                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                  Align(
                                                                                                                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                                                                                                                    child: Padding(
                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(6.0, 4.0, 6.0, 0.0),
                                                                                                                                      child: Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                                                        children: [
                                                                                                                                          Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                            children: [
                                                                                                                                              Padding(
                                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                                                child: Text(
                                                                                                                                                  ' News',
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                        fontFamily: 'Outfit',
                                                                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                                                                        fontSize: 14.0,
                                                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                                      ),
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
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              featuredTilesItem.details,
                                                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                    fontFamily: 'Outfit',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    fontSize: 18.0,
                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 14.0, 16.0, 14.0),
                                                                                                                            child: Text(
                                                                                                                              featuredTilesItem.details.maybeHandleOverflow(
                                                                                                                                maxChars: 250,
                                                                                                                                replacement: '…',
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                    fontFamily: 'Outfit',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    fontSize: 14.0,
                                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Stack(
                                                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                    children: [
                                                                                                                      Align(
                                                                                                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                        child: ClipRRect(
                                                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                                                          child: Image.network(
                                                                                                                            'https://picsum.photos/seed/787/600',
                                                                                                                            width: MediaQuery.sizeOf(context).width * 2.2,
                                                                                                                            fit: BoxFit.cover,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      const Align(
                                                                                                                        alignment: AlignmentDirectional(0.15, 0.1),
                                                                                                                        child: FlutterFlowVideoPlayer(
                                                                                                                          path: 'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                                                                                                                          videoType: VideoType.network,
                                                                                                                          width: 300.0,
                                                                                                                          autoPlay: false,
                                                                                                                          looping: false,
                                                                                                                          showControls: false,
                                                                                                                          allowFullScreen: false,
                                                                                                                          allowPlaybackSpeedMenu: false,
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
                                                                                              },
                                                                                              controller: _model.listViewController2,
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
                                                                        ),
                                                                      ),
                                                                      if (responsiveVisibility(
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
                                                                      ))
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: Color(0xFFF4F7FC),
                                                                            ),
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  height: 520.0,
                                                                                  constraints: const BoxConstraints(
                                                                                    maxWidth: 1200.0,
                                                                                  ),
                                                                                  decoration: BoxDecoration(
                                                                                    color: const Color(0xFFF4F7FC),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                  child: wrapWithModel(
                                                                                    model: _model.chatModel,
                                                                                    updateCallback: () => setState(() {}),
                                                                                    child: const ChatWidget(),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      StreamBuilder<
                                                                          List<
                                                                              TileBlocksRecord>>(
                                                                        stream:
                                                                            queryTileBlocksRecord(
                                                                          queryBuilder: (tileBlocksRecord) =>
                                                                              tileBlocksRecord.orderBy('block_index'),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<TileBlocksRecord>
                                                                              containerTileBlocksRecordList =
                                                                              snapshot.data!;
                                                                          return Container(
                                                                            width:
                                                                                double.infinity,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              minHeight: MediaQuery.sizeOf(context).height * 0.8,
                                                                              maxWidth: 1280.0,
                                                                              maxHeight: MediaQuery.sizeOf(context).height * 1.99,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                constraints: BoxConstraints(
                                                                                  maxWidth: 960.0,
                                                                                  maxHeight: MediaQuery.sizeOf(context).height * 1.0,
                                                                                ),
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: const AlignmentDirectional(0.0, -1.0),
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.9,
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                                                                                          maxHeight: 300.0,
                                                                                        ),
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          children: [
                                                                                            if (responsiveVisibility(
                                                                                              context: context,
                                                                                              tablet: false,
                                                                                              tabletLandscape: false,
                                                                                              desktop: false,
                                                                                            ))
                                                                                              Builder(
                                                                                                builder: (context) {
                                                                                                  final tileLevel1 = featuredPageTilesv2RecordList
                                                                                                      .where((e) => valueOrDefault<bool>(
                                                                                                            e.parentId == FFAppState().tileNav.tier0Id,
                                                                                                            false,
                                                                                                          ))
                                                                                                      .toList();
                                                                                                  return SingleChildScrollView(
                                                                                                    scrollDirection: Axis.horizontal,
                                                                                                    controller: _model.rowController,
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: List.generate(tileLevel1.length, (tileLevel1Index) {
                                                                                                        final tileLevel1Item = tileLevel1[tileLevel1Index];
                                                                                                        return Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                          child: ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                            child: AnimatedContainer(
                                                                                                              duration: const Duration(milliseconds: 210),
                                                                                                              curve: Curves.easeInOut,
                                                                                                              width: 250.0,
                                                                                                              constraints: const BoxConstraints(
                                                                                                                maxHeight: 250.0,
                                                                                                              ),
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                                                border: Border.all(
                                                                                                                  color: valueOrDefault<Color>(
                                                                                                                    FFAppState().tileNav.tier1Id == tileLevel1Item.reference.id ? FlutterFlowTheme.of(context).customColor7 : FlutterFlowTheme.of(context).accent2,
                                                                                                                    FlutterFlowTheme.of(context).accent2,
                                                                                                                  ),
                                                                                                                  width: 0.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                                children: [
                                                                                                                  InkWell(
                                                                                                                    splashColor: Colors.transparent,
                                                                                                                    focusColor: Colors.transparent,
                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                    onTap: () async {
                                                                                                                      logFirebaseEvent('FEATURED_PAGE_PAGE_Row_0mcvvfe1_ON_TAP');
                                                                                                                      if (FFAppState().tileNav.tier1Id == tileLevel1Item.reference.id) {
                                                                                                                        logFirebaseEvent('Row_update_app_state');
                                                                                                                        setState(() {
                                                                                                                          FFAppState().updateTileNavStruct(
                                                                                                                            (e) => e
                                                                                                                              ..tier1Id = null
                                                                                                                              ..tier2Id = null
                                                                                                                              ..tier3Id = null
                                                                                                                              ..tier4Id = null,
                                                                                                                          );
                                                                                                                          FFAppState().viewTileContentId = 'id';
                                                                                                                          FFAppState().navPath = FFAppState().navPath.take(1).toList().cast<String>();
                                                                                                                        });
                                                                                                                      } else {
                                                                                                                        logFirebaseEvent('Row_update_app_state');
                                                                                                                        FFAppState().updateTileNavStruct(
                                                                                                                          (e) => e
                                                                                                                            ..tier1Id = tileLevel1Item.reference.id
                                                                                                                            ..tier2Id = null
                                                                                                                            ..tier3Id = null
                                                                                                                            ..tier4Id = null,
                                                                                                                        );
                                                                                                                        FFAppState().viewTileContentId = tileLevel1Item.reference.id;
                                                                                                                        FFAppState().navPath = FFAppState().navPath.take(1).toList().cast<String>();
                                                                                                                        logFirebaseEvent('Row_update_app_state');
                                                                                                                        setState(() {
                                                                                                                          FFAppState().addToNavPath(tileLevel1Item.reference.id);
                                                                                                                        });
                                                                                                                      }
                                                                                                                    },
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                                          child: Column(
                                                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                            children: [
                                                                                                                              ClipRRect(
                                                                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                                                                child: Image.network(
                                                                                                                                  valueOrDefault<String>(
                                                                                                                                    tileLevel1Item.thumbnail,
                                                                                                                                    'https://firebasestorage.googleapis.com/v0/b/tony-morris-internationa-1b480.appspot.com/o/Screenshot%202023-09-18%20at%2003.42.png?alt=media&token=060d0210-4a99-4b7f-a5ff-ce9ab70a4849',
                                                                                                                                  ),
                                                                                                                                  width: 60.0,
                                                                                                                                  height: 60.0,
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Expanded(
                                                                                                                          child: Padding(
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 4.0, 0.0),
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                              children: [
                                                                                                                                Text(
                                                                                                                                  tileLevel1Item.title,
                                                                                                                                  maxLines: 2,
                                                                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                        fontFamily: 'Outfit',
                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                        fontSize: 18.0,
                                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Padding(
                                                                                                                          padding: const EdgeInsets.all(12.0),
                                                                                                                          child: Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                            children: [
                                                                                                                              InkWell(
                                                                                                                                splashColor: Colors.transparent,
                                                                                                                                focusColor: Colors.transparent,
                                                                                                                                hoverColor: Colors.transparent,
                                                                                                                                highlightColor: Colors.transparent,
                                                                                                                                onTap: () async {
                                                                                                                                  logFirebaseEvent('FEATURED_PAGE_PAGE_Icon_j8g29g2w_ON_TAP');
                                                                                                                                  logFirebaseEvent('Icon_update_app_state');
                                                                                                                                  setState(() {
                                                                                                                                    FFAppState().updateTileNavStruct(
                                                                                                                                      (e) => e
                                                                                                                                        ..tier1Id = tileLevel1Item.reference.id
                                                                                                                                        ..tier2Id = null
                                                                                                                                        ..tier3Id = null
                                                                                                                                        ..tier4Id = null,
                                                                                                                                    );
                                                                                                                                  });
                                                                                                                                },
                                                                                                                                child: Icon(
                                                                                                                                  Icons.arrow_forward_ios,
                                                                                                                                  color: valueOrDefault<Color>(
                                                                                                                                    FFAppState().tileNav.tier1Id == tileLevel1Item.reference.id ? FlutterFlowTheme.of(context).customColor7 : const Color(0xFF95A1AC),
                                                                                                                                    const Color(0xFF95A1AC),
                                                                                                                                  ),
                                                                                                                                  size: 24.0,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  if (valueOrDefault<bool>(
                                                                                                                    FFAppState().tileNav.tier1Id == FFAppState().viewTileContentId,
                                                                                                                    false,
                                                                                                                  ))
                                                                                                                    Padding(
                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                                                      child: Builder(
                                                                                                                        builder: (context) {
                                                                                                                          final tier2 = featuredPageTilesv2RecordList
                                                                                                                              .where((e) => valueOrDefault<bool>(
                                                                                                                                    e.parentId == FFAppState().tileNav.tier1Id,
                                                                                                                                    false,
                                                                                                                                  ))
                                                                                                                              .toList();
                                                                                                                          return ListView.builder(
                                                                                                                            padding: EdgeInsets.zero,
                                                                                                                            shrinkWrap: true,
                                                                                                                            scrollDirection: Axis.vertical,
                                                                                                                            itemCount: tier2.length,
                                                                                                                            itemBuilder: (context, tier2Index) {
                                                                                                                              final tier2Item = tier2[tier2Index];
                                                                                                                              return Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                                                child: InkWell(
                                                                                                                                  splashColor: Colors.transparent,
                                                                                                                                  focusColor: Colors.transparent,
                                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                                  onTap: () async {
                                                                                                                                    logFirebaseEvent('FEATURED_Container_2lgvfxb7_ON_TAP');
                                                                                                                                    if (valueOrDefault<bool>(
                                                                                                                                          FFAppState().viewTileContentId == tier2Item.reference.id,
                                                                                                                                          false,
                                                                                                                                        ) &&
                                                                                                                                        (FFAppState().tileNav.tier2Id == tier2Item.reference.id)) {
                                                                                                                                      logFirebaseEvent('Container_update_app_state');
                                                                                                                                      setState(() {
                                                                                                                                        FFAppState().updateTileNavStruct(
                                                                                                                                          (e) => e
                                                                                                                                            ..tier2Id = null
                                                                                                                                            ..tier3Id = null
                                                                                                                                            ..tier4Id = null,
                                                                                                                                        );
                                                                                                                                        FFAppState().viewTileContentId = tier2Item.reference.id;
                                                                                                                                        FFAppState().navPath = FFAppState().navPath.take(1).toList().cast<String>();
                                                                                                                                      });
                                                                                                                                    } else {
                                                                                                                                      logFirebaseEvent('Container_update_app_state');
                                                                                                                                      FFAppState().updateTileNavStruct(
                                                                                                                                        (e) => e
                                                                                                                                          ..tier2Id = tier2Item.reference.id
                                                                                                                                          ..tier3Id = null
                                                                                                                                          ..tier4Id = null,
                                                                                                                                      );
                                                                                                                                      FFAppState().viewTileContentId = tier2Item.reference.id;
                                                                                                                                      FFAppState().navPath = FFAppState().navPath.take(2).toList().cast<String>();
                                                                                                                                      logFirebaseEvent('Container_update_app_state');
                                                                                                                                      FFAppState().addToNavPath(tier2Item.reference.id);
                                                                                                                                      logFirebaseEvent('Container_update_app_state');
                                                                                                                                      setState(() {
                                                                                                                                        FFAppState().addToNavPath(tier2Item.reference.id);
                                                                                                                                      });
                                                                                                                                    }
                                                                                                                                  },
                                                                                                                                  child: Container(
                                                                                                                                    height: 32.0,
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                                                    ),
                                                                                                                                    child: Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        Text(
                                                                                                                                          tier2Item.title.maybeHandleOverflow(maxChars: 20),
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            },
                                                                                                                            controller: _model.listViewController3,
                                                                                                                          );
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    if (FFAppState().tileNav.tier0Id == '0' ? false : true)
                                                                                      Expanded(
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  if (responsiveVisibility(
                                                                                                    context: context,
                                                                                                    phone: false,
                                                                                                  ))
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        if (responsiveVisibility(
                                                                                                          context: context,
                                                                                                          phone: false,
                                                                                                          tablet: false,
                                                                                                          tabletLandscape: false,
                                                                                                        ))
                                                                                                          Expanded(
                                                                                                            child: Container(
                                                                                                              width: 370.0,
                                                                                                              decoration: const BoxDecoration(),
                                                                                                              child: Builder(
                                                                                                                builder: (context) {
                                                                                                                  final navTile1Desktop = featuredPageTilesv2RecordList
                                                                                                                      .where((e) => valueOrDefault<bool>(
                                                                                                                            e.parentId == FFAppState().tileNav.tier0Id,
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
                                                                                                                      return Padding(
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
                                                                                                                        child: AnimatedContainer(
                                                                                                                          duration: const Duration(milliseconds: 170),
                                                                                                                          curve: Curves.easeInOut,
                                                                                                                          width: double.infinity,
                                                                                                                          decoration: BoxDecoration(
                                                                                                                            color: const Color(0xFFF4F7FC),
                                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                                            border: Border.all(
                                                                                                                              color: FFAppState().tileNav.tier2Id == navTile1DesktopItem.reference.id ? FlutterFlowTheme.of(context).success : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                              width: 1.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          child: Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsets.all(10.0),
                                                                                                                                child: InkWell(
                                                                                                                                  splashColor: Colors.transparent,
                                                                                                                                  focusColor: Colors.transparent,
                                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                                  onTap: () async {
                                                                                                                                    logFirebaseEvent('FEATURED_PAGE_PAGE_tileTier_ON_TAP');
                                                                                                                                    if (FFAppState().tileNav.tier1Id == navTile1DesktopItem.reference.id) {
                                                                                                                                      logFirebaseEvent('tileTier_update_app_state');
                                                                                                                                      setState(() {
                                                                                                                                        FFAppState().updateTileNavStruct(
                                                                                                                                          (e) => e
                                                                                                                                            ..tier1Id = null
                                                                                                                                            ..tier2Id = null
                                                                                                                                            ..tier3Id = null
                                                                                                                                            ..tier4Id = null,
                                                                                                                                        );
                                                                                                                                        FFAppState().viewTileContentId = 'id';
                                                                                                                                        FFAppState().navPath = FFAppState().navPath.take(1).toList().cast<String>();
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
                                                                                                                                      setState(() {
                                                                                                                                        FFAppState().addToNavPath(navTile1DesktopItem.reference.id);
                                                                                                                                      });
                                                                                                                                    }

                                                                                                                                    logFirebaseEvent('tileTier_clear_text_fields_pin_codes');
                                                                                                                                    setState(() {
                                                                                                                                      _model.tileNameController?.clear();
                                                                                                                                      _model.blockNameController?.clear();
                                                                                                                                    });
                                                                                                                                    logFirebaseEvent('tileTier_update_page_state');
                                                                                                                                    setState(() {
                                                                                                                                      _model.showTileCreate = false;
                                                                                                                                      _model.showBlockCreate = false;
                                                                                                                                    });
                                                                                                                                  },
                                                                                                                                  child: Container(
                                                                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                                    height: 120.0,
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                                      borderRadius: BorderRadius.circular(13.0),
                                                                                                                                      border: Border.all(
                                                                                                                                        color: valueOrDefault<Color>(
                                                                                                                                          FFAppState().tileNav.tier1Id == navTile1DesktopItem.reference.id ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).selectedButton,
                                                                                                                                          FlutterFlowTheme.of(context).selectedButton,
                                                                                                                                        ),
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
                                                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 4.0, 0.0),
                                                                                                                                                  child: Column(
                                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                    children: [
                                                                                                                                                      Container(
                                                                                                                                                        decoration: BoxDecoration(
                                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                        ),
                                                                                                                                                        child: ClipRRect(
                                                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                                                          child: Image.network(
                                                                                                                                                            valueOrDefault<String>(
                                                                                                                                                              navTile1DesktopItem.image,
                                                                                                                                                              'https://firebasestorage.googleapis.com/v0/b/tony-morris-internationa-1b480.appspot.com/o/Screenshot%202023-09-18%20at%2003.42.png?alt=media&token=060d0210-4a99-4b7f-a5ff-ce9ab70a4849',
                                                                                                                                                            ),
                                                                                                                                                            width: 75.0,
                                                                                                                                                            height: 75.0,
                                                                                                                                                            fit: BoxFit.cover,
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                    ],
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                                Expanded(
                                                                                                                                                  child: Padding(
                                                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 4.0, 0.0),
                                                                                                                                                    child: Column(
                                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                      children: [
                                                                                                                                                        AutoSizeText(
                                                                                                                                                          'Module ${(valueOrDefault<int>(
                                                                                                                                                                navTile1DesktopIndex,
                                                                                                                                                                0,
                                                                                                                                                              ) ?? 0 + 1).toString()}',
                                                                                                                                                          textAlign: TextAlign.start,
                                                                                                                                                          maxLines: 3,
                                                                                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                                                fontFamily: 'Outfit',
                                                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                                fontSize: 18.0,
                                                                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                                              ),
                                                                                                                                                        ),
                                                                                                                                                        Align(
                                                                                                                                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                                                                          child: AutoSizeText(
                                                                                                                                                            functions.splitText(1, ' - ', navTile1DesktopItem.title),
                                                                                                                                                            textAlign: TextAlign.start,
                                                                                                                                                            maxLines: 2,
                                                                                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                                                  fontFamily: 'Outfit',
                                                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                                  fontSize: 18.0,
                                                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
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
                                                                                                                                          if (valueOrDefault<bool>(
                                                                                                                                            valueOrDefault<bool>(
                                                                                                                                                  navTile1DesktopItem.adminUsers.contains(currentUserReference?.id),
                                                                                                                                                  false,
                                                                                                                                                ) ||
                                                                                                                                                valueOrDefault<bool>(currentUserDocument?.isadmin, false),
                                                                                                                                            false,
                                                                                                                                          ))
                                                                                                                                            Padding(
                                                                                                                                              padding: const EdgeInsets.all(8.0),
                                                                                                                                              child: AuthUserStreamWidget(
                                                                                                                                                builder: (context) => Column(
                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                                                                  children: [
                                                                                                                                                    InkWell(
                                                                                                                                                      splashColor: Colors.transparent,
                                                                                                                                                      focusColor: Colors.transparent,
                                                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                                                      onTap: () async {
                                                                                                                                                        logFirebaseEvent('FEATURED_PAGE_PAGE_Icon_myfrtbvj_ON_TAP');
                                                                                                                                                        logFirebaseEvent('Icon_bottom_sheet');
                                                                                                                                                        await showModalBottomSheet(
                                                                                                                                                          isScrollControlled: true,
                                                                                                                                                          backgroundColor: const Color(0x84000000),
                                                                                                                                                          enableDrag: false,
                                                                                                                                                          context: context,
                                                                                                                                                          builder: (context) {
                                                                                                                                                            return WebViewAware(
                                                                                                                                                              child: GestureDetector(
                                                                                                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                                                                                child: Padding(
                                                                                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                                                  child: EditTileBlockCopyWidget(
                                                                                                                                                                    initialTileId: navTile1DesktopItem.reference.id,
                                                                                                                                                                    tiles: featuredPageTilesv2RecordList,
                                                                                                                                                                    blocks: containerTileBlocksRecordList,
                                                                                                                                                                    iniitalBlockId: '',
                                                                                                                                                                  ),
                                                                                                                                                                ),
                                                                                                                                                              ),
                                                                                                                                                            );
                                                                                                                                                          },
                                                                                                                                                        ).then((value) => safeSetState(() {}));

                                                                                                                                                        logFirebaseEvent('Icon_update_app_state');
                                                                                                                                                        setState(() {
                                                                                                                                                          FFAppState().drawerStartTab = 1;
                                                                                                                                                          FFAppState().drawerCurrentId = navTile1DesktopItem.reference.id;
                                                                                                                                                        });
                                                                                                                                                        logFirebaseEvent('Icon_drawer');
                                                                                                                                                        scaffoldKey.currentState!.openEndDrawer();
                                                                                                                                                      },
                                                                                                                                                      child: Icon(
                                                                                                                                                        Icons.settings_outlined,
                                                                                                                                                        color: FlutterFlowTheme.of(context).grayIcon,
                                                                                                                                                        size: 24.0,
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                    InkWell(
                                                                                                                                                      splashColor: Colors.transparent,
                                                                                                                                                      focusColor: Colors.transparent,
                                                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                                                      onTap: () async {
                                                                                                                                                        logFirebaseEvent('FEATURED_PAGE_PAGE_Icon_fqcotx15_ON_TAP');
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
                                                                                                                                                          await navTile1DesktopItem.reference.delete();
                                                                                                                                                        }
                                                                                                                                                      },
                                                                                                                                                      child: Icon(
                                                                                                                                                        Icons.delete_outlined,
                                                                                                                                                        color: FlutterFlowTheme.of(context).customColor3,
                                                                                                                                                        size: 24.0,
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
                                                                                                                              if (valueOrDefault<bool>(
                                                                                                                                () {
                                                                                                                                  if (valueOrDefault<bool>(
                                                                                                                                    FFAppState().tileNav.hasTier1Id() == false,
                                                                                                                                    false,
                                                                                                                                  )) {
                                                                                                                                    return false;
                                                                                                                                  } else if (valueOrDefault<bool>(
                                                                                                                                    FFAppState().tileNav.tier1Id == navTile1DesktopItem.reference.id,
                                                                                                                                    false,
                                                                                                                                  )) {
                                                                                                                                    return true;
                                                                                                                                  } else {
                                                                                                                                    return false;
                                                                                                                                  }
                                                                                                                                }(),
                                                                                                                                false,
                                                                                                                              ))
                                                                                                                                Column(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
                                                                                                                                    Padding(
                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                                                      child: Builder(
                                                                                                                                        builder: (context) {
                                                                                                                                          final tileTier2 = featuredPageTilesv2RecordList.where((e) => e.parentId == navTile1DesktopItem.reference.id).toList();
                                                                                                                                          return ListView.builder(
                                                                                                                                            padding: EdgeInsets.zero,
                                                                                                                                            shrinkWrap: true,
                                                                                                                                            scrollDirection: Axis.vertical,
                                                                                                                                            itemCount: tileTier2.length,
                                                                                                                                            itemBuilder: (context, tileTier2Index) {
                                                                                                                                              final tileTier2Item = tileTier2[tileTier2Index];
                                                                                                                                              return Padding(
                                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 10.0, 12.0),
                                                                                                                                                child: InkWell(
                                                                                                                                                  splashColor: Colors.transparent,
                                                                                                                                                  focusColor: Colors.transparent,
                                                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                                                  onTap: () async {
                                                                                                                                                    logFirebaseEvent('FEATURED_PAGE_PAGE_tile_ON_TAP');
                                                                                                                                                    if (valueOrDefault<bool>(
                                                                                                                                                          FFAppState().viewTileContentId == tileTier2Item.reference.id,
                                                                                                                                                          false,
                                                                                                                                                        ) &&
                                                                                                                                                        (FFAppState().tileNav.tier2Id == tileTier2Item.reference.id)) {
                                                                                                                                                      logFirebaseEvent('tile_update_app_state');
                                                                                                                                                      setState(() {
                                                                                                                                                        FFAppState().updateTileNavStruct(
                                                                                                                                                          (e) => e
                                                                                                                                                            ..tier2Id = null
                                                                                                                                                            ..tier3Id = null
                                                                                                                                                            ..tier4Id = null,
                                                                                                                                                        );
                                                                                                                                                        FFAppState().viewTileContentId = navTile1DesktopItem.parentId;
                                                                                                                                                        FFAppState().navPath = FFAppState().navPath.take(1).toList().cast<String>();
                                                                                                                                                      });
                                                                                                                                                    } else {
                                                                                                                                                      logFirebaseEvent('tile_update_app_state');
                                                                                                                                                      FFAppState().updateTileNavStruct(
                                                                                                                                                        (e) => e
                                                                                                                                                          ..tier2Id = tileTier2Item.reference.id
                                                                                                                                                          ..tier3Id = null
                                                                                                                                                          ..tier4Id = null,
                                                                                                                                                      );
                                                                                                                                                      FFAppState().viewTileContentId = tileTier2Item.reference.id;
                                                                                                                                                      FFAppState().navPath = FFAppState().navPath.take(1).toList().cast<String>();
                                                                                                                                                      logFirebaseEvent('tile_update_app_state');
                                                                                                                                                      FFAppState().addToNavPath(tileTier2Item.parentId);
                                                                                                                                                      logFirebaseEvent('tile_update_app_state');
                                                                                                                                                      setState(() {
                                                                                                                                                        FFAppState().addToNavPath(tileTier2Item.reference.id);
                                                                                                                                                      });
                                                                                                                                                    }

                                                                                                                                                    logFirebaseEvent('tile_clear_text_fields_pin_codes');
                                                                                                                                                    setState(() {
                                                                                                                                                      _model.tileNameController?.clear();
                                                                                                                                                      _model.blockNameController?.clear();
                                                                                                                                                    });
                                                                                                                                                    logFirebaseEvent('tile_update_page_state');
                                                                                                                                                    setState(() {
                                                                                                                                                      _model.showTileCreate = false;
                                                                                                                                                      _model.showBlockCreate = false;
                                                                                                                                                    });
                                                                                                                                                  },
                                                                                                                                                  child: Container(
                                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                                                                      border: Border.all(
                                                                                                                                                        color: FFAppState().tileNav.tier2Id == tileTier2Item.reference.id ? FlutterFlowTheme.of(context).success : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                    child: Padding(
                                                                                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                                                                                      child: Row(
                                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                                        children: [
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
                                                                                                                                                                      valueOrDefault<String>(
                                                                                                                                                                        navTile1DesktopItem.thumbnail,
                                                                                                                                                                        'https://firebasestorage.googleapis.com/v0/b/tony-morris-internationa-1b480.appspot.com/o/Screenshot%202023-09-18%20at%2003.42.png?alt=media&token=060d0210-4a99-4b7f-a5ff-ce9ab70a4849',
                                                                                                                                                                      ),
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
                                                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 4.0, 0.0),
                                                                                                                                                              child: Column(
                                                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                                children: [
                                                                                                                                                                  Text(
                                                                                                                                                                    tileTier2Item.title,
                                                                                                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                                                          fontFamily: 'Outfit',
                                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                                          fontSize: 14.0,
                                                                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                                                                        ),
                                                                                                                                                                  ),
                                                                                                                                                                ],
                                                                                                                                                              ),
                                                                                                                                                            ),
                                                                                                                                                          ),
                                                                                                                                                          if (valueOrDefault<bool>(
                                                                                                                                                            valueOrDefault<bool>(
                                                                                                                                                                  tileTier2Item.accessUsers.contains(currentUserUid),
                                                                                                                                                                  false,
                                                                                                                                                                ) ||
                                                                                                                                                                valueOrDefault<bool>(currentUserDocument?.isadmin, false),
                                                                                                                                                            false,
                                                                                                                                                          ))
                                                                                                                                                            Padding(
                                                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(4.0, 2.0, 8.0, 2.0),
                                                                                                                                                              child: AuthUserStreamWidget(
                                                                                                                                                                builder: (context) => Column(
                                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                                                  children: [
                                                                                                                                                                    Padding(
                                                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                                                                                      child: InkWell(
                                                                                                                                                                        splashColor: Colors.transparent,
                                                                                                                                                                        focusColor: Colors.transparent,
                                                                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                                                                        onTap: () async {
                                                                                                                                                                          logFirebaseEvent('FEATURED_PAGE_PAGE_Icon_d9oauxkc_ON_TAP');
                                                                                                                                                                          logFirebaseEvent('Icon_update_app_state');
                                                                                                                                                                          setState(() {
                                                                                                                                                                            FFAppState().drawerStartTab = 1;
                                                                                                                                                                            FFAppState().drawerCurrentId = tileTier2Item.reference.id;
                                                                                                                                                                          });
                                                                                                                                                                          logFirebaseEvent('Icon_drawer');
                                                                                                                                                                          scaffoldKey.currentState!.openEndDrawer();
                                                                                                                                                                        },
                                                                                                                                                                        child: Icon(
                                                                                                                                                                          Icons.settings_outlined,
                                                                                                                                                                          color: FlutterFlowTheme.of(context).grayIcon,
                                                                                                                                                                          size: 18.0,
                                                                                                                                                                        ),
                                                                                                                                                                      ),
                                                                                                                                                                    ),
                                                                                                                                                                    Padding(
                                                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                                                                      child: InkWell(
                                                                                                                                                                        splashColor: Colors.transparent,
                                                                                                                                                                        focusColor: Colors.transparent,
                                                                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                                                                        onTap: () async {
                                                                                                                                                                          logFirebaseEvent('FEATURED_PAGE_PAGE_Icon_ckukby0v_ON_TAP');
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
                                                                                                                                                                            await navTile1DesktopItem.reference.delete();
                                                                                                                                                                          }
                                                                                                                                                                        },
                                                                                                                                                                        child: Icon(
                                                                                                                                                                          Icons.delete_outlined,
                                                                                                                                                                          color: FlutterFlowTheme.of(context).customColor3,
                                                                                                                                                                          size: 18.0,
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
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              );
                                                                                                                                            },
                                                                                                                                            controller: _model.listViewController4,
                                                                                                                                          );
                                                                                                                                        },
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    },
                                                                                                                    controller: _model.listViewWeb,
                                                                                                                  );
                                                                                                                },
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  Expanded(
                                                                                                    child: Padding(
                                                                                                      padding: const EdgeInsets.all(24.0),
                                                                                                      child: SingleChildScrollView(
                                                                                                        controller: _model.columnController,
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            if (valueOrDefault<bool>(
                                                                                                              FFAppState().viewTileContentId != '',
                                                                                                              false,
                                                                                                            ))
                                                                                                              Container(
                                                                                                                width: double.infinity,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                ),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    if ((valueOrDefault<bool>(currentUserDocument?.isadmin, false) == true) &&
                                                                                                                        responsiveVisibility(
                                                                                                                          context: context,
                                                                                                                          phone: false,
                                                                                                                        ))
                                                                                                                      Padding(
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                        child: AuthUserStreamWidget(
                                                                                                                          builder: (context) => Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                                                                                                                                child: FlutterFlowIconButton(
                                                                                                                                  borderColor: Colors.transparent,
                                                                                                                                  borderRadius: 30.0,
                                                                                                                                  borderWidth: 1.0,
                                                                                                                                  buttonSize: 50.0,
                                                                                                                                  icon: Icon(
                                                                                                                                    Icons.settings_rounded,
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    size: 30.0,
                                                                                                                                  ),
                                                                                                                                  onPressed: () async {
                                                                                                                                    logFirebaseEvent('FEATURED_settings_rounded_ICN_ON_TAP');
                                                                                                                                    logFirebaseEvent('IconButton_bottom_sheet');
                                                                                                                                    await showModalBottomSheet(
                                                                                                                                      isScrollControlled: true,
                                                                                                                                      backgroundColor: Colors.transparent,
                                                                                                                                      enableDrag: false,
                                                                                                                                      context: context,
                                                                                                                                      builder: (context) {
                                                                                                                                        return WebViewAware(
                                                                                                                                          child: GestureDetector(
                                                                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                                                            child: Padding(
                                                                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                              child: SizedBox(
                                                                                                                                                height: 150.0,
                                                                                                                                                child: EditTileBlockCopyWidget(
                                                                                                                                                  initialTileId: FFAppState().viewTileContentId,
                                                                                                                                                  tiles: featuredPageTilesv2RecordList,
                                                                                                                                                  blocks: containerTileBlocksRecordList,
                                                                                                                                                  iniitalBlockId: '',
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        );
                                                                                                                                      },
                                                                                                                                    ).then((value) => safeSetState(() {}));
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                                                                                                                                child: FlutterFlowIconButton(
                                                                                                                                  borderColor: Colors.transparent,
                                                                                                                                  borderRadius: 30.0,
                                                                                                                                  borderWidth: 1.0,
                                                                                                                                  buttonSize: 50.0,
                                                                                                                                  icon: Icon(
                                                                                                                                    Icons.settings_rounded,
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    size: 30.0,
                                                                                                                                  ),
                                                                                                                                  onPressed: () async {
                                                                                                                                    logFirebaseEvent('FEATURED_settings_rounded_ICN_ON_TAP');
                                                                                                                                    logFirebaseEvent('IconButton_navigate_to');

                                                                                                                                    context.pushNamed('thumbnailpicker');
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              InkWell(
                                                                                                                                splashColor: Colors.transparent,
                                                                                                                                focusColor: Colors.transparent,
                                                                                                                                hoverColor: Colors.transparent,
                                                                                                                                highlightColor: Colors.transparent,
                                                                                                                                onTap: () async {
                                                                                                                                  logFirebaseEvent('FEATURED_Container_cixk87l4_ON_TAP');
                                                                                                                                  logFirebaseEvent('Container_update_page_state');
                                                                                                                                  setState(() {
                                                                                                                                    _model.showTileCreate = true;
                                                                                                                                    _model.showBlockCreate = false;
                                                                                                                                  });
                                                                                                                                },
                                                                                                                                child: Container(
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                                    border: Border.all(
                                                                                                                                      color: FlutterFlowTheme.of(context).accent1,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  child: Padding(
                                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                                                                    child: Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        FlutterFlowIconButton(
                                                                                                                                          borderColor: Colors.transparent,
                                                                                                                                          borderRadius: 30.0,
                                                                                                                                          borderWidth: 1.0,
                                                                                                                                          buttonSize: 40.0,
                                                                                                                                          icon: Icon(
                                                                                                                                            Icons.add,
                                                                                                                                            color: FlutterFlowTheme.of(context).darkercolour,
                                                                                                                                            size: 20.0,
                                                                                                                                          ),
                                                                                                                                          onPressed: () {
                                                                                                                                            print('IconButton pressed ...');
                                                                                                                                          },
                                                                                                                                        ),
                                                                                                                                        Padding(
                                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                                                          child: Text(
                                                                                                                                            'Add Child Tile',
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                                                                                                                                child: InkWell(
                                                                                                                                  splashColor: Colors.transparent,
                                                                                                                                  focusColor: Colors.transparent,
                                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                                  onTap: () async {
                                                                                                                                    logFirebaseEvent('FEATURED_Container_4kd4jvbq_ON_TAP');
                                                                                                                                    logFirebaseEvent('Container_update_page_state');
                                                                                                                                    setState(() {
                                                                                                                                      _model.showBlockCreate = true;
                                                                                                                                      _model.showTileCreate = false;
                                                                                                                                    });
                                                                                                                                  },
                                                                                                                                  child: Container(
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                                                      border: Border.all(
                                                                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    child: Padding(
                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                                                                      child: Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        children: [
                                                                                                                                          FlutterFlowIconButton(
                                                                                                                                            borderColor: Colors.transparent,
                                                                                                                                            borderRadius: 30.0,
                                                                                                                                            borderWidth: 1.0,
                                                                                                                                            buttonSize: 40.0,
                                                                                                                                            icon: Icon(
                                                                                                                                              Icons.add,
                                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                              size: 20.0,
                                                                                                                                            ),
                                                                                                                                            onPressed: () {
                                                                                                                                              print('IconButton pressed ...');
                                                                                                                                            },
                                                                                                                                          ),
                                                                                                                                          Text(
                                                                                                                                            'Add Content Block',
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                                                                                                                                child: InkWell(
                                                                                                                                  splashColor: Colors.transparent,
                                                                                                                                  focusColor: Colors.transparent,
                                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                                  onTap: () async {
                                                                                                                                    logFirebaseEvent('FEATURED_Container_zmzsbkkz_ON_TAP');
                                                                                                                                    logFirebaseEvent('Container_update_app_state');
                                                                                                                                    setState(() {
                                                                                                                                      FFAppState().drawerStartTab = 1;
                                                                                                                                      FFAppState().drawerCurrentId = FFAppState().viewTileContentId;
                                                                                                                                    });
                                                                                                                                    logFirebaseEvent('Container_drawer');
                                                                                                                                    scaffoldKey.currentState!.openEndDrawer();
                                                                                                                                  },
                                                                                                                                  child: Container(
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                                                      border: Border.all(
                                                                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    child: Padding(
                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                                                                      child: Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        children: [
                                                                                                                                          FlutterFlowIconButton(
                                                                                                                                            borderColor: Colors.transparent,
                                                                                                                                            borderRadius: 30.0,
                                                                                                                                            borderWidth: 1.0,
                                                                                                                                            buttonSize: 40.0,
                                                                                                                                            icon: Icon(
                                                                                                                                              Icons.mode_edit,
                                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                              size: 20.0,
                                                                                                                                            ),
                                                                                                                                            onPressed: () {
                                                                                                                                              print('IconButton pressed ...');
                                                                                                                                            },
                                                                                                                                          ),
                                                                                                                                          Text(
                                                                                                                                            'Edit Tile',
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                                                                                      ),
                                                                                                                    AnimatedContainer(
                                                                                                                      duration: const Duration(milliseconds: 100),
                                                                                                                      curve: Curves.easeInOut,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      ),
                                                                                                                      child: Visibility(
                                                                                                                        visible: valueOrDefault<bool>(
                                                                                                                          _model.showTileCreate,
                                                                                                                          false,
                                                                                                                        ),
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                              children: [
                                                                                                                                Expanded(
                                                                                                                                  child: Padding(
                                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                                                                                                                                    child: Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                      children: [
                                                                                                                                        Expanded(
                                                                                                                                          child: Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              Container(
                                                                                                                                                width: 50.0,
                                                                                                                                                height: 50.0,
                                                                                                                                                decoration: BoxDecoration(
                                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                ),
                                                                                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                                                child: Align(
                                                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                                                  child: Container(
                                                                                                                                                    width: 32.0,
                                                                                                                                                    height: 32.0,
                                                                                                                                                    decoration: const BoxDecoration(
                                                                                                                                                      color: Color(0xFF1AADF9),
                                                                                                                                                      shape: BoxShape.circle,
                                                                                                                                                    ),
                                                                                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                                                    child: Text(
                                                                                                                                                      '>',
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
                                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                                                child: Text(
                                                                                                                                                  'Tile Name',
                                                                                                                                                  style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Container(
                                                                                                                                          width: 50.0,
                                                                                                                                          height: 50.0,
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                          ),
                                                                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                                          child: InkWell(
                                                                                                                                            splashColor: Colors.transparent,
                                                                                                                                            focusColor: Colors.transparent,
                                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                                            onTap: () async {
                                                                                                                                              logFirebaseEvent('FEATURED_PAGE_PAGE_Icon_rl4r51ra_ON_TAP');
                                                                                                                                              logFirebaseEvent('Icon_reset_form_fields');
                                                                                                                                              setState(() {
                                                                                                                                                _model.tileNameController?.clear();
                                                                                                                                                _model.blockNameController?.clear();
                                                                                                                                              });
                                                                                                                                              logFirebaseEvent('Icon_update_page_state');
                                                                                                                                              setState(() {
                                                                                                                                                _model.showTileCreate = false;
                                                                                                                                              });
                                                                                                                                            },
                                                                                                                                            child: Icon(
                                                                                                                                              Icons.cancel_outlined,
                                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                              size: 24.0,
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                            Padding(
                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(25.0, 10.0, 0.0, 10.0),
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  Expanded(
                                                                                                                                    child: TextFormField(
                                                                                                                                      controller: _model.tileNameController,
                                                                                                                                      focusNode: _model.tileNameFocusNode,
                                                                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                                                                        '_model.tileNameController',
                                                                                                                                        const Duration(milliseconds: 2000),
                                                                                                                                        () => setState(() {}),
                                                                                                                                      ),
                                                                                                                                      obscureText: false,
                                                                                                                                      decoration: InputDecoration(
                                                                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                                                                        hintText: 'Give your tile a name',
                                                                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                                              fontSize: 16.0,
                                                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                                                            ),
                                                                                                                                        enabledBorder: OutlineInputBorder(
                                                                                                                                          borderSide: BorderSide(
                                                                                                                                            color: FlutterFlowTheme.of(context).btnBk,
                                                                                                                                            width: 2.0,
                                                                                                                                          ),
                                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                                        ),
                                                                                                                                        focusedBorder: OutlineInputBorder(
                                                                                                                                          borderSide: const BorderSide(
                                                                                                                                            color: Color(0xFF1AADF9),
                                                                                                                                            width: 2.0,
                                                                                                                                          ),
                                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                                        ),
                                                                                                                                        errorBorder: OutlineInputBorder(
                                                                                                                                          borderSide: BorderSide(
                                                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                                                            width: 2.0,
                                                                                                                                          ),
                                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                                        ),
                                                                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                                                                          borderSide: BorderSide(
                                                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                                                            width: 2.0,
                                                                                                                                          ),
                                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                      cursorColor: FlutterFlowTheme.of(context).customColor7,
                                                                                                                                      validator: _model.tileNameControllerValidator.asValidator(context),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                                                                    child: InkWell(
                                                                                                                                      splashColor: Colors.transparent,
                                                                                                                                      focusColor: Colors.transparent,
                                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                                      onTap: () async {
                                                                                                                                        logFirebaseEvent('FEATURED_Container_6kzei3xo_ON_TAP');
                                                                                                                                        var shouldSetState = false;
                                                                                                                                        if (_model.tileNameController.text != '') {
                                                                                                                                          logFirebaseEvent('Container_backend_call');

                                                                                                                                          var tilesv2RecordReference = Tilesv2Record.collection.doc();
                                                                                                                                          await tilesv2RecordReference.set({
                                                                                                                                            ...createTilesv2RecordData(
                                                                                                                                              createdTime: getCurrentTimestamp,
                                                                                                                                              updatedTime: getCurrentTimestamp,
                                                                                                                                              user: currentUserReference,
                                                                                                                                              uid: currentUserUid,
                                                                                                                                              type: 'Content',
                                                                                                                                              title: _model.tileNameController.text,
                                                                                                                                              subtitle: '',
                                                                                                                                              details: '',
                                                                                                                                              image: '',
                                                                                                                                              thumbnail: '',
                                                                                                                                              isPublished: false,
                                                                                                                                              layout: '',
                                                                                                                                              category: '',
                                                                                                                                              isPublic: false,
                                                                                                                                              isPinned: false,
                                                                                                                                              isFeatured: false,
                                                                                                                                              parentId: FFAppState().viewTileContentId,
                                                                                                                                              tileTier: valueOrDefault<int>(
                                                                                                                                                valueOrDefault<int>(
                                                                                                                                                      featuredPageTilesv2RecordList
                                                                                                                                                          .where((e) => valueOrDefault<bool>(
                                                                                                                                                                e.reference.id == FFAppState().viewTileContentId,
                                                                                                                                                                false,
                                                                                                                                                              ))
                                                                                                                                                          .toList()
                                                                                                                                                          .first
                                                                                                                                                          .tileTier,
                                                                                                                                                      0,
                                                                                                                                                    ) ??
                                                                                                                                                    0 + 1,
                                                                                                                                                1,
                                                                                                                                              ),
                                                                                                                                              tileIndex: valueOrDefault<int>(
                                                                                                                                                    featuredPageTilesv2RecordList
                                                                                                                                                        .where((e) => valueOrDefault<bool>(
                                                                                                                                                              e.parentId == FFAppState().viewTileContentId,
                                                                                                                                                              false,
                                                                                                                                                            ))
                                                                                                                                                        .toList()
                                                                                                                                                        .length,
                                                                                                                                                    0,
                                                                                                                                                  ) ??
                                                                                                                                                  0,
                                                                                                                                              isContent: false,
                                                                                                                                              tileId: '',
                                                                                                                                              tileType: 'Content',
                                                                                                                                              tileName: '${featuredPageTilesv2RecordList.where((e) => valueOrDefault<bool>(
                                                                                                                                                    e.reference.id == FFAppState().viewTileContentId,
                                                                                                                                                    false,
                                                                                                                                                  )).toList().first.title} - Tile ${(valueOrDefault<int>(
                                                                                                                                                    featuredPageTilesv2RecordList
                                                                                                                                                        .where((e) => valueOrDefault<bool>(
                                                                                                                                                              e.parentId == FFAppState().viewTileContentId,
                                                                                                                                                              false,
                                                                                                                                                            ))
                                                                                                                                                        .toList()
                                                                                                                                                        .length,
                                                                                                                                                    0,
                                                                                                                                                  ) ?? 0 + 1).toString()}',
                                                                                                                                              tileStatus: 'Draft',
                                                                                                                                            ),
                                                                                                                                            ...mapToFirestore(
                                                                                                                                              {
                                                                                                                                                'tags': [''],
                                                                                                                                                'access_users': [FFAppState().tileNav.tier0Id],
                                                                                                                                                'access_groups': [FFAppState().tileNav.tier0Id],
                                                                                                                                                'admin_users': [currentUserUid],
                                                                                                                                              },
                                                                                                                                            ),
                                                                                                                                          });
                                                                                                                                          _model.newChildTile = Tilesv2Record.getDocumentFromData({
                                                                                                                                            ...createTilesv2RecordData(
                                                                                                                                              createdTime: getCurrentTimestamp,
                                                                                                                                              updatedTime: getCurrentTimestamp,
                                                                                                                                              user: currentUserReference,
                                                                                                                                              uid: currentUserUid,
                                                                                                                                              type: 'Content',
                                                                                                                                              title: _model.tileNameController.text,
                                                                                                                                              subtitle: '',
                                                                                                                                              details: '',
                                                                                                                                              image: '',
                                                                                                                                              thumbnail: '',
                                                                                                                                              isPublished: false,
                                                                                                                                              layout: '',
                                                                                                                                              category: '',
                                                                                                                                              isPublic: false,
                                                                                                                                              isPinned: false,
                                                                                                                                              isFeatured: false,
                                                                                                                                              parentId: FFAppState().viewTileContentId,
                                                                                                                                              tileTier: valueOrDefault<int>(
                                                                                                                                                valueOrDefault<int>(
                                                                                                                                                      featuredPageTilesv2RecordList
                                                                                                                                                          .where((e) => valueOrDefault<bool>(
                                                                                                                                                                e.reference.id == FFAppState().viewTileContentId,
                                                                                                                                                                false,
                                                                                                                                                              ))
                                                                                                                                                          .toList()
                                                                                                                                                          .first
                                                                                                                                                          .tileTier,
                                                                                                                                                      0,
                                                                                                                                                    ) ??
                                                                                                                                                    0 + 1,
                                                                                                                                                1,
                                                                                                                                              ),
                                                                                                                                              tileIndex: valueOrDefault<int>(
                                                                                                                                                    featuredPageTilesv2RecordList
                                                                                                                                                        .where((e) => valueOrDefault<bool>(
                                                                                                                                                              e.parentId == FFAppState().viewTileContentId,
                                                                                                                                                              false,
                                                                                                                                                            ))
                                                                                                                                                        .toList()
                                                                                                                                                        .length,
                                                                                                                                                    0,
                                                                                                                                                  ) ??
                                                                                                                                                  0,
                                                                                                                                              isContent: false,
                                                                                                                                              tileId: '',
                                                                                                                                              tileType: 'Content',
                                                                                                                                              tileName: '${featuredPageTilesv2RecordList.where((e) => valueOrDefault<bool>(
                                                                                                                                                    e.reference.id == FFAppState().viewTileContentId,
                                                                                                                                                    false,
                                                                                                                                                  )).toList().first.title} - Tile ${(valueOrDefault<int>(
                                                                                                                                                    featuredPageTilesv2RecordList
                                                                                                                                                        .where((e) => valueOrDefault<bool>(
                                                                                                                                                              e.parentId == FFAppState().viewTileContentId,
                                                                                                                                                              false,
                                                                                                                                                            ))
                                                                                                                                                        .toList()
                                                                                                                                                        .length,
                                                                                                                                                    0,
                                                                                                                                                  ) ?? 0 + 1).toString()}',
                                                                                                                                              tileStatus: 'Draft',
                                                                                                                                            ),
                                                                                                                                            ...mapToFirestore(
                                                                                                                                              {
                                                                                                                                                'tags': [''],
                                                                                                                                                'access_users': [FFAppState().tileNav.tier0Id],
                                                                                                                                                'access_groups': [FFAppState().tileNav.tier0Id],
                                                                                                                                                'admin_users': [currentUserUid],
                                                                                                                                              },
                                                                                                                                            ),
                                                                                                                                          }, tilesv2RecordReference);
                                                                                                                                          shouldSetState = true;
                                                                                                                                        } else {
                                                                                                                                          logFirebaseEvent('Container_show_snack_bar');
                                                                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                                            SnackBar(
                                                                                                                                              content: Text(
                                                                                                                                                'Give your tile a name',
                                                                                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                              duration: const Duration(milliseconds: 4000),
                                                                                                                                              backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                                                                            ),
                                                                                                                                          );
                                                                                                                                          if (shouldSetState) setState(() {});
                                                                                                                                          return;
                                                                                                                                        }

                                                                                                                                        logFirebaseEvent('Container_backend_call');

                                                                                                                                        await _model.newChildTile!.reference.update(createTilesv2RecordData(
                                                                                                                                          tileId: _model.newChildTile?.reference.id,
                                                                                                                                          tileName: _model.newChildTile?.title,
                                                                                                                                        ));
                                                                                                                                        logFirebaseEvent('Container_reset_form_fields');
                                                                                                                                        setState(() {
                                                                                                                                          _model.tileNameController?.clear();
                                                                                                                                          _model.blockNameController?.clear();
                                                                                                                                        });
                                                                                                                                        logFirebaseEvent('Container_update_app_state');
                                                                                                                                        FFAppState().viewTileContentId = _model.newChildTile!.reference.id;
                                                                                                                                        FFAppState().drawerCurrentId = _model.newChildTile!.reference.id;
                                                                                                                                        FFAppState().addToNavPath(_model.newChildTile!.reference.id);
                                                                                                                                        logFirebaseEvent('Container_update_page_state');
                                                                                                                                        setState(() {
                                                                                                                                          _model.showTileCreate = false;
                                                                                                                                        });
                                                                                                                                        if (shouldSetState) setState(() {});
                                                                                                                                      },
                                                                                                                                      child: Container(
                                                                                                                                        decoration: BoxDecoration(
                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                                          border: Border.all(
                                                                                                                                            color: FlutterFlowTheme.of(context).accent1,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        child: Row(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          children: [
                                                                                                                                            FlutterFlowIconButton(
                                                                                                                                              borderColor: Colors.transparent,
                                                                                                                                              borderRadius: 30.0,
                                                                                                                                              borderWidth: 1.0,
                                                                                                                                              buttonSize: 40.0,
                                                                                                                                              icon: Icon(
                                                                                                                                                Icons.add,
                                                                                                                                                color: FlutterFlowTheme.of(context).darkercolour,
                                                                                                                                                size: 20.0,
                                                                                                                                              ),
                                                                                                                                              onPressed: () {
                                                                                                                                                print('IconButton pressed ...');
                                                                                                                                              },
                                                                                                                                            ),
                                                                                                                                            Padding(
                                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                                                              child: Text(
                                                                                                                                                'Create ',
                                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    AnimatedContainer(
                                                                                                                      duration: const Duration(milliseconds: 100),
                                                                                                                      curve: Curves.easeInOut,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      ),
                                                                                                                      child: Visibility(
                                                                                                                        visible: valueOrDefault<bool>(
                                                                                                                          _model.showBlockCreate,
                                                                                                                          false,
                                                                                                                        ),
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: [
                                                                                                                                Expanded(
                                                                                                                                  child: Padding(
                                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                                                                                                                                    child: Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                      children: [
                                                                                                                                        Expanded(
                                                                                                                                          child: Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              Container(
                                                                                                                                                width: 50.0,
                                                                                                                                                height: 50.0,
                                                                                                                                                decoration: BoxDecoration(
                                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                ),
                                                                                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                                                child: Align(
                                                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                                                  child: Container(
                                                                                                                                                    width: 32.0,
                                                                                                                                                    height: 32.0,
                                                                                                                                                    decoration: const BoxDecoration(
                                                                                                                                                      color: Color(0xFF1AADF9),
                                                                                                                                                      shape: BoxShape.circle,
                                                                                                                                                    ),
                                                                                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                                                    child: Text(
                                                                                                                                                      '>',
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
                                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                                                child: Text(
                                                                                                                                                  'Block Name',
                                                                                                                                                  style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Container(
                                                                                                                                          width: 50.0,
                                                                                                                                          height: 50.0,
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                          ),
                                                                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                                          child: InkWell(
                                                                                                                                            splashColor: Colors.transparent,
                                                                                                                                            focusColor: Colors.transparent,
                                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                                            onTap: () async {
                                                                                                                                              logFirebaseEvent('FEATURED_PAGE_PAGE_Icon_soyxtg0e_ON_TAP');
                                                                                                                                              logFirebaseEvent('Icon_reset_form_fields');
                                                                                                                                              setState(() {
                                                                                                                                                _model.tileNameController?.clear();
                                                                                                                                              });
                                                                                                                                              logFirebaseEvent('Icon_update_page_state');
                                                                                                                                              setState(() {
                                                                                                                                                _model.showTileCreate = false;
                                                                                                                                                _model.showBlockCreate = false;
                                                                                                                                              });
                                                                                                                                            },
                                                                                                                                            child: Icon(
                                                                                                                                              Icons.cancel_outlined,
                                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                              size: 24.0,
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                            if (valueOrDefault<bool>(currentUserDocument?.isadmin, false) == true)
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(25.0, 10.0, 0.0, 10.0),
                                                                                                                                child: AuthUserStreamWidget(
                                                                                                                                  builder: (context) => Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Expanded(
                                                                                                                                        child: Padding(
                                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 16.0, 0.0),
                                                                                                                                          child: TextFormField(
                                                                                                                                            controller: _model.blockNameController,
                                                                                                                                            focusNode: _model.blockNameFocusNode,
                                                                                                                                            onChanged: (_) => EasyDebounce.debounce(
                                                                                                                                              '_model.blockNameController',
                                                                                                                                              const Duration(milliseconds: 2000),
                                                                                                                                              () => setState(() {}),
                                                                                                                                            ),
                                                                                                                                            autofocus: true,
                                                                                                                                            obscureText: false,
                                                                                                                                            decoration: InputDecoration(
                                                                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                                                    fontSize: 16.0,
                                                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                                                                  ),
                                                                                                                                              hintText: 'Give your tile block a name',
                                                                                                                                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                                                                    fontSize: 16.0,
                                                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                                                                  ),
                                                                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                                                                borderSide: BorderSide(
                                                                                                                                                  color: FlutterFlowTheme.of(context).btnBk,
                                                                                                                                                  width: 2.0,
                                                                                                                                                ),
                                                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                                              ),
                                                                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                                                                borderSide: const BorderSide(
                                                                                                                                                  color: Color(0xFF1AADF9),
                                                                                                                                                  width: 2.0,
                                                                                                                                                ),
                                                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                                              ),
                                                                                                                                              errorBorder: OutlineInputBorder(
                                                                                                                                                borderSide: BorderSide(
                                                                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                                                                  width: 2.0,
                                                                                                                                                ),
                                                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                                              ),
                                                                                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                                                                                borderSide: BorderSide(
                                                                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                                                                  width: 2.0,
                                                                                                                                                ),
                                                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                            cursorColor: FlutterFlowTheme.of(context).customColor7,
                                                                                                                                            validator: _model.blockNameControllerValidator.asValidator(context),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Padding(
                                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                                        child: InkWell(
                                                                                                                                          splashColor: Colors.transparent,
                                                                                                                                          focusColor: Colors.transparent,
                                                                                                                                          hoverColor: Colors.transparent,
                                                                                                                                          highlightColor: Colors.transparent,
                                                                                                                                          onTap: () async {
                                                                                                                                            logFirebaseEvent('FEATURED_Container_qo69taeb_ON_TAP');
                                                                                                                                            var shouldSetState = false;
                                                                                                                                            if (_model.blockNameController.text != '') {
                                                                                                                                              logFirebaseEvent('Container_backend_call');

                                                                                                                                              var tileBlocksRecordReference = TileBlocksRecord.collection.doc();
                                                                                                                                              await tileBlocksRecordReference.set({
                                                                                                                                                ...createTileBlocksRecordData(
                                                                                                                                                  createdTime: getCurrentTimestamp,
                                                                                                                                                  updatedTime: getCurrentTimestamp,
                                                                                                                                                  user: currentUserReference,
                                                                                                                                                  uid: currentUserUid,
                                                                                                                                                  blockId: '',
                                                                                                                                                  blockType: 'Text',
                                                                                                                                                  blockIndex: containerTileBlocksRecordList
                                                                                                                                                      .where((e) => valueOrDefault<bool>(
                                                                                                                                                            e.tileId == FFAppState().viewTileContentId,
                                                                                                                                                            false,
                                                                                                                                                          ))
                                                                                                                                                      .toList()
                                                                                                                                                      .length,
                                                                                                                                                  blockName: '${featuredPageTilesv2RecordList.where((e) => valueOrDefault<bool>(
                                                                                                                                                        e.reference.id == FFAppState().viewTileContentId,
                                                                                                                                                        false,
                                                                                                                                                      )).toList().first.title} - Block ${(valueOrDefault<int>(
                                                                                                                                                        containerTileBlocksRecordList
                                                                                                                                                            .where((e) => valueOrDefault<bool>(
                                                                                                                                                                  e.tileId == FFAppState().viewTileContentId,
                                                                                                                                                                  false,
                                                                                                                                                                ))
                                                                                                                                                            .toList()
                                                                                                                                                            .length,
                                                                                                                                                        0,
                                                                                                                                                      ) ?? 0 + 1).toString()}',
                                                                                                                                                  blockStatus: 'Draft',
                                                                                                                                                  tileId: FFAppState().viewTileContentId,
                                                                                                                                                  image: '',
                                                                                                                                                  thumbnail: '',
                                                                                                                                                  isDefaultTheme: true,
                                                                                                                                                  blockLayout: 'Header',
                                                                                                                                                  blockTitle: '${featuredPageTilesv2RecordList.where((e) => valueOrDefault<bool>(
                                                                                                                                                        e.reference.id == FFAppState().viewTileContentId,
                                                                                                                                                        false,
                                                                                                                                                      )).toList().first.title} - Block ${(valueOrDefault<int>(
                                                                                                                                                        containerTileBlocksRecordList
                                                                                                                                                            .where((e) => valueOrDefault<bool>(
                                                                                                                                                                  e.tileId == FFAppState().viewTileContentId,
                                                                                                                                                                  false,
                                                                                                                                                                ))
                                                                                                                                                            .toList()
                                                                                                                                                            .length,
                                                                                                                                                        0,
                                                                                                                                                      ) ?? 0 + 1).toString()}',
                                                                                                                                                  blockSubtitle: '',
                                                                                                                                                  video: '',
                                                                                                                                                  audio: '',
                                                                                                                                                  text: '',
                                                                                                                                                  header: '',
                                                                                                                                                  subtitle: '',
                                                                                                                                                  title: _model.blockNameController.text,
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
                                                                                                                                              _model.newBlock = TileBlocksRecord.getDocumentFromData({
                                                                                                                                                ...createTileBlocksRecordData(
                                                                                                                                                  createdTime: getCurrentTimestamp,
                                                                                                                                                  updatedTime: getCurrentTimestamp,
                                                                                                                                                  user: currentUserReference,
                                                                                                                                                  uid: currentUserUid,
                                                                                                                                                  blockId: '',
                                                                                                                                                  blockType: 'Text',
                                                                                                                                                  blockIndex: containerTileBlocksRecordList
                                                                                                                                                      .where((e) => valueOrDefault<bool>(
                                                                                                                                                            e.tileId == FFAppState().viewTileContentId,
                                                                                                                                                            false,
                                                                                                                                                          ))
                                                                                                                                                      .toList()
                                                                                                                                                      .length,
                                                                                                                                                  blockName: '${featuredPageTilesv2RecordList.where((e) => valueOrDefault<bool>(
                                                                                                                                                        e.reference.id == FFAppState().viewTileContentId,
                                                                                                                                                        false,
                                                                                                                                                      )).toList().first.title} - Block ${(valueOrDefault<int>(
                                                                                                                                                        containerTileBlocksRecordList
                                                                                                                                                            .where((e) => valueOrDefault<bool>(
                                                                                                                                                                  e.tileId == FFAppState().viewTileContentId,
                                                                                                                                                                  false,
                                                                                                                                                                ))
                                                                                                                                                            .toList()
                                                                                                                                                            .length,
                                                                                                                                                        0,
                                                                                                                                                      ) ?? 0 + 1).toString()}',
                                                                                                                                                  blockStatus: 'Draft',
                                                                                                                                                  tileId: FFAppState().viewTileContentId,
                                                                                                                                                  image: '',
                                                                                                                                                  thumbnail: '',
                                                                                                                                                  isDefaultTheme: true,
                                                                                                                                                  blockLayout: 'Header',
                                                                                                                                                  blockTitle: '${featuredPageTilesv2RecordList.where((e) => valueOrDefault<bool>(
                                                                                                                                                        e.reference.id == FFAppState().viewTileContentId,
                                                                                                                                                        false,
                                                                                                                                                      )).toList().first.title} - Block ${(valueOrDefault<int>(
                                                                                                                                                        containerTileBlocksRecordList
                                                                                                                                                            .where((e) => valueOrDefault<bool>(
                                                                                                                                                                  e.tileId == FFAppState().viewTileContentId,
                                                                                                                                                                  false,
                                                                                                                                                                ))
                                                                                                                                                            .toList()
                                                                                                                                                            .length,
                                                                                                                                                        0,
                                                                                                                                                      ) ?? 0 + 1).toString()}',
                                                                                                                                                  blockSubtitle: '',
                                                                                                                                                  video: '',
                                                                                                                                                  audio: '',
                                                                                                                                                  text: '',
                                                                                                                                                  header: '',
                                                                                                                                                  subtitle: '',
                                                                                                                                                  title: _model.blockNameController.text,
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
                                                                                                                                              shouldSetState = true;
                                                                                                                                              logFirebaseEvent('Container_backend_call');

                                                                                                                                              await _model.newBlock!.reference.update(createTileBlocksRecordData(
                                                                                                                                                blockId: _model.newBlock?.reference.id,
                                                                                                                                              ));
                                                                                                                                              logFirebaseEvent('Container_update_app_state');
                                                                                                                                              setState(() {
                                                                                                                                                FFAppState().drawerStartTab = 2;
                                                                                                                                                FFAppState().drawerCurrentId = FFAppState().viewTileContentId;
                                                                                                                                                FFAppState().drawerBlockId = FFAppState().drawerBlockId;
                                                                                                                                              });
                                                                                                                                              logFirebaseEvent('Container_drawer');
                                                                                                                                              scaffoldKey.currentState!.openEndDrawer();
                                                                                                                                            } else {
                                                                                                                                              logFirebaseEvent('Container_show_snack_bar');
                                                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                                                SnackBar(
                                                                                                                                                  content: Text(
                                                                                                                                                    'Give your tile a name',
                                                                                                                                                    style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                                                                        ),
                                                                                                                                                  ),
                                                                                                                                                  duration: const Duration(milliseconds: 4000),
                                                                                                                                                  backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                                                                                ),
                                                                                                                                              );
                                                                                                                                              if (shouldSetState) setState(() {});
                                                                                                                                              return;
                                                                                                                                            }

                                                                                                                                            if (shouldSetState) setState(() {});
                                                                                                                                          },
                                                                                                                                          child: Container(
                                                                                                                                            decoration: BoxDecoration(
                                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                                                              border: Border.all(
                                                                                                                                                color: FlutterFlowTheme.of(context).accent1,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                            child: Row(
                                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                                              children: [
                                                                                                                                                FlutterFlowIconButton(
                                                                                                                                                  borderColor: Colors.transparent,
                                                                                                                                                  borderRadius: 30.0,
                                                                                                                                                  borderWidth: 1.0,
                                                                                                                                                  buttonSize: 40.0,
                                                                                                                                                  icon: Icon(
                                                                                                                                                    Icons.add,
                                                                                                                                                    color: FlutterFlowTheme.of(context).darkercolour,
                                                                                                                                                    size: 20.0,
                                                                                                                                                  ),
                                                                                                                                                  onPressed: () {
                                                                                                                                                    print('IconButton pressed ...');
                                                                                                                                                  },
                                                                                                                                                ),
                                                                                                                                                Padding(
                                                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                                                                  child: Text(
                                                                                                                                                    'Create ',
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                                                                                                                            child: FlutterFlowIconButton(
                                                                                                                              borderColor: Colors.transparent,
                                                                                                                              borderRadius: 30.0,
                                                                                                                              borderWidth: 1.0,
                                                                                                                              buttonSize: 50.0,
                                                                                                                              icon: FaIcon(
                                                                                                                                FontAwesomeIcons.gripVertical,
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                size: 30.0,
                                                                                                                              ),
                                                                                                                              onPressed: () {
                                                                                                                                print('IconButton pressed ...');
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Expanded(
                                                                                                                            child: Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                              children: [
                                                                                                                                if (valueOrDefault<bool>(
                                                                                                                                  () {
                                                                                                                                    if (FFAppState().viewTileContentId == '') {
                                                                                                                                      return (FFAppState().tileNav.tier2Id == '');
                                                                                                                                    } else if (FFAppState().tileNav.tier2Id == '') {
                                                                                                                                      return false;
                                                                                                                                    } else if (FFAppState().tileNav.tier2Id == '0') {
                                                                                                                                      return false;
                                                                                                                                    } else {
                                                                                                                                      return true;
                                                                                                                                    }
                                                                                                                                  }(),
                                                                                                                                  false,
                                                                                                                                ))
                                                                                                                                  Expanded(
                                                                                                                                    child: Builder(
                                                                                                                                      builder: (context) {
                                                                                                                                        final pathjTile = featuredPageTilesv2RecordList
                                                                                                                                            .where((e) => valueOrDefault<bool>(
                                                                                                                                                  e.parentId == FFAppState().viewTileContentId,
                                                                                                                                                  false,
                                                                                                                                                ))
                                                                                                                                            .toList();
                                                                                                                                        return SingleChildScrollView(
                                                                                                                                          scrollDirection: Axis.horizontal,
                                                                                                                                          controller: _model.navPath1,
                                                                                                                                          child: Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: List.generate(pathjTile.length, (pathjTileIndex) {
                                                                                                                                              final pathjTileItem = pathjTile[pathjTileIndex];
                                                                                                                                              return Padding(
                                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                                                                child: InkWell(
                                                                                                                                                  splashColor: Colors.transparent,
                                                                                                                                                  focusColor: Colors.transparent,
                                                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                                                  onTap: () async {
                                                                                                                                                    logFirebaseEvent('FEATURED_Container_nj261y10_ON_TAP');
                                                                                                                                                    logFirebaseEvent('Container_update_app_state');
                                                                                                                                                    setState(() {
                                                                                                                                                      FFAppState().addToNavPath(pathjTileItem.reference.id);
                                                                                                                                                      FFAppState().viewTileContentId = pathjTileItem.reference.id;
                                                                                                                                                    });
                                                                                                                                                    logFirebaseEvent('Container_clear_text_fields_pin_codes');
                                                                                                                                                    setState(() {
                                                                                                                                                      _model.tileNameController?.clear();
                                                                                                                                                      _model.blockNameController?.clear();
                                                                                                                                                    });
                                                                                                                                                    logFirebaseEvent('Container_update_page_state');
                                                                                                                                                    setState(() {
                                                                                                                                                      _model.showTileCreate = false;
                                                                                                                                                      _model.showBlockCreate = false;
                                                                                                                                                    });
                                                                                                                                                  },
                                                                                                                                                  child: Container(
                                                                                                                                                    height: 38.0,
                                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                                                                      border: Border.all(
                                                                                                                                                        color: const Color(0xFF1AADF9),
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                    child: Align(
                                                                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                                                      child: Padding(
                                                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 16.0, 0.0),
                                                                                                                                                        child: Text(
                                                                                                                                                          pathjTileItem.title,
                                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                                                                                                if (valueOrDefault<bool>(
                                                                                                                                      () {
                                                                                                                                        if (FFAppState().viewTileContentId == '') {
                                                                                                                                          return (FFAppState().tileNav.tier1Id == '');
                                                                                                                                        } else if (FFAppState().tileNav.tier2Id == '') {
                                                                                                                                          return false;
                                                                                                                                        } else if (FFAppState().tileNav.tier1Id == '0') {
                                                                                                                                          return false;
                                                                                                                                        } else if (featuredPageTilesv2RecordList
                                                                                                                                                .where((e) => valueOrDefault<bool>(
                                                                                                                                                      e.reference.id == FFAppState().viewTileContentId,
                                                                                                                                                      false,
                                                                                                                                                    ))
                                                                                                                                                .toList()
                                                                                                                                                .first
                                                                                                                                                .tileIndex ==
                                                                                                                                            featuredPageTilesv2RecordList
                                                                                                                                                .where((e) => valueOrDefault<bool>(
                                                                                                                                                      e.parentId == e.parentId,
                                                                                                                                                      false,
                                                                                                                                                    ))
                                                                                                                                                .toList()
                                                                                                                                                .length) {
                                                                                                                                          return false;
                                                                                                                                        } else {
                                                                                                                                          return true;
                                                                                                                                        }
                                                                                                                                      }(),
                                                                                                                                      false,
                                                                                                                                    ) &&
                                                                                                                                    responsiveVisibility(
                                                                                                                                      context: context,
                                                                                                                                      phone: false,
                                                                                                                                      tablet: false,
                                                                                                                                      tabletLandscape: false,
                                                                                                                                      desktop: false,
                                                                                                                                    ))
                                                                                                                                  Padding(
                                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                                                                                                                                    child: Container(
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        color: FlutterFlowTheme.of(context).customColor7,
                                                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                                                        border: Border.all(
                                                                                                                                          color: FlutterFlowTheme.of(context).customColor7,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      child: Padding(
                                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                                                                        child: Row(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          children: [
                                                                                                                                            FlutterFlowIconButton(
                                                                                                                                              borderColor: Colors.transparent,
                                                                                                                                              borderRadius: 30.0,
                                                                                                                                              borderWidth: 1.0,
                                                                                                                                              buttonSize: 40.0,
                                                                                                                                              icon: Icon(
                                                                                                                                                Icons.fast_forward_sharp,
                                                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                                                size: 20.0,
                                                                                                                                              ),
                                                                                                                                              onPressed: () {
                                                                                                                                                print('IconButton pressed ...');
                                                                                                                                              },
                                                                                                                                            ),
                                                                                                                                            Text(
                                                                                                                                              'Next',
                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        Expanded(
                                                                                                                          child: Padding(
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 20.0, 0.0),
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                              children: [
                                                                                                                                if (valueOrDefault<bool>(
                                                                                                                                  () {
                                                                                                                                    if (FFAppState().navPath.isNotEmpty) {
                                                                                                                                    return true;
                                                                                                                                  } else {
                                                                                                                                    return false;
                                                                                                                                  }
                                                                                                                                  }(),
                                                                                                                                  false,
                                                                                                                                ))
                                                                                                                                  Padding(
                                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                                                                    child: Row(
                                                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                                                      children: [
                                                                                                                                        Padding(
                                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                                                                                                                                          child: FlutterFlowIconButton(
                                                                                                                                            borderColor: Colors.transparent,
                                                                                                                                            borderRadius: 30.0,
                                                                                                                                            borderWidth: 1.0,
                                                                                                                                            buttonSize: 50.0,
                                                                                                                                            icon: Icon(
                                                                                                                                              Icons.history,
                                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                              size: 24.0,
                                                                                                                                            ),
                                                                                                                                            onPressed: () async {
                                                                                                                                              logFirebaseEvent('FEATURED_PAGE_PAGE_history_ICN_ON_TAP');
                                                                                                                                              logFirebaseEvent('IconButton_update_app_state');
                                                                                                                                              setState(() {
                                                                                                                                                FFAppState().navPath = FFAppState().navPath.take(3).toList().cast<String>();
                                                                                                                                                FFAppState().viewTileContentId = FFAppState().navPath.take(3).toList().last;
                                                                                                                                              });
                                                                                                                                            },
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Expanded(
                                                                                                                                          child: Container(
                                                                                                                                            decoration: BoxDecoration(
                                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                            ),
                                                                                                                                            child: Padding(
                                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                                                                                                                                              child: Builder(
                                                                                                                                                builder: (context) {
                                                                                                                                                  final navPath = (FFAppState().navPath.length <= 3 ? FFAppState().navPath : functions.subStringList(FFAppState().navPath.toList(), 2, FFAppState().navPath.length)).toList();
                                                                                                                                                  return SingleChildScrollView(
                                                                                                                                                    scrollDirection: Axis.horizontal,
                                                                                                                                                    controller: _model.navPath2,
                                                                                                                                                    child: Row(
                                                                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                                                                      children: List.generate(navPath.length, (navPathIndex) {
                                                                                                                                                        final navPathItem = navPath[navPathIndex];
                                                                                                                                                        return Padding(
                                                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                                                          child: InkWell(
                                                                                                                                                            splashColor: Colors.transparent,
                                                                                                                                                            focusColor: Colors.transparent,
                                                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                                                            onTap: () async {
                                                                                                                                                              logFirebaseEvent('FEATURED_Container_ozcvp9p0_ON_TAP');
                                                                                                                                                              logFirebaseEvent('Container_update_app_state');
                                                                                                                                                              setState(() {
                                                                                                                                                                FFAppState().navPath = FFAppState()
                                                                                                                                                                    .navPath
                                                                                                                                                                    .take(valueOrDefault<int>(
                                                                                                                                                                          navPathIndex,
                                                                                                                                                                          0,
                                                                                                                                                                        ) +
                                                                                                                                                                        1)
                                                                                                                                                                    .toList()
                                                                                                                                                                    .cast<String>();
                                                                                                                                                                FFAppState().viewTileContentId = navPathItem;
                                                                                                                                                              });
                                                                                                                                                            },
                                                                                                                                                            child: Container(
                                                                                                                                                              height: 32.0,
                                                                                                                                                              decoration: BoxDecoration(
                                                                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                                                              ),
                                                                                                                                                              child: Padding(
                                                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                                                                                child: Row(
                                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                                  children: [
                                                                                                                                                                    Text(
                                                                                                                                                                      navPathIndex == 0 ? featuredPageTilesv2RecordList.where((e) => e.reference.id == navPathItem).toList().first.title : '${featuredPageTilesv2RecordList.where((e) => e.reference.id == navPathItem).toList().first.tileTier.toString()} - ${featuredPageTilesv2RecordList.where((e) => e.reference.id == navPathItem).toList().first.title}',
                                                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                                                            color: valueOrDefault<Color>(
                                                                                                                                                                              valueOrDefault<bool>(
                                                                                                                                                                                FFAppState().navPath.last == navPathItem,
                                                                                                                                                                                false,
                                                                                                                                                                              )
                                                                                                                                                                                  ? const Color(0xFF1AADF9)
                                                                                                                                                                                  : FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                                            ),
                                                                                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                                                                          ),
                                                                                                                                                                    ),
                                                                                                                                                                    if (valueOrDefault<bool>(
                                                                                                                                                                      FFAppState().navPath.last != navPathItem,
                                                                                                                                                                      false,
                                                                                                                                                                    ))
                                                                                                                                                                      Padding(
                                                                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                                                                        child: Icon(
                                                                                                                                                                          Icons.keyboard_arrow_right,
                                                                                                                                                                          color: valueOrDefault<Color>(
                                                                                                                                                                            valueOrDefault<bool>(
                                                                                                                                                                              navPathIndex ==
                                                                                                                                                                                  (valueOrDefault<int>(
                                                                                                                                                                                        FFAppState().navPath.length,
                                                                                                                                                                                        0,
                                                                                                                                                                                      ) ??
                                                                                                                                                                                      0 - 1),
                                                                                                                                                                              false,
                                                                                                                                                                            )
                                                                                                                                                                                ? const Color(0xFF1AADF9)
                                                                                                                                                                                : FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                                          ),
                                                                                                                                                                          size: 20.0,
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
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            if (valueOrDefault<bool>(
                                                                                                              FFAppState().viewTileContentId != '',
                                                                                                              false,
                                                                                                            ))
                                                                                                              Builder(
                                                                                                                builder: (context) {
                                                                                                                  final tileContentBlock = containerTileBlocksRecordList
                                                                                                                      .where((e) => valueOrDefault<bool>(
                                                                                                                            e.tileId == FFAppState().viewTileContentId,
                                                                                                                            false,
                                                                                                                          ))
                                                                                                                      .toList();
                                                                                                                  return ListView.builder(
                                                                                                                    padding: EdgeInsets.zero,
                                                                                                                    shrinkWrap: true,
                                                                                                                    scrollDirection: Axis.vertical,
                                                                                                                    itemCount: tileContentBlock.length,
                                                                                                                    itemBuilder: (context, tileContentBlockIndex) {
                                                                                                                      final tileContentBlockItem = tileContentBlock[tileContentBlockIndex];
                                                                                                                      return Container(
                                                                                                                        width: double.infinity,
                                                                                                                        constraints: const BoxConstraints(
                                                                                                                          maxWidth: 960.0,
                                                                                                                        ),
                                                                                                                        decoration: const BoxDecoration(),
                                                                                                                        child: wrapWithModel(
                                                                                                                          model: _model.blockv3Models.getModel(
                                                                                                                            tileContentBlockItem.reference.id,
                                                                                                                            tileContentBlockIndex,
                                                                                                                          ),
                                                                                                                          updateCallback: () => setState(() {}),
                                                                                                                          updateOnChange: true,
                                                                                                                          child: Blockv3Widget(
                                                                                                                            key: Key(
                                                                                                                              'Keycpz_${tileContentBlockItem.reference.id}',
                                                                                                                            ),
                                                                                                                            tileBlock: tileContentBlockItem,
                                                                                                                            sessionId: containerSessionsRecordList.first,
                                                                                                                            companyDoc: containerCompaniesRecordList.first,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    },
                                                                                                                    controller: _model.listViewBlocks,
                                                                                                                  );
                                                                                                                },
                                                                                                              ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
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
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ));
      },
    );
  }
}
