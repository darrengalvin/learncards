import '/backend/backend.dart';
import '/components/drawer_tile_tree_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'dash_news_model.dart';
export 'dash_news_model.dart';

class DashNewsWidget extends StatefulWidget {
  const DashNewsWidget({super.key});

  @override
  State<DashNewsWidget> createState() => _DashNewsWidgetState();
}

class _DashNewsWidgetState extends State<DashNewsWidget> {
  late DashNewsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashNewsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'dashNews'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DASH_NEWS_PAGE_dashNews_ON_INIT_STATE');
      logFirebaseEvent('dashNews_update_app_state');
      setState(() {
        FFAppState().navPath = [];
        FFAppState().tileNav = TileNavStruct.fromSerializableMap(jsonDecode(
            '{\"tier0_id\":\"0\",\"tier1_id\":\"0\",\"tier2_id\":\"0\",\"tier3_id\":\"0\",\"tier4_id\":\"0\"}'));
        FFAppState().viewTileContentId = 'id';
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
        List<Tilesv2Record> dashNewsTilesv2RecordList = snapshot.data!;
        return Title(
            title: 'dashNews',
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
                        'DASH_NEWS_FloatingActionButton_1aq7x360_');
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
                                    'DASH_NEWS_Container_u109lkrb_CALLBACK');
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
                  child: StreamBuilder<List<CompaniesRecord>>(
                    stream: queryCompaniesRecord(
                      queryBuilder: (companiesRecord) => companiesRecord.where(
                        'isowner',
                        isEqualTo: true,
                      ),
                      singleRecord: true,
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
                      List<CompaniesRecord> rowCompaniesRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final rowCompaniesRecord =
                          rowCompaniesRecordList.isNotEmpty
                              ? rowCompaniesRecordList.first
                              : null;
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'DASH_NEWS_PAGE_Row_fgnuala4_ON_TAP');
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
