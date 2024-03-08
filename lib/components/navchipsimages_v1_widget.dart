import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navchipsimages_v1_model.dart';
export 'navchipsimages_v1_model.dart';

class NavchipsimagesV1Widget extends StatefulWidget {
  const NavchipsimagesV1Widget({
    super.key,
    this.tileDocs,
    int? initialTileIndex,
  }) : initialTileIndex = initialTileIndex ?? 0;

  final List<TilesRecord>? tileDocs;
  final int initialTileIndex;

  @override
  State<NavchipsimagesV1Widget> createState() => _NavchipsimagesV1WidgetState();
}

class _NavchipsimagesV1WidgetState extends State<NavchipsimagesV1Widget> {
  late NavchipsimagesV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavchipsimagesV1Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NAVCHIPSIMAGES_V1_navchipsimagesV1_ON_IN');
      logFirebaseEvent('navchipsimagesV1_update_app_state');
      FFAppState().navPath = [];
      if (widget.tileDocs!.isNotEmpty) {
        logFirebaseEvent('navchipsimagesV1_update_app_state');
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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(
                builder: (context) {
                  final tile = widget.tileDocs
                          ?.where((e) => e.tier == 99)
                          .toList()
                          .toList() ??
                      [];
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(tile.length, (tileIndex) {
                        final tileItem = tile[tileIndex];
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(17.0),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.easeIn,
                              width: 300.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  () {
                                    if (FFAppState().tileNav.tier0Id ==
                                        tileItem.reference.id) {
                                      return FlutterFlowTheme.of(context)
                                          .accent4;
                                    } else if (tileItem.image != '') {
                                      return FlutterFlowTheme.of(context)
                                          .primary;
                                    } else {
                                      return const Color(0xFFF4FDFF);
                                    }
                                  }(),
                                  const Color(0xFFF4FDFF),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(17.0),
                                border: Border.all(
                                  color: valueOrDefault<Color>(
                                    () {
                                      if (FFAppState().tileNav.tier0Id ==
                                          tileItem.reference.id) {
                                        return FlutterFlowTheme.of(context)
                                            .accent3;
                                      } else if (tileItem.image != '') {
                                        return FlutterFlowTheme.of(context)
                                            .primary;
                                      } else {
                                        return const Color(0xFFF4FDFF);
                                      }
                                    }(),
                                    const Color(0xFFF4FDFF),
                                  ),
                                  width: 1.0,
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
                                        'NAVCHIPSIMAGES_V1_Container_hx53en51_ON_');
                                    if (FFAppState().tileNav.tier0Id ==
                                        tileItem.reference.id) {
                                      logFirebaseEvent(
                                          'Container_update_app_state');
                                      _model.updatePage(() {});
                                    } else {
                                      logFirebaseEvent(
                                          'Container_update_app_state');
                                      _model.updatePage(() {
                                        FFAppState().tileNav = TileNavStruct(
                                          tier0Id: tileItem.reference.id,
                                          tier1Id: '',
                                          tier2Id: '',
                                          tier3Id: '',
                                          tier4Id: '',
                                        );
                                        FFAppState().viewTileContentId =
                                            tileItem.reference.id;
                                        FFAppState().navPath = (String var1) {
                                          return [var1];
                                        }(tileItem.reference.id)
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
                                      width: 150.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          image: Image.network(
                                            tileItem.image,
                                          ).image,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(17.0),
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      child: Visibility(
                                        visible: tileItem.image != ''
                                            ? false
                                            : true,
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            tileItem.title != ''
                                                ? tileItem.title
                                                : valueOrDefault<String>(
                                                    'Tile ${tileIndex.toString()}',
                                                    'Tile',
                                                  ),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
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
    );
  }
}
