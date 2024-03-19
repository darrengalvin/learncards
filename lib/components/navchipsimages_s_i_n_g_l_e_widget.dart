import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navchipsimages_s_i_n_g_l_e_model.dart';
export 'navchipsimages_s_i_n_g_l_e_model.dart';

class NavchipsimagesSINGLEWidget extends StatefulWidget {
  const NavchipsimagesSINGLEWidget({
    super.key,
    this.tileDocs,
    int? initialTileIndex,
  }) : initialTileIndex = initialTileIndex ?? 0;

  final List<Tilesv2Record>? tileDocs;
  final int initialTileIndex;

  @override
  State<NavchipsimagesSINGLEWidget> createState() =>
      _NavchipsimagesSINGLEWidgetState();
}

class _NavchipsimagesSINGLEWidgetState
    extends State<NavchipsimagesSINGLEWidget> {
  late NavchipsimagesSINGLEModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavchipsimagesSINGLEModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NAVCHIPSIMAGES_S_I_N_G_L_E_navchipsimage');
      logFirebaseEvent('navchipsimagesSINGLE_update_app_state');
      FFAppState().navPath = [];
      if (widget.tileDocs!.isNotEmpty) {
        logFirebaseEvent('navchipsimagesSINGLE_update_app_state');
        FFAppState().addToNavPath(valueOrDefault<String>(
          widget.tileDocs?[widget.initialTileIndex].reference.id,
          '0',
        ));
        FFAppState().viewTileContentId = valueOrDefault<String>(
          widget.tileDocs?[widget.initialTileIndex].reference.id,
          '0',
        );
        FFAppState().updateTileNavStruct(
          (e) => e..tier0Id = widget.tileDocs?.first.reference.id,
        );
      }
    });

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

    return ClipRRect(
      child: Container(
        decoration: const BoxDecoration(),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: StreamBuilder<List<Tilesv2Record>>(
          stream: queryTilesv2Record(
            queryBuilder: (tilesv2Record) => tilesv2Record
                .where(
                  'tile_id',
                  isEqualTo: FFAppState().viewTileContentId,
                )
                .where(
                  'tile_tier',
                  isEqualTo: 0,
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
            List<Tilesv2Record> listViewNTilesv2RecordList = snapshot.data!;
            // Return an empty Container when the item does not exist.
            if (snapshot.data!.isEmpty) {
              return Container();
            }
            final listViewNTilesv2Record = listViewNTilesv2RecordList.isNotEmpty
                ? listViewNTilesv2RecordList.first
                : null;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeIn,
                        width: 340.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            () {
                              if (FFAppState().tileNav.tier0Id ==
                                  listViewNTilesv2Record?.reference.id) {
                                return const Color(0xFF1AADF9);
                              } else if (listViewNTilesv2Record?.reference !=
                                  null) {
                                return FlutterFlowTheme.of(context).primary;
                              } else {
                                return const Color(0xFFF4FDFF);
                              }
                            }(),
                            const Color(0xFFF4FDFF),
                          ),
                          borderRadius: BorderRadius.circular(17.0),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'NAVCHIPSIMAGES_S_I_N_G_L_E_Container_ljp');
                              if (FFAppState().tileNav.tier0Id ==
                                  listViewNTilesv2Record.reference.id) {
                                logFirebaseEvent('Container_update_app_state');
                                _model.updatePage(() {
                                  FFAppState().tileNav = TileNavStruct
                                      .fromSerializableMap(jsonDecode(
                                          '{\"tier0_id\":\"0\",\"tier1_id\":\"0\",\"tier2_id\":\"0\",\"tier3_id\":\"0\",\"tier4_id\":\"0\"}'));
                                  FFAppState().viewTileContentId = 'id';
                                  FFAppState().navPath = [];
                                });
                              } else {
                                logFirebaseEvent('Container_update_app_state');
                                _model.updatePage(() {
                                  FFAppState().tileNav = TileNavStruct(
                                    tier0Id:
                                        listViewNTilesv2Record.reference.id,
                                    tier1Id: '',
                                    tier2Id: '',
                                    tier3Id: '',
                                    tier4Id: '',
                                  );
                                  FFAppState().viewTileContentId =
                                      listViewNTilesv2Record.reference.id;
                                  FFAppState().navPath = (String var1) {
                                    return [var1];
                                  }(listViewNTilesv2Record.reference.id)
                                      .toList()
                                      .cast<String>();
                                });
                              }
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(17.0),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.easeIn,
                                width: 180.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    image: Image.network(
                                      listViewNTilesv2Record!.featuredImage,
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(17.0),
                                  border: Border.all(
                                    color: Colors.transparent,
                                  ),
                                ),
                                child: Visibility(
                                  visible: listViewNTilesv2Record.title != ''
                                      ? false
                                      : true,
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      listViewNTilesv2Record.title,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
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
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
