import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_link_model.dart';
export 'add_link_model.dart';

class AddLinkWidget extends StatefulWidget {
  const AddLinkWidget({
    super.key,
    this.tileref,
  });

  final DocumentReference? tileref;

  @override
  State<AddLinkWidget> createState() => _AddLinkWidgetState();
}

class _AddLinkWidgetState extends State<AddLinkWidget>
    with TickerProviderStateMixin {
  late AddLinkModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddLinkModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.linkTitleController ??= TextEditingController();
    _model.linkTitleFocusNode ??= FocusNode();

    _model.linkURLController ??= TextEditingController();
    _model.linkURLFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
      child: Column(
        children: [
          Align(
            alignment: const Alignment(0.0, 0),
            child: TabBar(
              isScrollable: true,
              labelColor: FlutterFlowTheme.of(context).primary,
              labelStyle: FlutterFlowTheme.of(context).bodyMedium,
              unselectedLabelStyle: const TextStyle(),
              indicatorColor: FlutterFlowTheme.of(context).secondary,
              tabs: const [
                Tab(
                  text: 'Link Details',
                ),
                Tab(
                  text: 'Member Area',
                ),
                Tab(
                  text: 'Tile',
                ),
              ],
              controller: _model.tabBarController,
              onTap: (i) async {
                [() async {}, () async {}, () async {}][i]();
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _model.tabBarController,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'ADD_LINK_COMP_Icon_277cwpsv_ON_TAP');
                              logFirebaseEvent('Icon_bottom_sheet');
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.cancel_outlined,
                              color: Colors.black,
                              size: 24.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _model.linkTitleController,
                            focusNode: _model.linkTitleFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Link Title',
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.linkTitleControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _model.linkURLController,
                            focusNode: _model.linkURLFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Link URL',
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            keyboardType: TextInputType.multiline,
                            validator: _model.linkURLControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 900.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Choose where you would like to show this tile.',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: FlutterFlowTheme.of(context).secondary,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            StreamBuilder<List<CategoriesRecord>>(
                              stream: queryCategoriesRecord(),
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
                                List<CategoriesRecord>
                                    catagoryListViewCategoriesRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      catagoryListViewCategoriesRecordList
                                          .length,
                                  itemBuilder:
                                      (context, catagoryListViewIndex) {
                                    final catagoryListViewCategoriesRecord =
                                        catagoryListViewCategoriesRecordList[
                                            catagoryListViewIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 2.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 70.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 0.0,
                                              color: Color(0xFFDBE2E7),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: const Color(0xFF4B39EF),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(2.0),
                                                  child: Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDB8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 0.0, 0.0),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(25),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          const Color(0xFF7C8791),
                                                    ),
                                                    child: CheckboxListTile(
                                                      value: _model
                                                              .checkboxListTileValueMap1[
                                                          catagoryListViewCategoriesRecord] ??= false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                    .checkboxListTileValueMap1[
                                                                catagoryListViewCategoriesRecord] =
                                                            newValue!);
                                                      },
                                                      title: Text(
                                                        catagoryListViewCategoriesRecord
                                                            .categoryname,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color: const Color(
                                                                  0xFF090F13),
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Outfit'),
                                                            ),
                                                      ),
                                                      subtitle: Text(
                                                        'username',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color: const Color(
                                                                  0xFF7C8791),
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Outfit'),
                                                            ),
                                                      ),
                                                      tileColor:
                                                          const Color(0xFFF5F5F5),
                                                      activeColor:
                                                          const Color(0xFF4B39EF),
                                                      checkColor:
                                                          const Color(0xFF090F13),
                                                      dense: false,
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .trailing,
                                                    ),
                                                  ),
                                                ),
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
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Which Tile are you wanting to add this link to?',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: FlutterFlowTheme.of(context).secondary,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 0.0, 10.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('ADD_LINK_COMP_CREATE_BTN_ON_TAP');
                            logFirebaseEvent('Button_backend_call');

                            await LinksRecord.collection.doc().set({
                              ...createLinksRecordData(
                                linkurl: _model.linkURLController.text,
                                title: _model.linkTitleController.text,
                              ),
                              ...mapToFirestore(
                                {
                                  'tiles': _model.checkboxListTileCheckedItems2
                                      .map((e) => e.title)
                                      .toList(),
                                  'memberlevel': _model
                                      .checkboxListTileCheckedItems1
                                      .map((e) => e.categoryname)
                                      .toList(),
                                  'tileref': [widget.tileref],
                                },
                              ),
                            });
                          },
                          text: 'Create',
                          options: FFButtonOptions(
                            width: 150.0,
                            height: 30.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: Colors.white,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 2.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            StreamBuilder<List<TilesRecord>>(
                              stream: queryTilesRecord(),
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
                                List<TilesRecord> tileListViewTilesRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: tileListViewTilesRecordList.length,
                                  itemBuilder: (context, tileListViewIndex) {
                                    final tileListViewTilesRecord =
                                        tileListViewTilesRecordList[
                                            tileListViewIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 2.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 70.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 0.0,
                                              color: Color(0xFFDBE2E7),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: const Color(0xFF4B39EF),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(2.0),
                                                  child: Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      tileListViewTilesRecord
                                                          .image,
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 0.0, 0.0),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(25),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          const Color(0xFF7C8791),
                                                    ),
                                                    child: CheckboxListTile(
                                                      value: _model
                                                              .checkboxListTileValueMap2[
                                                          tileListViewTilesRecord] ??= true,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                    .checkboxListTileValueMap2[
                                                                tileListViewTilesRecord] =
                                                            newValue!);
                                                      },
                                                      title: Text(
                                                        tileListViewTilesRecord
                                                            .title,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color: const Color(
                                                                  0xFF090F13),
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Outfit'),
                                                            ),
                                                      ),
                                                      subtitle: Text(
                                                        tileListViewTilesRecord
                                                            .summary,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color: const Color(
                                                                  0xFF7C8791),
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Outfit'),
                                                            ),
                                                      ),
                                                      tileColor:
                                                          const Color(0xFFF5F5F5),
                                                      activeColor:
                                                          const Color(0xFF4B39EF),
                                                      checkColor:
                                                          const Color(0xFF090F13),
                                                      dense: false,
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .trailing,
                                                    ),
                                                  ),
                                                ),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
