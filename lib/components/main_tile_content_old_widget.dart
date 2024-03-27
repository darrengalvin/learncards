import '/add_items/create_new_tilea_inside/create_new_tilea_inside_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/edit_tile_block/edit_tile_block_widget.dart';
import '/social_feed/social/social_widget.dart';
import '/testpage/components/edit_document_tile/edit_document_tile_widget.dart';
import '/testpage/components/edit_link_in_tile/edit_link_in_tile_widget.dart';
import '/testpage/components/edit_tile/edit_tile_widget.dart';
import '/testpage/components/history_tiles/history_tiles_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'main_tile_content_old_model.dart';
export 'main_tile_content_old_model.dart';

class MainTileContentOldWidget extends StatefulWidget {
  const MainTileContentOldWidget({
    super.key,
    this.tilesdoc,
    this.tilesdocref,
    this.categoryref,
  });

  final TilesRecord? tilesdoc;
  final DocumentReference? tilesdocref;
  final DocumentReference? categoryref;

  @override
  State<MainTileContentOldWidget> createState() =>
      _MainTileContentOldWidgetState();
}

class _MainTileContentOldWidgetState extends State<MainTileContentOldWidget> {
  late MainTileContentOldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainTileContentOldModel());

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

    return Visibility(
      visible: (currentUserDocument?.hasaccess?.toList() ?? [])
          .contains(FFAppState().selectedcategory),
      child: AuthUserStreamWidget(
        builder: (context) => Container(
          constraints: BoxConstraints(
            maxWidth: 870.0,
          ),
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: StreamBuilder<List<TilesRecord>>(
                  stream: queryTilesRecord(
                    queryBuilder: (tilesRecord) => tilesRecord.where(
                      'title',
                      isEqualTo: FFAppState().selectedTile,
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
                    List<TilesRecord> listViewTilesRecordList = snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final listViewTilesRecord =
                        listViewTilesRecordList.isNotEmpty
                            ? listViewTilesRecordList.first
                            : null;
                    return ListView(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (valueOrDefault<bool>(
                                      currentUserDocument?.isadmin, false) ==
                                  true)
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'MAIN_TILE_CONTENT_OLD_Row_hnm9fwj4_ON_TA');
                                        logFirebaseEvent('Row_backend_call');

                                        var tileblocksRecordReference =
                                            TileblocksRecord.collection.doc();
                                        await tileblocksRecordReference.set({
                                          ...createTileblocksRecordData(
                                            headertext: '',
                                            id: 0,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'tileref': [
                                                listViewTilesRecord?.reference
                                              ],
                                            },
                                          ),
                                        });
                                        _model.createdTileBlockCopy =
                                            TileblocksRecord
                                                .getDocumentFromData({
                                          ...createTileblocksRecordData(
                                            headertext: '',
                                            id: 0,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'tileref': [
                                                listViewTilesRecord?.reference
                                              ],
                                            },
                                          ),
                                        }, tileblocksRecordReference);
                                        logFirebaseEvent('Row_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Color(0x00000000),
                                          barrierColor: Color(0x00000000),
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height: double.infinity,
                                                  child: EditTileBlockWidget(
                                                    tileblock: _model
                                                        .createdTileBlockCopy,
                                                    tileblockref: _model
                                                        .createdTileBlockCopy
                                                        ?.reference,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        setState(() {});
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if ((valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.isadmin,
                                                      false) ==
                                                  true) &&
                                              (FFAppState().historyActive ==
                                                  false))
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.note_add,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .darkercolour,
                                                size: 20.0,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                          Text(
                                            'Create Content Block',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (valueOrDefault<bool>(
                                            currentUserDocument?.isadmin,
                                            false) ==
                                        true)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'MAIN_TILE_CONTENT_OLD_Row_jruhkhqn_ON_TA');
                                            logFirebaseEvent(
                                                'Row_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              barrierColor: Color(0x00000000),
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: Container(
                                                      height: 600.0,
                                                      child:
                                                          CreateNewTileaInsideWidget(
                                                        tilesdoc:
                                                            listViewTilesRecord,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if ((valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isadmin,
                                                          false) ==
                                                      true) &&
                                                  (FFAppState().historyActive ==
                                                      false))
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.note_add,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .darkercolour,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              Text(
                                                'Add Child Tile',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 60.0,
                                          icon: FaIcon(
                                            FontAwesomeIcons.gripVertical,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 30.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'MAIN_TILE_CONTENT_OLD_gripVertical_ICN_O');
                                            logFirebaseEvent(
                                                'IconButton_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: Container(
                                                      height: 150.0,
                                                      child:
                                                          HistoryTilesWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if ((FFAppState().childrenfound == true) &&
                                        (FFAppState().isasubtile == true))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 7.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    maxHeight: 80.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: StreamBuilder<
                                                      List<TilesRecord>>(
                                                    stream: queryTilesRecord(
                                                      queryBuilder:
                                                          (tilesRecord) =>
                                                              tilesRecord
                                                                  .where(
                                                                    'parent',
                                                                    isEqualTo:
                                                                        FFAppState()
                                                                            .SelectedTileRef,
                                                                  )
                                                                  .orderBy(
                                                                      'id'),
                                                    ),
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
                                                      List<TilesRecord>
                                                          listViewTilesRecordList =
                                                          snapshot.data!;
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            listViewTilesRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewTilesRecord =
                                                              listViewTilesRecordList[
                                                                  listViewIndex];
                                                          return Visibility(
                                                            visible: (listViewTilesRecord
                                                                        .isAI !=
                                                                    true) ||
                                                                (listViewTilesRecord
                                                                        .reference ==
                                                                    FFAppState()
                                                                        .SelectedTileRef),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        300.0,
                                                                    height:
                                                                        60.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'MAIN_TILE_CONTENT_OLD_COMP_tile_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'tile_update_app_state');
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().historyActive =
                                                                                true;
                                                                            FFAppState().selectedTile =
                                                                                listViewTilesRecord.title;
                                                                            FFAppState().selectedSubTilesRef =
                                                                                listViewTilesRecord?.reference;
                                                                            FFAppState().SelectedTileRef =
                                                                                listViewTilesRecord.reference;
                                                                            FFAppState().isSubTile =
                                                                                true;
                                                                            FFAppState().mainTileRefSelected =
                                                                                listViewTilesRecord.parent;
                                                                          });
                                                                          logFirebaseEvent(
                                                                              'tile_update_component_state');
                                                                          setState(
                                                                              () {
                                                                            _model.historyID =
                                                                                _model.historyID! + 1;
                                                                          });
                                                                          if (listViewTilesRecord.children.length >
                                                                              0) {
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

                                                                          logFirebaseEvent(
                                                                              'tile_update_app_state');
                                                                          setState(
                                                                              () {
                                                                            FFAppState().lasttiletouched =
                                                                                listViewTilesRecord.reference;
                                                                          });
                                                                          if (listViewTilesRecord.reference ==
                                                                              FFAppState().selectedtilechangecolor) {
                                                                            logFirebaseEvent('tile_alert_dialog');
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return WebViewAware(
                                                                                  child: AlertDialog(
                                                                                    title: Text('Do nothing'),
                                                                                    content: Text('This will be deleted'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          } else {
                                                                            logFirebaseEvent('tile_backend_call');

                                                                            var historyRecordReference =
                                                                                HistoryRecord.createDoc(currentUserReference!);
                                                                            await historyRecordReference.set(createHistoryRecordData(
                                                                              tileid: FFAppState().SelectedTileRef,
                                                                              uid: currentUserReference,
                                                                              datevisited: getCurrentTimestamp,
                                                                              tilename: listViewTilesRecord.title,
                                                                              issub: true,
                                                                              id: functions.plusOneToVariable(_model.historyID),
                                                                            ));
                                                                            _model.createdHistorydocs = HistoryRecord.getDocumentFromData(
                                                                                createHistoryRecordData(
                                                                                  tileid: FFAppState().SelectedTileRef,
                                                                                  uid: currentUserReference,
                                                                                  datevisited: getCurrentTimestamp,
                                                                                  tilename: listViewTilesRecord.title,
                                                                                  issub: true,
                                                                                  id: functions.plusOneToVariable(_model.historyID),
                                                                                ),
                                                                                historyRecordReference);
                                                                          }

                                                                          if (listViewTilesRecord.tileref ==
                                                                              null) {
                                                                            logFirebaseEvent('tile_backend_call');

                                                                            await listViewTilesRecord.reference.update(createTilesRecordData(
                                                                              tileref: listViewTilesRecord.reference,
                                                                            ));
                                                                          }

                                                                          setState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              400.0,
                                                                          height:
                                                                              40.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 3.0,
                                                                                color: FlutterFlowTheme.of(context).lightergrey,
                                                                                offset: Offset(0.0, 1.0),
                                                                              )
                                                                            ],
                                                                            gradient:
                                                                                LinearGradient(
                                                                              colors: [
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                                FlutterFlowTheme.of(context).secondary
                                                                              ],
                                                                              stops: [
                                                                                0.0,
                                                                                1.0
                                                                              ],
                                                                              begin: AlignmentDirectional(0.0, -1.0),
                                                                              end: AlignmentDirectional(0, 1.0),
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FFAppState().SelectedTileRef == listViewTilesRecord.reference ? FlutterFlowTheme.of(context).darkercolour : FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 4.0, 0.0),
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
                                                                              if (valueOrDefault<bool>(currentUserDocument?.isadmin, false) == true)
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('MAIN_TILE_CONTENT_OLD_Icon_ggip193w_ON_T');
                                                                                              logFirebaseEvent('Icon_backend_call');

                                                                                              await listViewTilesRecord.reference.update({
                                                                                                ...mapToFirestore(
                                                                                                  {
                                                                                                    'id': FieldValue.increment(-1),
                                                                                                  },
                                                                                                ),
                                                                                              });
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.upload_sharp,
                                                                                              color: Color(0xFF57636C),
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('MAIN_TILE_CONTENT_OLD_Icon_w2siaai9_ON_T');
                                                                                              logFirebaseEvent('Icon_backend_call');

                                                                                              await listViewTilesRecord.reference.update({
                                                                                                ...mapToFirestore(
                                                                                                  {
                                                                                                    'id': FieldValue.increment(1),
                                                                                                  },
                                                                                                ),
                                                                                              });
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.download_outlined,
                                                                                              color: Color(0xFF57636C),
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('MAIN_TILE_CONTENT_OLD_Icon_r7db068y_ON_T');
                                                                                              logFirebaseEvent('Icon_alert_dialog');
                                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                                    context: context,
                                                                                                    builder: (alertDialogContext) {
                                                                                                      return WebViewAware(
                                                                                                        child: AlertDialog(
                                                                                                          title: Text('Delete Tile'),
                                                                                                          content: Text('Are you sure you wish to delete this tile?'),
                                                                                                          actions: [
                                                                                                            TextButton(
                                                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                              child: Text('Cancel'),
                                                                                                            ),
                                                                                                            TextButton(
                                                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                              child: Text('Confirm '),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ) ??
                                                                                                  false;
                                                                                              if (confirmDialogResponse) {
                                                                                                logFirebaseEvent('Icon_backend_call');
                                                                                                await listViewTilesRecord.reference.delete();
                                                                                              }
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.delete_forever_outlined,
                                                                                              color: Color(0xFF57636C),
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('MAIN_TILE_CONTENT_OLD_Icon_3j4z5kns_ON_T');
                                                                                              logFirebaseEvent('Icon_bottom_sheet');
                                                                                              await showModalBottomSheet(
                                                                                                isScrollControlled: true,
                                                                                                backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                barrierColor: Color(0x00000000),
                                                                                                context: context,
                                                                                                builder: (context) {
                                                                                                  return WebViewAware(
                                                                                                    child: Padding(
                                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                                      child: Container(
                                                                                                        height: 600.0,
                                                                                                        child: EditTileWidget(
                                                                                                          tilesdoc: listViewTilesRecord,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ).then((value) => safeSetState(() {}));
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.edit_outlined,
                                                                                              color: Color(0xFF57636C),
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                            ],
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
                                                      );
                                                    },
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
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StreamBuilder<List<TileblocksRecord>>(
                              stream: queryTileblocksRecord(
                                queryBuilder: (tileblocksRecord) =>
                                    tileblocksRecord
                                        .where(
                                          'tileref',
                                          arrayContains:
                                              FFAppState().SelectedTileRef,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<TileblocksRecord>
                                    listViewTileblocksRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewTileblocksRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewTileblocksRecord =
                                        listViewTileblocksRecordList[
                                            listViewIndex];
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 6.0, 16.0, 6.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                gradient: LinearGradient(
                                                  colors: [
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                    FlutterFlowTheme.of(context)
                                                        .secondary
                                                  ],
                                                  stops: [0.0, 1.0],
                                                  begin: AlignmentDirectional(
                                                      0.0, -1.0),
                                                  end: AlignmentDirectional(
                                                      0, 1.0),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(17.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (valueOrDefault<bool>(
                                                              currentUserDocument
                                                                  ?.isadmin,
                                                              false) ==
                                                          true)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            4.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'MAIN_TILE_CONTENT_OLD_Icon_cimlhk8s_ON_T');
                                                                    logFirebaseEvent(
                                                                        'Icon_alert_dialog');
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return WebViewAware(
                                                                                  child: AlertDialog(
                                                                                    title: Text('Delete Tile Block'),
                                                                                    content: Text('Are you sure you wish to delete this tile block?'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                        child: Text('Cancel'),
                                                                                      ),
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                        child: Text('Confirm '),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                    if (confirmDialogResponse) {
                                                                      logFirebaseEvent(
                                                                          'Icon_backend_call');
                                                                      await listViewTileblocksRecord
                                                                          .reference
                                                                          .delete();
                                                                    }
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .delete_forever_outlined,
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                'Position ID: ${listViewTileblocksRecord.id.toString()}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            4.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'MAIN_TILE_CONTENT_OLD_Icon_45bit9lj_ON_T');
                                                                    logFirebaseEvent(
                                                                        'Icon_backend_call');

                                                                    await listViewTileblocksRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'id':
                                                                              FieldValue.increment(1),
                                                                        },
                                                                      ),
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .upload_sharp,
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            4.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'MAIN_TILE_CONTENT_OLD_Icon_4g4y7alj_ON_T');
                                                                    logFirebaseEvent(
                                                                        'Icon_backend_call');

                                                                    await listViewTileblocksRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'id':
                                                                              FieldValue.increment(-1),
                                                                        },
                                                                      ),
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .download_outlined,
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      if (valueOrDefault<bool>(
                                                              currentUserDocument
                                                                  ?.isadmin,
                                                              false) ==
                                                          true)
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 60.0,
                                                          icon: Icon(
                                                            Icons.edit_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 30.0,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'MAIN_TILE_CONTENT_OLD_edit_outlined_ICN_');
                                                            logFirebaseEvent(
                                                                'IconButton_bottom_sheet');
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Color(
                                                                      0x00000000),
                                                              barrierColor: Color(
                                                                  0x00000000),
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return WebViewAware(
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        Container(
                                                                      height: double
                                                                          .infinity,
                                                                      child:
                                                                          EditTileBlockWidget(
                                                                        tileblock:
                                                                            listViewTileblocksRecord,
                                                                        tileblockref:
                                                                            listViewTileblocksRecord.reference,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            logFirebaseEvent(
                                                                'IconButton_update_app_state');
                                                            setState(() {
                                                              FFAppState()
                                                                      .SelectedTileRef =
                                                                  listViewTilesRecord
                                                                      ?.reference;
                                                            });
                                                          },
                                                        ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Container(
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: 340.0,
                                                                maxHeight:
                                                                    300.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Visibility(
                                                                visible: listViewTileblocksRecord
                                                                            .image !=
                                                                        null &&
                                                                    listViewTileblocksRecord
                                                                            .image !=
                                                                        '',
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
                                                                          3.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    child: Image
                                                                        .network(
                                                                      listViewTileblocksRecord
                                                                          .image,
                                                                      width: double
                                                                          .infinity,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        if (listViewTileblocksRecord
                                                                    .headertext !=
                                                                null &&
                                                            listViewTileblocksRecord
                                                                    .headertext !=
                                                                '')
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5.0),
                                                            child: Text(
                                                              listViewTileblocksRecord
                                                                  .headertext,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineMedium,
                                                            ),
                                                          ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      7.0,
                                                                      0.0,
                                                                      7.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (listViewTileblocksRecord
                                                                          .textblock !=
                                                                      null &&
                                                                  listViewTileblocksRecord
                                                                          .textblock !=
                                                                      '')
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            5.0),
                                                                    child: Text(
                                                                      listViewTileblocksRecord
                                                                          .textblock,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey('Outfit'),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: 1200.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                ],
                                                                stops: [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                end:
                                                                    AlignmentDirectional(
                                                                        0, 1.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            if ((listViewTileblocksRecord
                                                                            .buttontextlinktopage !=
                                                                        null &&
                                                                    listViewTileblocksRecord
                                                                            .buttontextlinktopage !=
                                                                        '') ||
                                                                (listViewTileblocksRecord
                                                                            .linktopage !=
                                                                        null &&
                                                                    listViewTileblocksRecord
                                                                            .linktopage !=
                                                                        ''))
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'MAIN_TILE_CONTENT_OLD_BUTTON_BTN_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Button_launch_u_r_l');
                                                                    await launchURL(
                                                                        listViewTileblocksRecord
                                                                            .linktopage);
                                                                  },
                                                                  text: listViewTileblocksRecord
                                                                      .buttontextlinktopage,
                                                                  options:
                                                                      FFButtonOptions(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            20.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleSmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                        ),
                                                                    elevation:
                                                                        2.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  StreamBuilder<
                                                      List<VideosRecord>>(
                                                    stream: queryVideosRecord(
                                                      queryBuilder:
                                                          (videosRecord) =>
                                                              videosRecord
                                                                  .where(
                                                        'tileref',
                                                        arrayContains:
                                                            FFAppState()
                                                                .SelectedTileRef,
                                                      ),
                                                    ),
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
                                                      List<VideosRecord>
                                                          listViewVideosVideosRecordList =
                                                          snapshot.data!;
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewVideosVideosRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewVideosIndex) {
                                                          final listViewVideosVideosRecord =
                                                              listViewVideosVideosRecordList[
                                                                  listViewVideosIndex];
                                                          return Visibility(
                                                            visible: (listViewTileblocksRecord
                                                                        .videolisttitle
                                                                        .length >
                                                                    0) &&
                                                                listViewTileblocksRecord
                                                                    .videolisttitle
                                                                    .contains(
                                                                        listViewVideosVideosRecord
                                                                            .title) &&
                                                                (listViewVideosVideosRecord
                                                                        .isai !=
                                                                    true),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
                                                                          3.0),
                                                              child: Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      300.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          5.0,
                                                                      color: Color(
                                                                          0x230E151B),
                                                                      offset: Offset(
                                                                          0.0,
                                                                          2.0),
                                                                    )
                                                                  ],
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0, 1.0),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              32.0,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                1200.0,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            gradient:
                                                                                LinearGradient(
                                                                              colors: [
                                                                                FlutterFlowTheme.of(context).accent3,
                                                                                FlutterFlowTheme.of(context).secondary
                                                                              ],
                                                                              stops: [
                                                                                0.0,
                                                                                1.0
                                                                              ],
                                                                              begin: AlignmentDirectional(0.0, -1.0),
                                                                              end: AlignmentDirectional(0, 1.0),
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(16.0),
                                                                              topRight: Radius.circular(16.0),
                                                                            ),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                        ),
                                                                        Container(
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                600.0,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: 1200.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                FlutterFlowVideoPlayer(
                                                                              path: listViewVideosVideosRecord.videofromurl,
                                                                              videoType: VideoType.network,
                                                                              height: double.infinity,
                                                                              autoPlay: false,
                                                                              looping: true,
                                                                              showControls: true,
                                                                              allowFullScreen: true,
                                                                              allowPlaybackSpeedMenu: true,
                                                                              lazyLoad: false,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            gradient:
                                                                                LinearGradient(
                                                                              colors: [
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                                FlutterFlowTheme.of(context).secondary
                                                                              ],
                                                                              stops: [
                                                                                0.0,
                                                                                1.0
                                                                              ],
                                                                              begin: AlignmentDirectional(0.0, -1.0),
                                                                              end: AlignmentDirectional(0, 1.0),
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(16.0),
                                                                              bottomRight: Radius.circular(16.0),
                                                                              topLeft: Radius.circular(0.0),
                                                                              topRight: Radius.circular(0.0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsets.all(12.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      listViewVideosVideosRecord.title,
                                                                                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 19.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        listViewVideosVideosRecord.videosummary,
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontStyle: FontStyle.italic,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsets.all(7.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(40.0),
                                                                                            child: Image.network(
                                                                                              listViewVideosVideosRecord.videobyimage,
                                                                                              width: 32.0,
                                                                                              height: 32.0,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              listViewVideosVideosRecord.videoby,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  StreamBuilder<
                                                      List<VideosRecord>>(
                                                    stream: queryVideosRecord(
                                                      queryBuilder:
                                                          (videosRecord) =>
                                                              videosRecord
                                                                  .where(
                                                        'tileref',
                                                        arrayContains:
                                                            FFAppState()
                                                                .SelectedTileRef,
                                                      ),
                                                    ),
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
                                                      List<VideosRecord>
                                                          listViewAIVideosVideosRecordList =
                                                          snapshot.data!;
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewAIVideosVideosRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewAIVideosIndex) {
                                                          final listViewAIVideosVideosRecord =
                                                              listViewAIVideosVideosRecordList[
                                                                  listViewAIVideosIndex];
                                                          return Visibility(
                                                            visible:
                                                                listViewAIVideosVideosRecord
                                                                        .isai ==
                                                                    true,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
                                                                          3.0),
                                                              child: Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      300.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          5.0,
                                                                      color: Color(
                                                                          0x230E151B),
                                                                      offset: Offset(
                                                                          0.0,
                                                                          2.0),
                                                                    )
                                                                  ],
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0, 1.0),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              32.0,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                1200.0,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            gradient:
                                                                                LinearGradient(
                                                                              colors: [
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                                FlutterFlowTheme.of(context).secondary
                                                                              ],
                                                                              stops: [
                                                                                0.0,
                                                                                1.0
                                                                              ],
                                                                              begin: AlignmentDirectional(0.0, -1.0),
                                                                              end: AlignmentDirectional(0, 1.0),
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(16.0),
                                                                              topRight: Radius.circular(16.0),
                                                                            ),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                        ),
                                                                        Container(
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                600.0,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: 1200.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 1700.0,
                                                                                  height: 300.0,
                                                                                  child: custom_widgets.VideoWithPlay(
                                                                                    width: 1700.0,
                                                                                    height: 300.0,
                                                                                    videoUrl: functions.urlToString(listViewAIVideosVideosRecord.videofromurl),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(16.0),
                                                                              bottomRight: Radius.circular(16.0),
                                                                              topLeft: Radius.circular(0.0),
                                                                              topRight: Radius.circular(0.0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsets.all(12.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      listViewAIVideosVideosRecord.title,
                                                                                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 19.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        listViewAIVideosVideosRecord.videosummary,
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontStyle: FontStyle.italic,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsets.all(7.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(40.0),
                                                                                            child: Image.network(
                                                                                              listViewAIVideosVideosRecord.videobyimage,
                                                                                              width: 32.0,
                                                                                              height: 32.0,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              listViewAIVideosVideosRecord.videoby,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
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
                                          ),
                                          StreamBuilder<List<DocumentsRecord>>(
                                            stream: queryDocumentsRecord(
                                              queryBuilder: (documentsRecord) =>
                                                  documentsRecord
                                                      .whereIn(
                                                          'documenttitle',
                                                          listViewTileblocksRecord
                                                              .doclistitle)
                                                      .orderBy('id'),
                                            ),
                                            builder: (context, snapshot) {
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
                                              List<DocumentsRecord>
                                                  listViewDocumentsRecordList =
                                                  snapshot.data!;
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewDocumentsRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewDocumentsRecord =
                                                      listViewDocumentsRecordList[
                                                          listViewIndex];
                                                  return Visibility(
                                                    visible:
                                                        listViewTileblocksRecord
                                                                .doclistitle
                                                                .length >
                                                            0,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  26.0,
                                                                  3.0,
                                                                  26.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'MAIN_TILE_CONTENT_OLD_COMP_tile_ON_TAP');
                                                          if (listViewDocumentsRecord
                                                                      .documentupload !=
                                                                  null &&
                                                              listViewDocumentsRecord
                                                                      .documentupload !=
                                                                  '') {
                                                            logFirebaseEvent(
                                                                'tile_launch_u_r_l');
                                                            await launchURL(
                                                                listViewDocumentsRecord
                                                                    .documentupload);
                                                          } else {
                                                            logFirebaseEvent(
                                                                'tile_launch_u_r_l');
                                                            await launchURL(
                                                                listViewDocumentsRecord
                                                                    .documenturl);
                                                          }
                                                        },
                                                        child: Container(
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 3.0,
                                                                color: Color(
                                                                    0x411D2429),
                                                                offset: Offset(
                                                                    0.0, 1.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    3.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          14.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      FaIcon(
                                                                        FontAwesomeIcons
                                                                            .book,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        size:
                                                                            44.0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            4.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          listViewDocumentsRecord
                                                                              .documenttitle,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF090F13),
                                                                                fontSize: 18.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                              ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                AutoSizeText(
                                                                              listViewDocumentsRecord.description.maybeHandleOverflow(
                                                                                maxChars: 70,
                                                                                replacement: '…',
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF7C8791),
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            if (valueOrDefault<bool>(currentUserDocument?.isadmin, false) ==
                                                                                true)
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsets.all(4.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          logFirebaseEvent('MAIN_TILE_CONTENT_OLD_Icon_54ovjbge_ON_T');
                                                                                          logFirebaseEvent('Icon_alert_dialog');
                                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                                context: context,
                                                                                                builder: (alertDialogContext) {
                                                                                                  return WebViewAware(
                                                                                                    child: AlertDialog(
                                                                                                      title: Text('Are you sure you wish to delete this Document ?'),
                                                                                                      content: Text('This will delete the document, if you are just loooking to remove it from this tile block then use. the edit button on the tile block instead.'),
                                                                                                      actions: [
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                          child: Text('Cancel'),
                                                                                                        ),
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                          child: Text('Confirm '),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ) ??
                                                                                              false;
                                                                                          if (confirmDialogResponse) {
                                                                                            logFirebaseEvent('Icon_backend_call');
                                                                                            await listViewDocumentsRecord.reference.delete();
                                                                                          }
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.delete_forever_outlined,
                                                                                          color: Color(0xFF57636C),
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsets.all(4.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          logFirebaseEvent('MAIN_TILE_CONTENT_OLD_Icon_mxxvcnrc_ON_T');
                                                                                          logFirebaseEvent('Icon_backend_call');

                                                                                          await listViewDocumentsRecord.reference.update({
                                                                                            ...mapToFirestore(
                                                                                              {
                                                                                                'id': FieldValue.increment(-1),
                                                                                              },
                                                                                            ),
                                                                                          });
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.upload_sharp,
                                                                                          color: Color(0xFF57636C),
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsets.all(4.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          logFirebaseEvent('MAIN_TILE_CONTENT_OLD_Icon_apepz1uw_ON_T');
                                                                                          logFirebaseEvent('Icon_backend_call');

                                                                                          await listViewDocumentsRecord.reference.update({
                                                                                            ...mapToFirestore(
                                                                                              {
                                                                                                'id': FieldValue.increment(1),
                                                                                              },
                                                                                            ),
                                                                                          });
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.download_outlined,
                                                                                          color: Color(0xFF57636C),
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            if (valueOrDefault<bool>(currentUserDocument?.isadmin, false) ==
                                                                                true)
                                                                              FlutterFlowIconButton(
                                                                                borderColor: Colors.transparent,
                                                                                borderRadius: 30.0,
                                                                                borderWidth: 1.0,
                                                                                buttonSize: 60.0,
                                                                                icon: Icon(
                                                                                  Icons.edit_outlined,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 30.0,
                                                                                ),
                                                                                onPressed: () async {
                                                                                  logFirebaseEvent('MAIN_TILE_CONTENT_OLD_edit_outlined_ICN_');
                                                                                  logFirebaseEvent('IconButton_bottom_sheet');
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    barrierColor: Color(0x00000000),
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return WebViewAware(
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: Container(
                                                                                            height: 600.0,
                                                                                            child: EditDocumentTileWidget(
                                                                                              document: listViewDocumentsRecord,
                                                                                              docref: listViewDocumentsRecord.reference,
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
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          StreamBuilder<List<LinksRecord>>(
                                            stream: queryLinksRecord(
                                              queryBuilder: (linksRecord) =>
                                                  linksRecord.where(
                                                'title',
                                                isEqualTo:
                                                    listViewTileblocksRecord
                                                        .linkintext,
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
                                              List<LinksRecord>
                                                  listViewLinksRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final listViewLinksRecord =
                                                  listViewLinksRecordList
                                                          .isNotEmpty
                                                      ? listViewLinksRecordList
                                                          .first
                                                      : null;
                                              return ListView(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 3.0,
                                                                16.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'MAIN_TILE_CONTENT_OLD_COMP_tile_ON_TAP');
                                                        logFirebaseEvent(
                                                            'tile_launch_u_r_l');
                                                        await launchURL(
                                                            listViewLinksRecord!
                                                                .linkurl);
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 3.0,
                                                              color: Color(
                                                                  0x411D2429),
                                                              offset: Offset(
                                                                  0.0, 1.0),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  3.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        listViewLinksRecord!
                                                                            .title,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: Color(0xFF090F13),
                                                                              fontSize: 18.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                            ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            listViewLinksRecord!.summary.maybeHandleOverflow(
                                                                              maxChars: 70,
                                                                              replacement: '…',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  color: Color(0xFF7C8791),
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (valueOrDefault<bool>(currentUserDocument?.isadmin, false) ==
                                                                              true)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsets.all(4.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('MAIN_TILE_CONTENT_OLD_Icon_0i5i2dww_ON_T');
                                                                                        logFirebaseEvent('Icon_alert_dialog');
                                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return WebViewAware(
                                                                                                  child: AlertDialog(
                                                                                                    title: Text('Delete Link'),
                                                                                                    content: Text('Are you sure you wish to delete this link block?'),
                                                                                                    actions: [
                                                                                                      TextButton(
                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                        child: Text('Cancel'),
                                                                                                      ),
                                                                                                      TextButton(
                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                        child: Text('Confirm '),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ) ??
                                                                                            false;
                                                                                        if (confirmDialogResponse) {
                                                                                          logFirebaseEvent('Icon_backend_call');
                                                                                          await listViewLinksRecord!.reference.delete();
                                                                                        }
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.delete_forever_outlined,
                                                                                        color: Color(0xFF57636C),
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.all(4.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('MAIN_TILE_CONTENT_OLD_Icon_5sulyfmu_ON_T');
                                                                                        logFirebaseEvent('Icon_backend_call');

                                                                                        await listViewLinksRecord!.reference.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'id': FieldValue.increment(-1),
                                                                                            },
                                                                                          ),
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.upload_sharp,
                                                                                        color: Color(0xFF57636C),
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.all(4.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('MAIN_TILE_CONTENT_OLD_Icon_hm29m9cw_ON_T');
                                                                                        logFirebaseEvent('Icon_backend_call');

                                                                                        await listViewLinksRecord!.reference.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'id': FieldValue.increment(1),
                                                                                            },
                                                                                          ),
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.download_outlined,
                                                                                        color: Color(0xFF57636C),
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          if (valueOrDefault<bool>(currentUserDocument?.isadmin, false) ==
                                                                              true)
                                                                            FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 30.0,
                                                                              borderWidth: 1.0,
                                                                              buttonSize: 60.0,
                                                                              icon: Icon(
                                                                                Icons.edit_outlined,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 30.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('MAIN_TILE_CONTENT_OLD_edit_outlined_ICN_');
                                                                                logFirebaseEvent('IconButton_bottom_sheet');
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  barrierColor: Color(0x00000000),
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return WebViewAware(
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: Container(
                                                                                          height: 600.0,
                                                                                          child: EditLinkInTileWidget(
                                                                                            linkref: listViewLinksRecord?.reference,
                                                                                            linkdoc: listViewLinksRecord,
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
                                                ],
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 40.0, 0.0),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth: 1200.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: StreamBuilder<
                                                  List<TilesRecord>>(
                                                stream: queryTilesRecord(),
                                                builder: (context, snapshot) {
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
                                                  List<TilesRecord>
                                                      listViewTilesTilesRecordList =
                                                      snapshot.data!;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewTilesTilesRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewTilesIndex) {
                                                      final listViewTilesTilesRecord =
                                                          listViewTilesTilesRecordList[
                                                              listViewTilesIndex];
                                                      return Visibility(
                                                        visible: listViewTileblocksRecord
                                                                .tileWithinTileRef
                                                                .contains(
                                                                    listViewTilesTilesRecord
                                                                        .reference) ==
                                                            true,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          3.0,
                                                                          16.0,
                                                                          3.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'MAIN_TILE_CONTENT_OLD_COMP_tile_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'tile_update_app_state');
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .SelectedTileRef =
                                                                        listViewTilesTilesRecord
                                                                            .reference;
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            3.0,
                                                                        color: Color(
                                                                            0x411D2429),
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                8.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                              children: [
                                                                                Text(
                                                                                  listViewTilesTilesRecord.title,
                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: Color(0xFF090F13),
                                                                                        fontSize: 18.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                      ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 8.0, 0.0),
                                                                                    child: AutoSizeText(
                                                                                      listViewTilesTilesRecord.summary.maybeHandleOverflow(
                                                                                        maxChars: 70,
                                                                                        replacement: '…',
                                                                                      ),
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            color: Color(0xFF7C8791),
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('MAIN_TILE_CONTENT_OLD_Icon_if1z5y4k_ON_T');
                                                                                        logFirebaseEvent('Icon_backend_call');

                                                                                        await listViewTileblocksRecord.reference.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'tileWithinTileRef': FieldValue.arrayRemove([
                                                                                                listViewTilesTilesRecord.reference
                                                                                              ]),
                                                                                            },
                                                                                          ),
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.cancel_outlined,
                                                                                        color: Colors.black,
                                                                                        size: 27.0,
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
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          if (listViewTileblocksRecord
                                                  .hassocialfeed ==
                                              true)
                                            SocialWidget(
                                              key: Key(
                                                  'Key8rn_${listViewIndex}_of_${listViewTileblocksRecordList.length}'),
                                              tilesdoc: widget.tilesdoc,
                                              tilesdocref: widget.tilesdocref,
                                              categoryref: widget.categoryref,
                                              tileblockref:
                                                  listViewTileblocksRecord
                                                      .reference,
                                            ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
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
