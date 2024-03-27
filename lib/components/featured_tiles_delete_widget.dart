import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'featured_tiles_delete_model.dart';
export 'featured_tiles_delete_model.dart';

class FeaturedTilesDeleteWidget extends StatefulWidget {
  const FeaturedTilesDeleteWidget({
    super.key,
    this.tileDocs,
    int? initialTileIndex,
  }) : initialTileIndex = initialTileIndex ?? 0;

  final List<Tilesv2Record>? tileDocs;
  final int initialTileIndex;

  @override
  State<FeaturedTilesDeleteWidget> createState() =>
      _FeaturedTilesDeleteWidgetState();
}

class _FeaturedTilesDeleteWidgetState extends State<FeaturedTilesDeleteWidget> {
  late FeaturedTilesDeleteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeaturedTilesDeleteModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FEATURED_TILES_DELETE_featuredTiles-dele');
      logFirebaseEvent('featuredTiles-delete_update_component_st');
      setState(() {
        _model.selectedTileId = valueOrDefault<String>(
          widget.tileDocs?[widget.initialTileIndex].reference.id,
          '0',
        );
      });
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
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 12.0,
          maxHeight: 160.0,
        ),
        decoration: const BoxDecoration(),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (context) {
              final tile = widget.tileDocs?.toList() ?? [];
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(tile.length, (tileIndex) {
                  final tileItem = tile[tileIndex];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'FEATURED_TILES_DELETE_Container_p06hf80s');
                        if (FFAppState().tileNav.tier0Id ==
                            tileItem.reference.id) {
                          logFirebaseEvent('Container_update_app_state');
                          FFAppState().tileNav =
                              TileNavStruct.fromSerializableMap(jsonDecode(
                                  '{\"tier0_id\":\"0\",\"tier1_id\":\"0\",\"tier2_id\":\"0\",\"tier3_id\":\"0\",\"tier4_id\":\"0\"}'));
                          FFAppState().navPath = [];
                          FFAppState().viewTileContentId = 'id';
                        } else {
                          logFirebaseEvent('Container_update_app_state');
                          FFAppState().tileNav =
                              TileNavStruct.fromSerializableMap(jsonDecode(
                                  '{\"tier0_id\":\"0\",\"tier1_id\":\"0\",\"tier2_id\":\"0\",\"tier3_id\":\"0\",\"tier4_id\":\"0\"}'));
                          FFAppState().navPath = [];
                          logFirebaseEvent('Container_update_app_state');
                          _model.updatePage(() {
                            FFAppState().tileNav = TileNavStruct(
                              tier0Id: tileItem.reference.id,
                              tier1Id: '0',
                              tier2Id: '0',
                              tier3Id: '0',
                              tier4Id: '0',
                            );
                            FFAppState().viewTileContentId =
                                tileItem.reference.id;
                            FFAppState().addToNavPath(tileItem.reference.id);
                          });
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeIn,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            FFAppState().tileNav.tier0Id ==
                                    tileItem.reference.id
                                ? const Color(0xFF1AADF9)
                                : FlutterFlowTheme.of(context).primary,
                            FlutterFlowTheme.of(context).primary,
                          ),
                          borderRadius: BorderRadius.circular(17.0),
                          border: Border.all(
                            color: valueOrDefault<Color>(
                              FFAppState().tileNav.tier0Id ==
                                      tileItem.reference.id
                                  ? const Color(0xFF1A5AF9)
                                  : Colors.transparent,
                              Colors.transparent,
                            ),
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(17.0),
                            child: Image.network(
                              tileItem.image,
                              fit: BoxFit.scaleDown,
                            ),
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
    );
  }
}
