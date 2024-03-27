import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'desktop_tile_nav_a_your_saved_model.dart';
export 'desktop_tile_nav_a_your_saved_model.dart';

class DesktopTileNavAYourSavedWidget extends StatefulWidget {
  const DesktopTileNavAYourSavedWidget({
    super.key,
    this.sessionId,
    this.sessionDoc,
  });

  final String? sessionId;
  final SessionsRecord? sessionDoc;

  @override
  State<DesktopTileNavAYourSavedWidget> createState() =>
      _DesktopTileNavAYourSavedWidgetState();
}

class _DesktopTileNavAYourSavedWidgetState
    extends State<DesktopTileNavAYourSavedWidget> {
  late DesktopTileNavAYourSavedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DesktopTileNavAYourSavedModel());

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
      alignment: AlignmentDirectional(0.0, -1.0),
      child: StreamBuilder<List<Tilesv2Record>>(
        stream: queryTilesv2Record(
          queryBuilder: (tilesv2Record) => tilesv2Record.orderBy('tile_index'),
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
          List<Tilesv2Record> desktopTileNavTilesv2RecordList = snapshot.data!;
          return AnimatedContainer(
            duration: Duration(milliseconds: 100),
            curve: Curves.easeInOut,
            width: double.infinity,
            height: double.infinity,
            constraints: BoxConstraints(
              maxHeight: 1000.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: StreamBuilder<List<CompaniesRecord>>(
              stream: queryCompaniesRecord(
                queryBuilder: (companiesRecord) => companiesRecord.where(
                  'companyCode',
                  isEqualTo: valueOrDefault<String>(
                    FFAppState().companySecretCode,
                    '112233',
                  ),
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
                List<CompaniesRecord> containerCompaniesRecordList =
                    snapshot.data!;
                return Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (valueOrDefault<bool>(
                            valueOrDefault<bool>(
                                  () {
                                    if ((loggedIn == true) &&
                                        (desktopTileNavTilesv2RecordList
                                                .first.uid ==
                                            currentUserReference?.id)) {
                                      return true;
                                    } else if ((loggedIn != true) &&
                                        valueOrDefault<bool>(
                                          desktopTileNavTilesv2RecordList
                                                  .first.sessionIdUser ==
                                              FFAppState().nonLoggedInSessionId,
                                          false,
                                        )) {
                                      return true;
                                    } else {
                                      return false;
                                    }
                                  }(),
                                  false,
                                ) ||
                                (valueOrDefault<bool>(
                                        currentUserDocument?.isadmin, false) ==
                                    true),
                            false,
                          ))
                            AuthUserStreamWidget(
                              builder: (context) => Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0),
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (responsiveVisibility(
                                        context: context,
                                        tablet: false,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownValueController ??=
                                              FormFieldController<String>(null),
                                          options:
                                              desktopTileNavTilesv2RecordList
                                                  .where((e) =>
                                                      valueOrDefault<bool>(
                                                        valueOrDefault<bool>(
                                                              e.tileTier > 0,
                                                              false,
                                                            ) &&
                                                            valueOrDefault<
                                                                bool>(
                                                              e.parentId ==
                                                                  FFAppState()
                                                                      .navPath
                                                                      .first,
                                                              false,
                                                            ),
                                                        false,
                                                      ))
                                                  .toList()
                                                  .map((e) => e.title)
                                                  .toList(),
                                          onChanged: (val) => setState(
                                              () => _model.dropDownValue = val),
                                          width: 300.0,
                                          height: 50.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          hintText: 'Please select...',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isOverButton: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final navTile1Desktop =
                                                          desktopTileNavTilesv2RecordList
                                                              .where((e) =>
                                                                  valueOrDefault<
                                                                      bool>(
                                                                    valueOrDefault<
                                                                            bool>(
                                                                          e.tileTier >
                                                                              0,
                                                                          false,
                                                                        ) &&
                                                                        (FFAppState().selectedcategory ==
                                                                            'Learning Journeys'),
                                                                    false,
                                                                  ))
                                                              .toList();
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            navTile1Desktop
                                                                .length,
                                                        itemBuilder: (context,
                                                            navTile1DesktopIndex) {
                                                          final navTile1DesktopItem =
                                                              navTile1Desktop[
                                                                  navTile1DesktopIndex];
                                                          return Visibility(
                                                            visible:
                                                                valueOrDefault<
                                                                    bool>(
                                                              valueOrDefault<
                                                                      bool>(
                                                                    () {
                                                                      if ((loggedIn ==
                                                                              true) &&
                                                                          (navTile1DesktopItem.uid ==
                                                                              currentUserReference
                                                                                  ?.id)) {
                                                                        return true;
                                                                      } else if ((loggedIn !=
                                                                              true) &&
                                                                          valueOrDefault<
                                                                              bool>(
                                                                            navTile1DesktopItem.sessionIdUser ==
                                                                                FFAppState().nonLoggedInSessionId,
                                                                            false,
                                                                          )) {
                                                                        return true;
                                                                      } else {
                                                                        return false;
                                                                      }
                                                                    }(),
                                                                    false,
                                                                  ) ||
                                                                  (valueOrDefault<
                                                                              bool>(
                                                                          currentUserDocument
                                                                              ?.isadmin,
                                                                          false) ==
                                                                      true) ||
                                                                  valueOrDefault<
                                                                      bool>(
                                                                    navTile1DesktopItem
                                                                            .triggerWeekly ==
                                                                        true,
                                                                    false,
                                                                  ),
                                                              false,
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            4.0,
                                                                            2.0),
                                                                child:
                                                                    AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                    child:
                                                                        AnimatedContainer(
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              170),
                                                                      curve: Curves
                                                                          .easeInOut,
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        primary:
                                                                            false,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(7.0, 7.0, 7.0, 7.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('DESKTOP_TILE_NAV_A_YOUR_SAVED_tileTier_O');
                                                                                  if (FFAppState().tileNav.tier1Id == navTile1DesktopItem.reference.id) {
                                                                                    logFirebaseEvent('tileTier_update_app_state');
                                                                                    setState(() {
                                                                                      FFAppState().updateTileNavStruct(
                                                                                        (e) => e
                                                                                          ..tier2Id = null
                                                                                          ..tier3Id = null
                                                                                          ..tier4Id = null,
                                                                                      );
                                                                                      FFAppState().viewTileContentId = navTile1DesktopItem.reference.id;
                                                                                      FFAppState().navPath = FFAppState().navPath.take(2).toList().cast<String>();
                                                                                    });
                                                                                    logFirebaseEvent('tileTier_update_app_state');
                                                                                    setState(() {
                                                                                      FFAppState().NewTileJustCreated = false;
                                                                                    });
                                                                                  } else {
                                                                                    logFirebaseEvent('tileTier_update_app_state');
                                                                                    FFAppState().updateTileNavStruct(
                                                                                      (e) => e
                                                                                        ..tier1Id = navTile1DesktopItem.reference.id
                                                                                        ..tier2Id = null
                                                                                        ..tier3Id = null
                                                                                        ..tier4Id = null,
                                                                                    );
                                                                                    FFAppState().viewTileContentId = navTile1DesktopItem.reference.id;
                                                                                    FFAppState().navPath = FFAppState().navPath.take(1).toList().cast<String>();
                                                                                    logFirebaseEvent('tileTier_update_app_state');
                                                                                    _model.updatePage(() {
                                                                                      FFAppState().addToNavPath(navTile1DesktopItem.reference.id);
                                                                                    });
                                                                                    logFirebaseEvent('tileTier_update_app_state');
                                                                                    setState(() {
                                                                                      FFAppState().NewTileJustCreated = false;
                                                                                    });
                                                                                  }

                                                                                  logFirebaseEvent('tileTier_update_app_state');
                                                                                  _model.updatePage(() {
                                                                                    FFAppState().selectedTopic = valueOrDefault<String>(
                                                                                      navTile1DesktopItem.title,
                                                                                      'primary tile',
                                                                                    );
                                                                                    FFAppState().selectedReadingItem = navTile1DesktopItem.title;
                                                                                    FFAppState().middleColumnShow = () {
                                                                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                        return false;
                                                                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                        return true;
                                                                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                        return true;
                                                                                      } else {
                                                                                        return true;
                                                                                      }
                                                                                    }();
                                                                                    FFAppState().leftColumnShow = true;
                                                                                    FFAppState().middlePane = valueOrDefault<String>(
                                                                                      desktopTileNavTilesv2RecordList.first.aiComplete != true ? 'preparing' : 'bodyContent',
                                                                                      'bodyContent',
                                                                                    );
                                                                                  });
                                                                                },
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  height: 110.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: valueOrDefault<Color>(
                                                                                      containerCompaniesRecordList.first.colors.primaryColor,
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(13.0),
                                                                                      bottomRight: Radius.circular(13.0),
                                                                                      topLeft: Radius.circular(13.0),
                                                                                      topRight: Radius.circular(13.0),
                                                                                    ),
                                                                                    border: Border.all(
                                                                                      color: valueOrDefault<Color>(
                                                                                        FFAppState().tileNav.tier1Id == navTile1DesktopItem.reference.id ? FlutterFlowTheme.of(context).customColor7 : FlutterFlowTheme.of(context).selectedButton,
                                                                                        FlutterFlowTheme.of(context).selectedButton,
                                                                                      ),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      ),
                                                                                                      child: Visibility(
                                                                                                        visible: responsiveVisibility(
                                                                                                          context: context,
                                                                                                          phone: false,
                                                                                                          tablet: false,
                                                                                                          tabletLandscape: false,
                                                                                                          desktop: false,
                                                                                                        ),
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                          child: Image.network(
                                                                                                            valueOrDefault<String>(
                                                                                                              navTile1DesktopItem.image,
                                                                                                              'https://firebasestorage.googleapis.com/v0/b/tony-morris-internationa-1b480.appspot.com/o/Screenshot%202023-09-18%20at%2003.42.png?alt=media&token=060d0210-4a99-4b7f-a5ff-ce9ab70a4849',
                                                                                                            ),
                                                                                                            width: 70.0,
                                                                                                            height: 70.0,
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 5.0, 8.0, 5.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          AutoSizeText(
                                                                                                            valueOrDefault<String>(
                                                                                                              'Generated: ${dateTimeFormat('relative', navTile1DesktopItem.createdTime)}',
                                                                                                              'not set',
                                                                                                            ),
                                                                                                            textAlign: TextAlign.start,
                                                                                                            maxLines: 3,
                                                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                                  color: containerCompaniesRecordList.first.colors.secondaryTextColor,
                                                                                                                  fontSize: 12.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            AutoSizeText(
                                                                                                              navTile1DesktopItem.title,
                                                                                                              textAlign: TextAlign.start,
                                                                                                              maxLines: 3,
                                                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                                    color: valueOrDefault<Color>(
                                                                                                                      containerCompaniesRecordList.first.colors.secondaryTextColor,
                                                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                                                    ),
                                                                                                                    fontSize: 16.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
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
                                                                                        if (valueOrDefault<bool>(
                                                                                          valueOrDefault<bool>(
                                                                                                navTile1DesktopItem.adminUsers.contains(currentUserReference?.id),
                                                                                                false,
                                                                                              ) ||
                                                                                              valueOrDefault<bool>(currentUserDocument?.isadmin, false),
                                                                                          false,
                                                                                        ))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [],
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Opacity(
                                                                              opacity: 0.8,
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                child: AnimatedContainer(
                                                                                  duration: Duration(milliseconds: 100),
                                                                                  curve: Curves.easeInOut,
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: containerCompaniesRecordList.first.colors.primaryColor,
                                                                                    borderRadius: BorderRadius.circular(17.0),
                                                                                    border: Border.all(
                                                                                      color: Colors.transparent,
                                                                                    ),
                                                                                  ),
                                                                                  child: Visibility(
                                                                                    visible: valueOrDefault<bool>(
                                                                                      () {
                                                                                        if (FFAppState().tileNav.tier1Id == navTile1DesktopItem.reference.id) {
                                                                                          return true;
                                                                                        } else if (desktopTileNavTilesv2RecordList.first.triggerWeekly == true) {
                                                                                          return true;
                                                                                        } else {
                                                                                          return false;
                                                                                        }
                                                                                      }(),
                                                                                      false,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          final tileTier2 = desktopTileNavTilesv2RecordList
                                                                                              .where((e) => valueOrDefault<bool>(
                                                                                                    e.parentId == navTile1DesktopItem.reference.id,
                                                                                                    false,
                                                                                                  ))
                                                                                              .toList();
                                                                                          return Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: List.generate(tileTier2.length, (tileTier2Index) {
                                                                                              final tileTier2Item = tileTier2[tileTier2Index];
                                                                                              return Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                                child: InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('DESKTOP_TILE_NAV_A_YOUR_SAVED_tile_ON_TA');
                                                                                                    logFirebaseEvent('tile_firestore_query');
                                                                                                    _model.companyQuery = await queryCompaniesRecordOnce(
                                                                                                      queryBuilder: (companiesRecord) => companiesRecord.where(
                                                                                                        'companyCode',
                                                                                                        isEqualTo: FFAppState().companySecretCode,
                                                                                                      ),
                                                                                                      singleRecord: true,
                                                                                                    ).then((s) => s.firstOrNull);
                                                                                                    logFirebaseEvent('tile_update_app_state');
                                                                                                    setState(() {
                                                                                                      FFAppState().middleColumnShow = true;
                                                                                                    });
                                                                                                    if (FFAppState().tileNav.tier2Id == tileTier2Item.reference.id) {
                                                                                                      logFirebaseEvent('tile_update_app_state');
                                                                                                      _model.updatePage(() {
                                                                                                        FFAppState().updateTileNavStruct(
                                                                                                          (e) => e
                                                                                                            ..tier3Id = null
                                                                                                            ..tier4Id = null,
                                                                                                        );
                                                                                                        FFAppState().viewTileContentId = valueOrDefault<String>(
                                                                                                          tileTier2Item.reference.id,
                                                                                                          '000',
                                                                                                        );
                                                                                                        FFAppState().navPath = FFAppState().navPath.take(3).toList().cast<String>();
                                                                                                      });
                                                                                                      logFirebaseEvent('tile_update_app_state');
                                                                                                      setState(() {
                                                                                                        FFAppState().NewTileJustCreated = false;
                                                                                                      });
                                                                                                    } else {
                                                                                                      logFirebaseEvent('tile_update_app_state');
                                                                                                      FFAppState().updateTileNavStruct(
                                                                                                        (e) => e
                                                                                                          ..tier2Id = tileTier2Item.reference.id
                                                                                                          ..tier3Id = null
                                                                                                          ..tier4Id = null,
                                                                                                      );
                                                                                                      FFAppState().viewTileContentId = valueOrDefault<String>(
                                                                                                        tileTier2Item.reference.id,
                                                                                                        '000',
                                                                                                      );
                                                                                                      FFAppState().navPath = FFAppState().navPath.take(2).toList().cast<String>();
                                                                                                      logFirebaseEvent('tile_update_app_state');
                                                                                                      _model.updatePage(() {
                                                                                                        FFAppState().addToNavPath(tileTier2Item.reference.id);
                                                                                                      });
                                                                                                      logFirebaseEvent('tile_update_app_state');
                                                                                                      setState(() {
                                                                                                        FFAppState().NewTileJustCreated = false;
                                                                                                      });
                                                                                                      logFirebaseEvent('tile_update_app_state');
                                                                                                      setState(() {
                                                                                                        FFAppState().selectedReadingItem = tileTier2Item.title;
                                                                                                      });
                                                                                                    }

                                                                                                    if (tileTier2Item.aiComplete != true) {
                                                                                                      logFirebaseEvent('tile_backend_call');

                                                                                                      await tileTier2Item.reference.update(createTilesv2RecordData(
                                                                                                        aiComplete: true,
                                                                                                      ));
                                                                                                      if (!loggedIn) {}
                                                                                                    } else {
                                                                                                      logFirebaseEvent('tile_alert_dialog');
                                                                                                      await showDialog(
                                                                                                        context: context,
                                                                                                        builder: (alertDialogContext) {
                                                                                                          return WebViewAware(
                                                                                                            child: AlertDialog(
                                                                                                              title: Text('Already Generated'),
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
                                                                                                    }

                                                                                                    setState(() {});
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0xB2FAFAFA),
                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                      border: Border.all(
                                                                                                        color: valueOrDefault<Color>(
                                                                                                          FFAppState().tileNav.tier2Id == tileTier2Item.reference.id ? FlutterFlowTheme.of(context).customColor7 : FlutterFlowTheme.of(context).accent3,
                                                                                                          FlutterFlowTheme.of(context).accent3,
                                                                                                        ),
                                                                                                        width: 1.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsets.all(8.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          if (valueOrDefault<bool>(
                                                                                                            tileTier2Item.image != null && tileTier2Item.image != '',
                                                                                                            false,
                                                                                                          ))
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Opacity(
                                                                                                                    opacity: 0.4,
                                                                                                                    child: ClipRRect(
                                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                                      child: Image.network(
                                                                                                                        tileTier2Item.image,
                                                                                                                        width: 60.0,
                                                                                                                        height: 60.0,
                                                                                                                        fit: BoxFit.cover,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          Expanded(
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    tileTier2Item.title,
                                                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                          fontFamily: 'Outfit',
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          fontSize: 15.0,
                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          if (valueOrDefault<bool>(
                                                                                                            valueOrDefault<bool>(
                                                                                                                  tileTier2Item.accessUsers.contains(currentUserUid),
                                                                                                                  false,
                                                                                                                ) ||
                                                                                                                valueOrDefault<bool>(currentUserDocument?.isadmin, false),
                                                                                                            false,
                                                                                                          ))
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 8.0, 0.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [],
                                                                                                              ),
                                                                                                            ),
                                                                                                        ],
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
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
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
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
