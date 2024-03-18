import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'history_tiles_model.dart';
export 'history_tiles_model.dart';

class HistoryTilesWidget extends StatefulWidget {
  const HistoryTilesWidget({
    super.key,
    this.tile,
    this.tiledoc,
    this.historydoc,
  });

  final TilesRecord? tile;
  final TilesRecord? tiledoc;
  final HistoryRecord? historydoc;

  @override
  State<HistoryTilesWidget> createState() => _HistoryTilesWidgetState();
}

class _HistoryTilesWidgetState extends State<HistoryTilesWidget> {
  late HistoryTilesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryTilesModel());

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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Text(
                  'History',
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
              ),
              Container(
                width: 1200.0,
                height: 40.0,
                decoration: BoxDecoration(),
                child: StreamBuilder<List<HistoryRecord>>(
                  stream: queryHistoryRecord(
                    parent: currentUserReference,
                    queryBuilder: (historyRecord) =>
                        historyRecord.orderBy('datevisited', descending: true),
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
                    List<HistoryRecord> listViewHistoryRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      itemCount: listViewHistoryRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewHistoryRecord =
                            listViewHistoryRecordList[listViewIndex];
                        return Container(
                          height: 100.0,
                          decoration: BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'HISTORY_TILES_Column_gnia4rl4_ON_TAP');
                              logFirebaseEvent('Column_update_component_state');
                              setState(() {
                                _model.historyID = listViewHistoryRecord.id;
                              });
                              logFirebaseEvent('Column_update_app_state');
                              FFAppState().update(() {
                                FFAppState().selectedTile =
                                    listViewHistoryRecord.tilename;
                                FFAppState().historyActive = true;
                                FFAppState().selectedHistoryRef =
                                    listViewHistoryRecord.reference;
                                FFAppState().SelectedTileRef =
                                    listViewHistoryRecord.tileid;
                              });
                              logFirebaseEvent('Column_update_app_state');
                              setState(() {
                                FFAppState().selectedParentRef =
                                    listViewHistoryRecord.tileref;
                              });
                              logFirebaseEvent('Column_backend_call');

                              await listViewHistoryRecord.reference
                                  .update(createHistoryRecordData(
                                id: _model.historyID,
                              ));
                              if (listViewHistoryRecord.issub == true) {
                                logFirebaseEvent(
                                    'Column_update_component_state');
                                setState(() {
                                  _model.historyID = listViewHistoryRecord.id;
                                });
                              }
                              if (listViewHistoryRecord.id > 0) {
                                logFirebaseEvent('Column_update_app_state');
                                setState(() {
                                  FFAppState().childrenfound = true;
                                });
                              } else {
                                logFirebaseEvent('Column_update_app_state');
                                setState(() {
                                  FFAppState().childrenfound = false;
                                });
                              }
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 10.0, 20.0, 0.0),
                                        child: Text(
                                          listViewHistoryRecord.tilename,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: FFAppState()
                                                            .selectedHistoryRef ==
                                                        listViewHistoryRecord
                                                            .reference
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .darkercolour,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts:
                                                    GoogleFonts.asMap()
                                                        .containsKey('Outfit'),
                                              ),
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
