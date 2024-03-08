import '/add_items/add_document_to_tile/add_document_to_tile_widget.dart';
import '/add_items/add_link_in_tile/add_link_in_tile_widget.dart';
import '/add_items/add_text_block_to_tile/add_text_block_to_tile_widget.dart';
import '/add_items/create_new_tilea_inside/create_new_tilea_inside_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/testpage/components/add_video_to_existing_tile/add_video_to_existing_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'admin_standard_model.dart';
export 'admin_standard_model.dart';

class AdminStandardWidget extends StatefulWidget {
  const AdminStandardWidget({
    super.key,
    this.tileref,
    this.tiledoc,
    this.textblocks,
    this.videos,
    this.documents,
    this.links,
    this.historydoc,
    this.historyRef,
  });

  final DocumentReference? tileref;
  final TilesRecord? tiledoc;
  final TextblockRecord? textblocks;
  final VideosRecord? videos;
  final DocumentsRecord? documents;
  final DocumentsandlinksRecord? links;
  final HistoryRecord? historydoc;
  final DocumentReference? historyRef;

  @override
  State<AdminStandardWidget> createState() => _AdminStandardWidgetState();
}

class _AdminStandardWidgetState extends State<AdminStandardWidget> {
  late AdminStandardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminStandardModel());

    _model.linkplaceController ??= TextEditingController();
    _model.linkplaceFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Add / Manage Standard',
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.linkplaceController,
                              focusNode: _model.linkplaceFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Page URL',
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodySmall,
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.linkplaceControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          icon: Icon(
                            Icons.insert_link_sharp,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 27.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'ADMIN_STANDARD_insert_link_sharp_ICN_ON_');
                            logFirebaseEvent(
                                'IconButton_generate_current_page_link');
                            _model.currentPageLink =
                                await generateCurrentPageLink(
                              context,
                              title: widget.tiledoc?.title,
                              imageUrl: widget.tiledoc?.image,
                              isShortLink: false,
                            );
                          },
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          icon: Icon(
                            Icons.content_copy_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 27.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'ADMIN_STANDARD_content_copy_rounded_ICN_');
                            logFirebaseEvent('IconButton_copy_to_clipboard');
                            await Clipboard.setData(
                                ClipboardData(text: widget.tiledoc!.pagelink));
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 0.0, 8.0),
                            child: Text(
                              'Show/Hide',
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.video_settings,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Video Slider',
                        style: FlutterFlowTheme.of(context).titleSmall,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              icon: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'ADMIN_STANDARD_COMP_add_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  barrierColor: const Color(0x00000000),
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SizedBox(
                                          height: 600.0,
                                          child: AddVideoToExistingTileWidget(
                                            tileref: widget.tileref,
                                            tiledoc: widget.tiledoc,
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
                            Switch(
                              value: _model.switchValue1 ??=
                                  widget.tiledoc!.showvideoslider,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue1 = newValue);
                                if (newValue) {
                                  logFirebaseEvent(
                                      'ADMIN_STANDARD_Switch_l0e5bqia_ON_TOGGLE');
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.tileref!
                                      .update(createTilesRecordData(
                                    showvideoslider: true,
                                  ));
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.historydoc!.reference
                                      .update(createHistoryRecordData(
                                    showvideoinslider: true,
                                  ));
                                } else {
                                  logFirebaseEvent(
                                      'ADMIN_STANDARD_Switch_l0e5bqia_ON_TOGGLE');
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.tileref!
                                      .update(createTilesRecordData(
                                    showvideoslider: false,
                                  ));
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.historydoc!.reference
                                      .update(createHistoryRecordData(
                                    showvideoinslider: false,
                                  ));
                                }
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
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.dock,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Document Area',
                        style: FlutterFlowTheme.of(context).titleSmall,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              icon: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'ADMIN_STANDARD_COMP_add_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  barrierColor: const Color(0x00000000),
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SizedBox(
                                          height: 600.0,
                                          child: AddDocumentToTileWidget(
                                            tileref: widget.tileref,
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
                            Switch(
                              value: _model.switchValue2 ??=
                                  widget.tiledoc!.showdocs,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue2 = newValue);
                                if (newValue) {
                                  logFirebaseEvent(
                                      'ADMIN_STANDARD_Switch_6rtfrdmv_ON_TOGGLE');
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.tileref!
                                      .update(createTilesRecordData(
                                    showdocs: true,
                                  ));
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.historydoc!.reference
                                      .update(createHistoryRecordData(
                                    showdocs: true,
                                  ));
                                } else {
                                  logFirebaseEvent(
                                      'ADMIN_STANDARD_Switch_6rtfrdmv_ON_TOGGLE');
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.tileref!
                                      .update(createTilesRecordData(
                                    showdocs: false,
                                  ));
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.historydoc!.reference
                                      .update(createHistoryRecordData(
                                    showdocs: false,
                                  ));
                                }
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
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.link,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Links Area',
                        style: FlutterFlowTheme.of(context).titleSmall,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              icon: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'ADMIN_STANDARD_COMP_add_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: const Color(0x00000000),
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: AddLinkInTileWidget(
                                          tileref: widget.tileref,
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
                            Switch(
                              value: _model.switchValue3 ??=
                                  widget.tiledoc!.showLinks,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue3 = newValue);
                                if (newValue) {
                                  logFirebaseEvent(
                                      'ADMIN_STANDARD_Switch_colwzycc_ON_TOGGLE');
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.tileref!
                                      .update(createTilesRecordData(
                                    showLinks: true,
                                  ));
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.historydoc!.reference
                                      .update(createHistoryRecordData(
                                    showlinks: true,
                                  ));
                                } else {
                                  logFirebaseEvent(
                                      'ADMIN_STANDARD_Switch_colwzycc_ON_TOGGLE');
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.tileref!
                                      .update(createTilesRecordData(
                                    showLinks: false,
                                  ));
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.historydoc!.reference
                                      .update(createHistoryRecordData(
                                    showlinks: false,
                                  ));
                                }
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
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.text_snippet_outlined,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Text Blocks',
                      style: FlutterFlowTheme.of(context).titleSmall,
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              icon: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'ADMIN_STANDARD_COMP_add_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  barrierColor: const Color(0x00000000),
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SizedBox(
                                          height: 600.0,
                                          child: AddTextBlockToTileWidget(
                                            tileref: widget.tileref,
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
                            Switch(
                              value: _model.switchValue4 ??=
                                  widget.tiledoc!.showtextblocks,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue4 = newValue);
                                if (newValue) {
                                  logFirebaseEvent(
                                      'ADMIN_STANDARD_Switch_tc75joyc_ON_TOGGLE');
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.tileref!
                                      .update(createTilesRecordData(
                                    showtextblocks: true,
                                  ));
                                } else {
                                  logFirebaseEvent(
                                      'ADMIN_STANDARD_Switch_tc75joyc_ON_TOGGLE');
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.tileref!
                                      .update(createTilesRecordData(
                                    showtextblocks: false,
                                  ));
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.historydoc!.reference
                                      .update(createHistoryRecordData(
                                    showtextblocks: false,
                                  ));
                                }
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
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.layers_outlined,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Sub Tiles',
                      style: FlutterFlowTheme.of(context).titleSmall,
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              icon: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'ADMIN_STANDARD_COMP_add_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: const Color(0x00000000),
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: CreateNewTileaInsideWidget(
                                          tilesdoc: widget.tiledoc,
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
                            Switch(
                              value: _model.switchValue5 ??=
                                  widget.tiledoc!.showsubtiles,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue5 = newValue);
                                if (newValue) {
                                  logFirebaseEvent(
                                      'ADMIN_STANDARD_Switch_3rj2rh0q_ON_TOGGLE');
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.tileref!
                                      .update(createTilesRecordData(
                                    showsubtiles: true,
                                  ));
                                } else {
                                  logFirebaseEvent(
                                      'ADMIN_STANDARD_Switch_3rj2rh0q_ON_TOGGLE');
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.tileref!
                                      .update(createTilesRecordData(
                                    showsubtiles: false,
                                  ));
                                }
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
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.smart_button_outlined,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Buttons',
                      style: FlutterFlowTheme.of(context).titleSmall,
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Switch(
                              value: _model.switchValue6 ??=
                                  widget.tiledoc!.showbuttons,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue6 = newValue);
                                if (newValue) {
                                  logFirebaseEvent(
                                      'ADMIN_STANDARD_Switch_v86vhssy_ON_TOGGLE');
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.tileref!
                                      .update(createTilesRecordData(
                                    showbuttons: true,
                                  ));
                                } else {
                                  logFirebaseEvent(
                                      'ADMIN_STANDARD_Switch_v86vhssy_ON_TOGGLE');
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.tileref!
                                      .update(createTilesRecordData(
                                    showbuttons: false,
                                  ));
                                }
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
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.smart_button_outlined,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Tiles In Tiles',
                      style: FlutterFlowTheme.of(context).titleSmall,
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Switch(
                              value: _model.switchValue7 ??=
                                  widget.tiledoc!.showtilesintiles,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue7 = newValue);
                                if (newValue) {
                                  logFirebaseEvent(
                                      'ADMIN_STANDARD_Switch_2mqtcfm4_ON_TOGGLE');
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.tileref!
                                      .update(createTilesRecordData(
                                    showtilesintiles: true,
                                  ));
                                } else {
                                  logFirebaseEvent(
                                      'ADMIN_STANDARD_Switch_2mqtcfm4_ON_TOGGLE');
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.tileref!
                                      .update(createTilesRecordData(
                                    showtilesintiles: false,
                                  ));
                                }
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
          ],
        ),
      ),
    );
  }
}
