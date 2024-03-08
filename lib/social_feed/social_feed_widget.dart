import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/blockv3_widget.dart';
import '/components/drawer_empty_list_tiles_widget.dart';
import '/components/drawer_tile_tree_widget.dart';
import '/components/header_container_widget.dart';
import '/components/learn_card_chat_activity_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/left_pane/desktop_tile_nav_ai_this_week/desktop_tile_nav_ai_this_week_widget.dart';
import '/left_pane/learn_topic_on_page/learn_topic_on_page_widget.dart';
import '/left_pane/main_app_tiles/main_app_tiles_widget.dart';
import '/right_pane/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_deletesoon/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_deletesoon_widget.dart';
import '/right_pane/chata_c_t_i_v_i_t_y/chata_c_t_i_v_i_t_y_widget.dart';
import '/right_pane/social_feed_new_componant/social_feed_new_componant_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'social_feed_model.dart';
export 'social_feed_model.dart';

class SocialFeedWidget extends StatefulWidget {
  const SocialFeedWidget({
    super.key,
    this.associatedTileBlock,
  });

  final String? associatedTileBlock;

  @override
  State<SocialFeedWidget> createState() => _SocialFeedWidgetState();
}

class _SocialFeedWidgetState extends State<SocialFeedWidget>
    with TickerProviderStateMixin {
  late SocialFeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'iconButtonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(-10.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialFeedModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'socialFeed'});

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
      stream: FFAppState().tilesv2ByIndex(
        requestFn: () => queryTilesv2Record(
          queryBuilder: (tilesv2Record) => tilesv2Record.orderBy('tile_index'),
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
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
        List<Tilesv2Record> socialFeedTilesv2RecordList = snapshot.data!;
        return Title(
            title: 'socialFeed',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () async {
                    logFirebaseEvent(
                        'SOCIAL_FEED_FloatingActionButton_bbxaqmd');
                    logFirebaseEvent('FloatingActionButton_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                          child: GestureDetector(
                            onTap: () => _model.unfocusNode.canRequestFocus
                                ? FocusScope.of(context)
                                    .requestFocus(_model.unfocusNode)
                                : FocusScope.of(context).unfocus(),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: const LearnCardChatActivityWidget(
                                learcardId: '',
                                learningCardTitle: '',
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));

                    logFirebaseEvent('FloatingActionButton_update_app_state');
                    setState(() {
                      FFAppState().endDrawerOpen = !FFAppState().endDrawerOpen;
                    });
                  },
                  backgroundColor: FlutterFlowTheme.of(context).accent2,
                  icon: const Icon(
                    Icons.wechat_rounded,
                  ),
                  elevation: 8.0,
                  label: Align(
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
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/2vqf7_',
                            ).image,
                          ),
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
                                    'SOCIAL_FEED_Container_3b6bqw41_CALLBACK');
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
                  width: 450.0,
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
                          itemId: FFAppState().viewTileContentId,
                        ),
                      ),
                    ),
                  ),
                ),
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
                          icon: Icon(
                            Icons.menu,
                            color: FlutterFlowTheme.of(context).accent1,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'SOCIAL_FEED_PAGE_menu_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_drawer');
                            scaffoldKey.currentState!.openDrawer();
                          },
                        ),
                        title: Text(
                          'Page Title',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                color: FlutterFlowTheme.of(context).accent1,
                                fontSize: 22.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineMediumFamily),
                              ),
                        ),
                        actions: const [],
                        centerTitle: true,
                        elevation: 2.0,
                      )
                    : null,
                body: SafeArea(
                  top: true,
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: StreamBuilder<List<SessionsRecord>>(
                      stream: FFAppState().sessionsBySessionid(
                        requestFn: () => querySessionsRecord(
                          queryBuilder: (sessionsRecord) =>
                              sessionsRecord.where(
                            'sessionId',
                            isEqualTo: FFAppState().nonLoggedInSessionId,
                          ),
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
                            stream: FFAppState().companyCode(
                              requestFn: () => queryCompaniesRecord(
                                queryBuilder: (companiesRecord) =>
                                    companiesRecord.where(
                                  'companyCode',
                                  isEqualTo: valueOrDefault<String>(
                                    FFAppState().companySecretCode,
                                    '112233',
                                  ),
                                ),
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
                              List<CompaniesRecord>
                                  containerCompanyCompaniesRecordList =
                                  snapshot.data!;
                              return Container(
                                decoration: const BoxDecoration(),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              constraints: const BoxConstraints(
                                                maxHeight: double.infinity,
                                              ),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  containerCompanyCompaniesRecordList
                                                      .first
                                                      .colors
                                                      .primaryColor,
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: BackdropFilter(
                                                    filter: ImageFilter.blur(
                                                      sigmaX: 2.0,
                                                      sigmaY: 2.0,
                                                    ),
                                                    child: Opacity(
                                                      opacity: 0.8,
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          constraints:
                                                              const BoxConstraints(
                                                            minWidth: 900.0,
                                                            minHeight: 900.0,
                                                            maxHeight: 750.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  Image.network(
                                                                '',
                                                              ).image,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1.0, 0.0),
                                                            child: Stack(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      containerCompanyCompaniesRecordList
                                                                          .first
                                                                          .backgroundImage,
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            400.0,
                                                                            100.0,
                                                                            400.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            MediaQuery.sizeOf(context).width *
                                                                                0.7,
                                                                        maxHeight:
                                                                            MediaQuery.sizeOf(context).height *
                                                                                0.7,
                                                                      ),
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        shape: BoxShape
                                                                            .rectangle,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(10.0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(17.0),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if ((socialFeedTilesv2RecordList.where((e) => e.sessionIdUser == FFAppState().nonLoggedInSessionId).toList().isNotEmpty) != true)
                                                                                    Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).customColor5,
                                                                                        borderRadius: BorderRadius.circular(17.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsets.all(50.0),
                                                                                        child: ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                          child: Image.network(
                                                                                            containerCompanyCompaniesRecordList.first.companylogo,
                                                                                            fit: BoxFit.cover,
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
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              wrapWithModel(
                                                model:
                                                    _model.headerContainerModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                updateOnChange: true,
                                                child: HeaderContainerWidget(
                                                  title: () {
                                                    if (socialFeedTilesv2RecordList
                                                            .where((e) =>
                                                                valueOrDefault<
                                                                    bool>(
                                                                  e.reference
                                                                          .id ==
                                                                      FFAppState()
                                                                          .viewTileContentId,
                                                                  false,
                                                                ))
                                                            .toList().isNotEmpty) {
                                                      return valueOrDefault<
                                                          String>(
                                                        socialFeedTilesv2RecordList
                                                            .where((e) =>
                                                                valueOrDefault<
                                                                    bool>(
                                                                  e.reference
                                                                          .id ==
                                                                      FFAppState()
                                                                          .viewTileContentId,
                                                                  false,
                                                                ))
                                                            .toList()
                                                            .first
                                                            .title,
                                                        'Welcome to your Website',
                                                      );
                                                    } else if (FFAppState()
                                                                .viewTileContentId ==
                                                            '') {
                                                      return '';
                                                    } else {
                                                      return '';
                                                    }
                                                  }(),
                                                  currentTier: 0,
                                                  companiesDoc:
                                                      containerCompanyCompaniesRecordList
                                                          .first,
                                                  action: () async {
                                                    logFirebaseEvent(
                                                        'SOCIAL_FEED_Container_wero7e3x_CALLBACK');
                                                    if (FFAppState()
                                                            .callbackAction ==
                                                        'Drawer') {
                                                      logFirebaseEvent(
                                                          'HeaderContainer_drawer');
                                                      scaffoldKey.currentState!
                                                          .openDrawer();
                                                    } else if (FFAppState()
                                                            .callbackAction ==
                                                        'NewTile') {
                                                      logFirebaseEvent(
                                                          'HeaderContainer_update_app_state');
                                                      setState(() {
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
                                                      scaffoldKey.currentState!
                                                          .openEndDrawer();
                                                    } else if (FFAppState()
                                                            .callbackAction ==
                                                        'AdminDrawer') {
                                                      logFirebaseEvent(
                                                          'HeaderContainer_drawer');
                                                      scaffoldKey.currentState!
                                                          .openEndDrawer();
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          7.0,
                                                                          0.0,
                                                                          7.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'SOCIAL_FEED_PAGE_SOCIAL_BTN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context.pushNamed(
                                                                          'socialFeed');

                                                                      logFirebaseEvent(
                                                                          'Button_update_app_state');
                                                                      setState(
                                                                          () {
                                                                        FFAppState().showPane =
                                                                            'social';
                                                                      });
                                                                    },
                                                                    text:
                                                                        'social',
                                                                    icon: const Icon(
                                                                      Icons
                                                                          .wechat_sharp,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              10.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: containerCompanyCompaniesRecordList
                                                                          .first
                                                                          .colors
                                                                          .secondaryColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey('Lexend Deca'),
                                                                          ),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          7.0,
                                                                          0.0,
                                                                          7.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'SOCIAL_FEED_PAGE_WELCOME_CHAT_BTN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Button_update_app_state');
                                                                      setState(
                                                                          () {
                                                                        FFAppState().showPane =
                                                                            'Initial Chat';
                                                                      });
                                                                    },
                                                                    text:
                                                                        'Welcome Chat',
                                                                    icon: const Icon(
                                                                      Icons
                                                                          .wechat_sharp,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              10.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: containerCompanyCompaniesRecordList
                                                                          .first
                                                                          .colors
                                                                          .secondaryColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey('Lexend Deca'),
                                                                          ),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          7.0,
                                                                          0.0,
                                                                          7.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'SOCIAL_FEED_PAGE_PREPARING_BTN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Button_update_app_state');
                                                                      setState(
                                                                          () {
                                                                        FFAppState().showPane =
                                                                            'preparing';
                                                                      });
                                                                    },
                                                                    text:
                                                                        'Preparing',
                                                                    icon: const Icon(
                                                                      Icons
                                                                          .read_more_sharp,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              10.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: containerCompanyCompaniesRecordList
                                                                          .first
                                                                          .colors
                                                                          .secondaryColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey('Lexend Deca'),
                                                                          ),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          7.0,
                                                                          0.0,
                                                                          7.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'SOCIAL_FEED_PAGE_TOPICS_BTN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Button_update_app_state');
                                                                      setState(
                                                                          () {
                                                                        FFAppState().showPane =
                                                                            'menu';
                                                                      });
                                                                    },
                                                                    text:
                                                                        'Topics',
                                                                    icon: const Icon(
                                                                      Icons
                                                                          .toc_rounded,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              10.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: containerCompanyCompaniesRecordList
                                                                          .first
                                                                          .colors
                                                                          .secondaryColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey('Lexend Deca'),
                                                                          ),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (FFAppState()
                                                                            .viewTileContentId !=
                                                                        '')
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            7.0,
                                                                            0.0,
                                                                            7.0,
                                                                            0.0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'SOCIAL_FEED_PAGE_CONTENT_BTN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');
                                                                        setState(
                                                                            () {
                                                                          FFAppState().showPane =
                                                                              'content';
                                                                        });
                                                                      },
                                                                      text:
                                                                          'content',
                                                                      icon:
                                                                          const Icon(
                                                                        Icons
                                                                            .crop_din,
                                                                        size:
                                                                            15.0,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        padding:
                                                                            const EdgeInsets.all(10.0),
                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: containerCompanyCompaniesRecordList
                                                                            .first
                                                                            .colors
                                                                            .secondaryColor,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 16.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Lexend Deca'),
                                                                            ),
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (FFAppState()
                                                                            .viewTileContentId !=
                                                                        '')
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            7.0,
                                                                            0.0,
                                                                            7.0,
                                                                            0.0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'SOCIAL_FEED_PAGE_APP_CONTENT_BTN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');
                                                                        setState(
                                                                            () {
                                                                          FFAppState().showPane =
                                                                              'APP CONTENT';
                                                                        });
                                                                      },
                                                                      text:
                                                                          'APP CONTENT',
                                                                      icon:
                                                                          const Icon(
                                                                        Icons
                                                                            .crop_din,
                                                                        size:
                                                                            15.0,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        padding:
                                                                            const EdgeInsets.all(10.0),
                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: containerCompanyCompaniesRecordList
                                                                            .first
                                                                            .colors
                                                                            .secondaryColor,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 16.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Lexend Deca'),
                                                                            ),
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          7.0,
                                                                          0.0,
                                                                          7.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'SOCIAL_FEED_PAGE_LEARNCARDS_BTN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Button_update_app_state');
                                                                      setState(
                                                                          () {
                                                                        FFAppState().showPane =
                                                                            'learncards';
                                                                      });
                                                                    },
                                                                    text:
                                                                        'learncards',
                                                                    icon: const Icon(
                                                                      Icons
                                                                          .crop_din,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              10.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: containerCompanyCompaniesRecordList
                                                                          .first
                                                                          .colors
                                                                          .secondaryColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey('Lexend Deca'),
                                                                          ),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          7.0,
                                                                          0.0,
                                                                          7.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'Button pressed ...');
                                                                    },
                                                                    text:
                                                                        'Learn Pilot',
                                                                    icon: const Icon(
                                                                      Icons
                                                                          .wechat_sharp,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              10.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: containerCompanyCompaniesRecordList
                                                                          .first
                                                                          .colors
                                                                          .secondaryColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey('Lexend Deca'),
                                                                          ),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor7,
                                                                  borderRadius:
                                                                      8.0,
                                                                  borderWidth:
                                                                      0.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .customColor3,
                                                                  hoverColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  hoverIconColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor7,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .rocket_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'SOCIAL_FEED_PAGE_AddTile_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'AddTile_auth');
                                                                    GoRouter.of(
                                                                            context)
                                                                        .prepareAuthEvent();
                                                                    await authManager
                                                                        .signOut();
                                                                    GoRouter.of(
                                                                            context)
                                                                        .clearRedirectLocation();

                                                                    context.goNamedAuth(
                                                                        'demo',
                                                                        context
                                                                            .mounted);
                                                                  },
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'iconButtonOnPageLoadAnimation']!),
                                                              ],
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      if (valueOrDefault<bool>(
                                                        () {
                                                          if (FFAppState()
                                                                  .showPane ==
                                                              'menu') {
                                                            return true;
                                                          } else if (FFAppState()
                                                                      .showPane ==
                                                                  '') {
                                                            return true;
                                                          } else if ((FFAppState()
                                                                      .showPane ==
                                                                  'Initial Chat') ||
                                                              (FFAppState()
                                                                      .showPane ==
                                                                  'APP CONTENT')) {
                                                            return false;
                                                          } else if ((FFAppState()
                                                                      .showPane ==
                                                                  'content') ||
                                                              (FFAppState()
                                                                      .showPane ==
                                                                  'preparing')) {
                                                            return true;
                                                          } else {
                                                            return false;
                                                          }
                                                        }(),
                                                        false,
                                                      )) {
                                                        return Visibility(
                                                          visible: () {
                                                            if ((MediaQuery.sizeOf(context)
                                                                        .width <
                                                                    kBreakpointSmall) &&
                                                                (FFAppState().showPane !=
                                                                    'menu')) {
                                                              return false;
                                                            } else if (MediaQuery.sizeOf(context)
                                                                    .width <
                                                                kBreakpointMedium) {
                                                              return true;
                                                            } else if (MediaQuery.sizeOf(context)
                                                                    .width <
                                                                kBreakpointLarge) {
                                                              return true;
                                                            } else if ((MediaQuery.sizeOf(context)
                                                                        .width <
                                                                    kBreakpointSmall) &&
                                                                (FFAppState().showPane ==
                                                                    'menu')) {
                                                              return true;
                                                            } else if ((MediaQuery.sizeOf(context)
                                                                        .width <
                                                                    kBreakpointMedium) &&
                                                                (FFAppState().showPane !=
                                                                        '')) {
                                                              return true;
                                                            } else if ((MediaQuery.sizeOf(context)
                                                                        .width <
                                                                    kBreakpointLarge) &&
                                                                (FFAppState().showPane != '')) {
                                                              return true;
                                                            } else {
                                                              return true;
                                                            }
                                                          }(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth: () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
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
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .desktopTileNavAiThisWeekModel,
                                                                    updateCallback: () =>
                                                                        setState(
                                                                            () {}),
                                                                    updateOnChange:
                                                                        true,
                                                                    child:
                                                                        DesktopTileNavAiThisWeekWidget(
                                                                      companyDoc:
                                                                          containerCompanyCompaniesRecordList
                                                                              .first,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              const Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [],
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      } else if (valueOrDefault<
                                                          bool>(
                                                        () {
                                                          if (FFAppState()
                                                                  .showPane ==
                                                              'Initial Chat') {
                                                            return true;
                                                          } else if (FFAppState()
                                                                      .showPane ==
                                                                  '') {
                                                            return true;
                                                          } else if ((FFAppState()
                                                                      .showPane ==
                                                                  'menu') ||
                                                              (FFAppState()
                                                                      .showPane ==
                                                                  'APP CONTENT')) {
                                                            return false;
                                                          } else {
                                                            return false;
                                                          }
                                                        }(),
                                                        false,
                                                      )) {
                                                        return Visibility(
                                                          visible: () {
                                                            if ((MediaQuery.sizeOf(context)
                                                                        .width <
                                                                    kBreakpointSmall) &&
                                                                (FFAppState().showPane !=
                                                                    'Initial Chat')) {
                                                              return false;
                                                            } else if (MediaQuery.sizeOf(context)
                                                                    .width <
                                                                kBreakpointMedium) {
                                                              return true;
                                                            } else if (MediaQuery.sizeOf(context)
                                                                    .width <
                                                                kBreakpointLarge) {
                                                              return true;
                                                            } else if ((MediaQuery.sizeOf(context)
                                                                        .width <
                                                                    kBreakpointSmall) &&
                                                                (FFAppState().showPane ==
                                                                    'Initial Chat')) {
                                                              return true;
                                                            } else if ((MediaQuery.sizeOf(context)
                                                                        .width <
                                                                    kBreakpointMedium) &&
                                                                (FFAppState().showPane !=
                                                                        '')) {
                                                              return true;
                                                            } else if ((MediaQuery.sizeOf(context)
                                                                        .width <
                                                                    kBreakpointLarge) &&
                                                                (FFAppState().showPane != '')) {
                                                              return true;
                                                            } else {
                                                              return true;
                                                            }
                                                          }(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 500.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth: () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
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
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    wrapWithModel(
                                                                      model: _model
                                                                          .learnTopicOnPageModel,
                                                                      updateCallback:
                                                                          () =>
                                                                              setState(() {}),
                                                                      child:
                                                                          const LearnTopicOnPageWidget(),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      } else if (valueOrDefault<
                                                          bool>(
                                                        () {
                                                          if (FFAppState()
                                                                  .showPane ==
                                                              'APP CONTENT') {
                                                            return true;
                                                          } else if (FFAppState()
                                                                      .showPane ==
                                                                  '') {
                                                            return true;
                                                          } else if ((FFAppState()
                                                                      .showPane ==
                                                                  'menu') ||
                                                              (FFAppState()
                                                                      .showPane ==
                                                                  'APP CONTENT')) {
                                                            return false;
                                                          } else {
                                                            return false;
                                                          }
                                                        }(),
                                                        false,
                                                      )) {
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 400.0,
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall) {
                                                                    return 400.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return 500.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointLarge) {
                                                                    return 600.0;
                                                                  } else {
                                                                    return 400.0;
                                                                  }
                                                                }(),
                                                              ),
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .mainAppTilesModel,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                child:
                                                                    MainAppTilesWidget(
                                                                  categorySelected:
                                                                      FFAppState()
                                                                          .selectedCategoryName,
                                                                  companyDoc:
                                                                      containerCompanyCompaniesRecordList
                                                                          .first,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      } else {
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                              if (() {
                                                if ((MediaQuery.sizeOf(context).width <
                                                        kBreakpointSmall) &&
                                                    ((FFAppState().showPane != 'content') &&
                                                        (FFAppState().showPane !=
                                                            'preparing'))) {
                                                  return false;
                                                } else if (MediaQuery.sizeOf(context).width <
                                                    kBreakpointMedium) {
                                                  return true;
                                                } else if (MediaQuery.sizeOf(context).width <
                                                    kBreakpointLarge) {
                                                  return true;
                                                } else if ((MediaQuery.sizeOf(context).width <
                                                        kBreakpointSmall) &&
                                                    (FFAppState().showPane ==
                                                        'content')) {
                                                  return true;
                                                } else if ((MediaQuery.sizeOf(context).width <
                                                        kBreakpointMedium) &&
                                                    (FFAppState().showPane !=
                                                            '')) {
                                                  return true;
                                                } else if ((MediaQuery.sizeOf(context).width <
                                                        kBreakpointLarge) &&
                                                    (FFAppState().showPane !=
                                                            '')) {
                                                  return true;
                                                } else if ((MediaQuery.sizeOf(context).width <
                                                        kBreakpointSmall) &&
                                                    (FFAppState().showPane !=
                                                        'preparing')) {
                                                  return false;
                                                } else if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                  return true;
                                                } else {
                                                  return true;
                                                }
                                              }())
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  15.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          if (FFAppState()
                                                                  .showPane ==
                                                              'social')
                                                            Container(
                                                              height: 1400.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  wrapWithModel(
                                                                    model: _model
                                                                        .socialFeedNewComponantModel,
                                                                    updateCallback: () =>
                                                                        setState(
                                                                            () {}),
                                                                    child:
                                                                        const SocialFeedNewComponantWidget(),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (valueOrDefault<
                                                                  bool>(
                                                                FFAppState()
                                                                        .NewTileJustCreated ==
                                                                    true,
                                                                false,
                                                              ) ||
                                                              valueOrDefault<
                                                                  bool>(
                                                                FFAppState()
                                                                            .viewTileContentId !=
                                                                        '',
                                                                false,
                                                              ))
                                                            StreamBuilder<
                                                                List<
                                                                    TileBlocksRecord>>(
                                                              stream: FFAppState()
                                                                  .tileBlocksIndex(
                                                                requestFn: () =>
                                                                    queryTileBlocksRecord(
                                                                  queryBuilder:
                                                                      (tileBlocksRecord) =>
                                                                          tileBlocksRecord
                                                                              .orderBy('block_index'),
                                                                ),
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
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<TileBlocksRecord>
                                                                    containerTileBlocksRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                return Container(
                                                                  height:
                                                                      1400.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
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
                                                                        FFAppState().viewTileContentId !=
                                                                                '',
                                                                        false,
                                                                      ))
                                                                        Expanded(
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final tileContent = containerTileBlocksRecordList
                                                                                  .where((e) => valueOrDefault<bool>(
                                                                                        e.tileId == FFAppState().viewTileContentId,
                                                                                        false,
                                                                                      ))
                                                                                  .toList();
                                                                              if (tileContent.isEmpty) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 640.0,
                                                                                    child: DrawerEmptyListTilesWidget(
                                                                                      tileDoc: socialFeedTilesv2RecordList
                                                                                          .where((e) => valueOrDefault<bool>(
                                                                                                e.reference.id == FFAppState().viewTileContentId,
                                                                                                false,
                                                                                              ))
                                                                                          .toList()
                                                                                          .first,
                                                                                      action: () async {},
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              return ListView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                primary: false,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: tileContent.length,
                                                                                itemBuilder: (context, tileContentIndex) {
                                                                                  final tileContentItem = tileContent[tileContentIndex];
                                                                                  return Align(
                                                                                    alignment: const AlignmentDirectional(0.0, -1.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                      children: [
                                                                                        Container(
                                                                                          key: ValueKey(tileContentItem.reference.id),
                                                                                          child: wrapWithModel(
                                                                                            model: _model.blockv3Models.getModel(
                                                                                              tileContentItem.reference.id,
                                                                                              tileContentIndex,
                                                                                            ),
                                                                                            updateCallback: () => setState(() {}),
                                                                                            updateOnChange: true,
                                                                                            child: Blockv3Widget(
                                                                                              key: Key(
                                                                                                'Keyv0c_${tileContentItem.reference.id}',
                                                                                              ),
                                                                                              tileBlock: tileContentItem,
                                                                                              topicItem: valueOrDefault<String>(
                                                                                                socialFeedTilesv2RecordList.first.title,
                                                                                                'topic not set',
                                                                                              ),
                                                                                              readingItem: valueOrDefault<String>(
                                                                                                tileContentItem.title,
                                                                                                'reading list item is not set',
                                                                                              ),
                                                                                              sessionId: containerSessionsRecordList.first,
                                                                                              companyDoc: containerCompanyCompaniesRecordList.first,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
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
                                                ),
                                              if (() {
                                                if ((MediaQuery.sizeOf(context)
                                                            .width <
                                                        kBreakpointSmall) &&
                                                    (FFAppState().showPane !=
                                                        'learncards')) {
                                                  return false;
                                                } else if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return true;
                                                } else if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return true;
                                                } else if ((MediaQuery.sizeOf(context)
                                                            .width <
                                                        kBreakpointSmall) &&
                                                    (FFAppState().showPane ==
                                                        'learncards')) {
                                                  return true;
                                                } else if ((MediaQuery.sizeOf(context)
                                                            .width <
                                                        kBreakpointMedium) &&
                                                    (FFAppState().showPane !=
                                                            '')) {
                                                  return true;
                                                } else if ((MediaQuery.sizeOf(context)
                                                            .width <
                                                        kBreakpointLarge) &&
                                                    (FFAppState().showPane !=
                                                            '')) {
                                                  return true;
                                                } else {
                                                  return true;
                                                }
                                              }())
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall) {
                                                                    return 400.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return 500.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointLarge) {
                                                                    return 600.0;
                                                                  } else {
                                                                    return 400.0;
                                                                  }
                                                                }(),
                                                              ),
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      LearnCardsRecord>>(
                                                                stream:
                                                                    queryLearnCardsRecord(
                                                                  queryBuilder:
                                                                      (learnCardsRecord) =>
                                                                          learnCardsRecord
                                                                              .where(
                                                                    'associatedTileBlock',
                                                                    isEqualTo:
                                                                        FFAppState()
                                                                            .selectedTileBlockRef
                                                                            ?.id,
                                                                  ),
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
                                                                  List<LearnCardsRecord>
                                                                      listViewLearnCardsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return ListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        listViewLearnCardsRecordList
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            listViewIndex) {
                                                                      final listViewLearnCardsRecord =
                                                                          listViewLearnCardsRecordList[
                                                                              listViewIndex];
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                15.0),
                                                                            child:
                                                                                ChataCTIVITYWidget(
                                                                              key: Key('Keyx7l_${listViewIndex}_of_${listViewLearnCardsRecordList.length}'),
                                                                              learnCardTitle: listViewLearnCardsRecord.title,
                                                                              learnCardType: listViewLearnCardsRecord.type,
                                                                              learnCardSummary: listViewLearnCardsRecord.summary,
                                                                              parameter4: containerCompanyCompaniesRecordList.first.colors.secondaryColor,
                                                                              learningCardId: listViewLearnCardsRecord.reference.id,
                                                                              sessionsDoc: containerSessionsRecordList.first,
                                                                              learnCardDocument: listViewLearnCardsRecord,
                                                                              companyDoc: containerCompanyCompaniesRecordList.first,
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
                                                          if (valueOrDefault<
                                                              bool>(
                                                            FFAppState()
                                                                    .endDrawerOpen ==
                                                                true,
                                                            false,
                                                          ))
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent2,
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      if (FFAppState()
                                                                          .endDrawerOpen)
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                  child: wrapWithModel(
                                                                                    model: _model.aICOMMUNICATIONDeletesoonModel,
                                                                                    updateCallback: () => setState(() {}),
                                                                                    child: AICOMMUNICATIONDeletesoonWidget(
                                                                                      askingQuestion: false,
                                                                                      learnCardId: valueOrDefault<String>(
                                                                                        FFAppState().selectedLearnCardId,
                                                                                        'No Card Selected',
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
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
