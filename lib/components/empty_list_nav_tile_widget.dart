import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_list_nav_tile_model.dart';
export 'empty_list_nav_tile_model.dart';

class EmptyListNavTileWidget extends StatefulWidget {
  const EmptyListNavTileWidget({
    super.key,
    int? tileIndex,
    int? tileTier,
    String? tileType,
    String? tileName,
    String? tileParent,
    String? hintText,
  })  : tileIndex = tileIndex ?? 0,
        tileTier = tileTier ?? 0,
        tileType = tileType ?? 'Nav',
        tileName = tileName ?? 'New Tile',
        tileParent = tileParent ?? '0',
        hintText = hintText ?? 'Get Started';

  final int tileIndex;
  final int tileTier;
  final String tileType;
  final String tileName;
  final String tileParent;
  final String hintText;

  @override
  State<EmptyListNavTileWidget> createState() => _EmptyListNavTileWidgetState();
}

class _EmptyListNavTileWidgetState extends State<EmptyListNavTileWidget> {
  late EmptyListNavTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListNavTileModel());

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

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('EMPTY_LIST_NAV_TILE_Container_xkdzooba_O');
          logFirebaseEvent('Container_backend_call');

          var tilesv2RecordReference = Tilesv2Record.collection.doc();
          await tilesv2RecordReference.set({
            ...createTilesv2RecordData(
              createdTime: getCurrentTimestamp,
              updatedTime: getCurrentTimestamp,
              user: currentUserReference,
              uid: currentUserUid,
              type: 'Content',
              title: 'Nav Tile 1',
              subtitle: '',
              details: '',
              image: '',
              thumbnail: '',
              isPublished: false,
              layout: 'Library',
              category: '',
              isPublic: false,
              isPinned: false,
              isFeatured: false,
              parentId: 'Nav',
              isContent: false,
              tileId: '',
              tileType: 'Content',
              tileName: widget.tileName,
              tileStatus: 'Draft',
              tileTier: widget.tileTier,
              tileIndex: valueOrDefault<int>(
                widget.tileIndex,
                0,
              ),
            ),
            ...mapToFirestore(
              {
                'tags': [''],
                'access_users': [FFAppState().tileNav.tier0Id],
                'access_groups': [],
                'admin_users': [currentUserUid],
              },
            ),
          });
          _model.newNavTile = Tilesv2Record.getDocumentFromData({
            ...createTilesv2RecordData(
              createdTime: getCurrentTimestamp,
              updatedTime: getCurrentTimestamp,
              user: currentUserReference,
              uid: currentUserUid,
              type: 'Content',
              title: 'Nav Tile 1',
              subtitle: '',
              details: '',
              image: '',
              thumbnail: '',
              isPublished: false,
              layout: 'Library',
              category: '',
              isPublic: false,
              isPinned: false,
              isFeatured: false,
              parentId: 'Nav',
              isContent: false,
              tileId: '',
              tileType: 'Content',
              tileName: widget.tileName,
              tileStatus: 'Draft',
              tileTier: widget.tileTier,
              tileIndex: valueOrDefault<int>(
                widget.tileIndex,
                0,
              ),
            ),
            ...mapToFirestore(
              {
                'tags': [''],
                'access_users': [FFAppState().tileNav.tier0Id],
                'access_groups': [],
                'admin_users': [currentUserUid],
              },
            ),
          }, tilesv2RecordReference);
          logFirebaseEvent('Container_backend_call');

          await _model.newNavTile!.reference.update(createTilesv2RecordData(
            tileId: _model.newNavTile?.reference.id,
            parentId:
                widget.tileTier == 0 ? 'Nav' : FFAppState().viewTileContentId,
          ));
          logFirebaseEvent('Container_update_app_state');
          _model.updatePage(() {
            FFAppState().callbackAction = 'NewTile';
            FFAppState().viewTileContentId = _model.newNavTile!.reference.id;
            FFAppState().addToNavPath(_model.newNavTile!.reference.id);
            FFAppState().updateTileNavStruct(
              (e) => e..tier0Id = _model.newNavTile?.reference.id,
            );
          });

          setState(() {});
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(17.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeIn,
            width: 250.0,
            height: 120.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary,
              borderRadius: BorderRadius.circular(17.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).customColor7,
                width: 2.0,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.add_box_outlined,
                  color: FlutterFlowTheme.of(context).customColor7,
                  size: 48.0,
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.hintText,
                      'Get Started',
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).customColor7,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
