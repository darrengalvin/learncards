import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/drawer_empty_list_tiles_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'drawer_tile_tree_model.dart';
export 'drawer_tile_tree_model.dart';

class DrawerTileTreeWidget extends StatefulWidget {
  const DrawerTileTreeWidget({
    super.key,
    bool? isHeader,
    int? startTab,
    required this.itemId,
  })  : isHeader = isHeader ?? false,
        startTab = startTab ?? 0;

  final bool isHeader;
  final int startTab;
  final String? itemId;

  @override
  State<DrawerTileTreeWidget> createState() => _DrawerTileTreeWidgetState();
}

class _DrawerTileTreeWidgetState extends State<DrawerTileTreeWidget>
    with TickerProviderStateMixin {
  late DrawerTileTreeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawerTileTreeModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DRAWER_TILE_TREE_drawer_TileTree_ON_INIT');
      if (widget.itemId != null && widget.itemId != '') {
        logFirebaseEvent('drawer_TileTree_update_component_state');
        setState(() {
          _model.currentTileId = valueOrDefault<String>(
            widget.itemId,
            'none',
          );
          _model.currentBlockId = valueOrDefault<String>(
            FFAppState().drawerBlockId,
            'none',
          );
        });
      } else {
        logFirebaseEvent('drawer_TileTree_update_component_state');
        setState(() {
          _model.currentTileId = FFAppState().viewTileContentId;
          _model.currentBlockId = FFAppState().drawerBlockId;
        });
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: min(
          valueOrDefault<int>(
            FFAppState().drawerStartTab,
            0,
          ),
          1),
    )..addListener(() => setState(() {}));
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textFieldTilenameController ??= TextEditingController();
    _model.textFieldTilenameFocusNode ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.tileNameController ??= TextEditingController();
    _model.tileNameFocusNode ??= FocusNode();

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

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: StreamBuilder<List<TilesRecord>>(
        stream: queryTilesRecord(
          queryBuilder: (tilesRecord) => tilesRecord.where(
            'parent_id',
            isEqualTo: FFAppState().selectedParentId,
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
          List<TilesRecord> containerTilesRecordList = snapshot.data!;
          return Container(
            width: 400.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (valueOrDefault<bool>(
                    widget.isHeader,
                    false,
                  ))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Manage',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).accent1,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'DRAWER_TILE_TREE_COMP_close_ICN_ON_TAP');
                                logFirebaseEvent(
                                    'IconButton_close_dialog,_drawer,_etc');
                                Navigator.pop(context);
                                logFirebaseEvent('IconButton_update_app_state');
                                setState(() {
                                  FFAppState().drawerBlockId = '';
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'DRAWER_TILE_TREE_Text_vs95il8p_ON_TAP');
                                    if (_model.currentTileId != null &&
                                        _model.currentTileId != '') {
                                      logFirebaseEvent('Text_tab_bar');
                                      setState(() {
                                        _model.tabBarController!.animateTo(
                                          0,
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      });
                                    } else {
                                      logFirebaseEvent('Text_tab_bar');
                                      setState(() {
                                        _model.tabBarController!.animateTo(
                                          1,
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      });
                                    }
                                  },
                                  child: AutoSizeText(
                                    'Manage',
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLargeFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .customColor7,
                                          fontSize: 22.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLargeFamily),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: const Alignment(0.0, 0),
                                          child: TabBar(
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            unselectedLabelColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium,
                                            unselectedLabelStyle: const TextStyle(),
                                            indicatorColor:
                                                FlutterFlowTheme.of(context)
                                                    .customColor7,
                                            padding: const EdgeInsets.all(4.0),
                                            tabs: const [
                                              Tab(
                                                text: 'Tiles',
                                              ),
                                              Tab(
                                                text: 'Content',
                                              ),
                                            ],
                                            controller: _model.tabBarController,
                                            onTap: (i) async {
                                              [() async {}, () async {}][i]();
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            controller: _model.tabBarController,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            children: [
                                              KeepAliveWidgetWrapper(
                                                builder: (context) => Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons.reply,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent1,
                                                              size: 18.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'DRAWER_TILE_TREE_COMP_reply_ICN_ON_TAP');
                                                            },
                                                          ),
                                                          if (_model.isEdit)
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textController1,
                                                                  focusNode: _model
                                                                      .textFieldFocusNode1,
                                                                  autofocus:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelStyle:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMedium,
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium,
                                                                    enabledBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isEdit
                                                                              ? FlutterFlowTheme.of(context).accent3
                                                                              : Colors.transparent,
                                                                          Colors
                                                                              .transparent,
                                                                        ),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor7,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  validator: _model
                                                                      .textController1Validator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .textFieldTilenameController,
                                                                focusNode: _model
                                                                    .textFieldTilenameFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.textFieldTilenameController',
                                                                  const Duration(
                                                                      milliseconds:
                                                                          2000),
                                                                  () async {
                                                                    logFirebaseEvent(
                                                                        'DRAWER_TILE_TREE_TextField-tilename_ON_T');
                                                                  },
                                                                ),
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'Label here...',
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                                  enabledBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                                validator: _model
                                                                    .textFieldTilenameControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  8.0,
                                                                  16.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          if (_model.isEdit)
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textController3,
                                                                  focusNode: _model
                                                                      .textFieldFocusNode2,
                                                                  autofocus:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelStyle:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMedium,
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium,
                                                                    enabledBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.isEdit
                                                                              ? FlutterFlowTheme.of(context).accent3
                                                                              : Colors.transparent,
                                                                          Colors
                                                                              .transparent,
                                                                        ),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor7,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  validator: _model
                                                                      .textController3Validator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        'https://picsum.photos/seed/537/600',
                                                        width: 100.0,
                                                        height: 100.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  20.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'DRAWER_TILE_TREE_UPLOAD_IMAGE_BTN_ON_TAP');
                                                        },
                                                        text: 'Upload Image',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'DRAWER_TILE_TREE_NEW_TILE_BTN_ON_TAP');
                                                                    if (_model
                                                                        .showCreateTile) {
                                                                      logFirebaseEvent(
                                                                          'Button_clear_text_fields_pin_codes');
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .tileNameController
                                                                            ?.clear();
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'Button_update_component_state');
                                                                      setState(
                                                                          () {
                                                                        _model.showCreateTile =
                                                                            false;
                                                                      });
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Button_update_component_state');
                                                                      setState(
                                                                          () {
                                                                        _model.showCreateTile =
                                                                            true;
                                                                      });
                                                                    }
                                                                  },
                                                                  text: valueOrDefault<
                                                                      String>(
                                                                    _model.showCreateTile
                                                                        ? 'Cancel'
                                                                        : 'New Tile',
                                                                    '+ New Tile',
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        40.0,
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: _model.showCreateTile
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .customColor7,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleSmallFamily,
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            _model.showCreateTile
                                                                                ? FlutterFlowTheme.of(context).error
                                                                                : FlutterFlowTheme.of(context).primary,
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                  showLoadingIndicator:
                                                                      false,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          AnimatedContainer(
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    100),
                                                            curve: Curves
                                                                .easeInOut,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Visibility(
                                                              visible:
                                                                  valueOrDefault<
                                                                      bool>(
                                                                _model
                                                                    .showCreateTile,
                                                                false,
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          8.0,
                                                                          12.0,
                                                                          8.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.tileNameController,
                                                                        focusNode:
                                                                            _model.tileNameFocusNode,
                                                                        onChanged:
                                                                            (_) =>
                                                                                EasyDebounce.debounce(
                                                                          '_model.tileNameController',
                                                                          const Duration(
                                                                              milliseconds: 2000),
                                                                          () =>
                                                                              setState(() {}),
                                                                        ),
                                                                        autofocus:
                                                                            true,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelStyle:
                                                                              FlutterFlowTheme.of(context).labelMedium,
                                                                          hintText:
                                                                              'Give your tile a name',
                                                                          hintStyle:
                                                                              FlutterFlowTheme.of(context).labelMedium,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).btnBk,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Color(0xFF1AADF9),
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        validator: _model
                                                                            .tileNameControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'DRAWER_TILE_TREE_Icon_8a2tyjgy_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Icon_backend_call');

                                                                        var tilesRecordReference = TilesRecord
                                                                            .collection
                                                                            .doc();
                                                                        await tilesRecordReference
                                                                            .set({
                                                                          ...createTilesRecordData(
                                                                            createdTime:
                                                                                getCurrentTimestamp,
                                                                            updatedTime:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            uid:
                                                                                currentUserUid,
                                                                            title:
                                                                                _model.tileNameController.text,
                                                                            image:
                                                                                '',
                                                                            summary:
                                                                                '',
                                                                            tier:
                                                                                1,
                                                                            id: 998,
                                                                            companyId:
                                                                                'notset',
                                                                            parent:
                                                                                FFAppState().selectedParentRef,
                                                                            parentId:
                                                                                FFAppState().selectedParentId,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'categories': [
                                                                                'not set'
                                                                              ],
                                                                              'memberlevels': [
                                                                                'not set'
                                                                              ],
                                                                              'subtopics': [
                                                                                'not set'
                                                                              ],
                                                                            },
                                                                          ),
                                                                        });
                                                                        _model.newChildTileCopyCopy =
                                                                            TilesRecord.getDocumentFromData({
                                                                          ...createTilesRecordData(
                                                                            createdTime:
                                                                                getCurrentTimestamp,
                                                                            updatedTime:
                                                                                getCurrentTimestamp,
                                                                            user:
                                                                                currentUserReference,
                                                                            uid:
                                                                                currentUserUid,
                                                                            title:
                                                                                _model.tileNameController.text,
                                                                            image:
                                                                                '',
                                                                            summary:
                                                                                '',
                                                                            tier:
                                                                                1,
                                                                            id: 998,
                                                                            companyId:
                                                                                'notset',
                                                                            parent:
                                                                                FFAppState().selectedParentRef,
                                                                            parentId:
                                                                                FFAppState().selectedParentId,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'categories': [
                                                                                'not set'
                                                                              ],
                                                                              'memberlevels': [
                                                                                'not set'
                                                                              ],
                                                                              'subtopics': [
                                                                                'not set'
                                                                              ],
                                                                            },
                                                                          ),
                                                                        }, tilesRecordReference);
                                                                        logFirebaseEvent(
                                                                            'Icon_tab_bar');
                                                                        setState(
                                                                            () {
                                                                          _model
                                                                              .tabBarController!
                                                                              .animateTo(
                                                                            min(_model.tabBarController!.length - 1,
                                                                                _model.tabBarController!.index + 1),
                                                                            duration:
                                                                                const Duration(milliseconds: 300),
                                                                            curve:
                                                                                Curves.ease,
                                                                          );
                                                                        });

                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .check_circle_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor7,
                                                                        size:
                                                                            32.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  if (true) {
                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final tilesFromParent =
                                                                              containerTilesRecordList.toList();
                                                                          if (tilesFromParent
                                                                              .isEmpty) {
                                                                            return Image.asset(
                                                                              '',
                                                                            );
                                                                          }
                                                                          return ReorderableListView
                                                                              .builder(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                tilesFromParent.length,
                                                                            itemBuilder:
                                                                                (context, tilesFromParentIndex) {
                                                                              final tilesFromParentItem = tilesFromParent[tilesFromParentIndex];
                                                                              return Container(
                                                                                key: ValueKey("ListView_bf245p83" '_' + tilesFromParentIndex.toString()),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 38.0, 0.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            logFirebaseEvent('DRAWER_TILE_TREE_COMP_tile_ON_TAP');
                                                                                          },
                                                                                          child: ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                            child: Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                              height: 100.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Colors.white,
                                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                                border: Border.all(
                                                                                                  color: FlutterFlowTheme.of(context).btnBk,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsets.all(8.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      width: 60.0,
                                                                                                      height: 80.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                        border: Border.all(
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: Align(
                                                                                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                        child: InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            logFirebaseEvent('DRAWER_TILE_TREE_Icon_6a4wq2qv_ON_TAP');
                                                                                                          },
                                                                                                          child: const Icon(
                                                                                                            Icons.dashboard_customize_sharp,
                                                                                                            color: Color(0x591AADF9),
                                                                                                            size: 48.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                      child: Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 12.0, 0.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: Padding(
                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                    child: AutoSizeText(
                                                                                                                      'A wonderfully delicious 2 patty melt that melts into your...movesfssfsdfsdfdsfsdfdsfsdfsdfsdfsdfsf\nyour...movesfssfsdfsdfdsfsdfdsfsdfsdfsdfsdfsfyour...movesfssfsdfsdfdsfsdfdsfsdfsdfsdfsdfsf',
                                                                                                                      textAlign: TextAlign.start,
                                                                                                                      maxLines: 2,
                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                            fontFamily: 'Outfit',
                                                                                                                            color: const Color(0xFF7C8791),
                                                                                                                            fontSize: 18.0,
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        '0',
                                                                                                                        textAlign: TextAlign.start,
                                                                                                                        maxLines: 1,
                                                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                              fontFamily: 'Outfit',
                                                                                                                              color: const Color(0xFF090F13),
                                                                                                                              fontSize: 16.0,
                                                                                                                              fontWeight: FontWeight.w500,
                                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                                        child: Container(
                                                                                                                          width: 10.0,
                                                                                                                          height: 10.0,
                                                                                                                          decoration: const BoxDecoration(
                                                                                                                            color: Color(0xFF1AADF9),
                                                                                                                            shape: BoxShape.circle,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Text(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          'module',
                                                                                                                          'Module',
                                                                                                                        ).maybeHandleOverflow(maxChars: 2),
                                                                                                                        maxLines: 1,
                                                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                              fontFamily: 'Outfit',
                                                                                                                              color: const Color(0xFF090F13),
                                                                                                                              fontSize: 16.0,
                                                                                                                              fontWeight: FontWeight.w500,
                                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                                        child: Container(
                                                                                                                          width: 10.0,
                                                                                                                          height: 10.0,
                                                                                                                          decoration: const BoxDecoration(
                                                                                                                            color: Color(0xFF1AADF9),
                                                                                                                            shape: BoxShape.circle,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Text(
                                                                                                                        'Title',
                                                                                                                        maxLines: 1,
                                                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                              fontFamily: 'Outfit',
                                                                                                                              color: const Color(0xFF090F13),
                                                                                                                              fontSize: 16.0,
                                                                                                                              fontWeight: FontWeight.w500,
                                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
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
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Stack(
                                                                                                            children: [
                                                                                                              if (!_model.isEditTiles)
                                                                                                                Container(
                                                                                                                  width: 30.0,
                                                                                                                  height: 30.0,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  ),
                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: InkWell(
                                                                                                                    splashColor: Colors.transparent,
                                                                                                                    focusColor: Colors.transparent,
                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                    onTap: () async {
                                                                                                                      logFirebaseEvent('DRAWER_TILE_TREE_Icon_fk1xpdg4_ON_TAP');
                                                                                                                      logFirebaseEvent('Icon_tab_bar');
                                                                                                                      setState(() {
                                                                                                                        _model.tabBarController!.animateTo(
                                                                                                                          1,
                                                                                                                          duration: const Duration(milliseconds: 300),
                                                                                                                          curve: Curves.ease,
                                                                                                                        );
                                                                                                                      });
                                                                                                                    },
                                                                                                                    child: Icon(
                                                                                                                      Icons.arrow_forward,
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      size: 24.0,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              if (_model.isEditTiles)
                                                                                                                Container(
                                                                                                                  width: 30.0,
                                                                                                                  height: 30.0,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  ),
                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: InkWell(
                                                                                                                    splashColor: Colors.transparent,
                                                                                                                    focusColor: Colors.transparent,
                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                    onTap: () async {
                                                                                                                      logFirebaseEvent('DRAWER_TILE_TREE_Icon_iw1o2fo4_ON_TAP');
                                                                                                                      logFirebaseEvent('Icon_update_component_state');
                                                                                                                      setState(() {});
                                                                                                                    },
                                                                                                                    child: Icon(
                                                                                                                      Icons.delete_outline,
                                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                                      size: 24.0,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                            ],
                                                                                                          ),
                                                                                                          Container(
                                                                                                            width: 30.0,
                                                                                                            height: 30.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                            child: InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                logFirebaseEvent('DRAWER_TILE_TREE_Icon_5736z3ih_ON_TAP');
                                                                                                                logFirebaseEvent('Icon_tab_bar');
                                                                                                                setState(() {
                                                                                                                  _model.tabBarController!.animateTo(
                                                                                                                    1,
                                                                                                                    duration: const Duration(milliseconds: 300),
                                                                                                                    curve: Curves.ease,
                                                                                                                  );
                                                                                                                });
                                                                                                              },
                                                                                                              child: Icon(
                                                                                                                Icons.settings_outlined,
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                size: 24.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
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
                                                                                ),
                                                                              );
                                                                            },
                                                                            onReorder:
                                                                                (int reorderableOldIndex, int reorderableNewIndex) async {
                                                                              logFirebaseEvent('DRAWER_TILE_TREE_ListView_bf245p83_ON_RE');
                                                                              logFirebaseEvent('ListView_update_component_state');
                                                                              setState(() {
                                                                                _model.loopCounter = 0;
                                                                                _model.tempTileList = [];
                                                                              });

                                                                              setState(() {});
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    return Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .drawerEmptyListTilesModel,
                                                                        updateCallback:
                                                                            () =>
                                                                                setState(() {}),
                                                                        updateOnChange:
                                                                            true,
                                                                        child:
                                                                            DrawerEmptyListTilesWidget(
                                                                          tileDoc:
                                                                              _model.selectedTileDoc,
                                                                          action:
                                                                              () async {},
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              KeepAliveWidgetWrapper(
                                                builder: (context) =>
                                                    Container(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
