import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_list_nav_tile_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_itles_model.dart';
export 'header_itles_model.dart';

class HeaderItlesWidget extends StatefulWidget {
  const HeaderItlesWidget({
    super.key,
    this.tileDocs,
    int? initialTileIndex,
  }) : this.initialTileIndex = initialTileIndex ?? 0;

  final List<Tilesv2Record>? tileDocs;
  final int initialTileIndex;

  @override
  State<HeaderItlesWidget> createState() => _HeaderItlesWidgetState();
}

class _HeaderItlesWidgetState extends State<HeaderItlesWidget> {
  late HeaderItlesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderItlesModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HEADER_ITLES_headerItles_ON_INIT_STATE');
      logFirebaseEvent('headerItles_update_app_state');
      FFAppState().navPath = [];
      if (widget.tileDocs!.length >= 1) {
        logFirebaseEvent('headerItles_update_app_state');
        FFAppState().addToNavPath(valueOrDefault<String>(
          widget.tileDocs?[widget.initialTileIndex]?.reference.id,
          '0',
        ));
        FFAppState().viewTileContentId = valueOrDefault<String>(
          widget.tileDocs?[widget.initialTileIndex]?.reference.id,
          '0',
        );
        FFAppState().updateTileNavStruct(
          (e) => e..tier0Id = widget.tileDocs?.first?.reference.id,
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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ClipRRect(
          child: Container(
            decoration: BoxDecoration(),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Builder(
                  builder: (context) {
                    final tile = widget.tileDocs?.toList() ?? [];
                    if (tile.isEmpty) {
                      return Center(
                        child: EmptyListNavTileWidget(
                          tileIndex: 0,
                          tileTier: 0,
                          tileType: 'Nav',
                          tileName: 'Nav Tile 1',
                          tileParent: '0',
                          hintText: 'Get Started',
                        ),
                      );
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(tile.length, (tileIndex) {
                          final tileItem = tile[tileIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(17.0),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.easeIn,
                                width: 250.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    () {
                                      if (FFAppState().tileNav.tier0Id ==
                                          tileItem.reference.id) {
                                        return Color(0xFF1AADF9);
                                      } else if (tileItem.image != null &&
                                          tileItem.image != '') {
                                        return FlutterFlowTheme.of(context)
                                            .primary;
                                      } else {
                                        return Color(0xFFF4FDFF);
                                      }
                                    }(),
                                    Color(0xFFF4FDFF),
                                  ),
                                  borderRadius: BorderRadius.circular(17.0),
                                  border: Border.all(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'HEADER_ITLES_Container_hjm1c53x_ON_TAP');
                                      if (FFAppState().tileNav.tier0Id ==
                                          tileItem.reference.id) {
                                        logFirebaseEvent(
                                            'Container_update_app_state');
                                        _model.updatePage(() {
                                          FFAppState().tileNav = TileNavStruct
                                              .fromSerializableMap(jsonDecode(
                                                  '{\"tier0_id\":\"0\",\"tier1_id\":\"0\",\"tier2_id\":\"0\",\"tier3_id\":\"0\",\"tier4_id\":\"0\"}'));
                                          FFAppState().viewTileContentId = 'id';
                                          FFAppState().navPath = [];
                                        });
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
                                        duration: Duration(milliseconds: 100),
                                        curve: Curves.easeIn,
                                        width: 250.0,
                                        height: 120.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
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
                                          visible: tileItem.image != null &&
                                                  tileItem.image != ''
                                              ? false
                                              : true,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              tileItem.title != null &&
                                                      tileItem.title != ''
                                                  ? tileItem.title
                                                  : valueOrDefault<String>(
                                                      'Tile ${tileIndex.toString()}',
                                                      'Tile',
                                                    ),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 22.0,
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
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).btnBk,
                        width: 1.0,
                      ),
                    ),
                    child: MouseRegion(
                      opaque: false,
                      cursor: MouseCursor.defer ?? MouseCursor.defer,
                      child: Opacity(
                        opacity: 10.0,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'HEADER_ITLES_Container_b9m6jbld_ON_TAP');
                          },
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0x121AADF9),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).btnBk,
                                    borderRadius: 8.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.add_a_photo_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .customColor7,
                                      size: 24.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.4,
                                  child: Text(
                                    'Add a cover photo',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      onEnter: ((event) async {
                        setState(() => _model.mouseRegionHovered = true);
                        logFirebaseEvent(
                            'HEADER_ITLES_MouseRegion_e87qt2fo_ON_TOG');
                      }),
                      onExit: ((event) async {
                        setState(() => _model.mouseRegionHovered = false);
                        logFirebaseEvent(
                            'HEADER_ITLES_MouseRegion_e87qt2fo_ON_TOG');
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
