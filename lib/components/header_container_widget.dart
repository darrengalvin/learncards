import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_on_page_widget.dart';
import '/components/learning_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'header_container_model.dart';
export 'header_container_model.dart';

class HeaderContainerWidget extends StatefulWidget {
  const HeaderContainerWidget({
    super.key,
    this.action,
    String? title,
    int? currentTier,
    this.companiesDoc,
    this.memberLevels,
    this.sessionsDoc,
  })  : title = title ?? 'Library',
        currentTier = currentTier ?? 0;

  final Future Function()? action;
  final String title;
  final int currentTier;
  final CompaniesRecord? companiesDoc;
  final List<MemberLevelsRecord>? memberLevels;
  final SessionsRecord? sessionsDoc;

  @override
  State<HeaderContainerWidget> createState() => _HeaderContainerWidgetState();
}

class _HeaderContainerWidgetState extends State<HeaderContainerWidget> {
  late HeaderContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderContainerModel());

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

    return StreamBuilder<List<Tilesv2Record>>(
      stream: queryTilesv2Record(
        queryBuilder: (tilesv2Record) => tilesv2Record
            .where(
              'companyDocId',
              isEqualTo: widget.companiesDoc?.reference.id,
            )
            .orderBy('tile_index'),
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
        List<Tilesv2Record> containerTilesv2RecordList = snapshot.data!;
        return Container(
          constraints: const BoxConstraints(
            maxWidth: 850.0,
          ),
          decoration: const BoxDecoration(),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 7.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'HEADER_CONTAINER_Column_07u6du22_ON_TAP');
                                      logFirebaseEvent(
                                          'Column_update_app_state');
                                      FFAppState().update(() {
                                        FFAppState().showmenuopen = true;
                                      });
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderRadius: 0.0,
                                            buttonSize: 37.0,
                                            icon: Icon(
                                              Icons.menu_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 34.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'HEADER_CONTAINER_menu_sharp_ICN_ON_TAP');
                                              logFirebaseEvent(
                                                  'IconButton_update_app_state');
                                              FFAppState().update(() {
                                                FFAppState().showmenuopen =
                                                    true;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child:
                                          StreamBuilder<List<LearnCardsRecord>>(
                                        stream: queryLearnCardsRecord(
                                          queryBuilder: (learnCardsRecord) =>
                                              learnCardsRecord.where(
                                            'tile_id',
                                            isEqualTo:
                                                FFAppState().viewTileContentId,
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<LearnCardsRecord>
                                              containerLearnCardsRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final containerLearnCardsRecord =
                                              containerLearnCardsRecordList
                                                      .isNotEmpty
                                                  ? containerLearnCardsRecordList
                                                      .first
                                                  : null;
                                          return Container(
                                            decoration: const BoxDecoration(),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 7.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      AnimatedContainer(
                                                        duration: const Duration(
                                                            milliseconds: 100),
                                                        curve: Curves.easeInOut,
                                                        constraints:
                                                            const BoxConstraints(
                                                          maxWidth: 600.0,
                                                        ),
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      6.0),
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .learningCardModel,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            updateOnChange:
                                                                true,
                                                            child:
                                                                LearningCardWidget(
                                                              learnCard:
                                                                  containerLearnCardsRecord!,
                                                              companyDoc: widget
                                                                  .companiesDoc!,
                                                              sessionsDoc: widget
                                                                  .sessionsDoc!,
                                                              showLearnCard:
                                                                  FFAppState()
                                                                      .showLearnCard,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.sizeOf(context).width *
                                              1.0,
                                      maxHeight: 130.0,
                                    ),
                                    decoration: const BoxDecoration(),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Builder(
                                        builder: (context) {
                                          final membeeLevelaFromPassed = widget
                                                  .memberLevels
                                                  ?.where((e) =>
                                                      valueOrDefault<bool>(
                                                        valueOrDefault<bool>(
                                                              (currentUserDocument
                                                                              ?.hasaccess
                                                                              .toList() ??
                                                                          [])
                                                                      .contains(e
                                                                          .reference
                                                                          .id) ==
                                                                  false,
                                                              false,
                                                            ) ||
                                                            valueOrDefault<
                                                                    bool>(
                                                                currentUserDocument
                                                                    ?.isadmin,
                                                                false) ||
                                                            (widget.sessionsDoc
                                                                    ?.hasAccess
                                                                    .contains(e
                                                                        .reference
                                                                        .id) ==
                                                                false) ||
                                                            (FFAppState()
                                                                    .debugCount >=
                                                                5),
                                                        false,
                                                      ) &&
                                                      (e.companyDocId ==
                                                          widget.companiesDoc
                                                              ?.reference.id))
                                                  .toList()
                                                  .toList() ??
                                              [];
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                membeeLevelaFromPassed.length,
                                            itemBuilder: (context,
                                                membeeLevelaFromPassedIndex) {
                                              final membeeLevelaFromPassedItem =
                                                  membeeLevelaFromPassed[
                                                      membeeLevelaFromPassedIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'HEADER_CONTAINER_Column_i8lgm4oj_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Column_update_app_state');
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                            .selectedMemberLevel =
                                                        membeeLevelaFromPassedItem
                                                            .reference.id;
                                                    FFAppState()
                                                            .selectedMemberLevelName =
                                                        valueOrDefault<String>(
                                                      membeeLevelaFromPassedItem
                                                          .memberLevelName,
                                                      'namenotset',
                                                    );
                                                  });
                                                  logFirebaseEvent(
                                                      'Column_haptic_feedback');
                                                  HapticFeedback.heavyImpact();
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(5.0),
                                                      child: Container(
                                                        constraints:
                                                            const BoxConstraints(
                                                          maxWidth: 300.0,
                                                          maxHeight: 150.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      17.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      5.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        17.0),
                                                            child:
                                                                Image.network(
                                                              membeeLevelaFromPassedItem
                                                                  .shield,
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: 100.0,
                                                              fit: BoxFit.cover,
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
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: StreamBuilder<List<CategoriesRecord>>(
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
                                        containerCategoriesRecordList =
                                        snapshot.data!;
                                    return ClipRRect(
                                      child: AnimatedContainer(
                                        duration: const Duration(milliseconds: 100),
                                        curve: Curves.easeInOut,
                                        decoration: const BoxDecoration(),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final categoriesMemberLevel =
                                                      containerCategoriesRecordList
                                                          .toList();
                                                  return SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: List.generate(
                                                          categoriesMemberLevel
                                                              .length,
                                                          (categoriesMemberLevelIndex) {
                                                        final categoriesMemberLevelItem =
                                                            categoriesMemberLevel[
                                                                categoriesMemberLevelIndex];
                                                        return Visibility(
                                                          visible: categoriesMemberLevelItem
                                                                  .accessToMemberLevelsId
                                                                  .contains(
                                                                      FFAppState()
                                                                          .selectedMemberLevel) ==
                                                              true,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          17.0),
                                                              child:
                                                                  AnimatedContainer(
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        100),
                                                                curve: Curves
                                                                    .easeIn,
                                                                width: 270.0,
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              17.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          4.0,
                                                                          4.0),
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
                                                                          'HEADER_CONTAINER_Container_3zakymkg_ON_T');
                                                                      logFirebaseEvent(
                                                                          'Container_update_app_state');
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().showLearnCard =
                                                                            false;
                                                                      });
                                                                      if (categoriesMemberLevelItem
                                                                              .categoryname ==
                                                                          'Learning Journeys') {
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().leftPane =
                                                                              'aiMenu';
                                                                          FFAppState().leftColumnShow =
                                                                              true;
                                                                          FFAppState().middlePane =
                                                                              'bodyContent';
                                                                          FFAppState().middleColumnShow =
                                                                              valueOrDefault<bool>(
                                                                            () {
                                                                              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                return false;
                                                                              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                return true;
                                                                              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                return true;
                                                                              } else {
                                                                                return true;
                                                                              }
                                                                            }(),
                                                                            true,
                                                                          );
                                                                        });
                                                                      } else if (categoriesMemberLevelItem
                                                                              .categoryname ==
                                                                          'Vault') {
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        _model.updatePage(
                                                                            () {
                                                                          FFAppState().leftPane =
                                                                              'appMenu';
                                                                          FFAppState().leftColumnShow =
                                                                              true;
                                                                          FFAppState().middleColumnShow =
                                                                              valueOrDefault<bool>(
                                                                            () {
                                                                              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                return false;
                                                                              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                return true;
                                                                              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                return true;
                                                                              } else {
                                                                                return true;
                                                                              }
                                                                            }(),
                                                                            true,
                                                                          );
                                                                          FFAppState().middlePane =
                                                                              'bodyContentMainTiles';
                                                                        });
                                                                      } else if (categoriesMemberLevelItem
                                                                              .categoryname ==
                                                                          'Events') {
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        _model.updatePage(
                                                                            () {
                                                                          FFAppState().leftPane =
                                                                              'events';
                                                                          FFAppState().leftColumnShow =
                                                                              true;
                                                                          FFAppState().middleColumnShow =
                                                                              valueOrDefault<bool>(
                                                                            () {
                                                                              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                return false;
                                                                              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                return true;
                                                                              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                return true;
                                                                              } else {
                                                                                return true;
                                                                              }
                                                                            }(),
                                                                            true,
                                                                          );
                                                                          FFAppState().middlePane =
                                                                              'bodyContentMainTiles';
                                                                          FFAppState().selectedParentId =
                                                                              'Events';
                                                                          FFAppState().selectedcategory =
                                                                              'Events';
                                                                          FFAppState().selectedCategoryName =
                                                                              'Events';
                                                                        });
                                                                      } else if (categoriesMemberLevelItem
                                                                              .categoryname ==
                                                                          'Chat') {
                                                                        logFirebaseEvent(
                                                                            'Container_firestore_query');
                                                                        _model.companycheckforbottomchat =
                                                                            await queryCompaniesRecordOnce(
                                                                          queryBuilder: (companiesRecord) =>
                                                                              companiesRecord.where(
                                                                            'companyCode',
                                                                            isEqualTo:
                                                                                FFAppState().companySecretCode,
                                                                          ),
                                                                          singleRecord:
                                                                              true,
                                                                        ).then((s) =>
                                                                                s.firstOrNull);
                                                                        logFirebaseEvent(
                                                                            'Container_bottom_sheet');
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return WebViewAware(
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: AICOMMUNICATIONOnPageWidget(
                                                                                  companiesDoc: _model.companycheckforbottomchat!,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'Container_alert_dialog');
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return WebViewAware(
                                                                              child: AlertDialog(
                                                                                title: const Text('conditions not met '),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: const Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      }

                                                                      if ((FFAppState().selectedcategory ==
                                                                              '') ||
                                                                          valueOrDefault<
                                                                              bool>(
                                                                            FFAppState().selectedCategoryName == '',
                                                                            false,
                                                                          )) {
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        _model.updatePage(
                                                                            () {
                                                                          FFAppState().selectedcategory =
                                                                              'Community';
                                                                          FFAppState().selectedCategoryName =
                                                                              'Community';
                                                                        });
                                                                      }

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              17.0),
                                                                      child:
                                                                          AnimatedContainer(
                                                                        duration:
                                                                            const Duration(milliseconds: 100),
                                                                        curve: Curves
                                                                            .easeIn,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          image:
                                                                              DecorationImage(
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            image:
                                                                                Image.network(
                                                                              '',
                                                                            ).image,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(17.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Colors.transparent,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            categoriesMemberLevelItem.categoryname,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
