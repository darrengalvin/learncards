import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_new_tile_model.dart';
export 'create_new_tile_model.dart';

class CreateNewTileWidget extends StatefulWidget {
  const CreateNewTileWidget({
    super.key,
    this.tilesdoc,
    this.tileref,
  });

  final TilesRecord? tilesdoc;
  final DocumentReference? tileref;

  @override
  State<CreateNewTileWidget> createState() => _CreateNewTileWidgetState();
}

class _CreateNewTileWidgetState extends State<CreateNewTileWidget>
    with TickerProviderStateMixin {
  late CreateNewTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateNewTileModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.tileTitleController ??= TextEditingController();
    _model.tileTitleFocusNode ??= FocusNode();

    _model.tileSummaryController ??= TextEditingController();
    _model.tileSummaryFocusNode ??= FocusNode();

    _model.positionIDController ??= TextEditingController();
    _model.positionIDFocusNode ??= FocusNode();

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
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment(0.0, 0),
              child: TabBar(
                isScrollable: true,
                labelColor: FlutterFlowTheme.of(context).primaryText,
                unselectedLabelColor:
                    FlutterFlowTheme.of(context).secondaryText,
                labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                unselectedLabelStyle: TextStyle(),
                indicatorColor: FlutterFlowTheme.of(context).secondary,
                tabs: [
                  Tab(
                    text: 'Tile Name',
                  ),
                  Tab(
                    text: 'Member Level ',
                  ),
                  Tab(
                    text: 'Advanced',
                  ),
                  Tab(
                    text: 'Members',
                  ),
                ],
                controller: _model.tabBarController,
                onTap: (i) async {
                  [() async {}, () async {}, () async {}, () async {}][i]();
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
                      color: FlutterFlowTheme.of(context).tertiary,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: SelectionArea(
                              child: Text(
                            'Create New Tile',
                            style: FlutterFlowTheme.of(context).titleMedium,
                          )),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: SelectionArea(
                              child: Text(
                            'This is the tile that will show in the users area',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _model.tileTitleController,
                            focusNode: _model.tileTitleFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Tile Name ',
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.tileTitleControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _model.tileSummaryController,
                            focusNode: _model.tileSummaryFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Summary',
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            validator: _model.tileSummaryControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _model.positionIDController,
                            focusNode: _model.positionIDFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Position ID',
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            keyboardType: TextInputType.number,
                            validator: _model.positionIDControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/red.png',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'CREATE_NEW_TILE_UPLOAD_IMAGE_BTN_ON_TAP');
                                        logFirebaseEvent(
                                            'Button_upload_media_to_firebase');
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            showUploadMessage(
                                              context,
                                              'Uploading file...',
                                              showLoading: true,
                                            );
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            _model.isDataUploading = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl =
                                                  downloadUrls.first;
                                            });
                                            showUploadMessage(
                                                context, 'Success!');
                                          } else {
                                            setState(() {});
                                            showUploadMessage(context,
                                                'Failed to upload data');
                                            return;
                                          }
                                        }
                                      },
                                      text: 'Upload Image',
                                      options: FFButtonOptions(
                                        width: 150.0,
                                        height: 30.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'CREATE_NEW_TILE_COMP_CREATE_BTN_ON_TAP');
                                    logFirebaseEvent('Button_backend_call');

                                    var tilesRecordReference =
                                        TilesRecord.collection.doc();
                                    await tilesRecordReference.set({
                                      ...createTilesRecordData(
                                        title: _model.tileTitleController.text,
                                        summary:
                                            _model.tileSummaryController.text,
                                        image: valueOrDefault<String>(
                                          _model.uploadedFileUrl,
                                          'https://res.cloudinary.com/dplpckpbm/image/upload/v1669210510/images/1e14229fe8024ddaa0fb1de025bee634.png',
                                        ),
                                        tier: 0,
                                        id: valueOrDefault<int>(
                                          int.tryParse(
                                              _model.positionIDController.text),
                                          0,
                                        ),
                                        showvideoslider: true,
                                        show: true,
                                        isFeatured: _model.isFeaturedValue,
                                        isAI: _model.isAIValue,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'memberlevels': _model
                                              .checkboxListTileCheckedItems1
                                              .map((e) => e.categoryname)
                                              .toList(),
                                        },
                                      ),
                                    });
                                    _model.newlycreatedtile =
                                        TilesRecord.getDocumentFromData({
                                      ...createTilesRecordData(
                                        title: _model.tileTitleController.text,
                                        summary:
                                            _model.tileSummaryController.text,
                                        image: valueOrDefault<String>(
                                          _model.uploadedFileUrl,
                                          'https://res.cloudinary.com/dplpckpbm/image/upload/v1669210510/images/1e14229fe8024ddaa0fb1de025bee634.png',
                                        ),
                                        tier: 0,
                                        id: valueOrDefault<int>(
                                          int.tryParse(
                                              _model.positionIDController.text),
                                          0,
                                        ),
                                        showvideoslider: true,
                                        show: true,
                                        isFeatured: _model.isFeaturedValue,
                                        isAI: _model.isAIValue,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'memberlevels': _model
                                              .checkboxListTileCheckedItems1
                                              .map((e) => e.categoryname)
                                              .toList(),
                                        },
                                      ),
                                    }, tilesRecordReference);
                                    if (_model.checkboxListTileCheckedItems2
                                            .length >
                                        0) {
                                      logFirebaseEvent('Button_backend_call');

                                      await _model.newlycreatedtile!.reference
                                          .update({
                                        ...createTilesRecordData(
                                          tileref: _model
                                              .newlycreatedtile?.reference,
                                          onlyShowToMembers: true,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'showToMembers': FFAppState()
                                                .selectedToShowMembers,
                                          },
                                        ),
                                      });
                                    } else {
                                      logFirebaseEvent('Button_backend_call');

                                      await _model.newlycreatedtile!.reference
                                          .update(createTilesRecordData(
                                        tileref:
                                            _model.newlycreatedtile?.reference,
                                      ));
                                    }

                                    logFirebaseEvent('Button_bottom_sheet');
                                    Navigator.pop(context);
                                    logFirebaseEvent('Button_backend_call');

                                    await widget.tilesdoc!.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'children': FieldValue.arrayUnion([
                                            _model.newlycreatedtile?.reference
                                          ]),
                                        },
                                      ),
                                    });
                                    logFirebaseEvent('Button_bottom_sheet');
                                    Navigator.pop(context);

                                    setState(() {});
                                  },
                                  text: 'Create',
                                  options: FFButtonOptions(
                                    width: 150.0,
                                    height: 30.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (_model.uploadedFileUrl != null &&
                                  _model.uploadedFileUrl != '')
                                Image.network(
                                  _model.uploadedFileUrl,
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 900.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Choose where you would like to show this tile.',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
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
                                              FlutterFlowTheme.of(context)
                                                  .primary,
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
                                      primary: false,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 2.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 70.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              boxShadow: [
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Card(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: Color(0xFF4B39EF),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
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
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Theme(
                                                        data: ThemeData(
                                                          checkboxTheme:
                                                              CheckboxThemeData(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
                                                            ),
                                                          ),
                                                          unselectedWidgetColor:
                                                              Color(0xFF7C8791),
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
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  fontSize:
                                                                      20.0,
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Outfit'),
                                                                ),
                                                          ),
                                                          tileColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          activeColor:
                                                              Color(0xFF4B39EF),
                                                          checkColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
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
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).tertiary,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(0.0),
                                        ),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context).accent2,
                                  ),
                                  child: Checkbox(
                                    value: _model.isFeaturedValue ??=
                                        FFAppState().isfeaturedpost,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.isFeaturedValue = newValue!);
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                                Text(
                                  'Featured?',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(0.0),
                                        ),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context).accent2,
                                  ),
                                  child: Checkbox(
                                    value: _model.isAIValue ??= false,
                                    onChanged: (newValue) async {
                                      setState(
                                          () => _model.isAIValue = newValue!);
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                                Text(
                                  'AI ?',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(0.0),
                                        ),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context).accent2,
                                  ),
                                  child: Checkbox(
                                    value: _model.ispushValue ??= false,
                                    onChanged: (newValue) async {
                                      setState(
                                          () => _model.ispushValue = newValue!);
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                                Text(
                                  'Push - (coming soon)',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent4,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Text(
                              'Pick which members should see this tile. Note if you pick any name from below NO ONE else will be able to see this tile so only use it if its soley for the people you pick.',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StreamBuilder<List<UsersRecord>>(
                                  stream: queryUsersRecord(),
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
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<UsersRecord>
                                        catagoryListViewUsersRecordList =
                                        snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: catagoryListViewUsersRecordList
                                          .length,
                                      itemBuilder:
                                          (context, catagoryListViewIndex) {
                                        final catagoryListViewUsersRecord =
                                            catagoryListViewUsersRecordList[
                                                catagoryListViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 2.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 70.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              boxShadow: [
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Card(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: Color(0xFF4B39EF),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
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
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Theme(
                                                        data: ThemeData(
                                                          checkboxTheme:
                                                              CheckboxThemeData(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
                                                            ),
                                                          ),
                                                          unselectedWidgetColor:
                                                              Color(0xFF7C8791),
                                                        ),
                                                        child: CheckboxListTile(
                                                          value: _model
                                                                  .checkboxListTileValueMap2[
                                                              catagoryListViewUsersRecord] ??= false,
                                                          onChanged:
                                                              (newValue) async {
                                                            setState(() => _model
                                                                        .checkboxListTileValueMap2[
                                                                    catagoryListViewUsersRecord] =
                                                                newValue!);
                                                            if (newValue!) {
                                                              logFirebaseEvent(
                                                                  'CREATE_NEW_TILE_CheckboxListTile_d36sgtv');
                                                              logFirebaseEvent(
                                                                  'CheckboxListTile_update_app_state');
                                                              setState(() {
                                                                FFAppState().addToSelectedToShowMembers(
                                                                    catagoryListViewUsersRecord
                                                                        .reference);
                                                              });
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'CREATE_NEW_TILE_CheckboxListTile_d36sgtv');
                                                              logFirebaseEvent(
                                                                  'CheckboxListTile_update_app_state');
                                                              setState(() {
                                                                FFAppState().removeFromSelectedToShowMembers(
                                                                    catagoryListViewUsersRecord
                                                                        .reference);
                                                              });
                                                            }
                                                          },
                                                          title: Text(
                                                            catagoryListViewUsersRecord
                                                                .displayName,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  fontSize:
                                                                      20.0,
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
                                                            catagoryListViewUsersRecord
                                                                .email,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      14.0,
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
                                                              Color(0xFFF5F5F5),
                                                          activeColor:
                                                              Color(0xFF4B39EF),
                                                          checkColor:
                                                              Color(0xFF090F13),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
