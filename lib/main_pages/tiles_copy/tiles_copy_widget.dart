import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header_container_widget.dart';
import '/components/main_tile_content_old_widget.dart';
import '/components/no_access_widget.dart';
import '/components/side_menu_copy_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/testpage/components/edit_tile/edit_tile_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'tiles_copy_model.dart';
export 'tiles_copy_model.dart';

class TilesCopyWidget extends StatefulWidget {
  const TilesCopyWidget({
    super.key,
    this.tilesdoc,
    this.tilesdocref,
    this.categorydoc,
    this.categoryref,
    this.templatelist,
    this.featuredtiem,
    this.tileref,
    this.tilesref,
    this.tiledoc,
    this.historydoc,
    this.historyref,
    this.tile,
    this.createdTextBlockT,
    this.companies,
  });

  final TilesRecord? tilesdoc;
  final DocumentReference? tilesdocref;
  final DocumentsRecord? categorydoc;
  final DocumentReference? categoryref;
  final TemplatesRecord? templatelist;
  final FeaturedpagesRecord? featuredtiem;
  final DocumentReference? tileref;
  final DocumentReference? tilesref;
  final DocumentsRecord? tiledoc;
  final HistoryRecord? historydoc;
  final DocumentReference? historyref;
  final TilesRecord? tile;
  final DocumentReference? createdTextBlockT;
  final DocumentReference? companies;

  @override
  State<TilesCopyWidget> createState() => _TilesCopyWidgetState();
}

class _TilesCopyWidgetState extends State<TilesCopyWidget>
    with TickerProviderStateMixin {
  late TilesCopyModel _model;

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
    _model = createModel(context, () => TilesCopyModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'tilesCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TILES_COPY_PAGE_tilesCopy_ON_INIT_STATE');
      logFirebaseEvent('tilesCopy_update_page_state');
      setState(() {
        _model.showsubs = true;
      });
      logFirebaseEvent('tilesCopy_update_app_state');
      setState(() {
        FFAppState().showmenuopen = false;
        FFAppState().drawerMenu = false;
      });
      if (FFAppState().selectedParentRef == null) {
        logFirebaseEvent('tilesCopy_update_app_state');
        setState(() {
          FFAppState().lasttiletouched = currentUserDocument?.startingtile;
        });
      }
      logFirebaseEvent('tilesCopy_update_app_state');
      setState(() {
        FFAppState().selectedParentRef = FFAppState().lasttiletouched;
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
        title: 'tilesCopy',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('TILES_COPY_PAGE_Row_jicni69a_ON_TAP');
                  logFirebaseEvent('Row_update_app_state');
                  FFAppState().update(() {
                    FFAppState().drawerMenu = false;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10.0,
                          sigmaY: 10.0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            MouseRegion(
                              opaque: false,
                              cursor: MouseCursor.defer ?? MouseCursor.defer,
                              onEnter: ((event) async {
                                setState(
                                    () => _model.mouseRegionHovered1 = true);
                                logFirebaseEvent(
                                    'TILES_COPY_MouseRegion_2ri2gr7o_ON_TOGGL');
                                logFirebaseEvent(
                                    'MouseRegion_update_app_state');
                                setState(() {
                                  FFAppState().showmenuopen = true;
                                });
                              }),
                              onExit: ((event) async {
                                setState(
                                    () => _model.mouseRegionHovered1 = false);
                                logFirebaseEvent(
                                    'TILES_COPY_MouseRegion_2ri2gr7o_ON_TOGGL');
                                logFirebaseEvent(
                                    'MouseRegion_update_app_state');
                                setState(() {
                                  FFAppState().showmenuopen = false;
                                });
                              }),
                              child: Visibility(
                                visible: responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 40.0,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            FlutterFlowTheme.of(context)
                                                .secondary
                                          ],
                                          stops: const [0.0, 1.0],
                                          begin:
                                              const AlignmentDirectional(0.0, -1.0),
                                          end: const AlignmentDirectional(0, 1.0),
                                        ),
                                      ),
                                      child: wrapWithModel(
                                        model: _model.sideMenuCopyModel,
                                        updateCallback: () => setState(() {}),
                                        child: const SideMenuCopyWidget(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            MouseRegion(
                              opaque: false,
                              cursor: MouseCursor.defer ?? MouseCursor.defer,
                              onEnter: ((event) async {
                                setState(
                                    () => _model.mouseRegionHovered2 = true);
                                logFirebaseEvent(
                                    'TILES_COPY_MouseRegion_nrsoggtc_ON_TOGGL');
                                logFirebaseEvent(
                                    'MouseRegion_update_app_state');
                                setState(() {
                                  FFAppState().showmenuopen = true;
                                  FFAppState().drawerMenu = true;
                                });
                              }),
                              onExit: ((event) async {
                                setState(
                                    () => _model.mouseRegionHovered2 = false);
                                logFirebaseEvent(
                                    'TILES_COPY_MouseRegion_nrsoggtc_ON_TOGGL');
                                logFirebaseEvent(
                                    'MouseRegion_update_app_state');
                                setState(() {
                                  FFAppState().showmenuopen = false;
                                  FFAppState().drawerMenu = false;
                                });
                              }),
                              child: Visibility(
                                visible: FFAppState().showmenuopen == true,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 230.0,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.sideMenuModel,
                                          updateCallback: () => setState(() {}),
                                          child: SideMenuWidget(
                                            action: () async {},
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
                    Expanded(
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10.0,
                            sigmaY: 10.0,
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'TILES_COPY_Container_17rs3krc_ON_TAP');
                              logFirebaseEvent('Container_update_app_state');
                              setState(() {
                                FFAppState().showmenuopen = false;
                                FFAppState().drawerMenu = false;
                              });
                            },
                            child: Container(
                              width: 100.0,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  wrapWithModel(
                                    model: _model.headerContainerModel,
                                    updateCallback: () => setState(() {}),
                                    updateOnChange: true,
                                    child: HeaderContainerWidget(
                                      action: () async {},
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [],
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      child: Stack(
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if ((currentUserDocument
                                                                              ?.hasaccess
                                                                              .toList() ??
                                                                          [])
                                                                      .contains(
                                                                          FFAppState()
                                                                              .selectedcategory) &&
                                                                  responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                    tabletLandscape:
                                                                        false,
                                                                  ))
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              Container(
                                                                        width:
                                                                            370.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            Visibility(
                                                                          visible: (currentUserDocument?.hasaccess.toList() ?? []).contains(FFAppState().selectedcategory) &&
                                                                              responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                                tablet: false,
                                                                              ),
                                                                          child:
                                                                              StreamBuilder<List<TilesRecord>>(
                                                                            stream:
                                                                                queryTilesRecord(
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
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<TilesRecord> listViewWebTilesRecordList = snapshot.data!;
                                                                              return ListView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                primary: false,
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: listViewWebTilesRecordList.length,
                                                                                itemBuilder: (context, listViewWebIndex) {
                                                                                  final listViewWebTilesRecord = listViewWebTilesRecordList[listViewWebIndex];
                                                                                  return Visibility(
                                                                                    visible: listViewWebTilesRecord.isFeatured != true,
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: SingleChildScrollView(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  if ((listViewWebTilesRecord.show == true) && (listViewWebTilesRecord.isFeatured != true))
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsets.all(10.0),
                                                                                                      child: Container(
                                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).accent4,
                                                                                                          boxShadow: const [
                                                                                                            BoxShadow(
                                                                                                              blurRadius: 3.0,
                                                                                                              color: Color(0x411D2429),
                                                                                                              offset: Offset(0.0, 1.0),
                                                                                                            )
                                                                                                          ],
                                                                                                          borderRadius: BorderRadius.circular(13.0),
                                                                                                          border: Border.all(
                                                                                                            color: FFAppState().SelectedTileRef == listViewWebTilesRecord.reference ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          ),
                                                                                                        ),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            const Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              children: [],
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: Padding(
                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 4.0, 0.0),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: 100.0,
                                                                                                                            height: 100.0,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                            ),
                                                                                                                            child: ClipRRect(
                                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                                              child: Image.network(
                                                                                                                                listViewWebTilesRecord.image,
                                                                                                                                width: 250.0,
                                                                                                                                height: 75.0,
                                                                                                                                fit: BoxFit.cover,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
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
                                                                                                                            listViewWebTilesRecord.title,
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
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  if (valueOrDefault<bool>(currentUserDocument?.isadmin, false) == true)
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
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
                                                                                                                    if (valueOrDefault<bool>(currentUserDocument?.isadmin, false) == true)
                                                                                                                      FlutterFlowIconButton(
                                                                                                                        borderColor: FlutterFlowTheme.of(context).primary,
                                                                                                                        borderRadius: 20.0,
                                                                                                                        borderWidth: 1.0,
                                                                                                                        buttonSize: 40.0,
                                                                                                                        fillColor: FlutterFlowTheme.of(context).info,
                                                                                                                        icon: Icon(
                                                                                                                          Icons.mode_edit,
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          size: 24.0,
                                                                                                                        ),
                                                                                                                        onPressed: () async {
                                                                                                                          logFirebaseEvent('TILES_COPY_PAGE_mode_edit_ICN_ON_TAP');
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
                                                                                                                                    child: EditTileWidget(
                                                                                                                                      tilesdoc: listViewWebTilesRecord,
                                                                                                                                      tileref: listViewWebTilesRecord.tileref,
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
                                                                                                                Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    FlutterFlowIconButton(
                                                                                                                      borderColor: FlutterFlowTheme.of(context).primary,
                                                                                                                      borderRadius: 20.0,
                                                                                                                      borderWidth: 1.0,
                                                                                                                      buttonSize: 40.0,
                                                                                                                      fillColor: FlutterFlowTheme.of(context).info,
                                                                                                                      icon: Icon(
                                                                                                                        Icons.restore_from_trash_outlined,
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        size: 24.0,
                                                                                                                      ),
                                                                                                                      onPressed: () async {
                                                                                                                        logFirebaseEvent('TILES_COPY_restore_from_trash_outlined_I');
                                                                                                                        logFirebaseEvent('IconButton_alert_dialog');
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
                                                                                                                          logFirebaseEvent('IconButton_backend_call');
                                                                                                                          await listViewWebTilesRecord.reference.delete();
                                                                                                                        }
                                                                                                                      },
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                ],
                                                                                              ),
                                                                                              if (FFAppState().selectedParentRef == listViewWebTilesRecord.reference)
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('TILES_COPY_PAGE_tile_ON_TAP');
                                                                                                    if (listViewWebTilesRecord.children.isNotEmpty) {
                                                                                                      logFirebaseEvent('tile_update_app_state');
                                                                                                      setState(() {
                                                                                                        FFAppState().childrenfound = true;
                                                                                                      });
                                                                                                    } else {
                                                                                                      logFirebaseEvent('tile_update_app_state');
                                                                                                      setState(() {
                                                                                                        FFAppState().childrenfound = false;
                                                                                                      });
                                                                                                    }

                                                                                                    if (listViewWebTilesRecord.tileref == null) {
                                                                                                      logFirebaseEvent('tile_backend_call');

                                                                                                      await listViewWebTilesRecord.reference.update(createTilesRecordData(
                                                                                                        tileref: listViewWebTilesRecord.reference,
                                                                                                      ));
                                                                                                    }
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                    decoration: const BoxDecoration(
                                                                                                      borderRadius: BorderRadius.only(
                                                                                                        bottomLeft: Radius.circular(16.0),
                                                                                                        bottomRight: Radius.circular(16.0),
                                                                                                        topLeft: Radius.circular(0.0),
                                                                                                        topRight: Radius.circular(0.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 4.0, 0.0),
                                                                                                              child: SingleChildScrollView(
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    if (listViewWebTilesRecord.parent == FFAppState().grandParentTileRefSelected)
                                                                                                                      Padding(
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                        child: Container(
                                                                                                                          width: 305.0,
                                                                                                                          decoration: const BoxDecoration(
                                                                                                                            borderRadius: BorderRadius.only(
                                                                                                                              bottomLeft: Radius.circular(16.0),
                                                                                                                              bottomRight: Radius.circular(16.0),
                                                                                                                              topLeft: Radius.circular(0.0),
                                                                                                                              topRight: Radius.circular(0.0),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          child: Padding(
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
                                                                                                                            child: Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: [
                                                                                                                                Expanded(
                                                                                                                                  child: Padding(
                                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 4.0, 0.0),
                                                                                                                                    child: Column(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                      children: [
                                                                                                                                        Column(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          children: [
                                                                                                                                            StreamBuilder<List<TilesRecord>>(
                                                                                                                                              stream: queryTilesRecord(
                                                                                                                                                queryBuilder: (tilesRecord) => tilesRecord
                                                                                                                                                    .where(
                                                                                                                                                      'parent',
                                                                                                                                                      isEqualTo: FFAppState().selectedParentRef,
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
                                                                                                                                                List<TilesRecord> listViewTilesRecordList = snapshot.data!;
                                                                                                                                                return ListView.builder(
                                                                                                                                                  padding: EdgeInsets.zero,
                                                                                                                                                  shrinkWrap: true,
                                                                                                                                                  scrollDirection: Axis.vertical,
                                                                                                                                                  itemCount: listViewTilesRecordList.length,
                                                                                                                                                  itemBuilder: (context, listViewIndex) {
                                                                                                                                                    final listViewTilesRecord = listViewTilesRecordList[listViewIndex];
                                                                                                                                                    return Padding(
                                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                                                                                      child: InkWell(
                                                                                                                                                        splashColor: Colors.transparent,
                                                                                                                                                        focusColor: Colors.transparent,
                                                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                                                        onTap: () async {
                                                                                                                                                          logFirebaseEvent('TILES_COPY_PAGE_tile_ON_TAP');
                                                                                                                                                          logFirebaseEvent('tile_update_app_state');
                                                                                                                                                          FFAppState().update(() {
                                                                                                                                                            FFAppState().historyActive = false;
                                                                                                                                                            FFAppState().selectedTile = listViewTilesRecord.title;
                                                                                                                                                            FFAppState().selectedSubTilesRef = listViewTilesRecord.reference;
                                                                                                                                                            FFAppState().SelectedTileRef = listViewTilesRecord.reference;
                                                                                                                                                            FFAppState().isSubTile = true;
                                                                                                                                                            FFAppState().selectedParentRef = listViewTilesRecord.parent;
                                                                                                                                                            FFAppState().mainTileRefSelected = listViewTilesRecord.parent;
                                                                                                                                                            FFAppState().grandParentTileRefSelected = listViewTilesRecord.grandParentRef;
                                                                                                                                                            FFAppState().isasubtile = true;
                                                                                                                                                          });
                                                                                                                                                          if (listViewTilesRecord.children.isNotEmpty) {
                                                                                                                                                            logFirebaseEvent('tile_update_app_state');
                                                                                                                                                            setState(() {
                                                                                                                                                              FFAppState().childrenfound = true;
                                                                                                                                                            });
                                                                                                                                                          } else {
                                                                                                                                                            logFirebaseEvent('tile_update_app_state');
                                                                                                                                                            setState(() {
                                                                                                                                                              FFAppState().childrenfound = false;
                                                                                                                                                            });
                                                                                                                                                          }

                                                                                                                                                          logFirebaseEvent('tile_update_app_state');
                                                                                                                                                          setState(() {
                                                                                                                                                            FFAppState().lasttiletouched = listViewTilesRecord.reference;
                                                                                                                                                          });
                                                                                                                                                        },
                                                                                                                                                        child: Container(
                                                                                                                                                          width: 400.0,
                                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                                            boxShadow: [
                                                                                                                                                              BoxShadow(
                                                                                                                                                                blurRadius: 3.0,
                                                                                                                                                                color: FlutterFlowTheme.of(context).lightergrey,
                                                                                                                                                                offset: const Offset(0.0, 1.0),
                                                                                                                                                              )
                                                                                                                                                            ],
                                                                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                                                                            border: Border.all(
                                                                                                                                                              color: FFAppState().SelectedTileRef == listViewTilesRecord.reference ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                                                            ),
                                                                                                                                                          ),
                                                                                                                                                          child: Padding(
                                                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                                                                                            child: Row(
                                                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                              children: [
                                                                                                                                                                Expanded(
                                                                                                                                                                  child: Padding(
                                                                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 4.0, 0.0),
                                                                                                                                                                    child: Column(
                                                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                                      children: [
                                                                                                                                                                        ClipRRect(
                                                                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                                                                          child: Image.network(
                                                                                                                                                                            listViewTilesRecord.image,
                                                                                                                                                                            width: 250.0,
                                                                                                                                                                            height: 75.0,
                                                                                                                                                                            fit: BoxFit.cover,
                                                                                                                                                                          ),
                                                                                                                                                                        ),
                                                                                                                                                                      ],
                                                                                                                                                                    ),
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
                                                                                                                                                                          listViewTilesRecord.title,
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
                                                                                                                                                                Expanded(
                                                                                                                                                                  child: Padding(
                                                                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 4.0, 0.0),
                                                                                                                                                                    child: Column(
                                                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                                      children: [
                                                                                                                                                                        if (valueOrDefault<bool>(currentUserDocument?.isadmin, false) == true)
                                                                                                                                                                          Row(
                                                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                                                                            children: [
                                                                                                                                                                              if (valueOrDefault<bool>(currentUserDocument?.isadmin, false) == true)
                                                                                                                                                                                FlutterFlowIconButton(
                                                                                                                                                                                  borderColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                                                                  borderRadius: 20.0,
                                                                                                                                                                                  borderWidth: 1.0,
                                                                                                                                                                                  buttonSize: 25.0,
                                                                                                                                                                                  fillColor: FlutterFlowTheme.of(context).info,
                                                                                                                                                                                  icon: Icon(
                                                                                                                                                                                    Icons.mode_edit,
                                                                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                                                    size: 14.0,
                                                                                                                                                                                  ),
                                                                                                                                                                                  onPressed: () async {
                                                                                                                                                                                    logFirebaseEvent('TILES_COPY_PAGE_mode_edit_ICN_ON_TAP');
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
                                                                                                                                                                                              child: EditTileWidget(
                                                                                                                                                                                                tilesdoc: listViewTilesRecord,
                                                                                                                                                                                                tileref: listViewTilesRecord.tileref,
                                                                                                                                                                                              ),
                                                                                                                                                                                            ),
                                                                                                                                                                                          ),
                                                                                                                                                                                        );
                                                                                                                                                                                      },
                                                                                                                                                                                    ).then((value) => safeSetState(() {}));
                                                                                                                                                                                  },
                                                                                                                                                                                ),
                                                                                                                                                                              Padding(
                                                                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                                                                                                child: FlutterFlowIconButton(
                                                                                                                                                                                  borderColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                                                                  borderRadius: 20.0,
                                                                                                                                                                                  borderWidth: 1.0,
                                                                                                                                                                                  buttonSize: 25.0,
                                                                                                                                                                                  fillColor: FlutterFlowTheme.of(context).info,
                                                                                                                                                                                  icon: Icon(
                                                                                                                                                                                    Icons.restore_from_trash_outlined,
                                                                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                                                    size: 14.0,
                                                                                                                                                                                  ),
                                                                                                                                                                                  onPressed: () async {
                                                                                                                                                                                    logFirebaseEvent('TILES_COPY_restore_from_trash_outlined_I');
                                                                                                                                                                                    logFirebaseEvent('IconButton_alert_dialog');
                                                                                                                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                                                                          context: context,
                                                                                                                                                                                          builder: (alertDialogContext) {
                                                                                                                                                                                            return WebViewAware(
                                                                                                                                                                                              child: AlertDialog(
                                                                                                                                                                                                title: Text('Delete ${listViewTilesRecord.title} ?'),
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
                                                                                                                                                                                      logFirebaseEvent('IconButton_backend_call');
                                                                                                                                                                                      await listViewTilesRecord.reference.delete();
                                                                                                                                                                                    }
                                                                                                                                                                                  },
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
                                                                                                                                                      ),
                                                                                                                                                    );
                                                                                                                                                  },
                                                                                                                                                );
                                                                                                                                              },
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
                                                                                            ],
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
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (true &&
                                                                    responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      desktop:
                                                                          false,
                                                                    ))
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          MediaQuery.sizeOf(context).width *
                                                                              1.0,
                                                                      maxHeight:
                                                                          280.0,
                                                                    ),
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child:
                                                                        Visibility(
                                                                      visible: (currentUserDocument?.hasaccess.toList() ??
                                                                              [])
                                                                          .contains(
                                                                              FFAppState().selectedcategory),
                                                                      child:
                                                                          AuthUserStreamWidget(
                                                                        builder:
                                                                            (context) =>
                                                                                StreamBuilder<List<TilesRecord>>(
                                                                          stream:
                                                                              queryTilesRecord(
                                                                            queryBuilder: (tilesRecord) => tilesRecord
                                                                                .where(
                                                                                  'memberlevels',
                                                                                  arrayContains: FFAppState().selectedcategory,
                                                                                )
                                                                                .where(
                                                                                  'show',
                                                                                  isEqualTo: true,
                                                                                )
                                                                                .where(
                                                                                  'tier',
                                                                                  isEqualTo: 0,
                                                                                )
                                                                                .orderBy('id'),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            List<TilesRecord>
                                                                                listViewTilesRecordList =
                                                                                snapshot.data!;
                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.horizontal,
                                                                              itemCount: listViewTilesRecordList.length,
                                                                              itemBuilder: (context, listViewIndex) {
                                                                                final listViewTilesRecord = listViewTilesRecordList[listViewIndex];
                                                                                return Visibility(
                                                                                  visible: listViewTilesRecord.isFeatured != true,
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('TILES_COPY_Container_sd5yinn5_ON_TAP');
                                                                                        logFirebaseEvent('Container_update_app_state');
                                                                                        FFAppState().update(() {
                                                                                          FFAppState().historyActive = true;
                                                                                          FFAppState().selectedTile = listViewTilesRecord.title;
                                                                                          FFAppState().selectedSubTilesRef = listViewTilesRecord.reference;
                                                                                          FFAppState().SelectedTileRef = listViewTilesRecord.reference;
                                                                                          FFAppState().isSubTile = true;
                                                                                          FFAppState().selectedParentRef = listViewTilesRecord.reference;
                                                                                          FFAppState().isasubtile = true;
                                                                                        });
                                                                                        logFirebaseEvent('Container_update_page_state');
                                                                                        setState(() {
                                                                                          _model.historyID = _model.historyID! + 1;
                                                                                        });
                                                                                        if (listViewTilesRecord.children.isNotEmpty) {
                                                                                          logFirebaseEvent('Container_update_app_state');
                                                                                          setState(() {
                                                                                            FFAppState().childrenfound = true;
                                                                                          });
                                                                                        } else {
                                                                                          logFirebaseEvent('Container_update_app_state');
                                                                                          setState(() {
                                                                                            FFAppState().childrenfound = false;
                                                                                          });
                                                                                        }

                                                                                        logFirebaseEvent('Container_update_app_state');
                                                                                        setState(() {
                                                                                          FFAppState().lasttiletouched = listViewTilesRecord.reference;
                                                                                        });
                                                                                        if ((currentUserDocument?.lasttiletouched.toList() ?? []).contains(listViewTilesRecord.reference) == true) {
                                                                                          logFirebaseEvent('Container_alert_dialog');
                                                                                          await showDialog(
                                                                                            context: context,
                                                                                            builder: (alertDialogContext) {
                                                                                              return WebViewAware(
                                                                                                child: AlertDialog(
                                                                                                  title: const Text('Do nothing'),
                                                                                                  content: const Text('This will be deleted'),
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
                                                                                        } else {
                                                                                          logFirebaseEvent('Container_backend_call');

                                                                                          var historyRecordReference = HistoryRecord.createDoc(currentUserReference!);
                                                                                          await historyRecordReference.set(createHistoryRecordData(
                                                                                            tileid: FFAppState().SelectedTileRef,
                                                                                            uid: currentUserReference,
                                                                                            datevisited: getCurrentTimestamp,
                                                                                            tilename: listViewTilesRecord.title,
                                                                                            id: functions.plusOneToVariable(_model.historyID),
                                                                                          ));
                                                                                          _model.createdHistorydocumentrCopy = HistoryRecord.getDocumentFromData(
                                                                                              createHistoryRecordData(
                                                                                                tileid: FFAppState().SelectedTileRef,
                                                                                                uid: currentUserReference,
                                                                                                datevisited: getCurrentTimestamp,
                                                                                                tilename: listViewTilesRecord.title,
                                                                                                id: functions.plusOneToVariable(_model.historyID),
                                                                                              ),
                                                                                              historyRecordReference);
                                                                                        }

                                                                                        if ((currentUserDocument?.lasttiletouched.toList() ?? []).contains(listViewTilesRecord.reference) == true) {
                                                                                          logFirebaseEvent('Container_update_page_state');
                                                                                          setState(() {
                                                                                            _model.showsubsubs = true;
                                                                                          });
                                                                                        }

                                                                                        setState(() {});
                                                                                      },
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            if (listViewTilesRecord.isFeatured != true)
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                                                                                                child: Container(
                                                                                                  width: 300.0,
                                                                                                  decoration: const BoxDecoration(
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                                      bottomRight: Radius.circular(0.0),
                                                                                                      topLeft: Radius.circular(16.0),
                                                                                                      topRight: Radius.circular(16.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      if (valueOrDefault<bool>(currentUserDocument?.isadmin, false) == true)
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.end,
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
                                                                                                                        FlutterFlowIconButton(
                                                                                                                          borderColor: FlutterFlowTheme.of(context).primary,
                                                                                                                          borderRadius: 20.0,
                                                                                                                          borderWidth: 1.0,
                                                                                                                          buttonSize: 40.0,
                                                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                          icon: Icon(
                                                                                                                            Icons.mode_edit,
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            size: 24.0,
                                                                                                                          ),
                                                                                                                          onPressed: () async {
                                                                                                                            logFirebaseEvent('TILES_COPY_PAGE_mode_edit_ICN_ON_TAP');
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
                                                                                                                                      child: EditTileWidget(
                                                                                                                                        tilesdoc: listViewTilesRecord,
                                                                                                                                        tileref: listViewTilesRecord.reference,
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
                                                                                                                    Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        FlutterFlowIconButton(
                                                                                                                          borderColor: FlutterFlowTheme.of(context).primary,
                                                                                                                          borderRadius: 20.0,
                                                                                                                          borderWidth: 1.0,
                                                                                                                          buttonSize: 40.0,
                                                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                          icon: Icon(
                                                                                                                            Icons.restore_from_trash_outlined,
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            size: 24.0,
                                                                                                                          ),
                                                                                                                          onPressed: () async {
                                                                                                                            logFirebaseEvent('TILES_COPY_restore_from_trash_outlined_I');
                                                                                                                            logFirebaseEvent('IconButton_alert_dialog');
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
                                                                                                                              logFirebaseEvent('IconButton_backend_call');
                                                                                                                              await listViewTilesRecord.reference.delete();
                                                                                                                            }
                                                                                                                          },
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsets.all(10.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: Text(
                                                                                                                listViewTilesRecord.title,
                                                                                                                style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            SingleChildScrollView(
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      width: 305.0,
                                                                                                      height: 180.0,
                                                                                                      constraints: const BoxConstraints(
                                                                                                        maxHeight: 220.0,
                                                                                                      ),
                                                                                                      decoration: const BoxDecoration(
                                                                                                        borderRadius: BorderRadius.only(
                                                                                                          bottomLeft: Radius.circular(16.0),
                                                                                                          bottomRight: Radius.circular(16.0),
                                                                                                          topLeft: Radius.circular(0.0),
                                                                                                          topRight: Radius.circular(0.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 24.0, 0.0),
                                                                                                                child: SingleChildScrollView(
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      SingleChildScrollView(
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            StreamBuilder<List<TilesRecord>>(
                                                                                                                              stream: queryTilesRecord(
                                                                                                                                queryBuilder: (tilesRecord) => tilesRecord
                                                                                                                                    .where(
                                                                                                                                      'parent',
                                                                                                                                      isEqualTo: listViewTilesRecord.reference,
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
                                                                                                                                List<TilesRecord> listViewTilesRecordList = snapshot.data!;
                                                                                                                                return ListView.builder(
                                                                                                                                  padding: EdgeInsets.zero,
                                                                                                                                  primary: false,
                                                                                                                                  shrinkWrap: true,
                                                                                                                                  scrollDirection: Axis.vertical,
                                                                                                                                  itemCount: listViewTilesRecordList.length,
                                                                                                                                  itemBuilder: (context, listViewIndex) {
                                                                                                                                    final listViewTilesRecord = listViewTilesRecordList[listViewIndex];
                                                                                                                                    return Padding(
                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                                                                      child: InkWell(
                                                                                                                                        splashColor: Colors.transparent,
                                                                                                                                        focusColor: Colors.transparent,
                                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                                        onTap: () async {
                                                                                                                                          logFirebaseEvent('TILES_COPY_PAGE_tile_ON_TAP');
                                                                                                                                          logFirebaseEvent('tile_update_app_state');
                                                                                                                                          FFAppState().update(() {
                                                                                                                                            FFAppState().historyActive = true;
                                                                                                                                            FFAppState().selectedTile = listViewTilesRecord.title;
                                                                                                                                            FFAppState().selectedSubTilesRef = listViewTilesRecord.reference;
                                                                                                                                            FFAppState().SelectedTileRef = listViewTilesRecord.reference;
                                                                                                                                            FFAppState().isSubTile = true;
                                                                                                                                            FFAppState().selectedParentRef = listViewTilesRecord.parent;
                                                                                                                                            FFAppState().isasubtile = true;
                                                                                                                                          });
                                                                                                                                          logFirebaseEvent('tile_update_page_state');
                                                                                                                                          setState(() {
                                                                                                                                            _model.historyID = _model.historyID! + 1;
                                                                                                                                          });
                                                                                                                                          if (listViewTilesRecord.children.isNotEmpty) {
                                                                                                                                            logFirebaseEvent('tile_update_app_state');
                                                                                                                                            setState(() {
                                                                                                                                              FFAppState().childrenfound = true;
                                                                                                                                            });
                                                                                                                                          } else {
                                                                                                                                            logFirebaseEvent('tile_update_app_state');
                                                                                                                                            setState(() {
                                                                                                                                              FFAppState().childrenfound = false;
                                                                                                                                            });
                                                                                                                                          }

                                                                                                                                          logFirebaseEvent('tile_update_app_state');
                                                                                                                                          setState(() {
                                                                                                                                            FFAppState().lasttiletouched = listViewTilesRecord.reference;
                                                                                                                                          });
                                                                                                                                          if ((currentUserDocument?.lasttiletouched.toList() ?? []).contains(listViewTilesRecord.reference) == true) {
                                                                                                                                            logFirebaseEvent('tile_alert_dialog');
                                                                                                                                            await showDialog(
                                                                                                                                              context: context,
                                                                                                                                              builder: (alertDialogContext) {
                                                                                                                                                return WebViewAware(
                                                                                                                                                  child: AlertDialog(
                                                                                                                                                    title: const Text('Do nothing'),
                                                                                                                                                    content: const Text('This will be deleted'),
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
                                                                                                                                          } else {
                                                                                                                                            logFirebaseEvent('tile_backend_call');

                                                                                                                                            var historyRecordReference = HistoryRecord.createDoc(currentUserReference!);
                                                                                                                                            await historyRecordReference.set(createHistoryRecordData(
                                                                                                                                              tileid: FFAppState().SelectedTileRef,
                                                                                                                                              uid: currentUserReference,
                                                                                                                                              datevisited: getCurrentTimestamp,
                                                                                                                                              tilename: listViewTilesRecord.title,
                                                                                                                                              id: functions.plusOneToVariable(_model.historyID),
                                                                                                                                            ));
                                                                                                                                            _model.createdHistorydocumentr = HistoryRecord.getDocumentFromData(
                                                                                                                                                createHistoryRecordData(
                                                                                                                                                  tileid: FFAppState().SelectedTileRef,
                                                                                                                                                  uid: currentUserReference,
                                                                                                                                                  datevisited: getCurrentTimestamp,
                                                                                                                                                  tilename: listViewTilesRecord.title,
                                                                                                                                                  id: functions.plusOneToVariable(_model.historyID),
                                                                                                                                                ),
                                                                                                                                                historyRecordReference);
                                                                                                                                          }

                                                                                                                                          if (listViewTilesRecord.children.isNotEmpty) {
                                                                                                                                            logFirebaseEvent('tile_update_page_state');
                                                                                                                                            setState(() {
                                                                                                                                              _model.showsubsubs = true;
                                                                                                                                            });
                                                                                                                                          }

                                                                                                                                          setState(() {});
                                                                                                                                        },
                                                                                                                                        child: Container(
                                                                                                                                          width: 400.0,
                                                                                                                                          height: 50.0,
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            boxShadow: [
                                                                                                                                              BoxShadow(
                                                                                                                                                blurRadius: 3.0,
                                                                                                                                                color: FlutterFlowTheme.of(context).lightergrey,
                                                                                                                                                offset: const Offset(0.0, 1.0),
                                                                                                                                              )
                                                                                                                                            ],
                                                                                                                                            gradient: LinearGradient(
                                                                                                                                              colors: [
                                                                                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                                                FlutterFlowTheme.of(context).secondary
                                                                                                                                              ],
                                                                                                                                              stops: const [0.0, 1.0],
                                                                                                                                              begin: const AlignmentDirectional(0.0, -1.0),
                                                                                                                                              end: const AlignmentDirectional(0, 1.0),
                                                                                                                                            ),
                                                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                                                            border: Border.all(
                                                                                                                                              color: FFAppState().SelectedTileRef == listViewTilesRecord.reference ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                          child: Padding(
                                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                                                                                                                                            child: Row(
                                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                                              children: [
                                                                                                                                                Expanded(
                                                                                                                                                  child: Padding(
                                                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 4.0, 0.0),
                                                                                                                                                    child: Column(
                                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                      children: [
                                                                                                                                                        Text(
                                                                                                                                                          listViewTilesRecord.title,
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
                                                                                                                                              ],
                                                                                                                                            ),
                                                                                                                                          ),
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
                                                                                                              ),
                                                                                                            ),
                                                                                                            SizedBox(
                                                                                                              height: 100.0,
                                                                                                              child: VerticalDivider(
                                                                                                                width: 1.5,
                                                                                                                thickness: 1.0,
                                                                                                                indent: 30.0,
                                                                                                                endIndent: 30.0,
                                                                                                                color: FlutterFlowTheme.of(context).accent4,
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
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  child:
                                                                      SizedBox(
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              24.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxHeight: MediaQuery.sizeOf(context).height * 0.7,
                                                                            ),
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                wrapWithModel(
                                                                              model: _model.mainTileContentOldModel,
                                                                              updateCallback: () => setState(() {}),
                                                                              updateOnChange: true,
                                                                              child: const MainTileContentOldWidget(),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            if (valueOrDefault<bool>(
                                                                              (currentUserDocument?.hasaccess.toList() ?? []).contains(FFAppState().selectedcategory) == false,
                                                                              false,
                                                                            ))
                                                                              Expanded(
                                                                                child: AuthUserStreamWidget(
                                                                                  builder: (context) => Builder(
                                                                                    builder: (context) {
                                                                                      if ((currentUserDocument?.hasaccess.toList() ?? []).contains(currentUserReference?.id) == false) {
                                                                                        return Container(
                                                                                          width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                          constraints: BoxConstraints(
                                                                                            maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                                                                                          ),
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                          ),
                                                                                          child: wrapWithModel(
                                                                                            model: _model.noAccessModel1,
                                                                                            updateCallback: () => setState(() {}),
                                                                                            child: const NoAccessWidget(),
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        return Visibility(
                                                                                          visible: (currentUserDocument?.hasaccess.toList() ?? []).contains(FFAppState().selectedcategory) == false,
                                                                                          child: Container(
                                                                                            width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                            constraints: BoxConstraints(
                                                                                              maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                                                                                            ),
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                            ),
                                                                                            child: wrapWithModel(
                                                                                              model: _model.noAccessModel2,
                                                                                              updateCallback: () => setState(() {}),
                                                                                              child: const NoAccessWidget(),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                    },
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
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ).animateOnPageLoad(animationsMap[
                                                    'columnOnPageLoadAnimation']!),
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
                        ),
                      ),
                    ),
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
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 40.0, 0.0),
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: const BoxDecoration(),
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
        ));
  }
}
