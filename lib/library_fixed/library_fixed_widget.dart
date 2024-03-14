import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_on_page_my_mentor_widget.dart';
import '/components/a_i_c_o_m_m_u_n_i_c_a_t_i_o_n_welcome_widget.dart';
import '/components/developer_debug_mode_widget.dart';
import '/components/drawer_tile_tree_widget.dart';
import '/components/header_container_widget.dart';
import '/components/left_menu_widget.dart';
import '/components/middle_body_all_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'library_fixed_model.dart';
export 'library_fixed_model.dart';

class LibraryFixedWidget extends StatefulWidget {
  const LibraryFixedWidget({
    super.key,
    this.associatedTileBlock,
    this.companiesDoc,
    this.landing,
  });

  final String? associatedTileBlock;
  final CompaniesRecord? companiesDoc;
  final String? landing;

  @override
  State<LibraryFixedWidget> createState() => _LibraryFixedWidgetState();
}

class _LibraryFixedWidgetState extends State<LibraryFixedWidget> {
  late LibraryFixedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LibraryFixedModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Library-fixed'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LIBRARY_FIXED_Library-fixed_ON_INIT_STAT');
      if (kDebugMode == true) {
        logFirebaseEvent('Library-fixed_bottom_sheet');
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return WebViewAware(
              child: GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: const DeveloperDebugModeWidget(),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
      logFirebaseEvent('Library-fixed_custom_action');
      await actions.onPageLoadCheckUrl();
      logFirebaseEvent('Library-fixed_firestore_query');
      _model.companyByUrl = await queryCompaniesRecordOnce(
        queryBuilder: (companiesRecord) => companiesRecord.where(
          'companyDocId',
          isEqualTo: valueOrDefault<String>(
            FFAppState().companyDocId,
            'nocompanydocid',
          ),
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      logFirebaseEvent('Library-fixed_alert_dialog');
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              title: const Text('Company Docs Found'),
              content: Text(valueOrDefault<String>(
                _model.companyByUrl?.companyname,
                'notFound',
              )),
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
      if (_model.companyByUrl?.landingUrls
              .contains(FFAppState().selectedCompanyUrl) ==
          true) {
        logFirebaseEvent('Library-fixed_update_app_state');
        setState(() {
          FFAppState().debugMessage =
              'URL Matches company${valueOrDefault<String>(
            widget.companiesDoc?.companyname,
            '-',
          )}';
        });
        logFirebaseEvent('Library-fixed_update_app_state');
        setState(() {
          FFAppState().companySecretCode = _model.companyByUrl!.companyCode;
          FFAppState().companyBackgroundImage =
              _model.companyByUrl!.backgroundImage;
        });
      } else {
        logFirebaseEvent('Library-fixed_update_app_state');
        setState(() {
          FFAppState().debugMessage =
              'URL Does Not Matche Company${valueOrDefault<String>(
            widget.companiesDoc?.companyname,
            '-',
          )}';
        });
        logFirebaseEvent('Library-fixed_firestore_query');
        _model.companyByUrl2 = await queryCompaniesRecordOnce(
          queryBuilder: (companiesRecord) => companiesRecord.where(
            'landingUrls',
            arrayContains: FFAppState().selectedCompanyUrl,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
      }

      if (FFAppState().nonLoggedInSessionId == '') {
        logFirebaseEvent('Library-fixed_update_app_state');
        setState(() {
          FFAppState().debugMessage = valueOrDefault<String>(
            'NonLoggedinSessionId unset',
            '-',
          );
          FFAppState().selectedThreadId = 'Ddefault-${random_data.randomString(
            8,
            8,
            true,
            true,
            true,
          )}';
        });
        logFirebaseEvent('Library-fixed_backend_call');

        var sessionsRecordReference = SessionsRecord.collection.doc();
        await sessionsRecordReference.set({
          ...createSessionsRecordData(
            dateTime: getCurrentTimestamp,
            backgroundImage: '',
            wantToLearn: '',
            person1ThreadId: '1',
            person2ThreadId: '2',
            person3ThreadId: '3',
            person4ThreadId: '4',
            person5ThreadId: '5',
            currentNavJourney: 'newSession',
            defaultThreadId: valueOrDefault<String>(
              FFAppState().selectedThreadId,
              'id',
            ),
            companyId: _model.companyByUrl?.reference.id,
          ),
          ...mapToFirestore(
            {
              'threads': [
                getThreadsFirestoreData(
                  createThreadsStruct(
                    threadId: FFAppState().selectedThreadId,
                    threadName: 'Initial Welcome Chat',
                    threadImage: '',
                    clearUnsetFields: false,
                    create: true,
                  ),
                  true,
                )
              ],
            },
          ),
        });
        _model.sessionsCreated = SessionsRecord.getDocumentFromData({
          ...createSessionsRecordData(
            dateTime: getCurrentTimestamp,
            backgroundImage: '',
            wantToLearn: '',
            person1ThreadId: '1',
            person2ThreadId: '2',
            person3ThreadId: '3',
            person4ThreadId: '4',
            person5ThreadId: '5',
            currentNavJourney: 'newSession',
            defaultThreadId: valueOrDefault<String>(
              FFAppState().selectedThreadId,
              'id',
            ),
            companyId: _model.companyByUrl?.reference.id,
          ),
          ...mapToFirestore(
            {
              'threads': [
                getThreadsFirestoreData(
                  createThreadsStruct(
                    threadId: FFAppState().selectedThreadId,
                    threadName: 'Initial Welcome Chat',
                    threadImage: '',
                    clearUnsetFields: false,
                    create: true,
                  ),
                  true,
                )
              ],
            },
          ),
        }, sessionsRecordReference);
        logFirebaseEvent('Library-fixed_backend_call');

        await _model.sessionsCreated!.reference.update(createSessionsRecordData(
          sessionId: valueOrDefault<String>(
            _model.sessionsCreated?.reference.id,
            'notUsedDocId',
          ),
        ));
        logFirebaseEvent('Library-fixed_update_app_state');
        setState(() {
          FFAppState().nonLoggedInSessionId =
              _model.sessionsCreated!.reference.id;
        });
      } else {
        logFirebaseEvent('Library-fixed_update_app_state');
        setState(() {
          FFAppState().debugMessage = valueOrDefault<String>(
            'NonLoggedinSessionId   ${FFAppState().nonLoggedInSessionId}',
            '-',
          );
        });
      }

      logFirebaseEvent('Library-fixed_update_app_state');
      setState(() {
        FFAppState().debugMessage = 'team queried';
      });
      // sessions query for later
      logFirebaseEvent('Library-fixed_sessionsqueryforlater');
      _model.sessionQueryOnPageLoad = await querySessionsRecordOnce(
        queryBuilder: (sessionsRecord) => sessionsRecord.where(
          'sessionId',
          isEqualTo: FFAppState().nonLoggedInSessionId,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.sessionQueryOnPageLoad?.currentNavJourney == 'newSession') {
        logFirebaseEvent('Library-fixed_update_app_state');
        FFAppState().update(() {
          FFAppState().leftPane = 'aiMenu';
          FFAppState().leftColumnShow = true;
          FFAppState().middlePane = 'bodyContent';
          FFAppState().middleColumnShow = valueOrDefault<bool>(
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
        logFirebaseEvent('Library-fixed_update_app_state');
        FFAppState().selectedcategory = valueOrDefault<String>(
          _model.companyByUrl?.startingCategory,
          'starting category is not set in companies doc',
        );
        FFAppState().selectedCategoryName = valueOrDefault<String>(
          _model.companyByUrl?.startingCategory,
          'starting category is not set in companies doc',
        );
        logFirebaseEvent('Library-fixed_update_app_state');
        FFAppState().update(() {
          FFAppState().selectedMemberLevel = valueOrDefault<String>(
            _model.companyByUrl?.startingMemberLevel,
            'starting member level is not set in company doc',
          );
          FFAppState().selectedMemberLevelName = valueOrDefault<String>(
            _model.companyByUrl?.startingMemberLevelName,
            'starting member level name is not set in compay doc',
          );
        });
        logFirebaseEvent('Library-fixed_update_app_state');
        setState(() {
          FFAppState().rightPane = 'learnCards';
        });
      }
      logFirebaseEvent('Library-fixed_update_app_state');
      setState(() {
        FFAppState().debugMessage = 'person 1 set';
      });
      if ((FFAppState().leftPane == '') ||
          (FFAppState().leftPane == '-')) {
        logFirebaseEvent('Library-fixed_update_app_state');
        setState(() {
          FFAppState().leftPane = 'appMenu';
          FFAppState().leftColumnShow = true;
        });
        logFirebaseEvent('Library-fixed_update_app_state');
        setState(() {
          FFAppState().debugMessage = valueOrDefault<String>(
            'LefPane set to ${FFAppState().leftPane}  and is  show = ${FFAppState().leftColumnShow.toString()}',
            '-',
          );
        });
      } else {
        logFirebaseEvent('Library-fixed_update_app_state');
        setState(() {
          FFAppState().debugMessage = valueOrDefault<String>(
            'Left pane is already set ${FFAppState().leftPane}',
            '-',
          );
        });
      }

      if ((FFAppState().middlePane == '') ||
          (FFAppState().middlePane == '-')) {
        logFirebaseEvent('Library-fixed_update_app_state');
        setState(() {
          FFAppState().middlePane = 'bodyContentMainTiles';
        });
        logFirebaseEvent('Library-fixed_update_app_state');
        setState(() {
          FFAppState().debugMessage = valueOrDefault<String>(
            'middlePane set to ${valueOrDefault<String>(
              FFAppState().middlePane,
              '-',
            )}  and is  show = ${valueOrDefault<String>(
              FFAppState().middlePane,
              '-',
            )}',
            '-',
          );
        });
      }
      if ((FFAppState().rightPane == '') ||
          (FFAppState().rightPane == '-')) {
        logFirebaseEvent('Library-fixed_update_app_state');
        setState(() {
          FFAppState().rightPane = 'learnCards';
        });
        logFirebaseEvent('Library-fixed_update_app_state');
        setState(() {
          FFAppState().leftPane = 'appMenu';
          FFAppState().rightColumnShow = () {
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
          FFAppState().middleColumnShow = valueOrDefault<bool>(
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
        logFirebaseEvent('Library-fixed_update_app_state');
        setState(() {
          FFAppState().debugMessage = valueOrDefault<String>(
            'rightPane set to ${valueOrDefault<String>(
              FFAppState().rightPane,
              '-',
            )}  and is  show = ${FFAppState().rightPane}',
            '-',
          );
        });
      }
      logFirebaseEvent('Library-fixed_update_app_state');
      setState(() {
        FFAppState().debugMessage = 'set selected thread';
      });
      logFirebaseEvent('Library-fixed_firestore_query');
      _model.loadingcHATmENTOR = await queryMyTeamRecordOnce(
        queryBuilder: (myTeamRecord) => myTeamRecord
            .where(
              'positionId',
              isEqualTo: 1,
            )
            .where(
              'company',
              isEqualTo: FFAppState().selectedCompanyId,
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      logFirebaseEvent('Library-fixed_update_app_state');
      setState(() {
        FFAppState().selectedTeam = _model.loadingcHATmENTOR!.reference.id;
      });
      if (valueOrDefault<bool>(
        (_model.sessionQueryOnPageLoad?.currentNavJourney == 'newSession') &&
            (_model.sessionQueryOnPageLoad?.userEmail == null ||
                _model.sessionQueryOnPageLoad?.userEmail == ''),
        false,
      )) {
        logFirebaseEvent('Library-fixed_update_app_state');
        setState(() {
          FFAppState().debugMessage = valueOrDefault<String>(
            'In the NO SELECTED THREAD chain',
            '-',
          );
        });
        logFirebaseEvent('Library-fixed_firestore_query');
        _model.queryFlowiseChats = await queryFlowiseChatsRecordOnce(
          queryBuilder: (flowiseChatsRecord) => flowiseChatsRecord.where(
            'session_id',
            isEqualTo: valueOrDefault<String>(
              FFAppState().nonLoggedInSessionId,
              'none',
            ),
          ),
        );
        logFirebaseEvent('Library-fixed_update_app_state');
        setState(() {
          FFAppState().selectedThreadId =
              _model.sessionQueryOnPageLoad!.defaultThreadId;
        });
        if (_model.queryFlowiseChats!.isNotEmpty) {
          logFirebaseEvent('Library-fixed_update_app_state');
          setState(() {
            FFAppState().debugMessage = valueOrDefault<String>(
              'Exisiting Thread Was Found ',
              '-',
            );
          });
        } else {
          logFirebaseEvent('Library-fixed_update_app_state');
          setState(() {
            FFAppState().debugMessage = valueOrDefault<String>(
              'rxisiting thread is nOT set ',
              '-',
            );
          });
          // flowise chat document
          logFirebaseEvent('Library-fixed_flowisechatdocument');

          var flowiseChatsRecordReference = FlowiseChatsRecord.collection.doc();
          await flowiseChatsRecordReference.set(createFlowiseChatsRecordData(
            userId: valueOrDefault<String>(
              FFAppState().nonLoggedInSessionId,
              'loggedIn',
            ),
            role: 'ai',
            text: valueOrDefault<String>(
              _model.companyByUrl?.welcomeMessage,
              'not set',
            ),
            createdTime: getCurrentTimestamp,
            sessionId: valueOrDefault<String>(
              FFAppState().nonLoggedInSessionId,
              'not set',
            ),
            threadId: _model.sessionQueryOnPageLoad?.defaultThreadId,
            companyDocId: valueOrDefault<String>(
              _model.companyByUrl?.reference.id,
              '0fXG0CVY9h92MABM',
            ),
            threadDetails: createThreadsStruct(
              threadId: _model.sessionQueryOnPageLoad?.defaultThreadId,
              threadName: 'Initial Welcome Chat',
              threadImage: _model.companyByUrl?.companylogo,
              clearUnsetFields: false,
              create: true,
            ),
          ));
          _model.initialchatCreated = FlowiseChatsRecord.getDocumentFromData(
              createFlowiseChatsRecordData(
                userId: valueOrDefault<String>(
                  FFAppState().nonLoggedInSessionId,
                  'loggedIn',
                ),
                role: 'ai',
                text: valueOrDefault<String>(
                  _model.companyByUrl?.welcomeMessage,
                  'not set',
                ),
                createdTime: getCurrentTimestamp,
                sessionId: valueOrDefault<String>(
                  FFAppState().nonLoggedInSessionId,
                  'not set',
                ),
                threadId: _model.sessionQueryOnPageLoad?.defaultThreadId,
                companyDocId: valueOrDefault<String>(
                  _model.companyByUrl?.reference.id,
                  '0fXG0CVY9h92MABM',
                ),
                threadDetails: createThreadsStruct(
                  threadId: _model.sessionQueryOnPageLoad?.defaultThreadId,
                  threadName: 'Initial Welcome Chat',
                  threadImage: _model.companyByUrl?.companylogo,
                  clearUnsetFields: false,
                  create: true,
                ),
              ),
              flowiseChatsRecordReference);
        }

        logFirebaseEvent('Library-fixed_navigate_to');

        context.pushNamed(
          'chatPage',
          queryParameters: {
            'companiesDoc': serializeParam(
              _model.companyByUrl,
              ParamType.Document,
            ),
            'sessionsDoc': serializeParam(
              _model.sessionQueryOnPageLoad,
              ParamType.Document,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'companiesDoc': _model.companyByUrl,
            'sessionsDoc': _model.sessionQueryOnPageLoad,
          },
        );
      } else {
        logFirebaseEvent('Library-fixed_update_app_state');
        setState(() {
          FFAppState().debugMessage = valueOrDefault<String>(
            'in selected thread chain ${valueOrDefault<String>(
              FFAppState().selectedThreadId,
              '-',
            )}',
            '-',
          );
        });
        if (_model.sessionQueryOnPageLoad?.userEmail == null ||
            _model.sessionQueryOnPageLoad?.userEmail == '') {
          logFirebaseEvent('Library-fixed_navigate_to');

          context.pushNamed(
            'chatPage',
            queryParameters: {
              'companiesDoc': serializeParam(
                _model.companyByUrl,
                ParamType.Document,
              ),
              'sessionsDoc': serializeParam(
                _model.sessionQueryOnPageLoad,
                ParamType.Document,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              'companiesDoc': _model.companyByUrl,
              'sessionsDoc': _model.sessionQueryOnPageLoad,
            },
          );
        }
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<Tilesv2Record>>(
      stream: FFAppState().tilesv2ByIndex(
        requestFn: () => queryTilesv2Record(
          queryBuilder: (tilesv2Record) => tilesv2Record.orderBy('tile_index'),
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<Tilesv2Record> libraryFixedTilesv2RecordList = snapshot.data!;
        return Title(
            title: 'Library-fixed',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                drawer: Drawer(
                  elevation: 16.0,
                  child: WebViewAware(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 50.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'LIBRARY_FIXED_PAGE_ADMIN_DASH_BTN_ON_TAP');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'dash',
                                queryParameters: {
                                  'companyDoc': serializeParam(
                                    _model.companyByUrl,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'companyDoc': _model.companyByUrl,
                                },
                              );
                            },
                            text: 'Admin Dash',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context).accent1,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).accent2,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                endDrawer: SizedBox(
                  width: 450.0,
                  child: Drawer(
                    elevation: 16.0,
                    child: WebViewAware(
                      child: wrapWithModel(
                        model: _model.drawerTileTreeModel,
                        updateCallback: () => setState(() {}),
                        child: DrawerTileTreeWidget(
                          isHeader: false,
                          itemId: valueOrDefault<String>(
                            libraryFixedTilesv2RecordList.first.reference.id,
                            'this',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                body: SafeArea(
                  top: true,
                  child: MouseRegion(
                    opaque: false,
                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                    onEnter: ((event) async {
                      setState(() => _model.mouseRegionHovered = true);
                      logFirebaseEvent(
                          'LIBRARY_FIXED_MouseRegion_tgmjc0s6_ON_TO');
                      logFirebaseEvent('MouseRegion_backend_call');

                      await _model.sessionQueryOnPageLoad!.reference
                          .update(createSessionsRecordData(
                        lastActive: getCurrentTimestamp,
                      ));
                    }),
                    onExit: ((event) async {
                      setState(() => _model.mouseRegionHovered = false);
                    }),
                    child: StreamBuilder<List<MemberLevelsRecord>>(
                      stream: queryMemberLevelsRecord(),
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
                        List<MemberLevelsRecord>
                            containerMemberLevelsRecordList = snapshot.data!;
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'LIBRARY_FIXED_Container_1fs11lgx_ON_TAP');
                            logFirebaseEvent('Container_update_app_state');
                            setState(() {
                              FFAppState().bottomSheetOpen = false;
                            });
                          },
                          child: Container(
                            decoration: const BoxDecoration(),
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: Container(
                                decoration: const BoxDecoration(),
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Stack(
                                  children: [
                                    Container(
                                      constraints: const BoxConstraints(
                                        maxHeight: double.infinity,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _model
                                            .companyByUrl?.colors.primaryColor,
                                      ),
                                      alignment:
                                          const AlignmentDirectional(-1.0, -1.0),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 2.0,
                                              sigmaY: 2.0,
                                            ),
                                            child: Opacity(
                                              opacity: 0.8,
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  constraints: const BoxConstraints(
                                                    minWidth: 900.0,
                                                    minHeight: 350.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        '',
                                                      ).image,
                                                    ),
                                                  ),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Stack(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                _model
                                                                    .companyByUrl
                                                                    ?.backgroundImage,
                                                                'https://res.cloudinary.com/dplpckpbm/image/upload/v1703535226/learningPathwaysBright_b3strj.webp',
                                                              ),
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              fit: BoxFit.cover,
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
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxHeight:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.27,
                                                      ),
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .headerContainerModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            HeaderContainerWidget(
                                                          companiesDoc: _model
                                                              .companyByUrl,
                                                          memberLevels:
                                                              containerMemberLevelsRecordList,
                                                          sessionsDoc: _model
                                                              .sessionQueryOnPageLoad,
                                                          action: () async {},
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        constraints:
                                                            BoxConstraints(
                                                          maxHeight:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.57,
                                                        ),
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              wrapWithModel(
                                                                model: _model
                                                                    .middleBodyAllModel,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                updateOnChange:
                                                                    true,
                                                                child:
                                                                    const MiddleBodyAllWidget(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Opacity(
                                                      opacity: 0.8,
                                                      child: StreamBuilder<
                                                          List<MyTeamRecord>>(
                                                        stream:
                                                            queryMyTeamRecord(
                                                          queryBuilder:
                                                              (myTeamRecord) =>
                                                                  myTeamRecord
                                                                      .where(
                                                                        'company',
                                                                        isEqualTo:
                                                                            valueOrDefault<String>(
                                                                          FFAppState()
                                                                              .selectedCompanyId,
                                                                          '0',
                                                                        ),
                                                                      )
                                                                      .orderBy(
                                                                          'positionId'),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<MyTeamRecord>
                                                              containerMyTeamRecordList =
                                                              snapshot.data!;
                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            constraints:
                                                                BoxConstraints(
                                                              maxHeight: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.14,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .platinum,
                                                            ),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
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
                                                                          'LIBRARY_FIXED_Column_gf2cll4s_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Column_update_app_state');
                                                                      setState(
                                                                          () {
                                                                        FFAppState().showLearnCard =
                                                                            false;
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'Column_update_app_state');
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().leftPane =
                                                                            'aiMenu';
                                                                        FFAppState().leftColumnShow =
                                                                            true;
                                                                        FFAppState().middlePane =
                                                                            'bodyContent';
                                                                        FFAppState().middleColumnShow =
                                                                            valueOrDefault<bool>(
                                                                          () {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return false;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return true;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
                                                                              return true;
                                                                            } else {
                                                                              return true;
                                                                            }
                                                                          }(),
                                                                          true,
                                                                        );
                                                                      });
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        FlutterFlowIconButton(
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderRadius:
                                                                              20.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              40.0,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.arrow_back_ios,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('LIBRARY_FIXED_arrow_back_ios_ICN_ON_TAP');
                                                                            logFirebaseEvent('IconButton_update_app_state');
                                                                            setState(() {
                                                                              FFAppState().showLearnCard = false;
                                                                            });
                                                                            logFirebaseEvent('IconButton_update_app_state');
                                                                            FFAppState().update(() {
                                                                              FFAppState().leftPane = 'aiMenu';
                                                                              FFAppState().leftColumnShow = true;
                                                                              FFAppState().middlePane = 'bodyContent';
                                                                              FFAppState().middleColumnShow = valueOrDefault<bool>(
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
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final myTeam =
                                                                              containerMyTeamRecordList.toList();
                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                List.generate(myTeam.length, (myTeamIndex) {
                                                                              final myTeamItem = myTeam[myTeamIndex];
                                                                              return InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('LIBRARY_FIXED_Column_hqm03hlf_ON_TAP');
                                                                                  logFirebaseEvent('Column_firestore_query');
                                                                                  _model.checkingMentorChat = await querySessionsRecordOnce(
                                                                                    queryBuilder: (sessionsRecord) => sessionsRecord.where(
                                                                                      'sessionId',
                                                                                      isEqualTo: valueOrDefault<String>(
                                                                                        FFAppState().nonLoggedInSessionId,
                                                                                        'nonloggedinnotset',
                                                                                      ),
                                                                                    ),
                                                                                    singleRecord: true,
                                                                                  ).then((s) => s.firstOrNull);
                                                                                  if ((_model.checkingMentorChat?.currentNavJourney == 'newSession') && (myTeamItem.positionId != 1)) {
                                                                                    logFirebaseEvent('Column_alert_dialog');
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return WebViewAware(
                                                                                          child: AlertDialog(
                                                                                            title: const Text('You must complete the welcome chat first.'),
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
                                                                                    logFirebaseEvent('Column_update_app_state');
                                                                                    setState(() {
                                                                                      FFAppState().selectedThreadId = myTeamItem.positionId == 1 ? _model.sessionQueryOnPageLoad!.defaultThreadId : '${myTeamItem.reference.id}+${_model.checkingMentorChat?.reference.id}';
                                                                                    });
                                                                                    logFirebaseEvent('Column_update_app_state');
                                                                                    setState(() {
                                                                                      FFAppState().selectedTeam = myTeamItem.reference.id;
                                                                                    });
                                                                                    logFirebaseEvent('Column_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'chatPage',
                                                                                      queryParameters: {
                                                                                        'companiesDoc': serializeParam(
                                                                                          _model.companyByUrl,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                        'sessionsDoc': serializeParam(
                                                                                          _model.checkingMentorChat,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'companiesDoc': _model.companyByUrl,
                                                                                        'sessionsDoc': _model.checkingMentorChat,
                                                                                      },
                                                                                    );
                                                                                  } else {
                                                                                    logFirebaseEvent('Column_update_app_state');
                                                                                    setState(() {
                                                                                      FFAppState().selectedThreadId = valueOrDefault<String>(
                                                                                        myTeamItem.positionId == 1 ? _model.sessionQueryOnPageLoad?.defaultThreadId : '${myTeamItem.reference.id}+${_model.checkingMentorChat?.reference.id}',
                                                                                        'o',
                                                                                      );
                                                                                    });
                                                                                    logFirebaseEvent('Column_update_app_state');
                                                                                    setState(() {
                                                                                      FFAppState().selectedTeam = myTeamItem.reference.id;
                                                                                    });
                                                                                    logFirebaseEvent('Column_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'chatPage',
                                                                                      queryParameters: {
                                                                                        'companiesDoc': serializeParam(
                                                                                          _model.companyByUrl,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                        'sessionsDoc': serializeParam(
                                                                                          _model.checkingMentorChat,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'companiesDoc': _model.companyByUrl,
                                                                                        'sessionsDoc': _model.checkingMentorChat,
                                                                                      },
                                                                                    );
                                                                                  }

                                                                                  setState(() {});
                                                                                },
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 100.0,
                                                                                        height: 100.0,
                                                                                        decoration: const BoxDecoration(),
                                                                                        child: Stack(
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 90.0,
                                                                                              height: 90.0,
                                                                                              clipBehavior: Clip.antiAlias,
                                                                                              decoration: const BoxDecoration(
                                                                                                shape: BoxShape.circle,
                                                                                              ),
                                                                                              child: Image.network(
                                                                                                valueOrDefault<String>(
                                                                                                  myTeamItem.image,
                                                                                                  'https://res.cloudinary.com/dplpckpbm/image/upload/v1708824869/dg0865_Chief_AI_Officer_Taylor_Jordan_Leads_AI_strategy_and_imp_3be63b10-fc84-4fb8-815c-db58d2530086_dlybur.png',
                                                                                                ),
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 40.0,
                                                                                              height: 40.0,
                                                                                              clipBehavior: Clip.antiAlias,
                                                                                              decoration: const BoxDecoration(
                                                                                                shape: BoxShape.circle,
                                                                                              ),
                                                                                              child: Image.network(
                                                                                                valueOrDefault<String>(
                                                                                                  myTeamItem.image,
                                                                                                  'https://res.cloudinary.com/dplpckpbm/image/upload/v1708824869/dg0865_Chief_AI_Officer_Taylor_Jordan_Leads_AI_strategy_and_imp_3be63b10-fc84-4fb8-815c-db58d2530086_dlybur.png',
                                                                                                ),
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 26.0,
                                                                                              height: 26.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(90.0),
                                                                                              ),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    '1',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).customColor3,
                                                                                                          fontSize: 18.0,
                                                                                                          fontWeight: FontWeight.w800,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                              );
                                                                            }),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                    tabletLandscape:
                                                                        false,
                                                                    desktop:
                                                                        false,
                                                                  ))
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          1.0,
                                                                          20.0,
                                                                          10.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'LIBRARY_FIXED_PAGE_ON_LOAD_BTN_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          setState(
                                                                              () {
                                                                            FFAppState().selectedThreadId =
                                                                                random_data.randomString(
                                                                              10,
                                                                              10,
                                                                              true,
                                                                              true,
                                                                              true,
                                                                            );
                                                                            FFAppState().chatType =
                                                                                'onboarding';
                                                                          });
                                                                        },
                                                                        text:
                                                                            'OnLoad',
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .location_history,
                                                                          size:
                                                                              15.0,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              50.0,
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              4.0,
                                                                              24.0,
                                                                              4.0),
                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).selectedButton,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 18.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                              ),
                                                                          elevation:
                                                                              1.0,
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                    tabletLandscape:
                                                                        false,
                                                                    desktop:
                                                                        false,
                                                                  ))
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          1.0,
                                                                          20.0,
                                                                          10.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'LIBRARY_FIXED_PAGE_WELCOME_BTN_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Button_bottom_sheet');
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return WebViewAware(
                                                                                child: GestureDetector(
                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: AICOMMUNICATIONWelcomeWidget(
                                                                                      askingQuestion: false,
                                                                                      companyDoc: widget.companiesDoc!,
                                                                                      sessionsDoc: _model.sessionQueryOnPageLoad!,
                                                                                      isLearnCard: true,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));

                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          setState(
                                                                              () {
                                                                            FFAppState().selectedThreadId =
                                                                                random_data.randomString(
                                                                              10,
                                                                              10,
                                                                              true,
                                                                              true,
                                                                              true,
                                                                            );
                                                                            FFAppState().chatType =
                                                                                'onboarding';
                                                                          });
                                                                        },
                                                                        text:
                                                                            'welcome',
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .location_history,
                                                                          size:
                                                                              15.0,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              50.0,
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              4.0,
                                                                              24.0,
                                                                              4.0),
                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).selectedButton,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 18.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                              ),
                                                                          elevation:
                                                                              1.0,
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                    tabletLandscape:
                                                                        false,
                                                                    desktop:
                                                                        false,
                                                                  ))
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (valueOrDefault<
                                                                            bool>(
                                                                          currentUserEmail ==
                                                                              'dg@goappy.io',
                                                                          false,
                                                                        ))
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                1.0,
                                                                                20.0,
                                                                                10.0),
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('LIBRARY_FIXED_SIMULATED_COMPANY_BTN_ON_T');
                                                                                // Create Companies Doc
                                                                                logFirebaseEvent('Button_CreateCompaniesDoc');

                                                                                var companiesRecordReference = CompaniesRecord.collection.doc();
                                                                                await companiesRecordReference.set(createCompaniesRecordData(
                                                                                  companylogo: '',
                                                                                  companyname: '',
                                                                                  isowner: false,
                                                                                  livelicence: false,
                                                                                  aILicence: false,
                                                                                  navtype: '',
                                                                                  aiimage: '',
                                                                                  featureimage: '',
                                                                                  fullfeature: '',
                                                                                  welcometitle: '',
                                                                                  welcomedescription: '',
                                                                                  companylogoSquare: '',
                                                                                  companylogosquaredark: '',
                                                                                  haslivevideo: false,
                                                                                  hasai: false,
                                                                                  hassocialfeed: false,
                                                                                  aiSystemPrompt: '',
                                                                                  initialLearnCards: 10,
                                                                                  aiLearnCardsPrompt: '',
                                                                                  companyDetails: '',
                                                                                  backgroundImage: _model.textController.text != '' ? _model.textController.text : null,
                                                                                  companyAiData: createCompanyDataForAiStruct(
                                                                                    companyName: 'Random Nsme ${random_data.randomString(
                                                                                      5,
                                                                                      5,
                                                                                      true,
                                                                                      false,
                                                                                      false,
                                                                                    )}',
                                                                                    companySummary: 'This company is a life coach',
                                                                                    companyIndustry: 'coaching',
                                                                                    ownerName: 'Darren',
                                                                                    clearUnsetFields: false,
                                                                                    create: true,
                                                                                  ),
                                                                                  whatTheyDo: 'life coaching',
                                                                                  userGatherDataPrompt: '',
                                                                                  companyCode: '',
                                                                                  welcomeIntroPrompt: '',
                                                                                  welcomeMessage: '',
                                                                                  primaryTile: '',
                                                                                  getTilesPrompt: '',
                                                                                  getTileContentPromptPrt1: '',
                                                                                  getTileContentPromptPr2: '',
                                                                                  userGatherDataQuestionPrompt: '',
                                                                                  getTilesPromptUserMessage: '',
                                                                                  startLearnCardPrompt: '',
                                                                                  colors: createColorsStruct(
                                                                                    primaryColor: FlutterFlowTheme.of(context).alternate,
                                                                                    secondaryColor: FlutterFlowTheme.of(context).customColor7,
                                                                                    teritoryColor: FlutterFlowTheme.of(context).info,
                                                                                    primaryTextColor: FlutterFlowTheme.of(context).warning,
                                                                                    secondaryTextColor: FlutterFlowTheme.of(context).accent1,
                                                                                    clearUnsetFields: false,
                                                                                    create: true,
                                                                                  ),
                                                                                  continueLearnCardPrompt: '',
                                                                                  supabaseApiKey: '',
                                                                                  supabaseProjUrl: '',
                                                                                  tableName: '',
                                                                                  queryName: '',
                                                                                  isLearnCards: false,
                                                                                  flowiseUrl: 'https://nafya-flowise.alikibao.online/api/v1/prediction/bfca5688-5bd8-4c88-9f6f-0254aa400933 ',
                                                                                  youAreMyCoachPrompt: '',
                                                                                  youAreMyCoachMessage: '',
                                                                                  welcomeLetterPrompt: '',
                                                                                  startingCategory: '',
                                                                                ));
                                                                                _model.createdCompany = CompaniesRecord.getDocumentFromData(
                                                                                    createCompaniesRecordData(
                                                                                      companylogo: '',
                                                                                      companyname: '',
                                                                                      isowner: false,
                                                                                      livelicence: false,
                                                                                      aILicence: false,
                                                                                      navtype: '',
                                                                                      aiimage: '',
                                                                                      featureimage: '',
                                                                                      fullfeature: '',
                                                                                      welcometitle: '',
                                                                                      welcomedescription: '',
                                                                                      companylogoSquare: '',
                                                                                      companylogosquaredark: '',
                                                                                      haslivevideo: false,
                                                                                      hasai: false,
                                                                                      hassocialfeed: false,
                                                                                      aiSystemPrompt: '',
                                                                                      initialLearnCards: 10,
                                                                                      aiLearnCardsPrompt: '',
                                                                                      companyDetails: '',
                                                                                      backgroundImage: _model.textController.text != '' ? _model.textController.text : null,
                                                                                      companyAiData: createCompanyDataForAiStruct(
                                                                                        companyName: 'Random Nsme ${random_data.randomString(
                                                                                          5,
                                                                                          5,
                                                                                          true,
                                                                                          false,
                                                                                          false,
                                                                                        )}',
                                                                                        companySummary: 'This company is a life coach',
                                                                                        companyIndustry: 'coaching',
                                                                                        ownerName: 'Darren',
                                                                                        clearUnsetFields: false,
                                                                                        create: true,
                                                                                      ),
                                                                                      whatTheyDo: 'life coaching',
                                                                                      userGatherDataPrompt: '',
                                                                                      companyCode: '',
                                                                                      welcomeIntroPrompt: '',
                                                                                      welcomeMessage: '',
                                                                                      primaryTile: '',
                                                                                      getTilesPrompt: '',
                                                                                      getTileContentPromptPrt1: '',
                                                                                      getTileContentPromptPr2: '',
                                                                                      userGatherDataQuestionPrompt: '',
                                                                                      getTilesPromptUserMessage: '',
                                                                                      startLearnCardPrompt: '',
                                                                                      colors: createColorsStruct(
                                                                                        primaryColor: FlutterFlowTheme.of(context).alternate,
                                                                                        secondaryColor: FlutterFlowTheme.of(context).customColor7,
                                                                                        teritoryColor: FlutterFlowTheme.of(context).info,
                                                                                        primaryTextColor: FlutterFlowTheme.of(context).warning,
                                                                                        secondaryTextColor: FlutterFlowTheme.of(context).accent1,
                                                                                        clearUnsetFields: false,
                                                                                        create: true,
                                                                                      ),
                                                                                      continueLearnCardPrompt: '',
                                                                                      supabaseApiKey: '',
                                                                                      supabaseProjUrl: '',
                                                                                      tableName: '',
                                                                                      queryName: '',
                                                                                      isLearnCards: false,
                                                                                      flowiseUrl: 'https://nafya-flowise.alikibao.online/api/v1/prediction/bfca5688-5bd8-4c88-9f6f-0254aa400933 ',
                                                                                      youAreMyCoachPrompt: '',
                                                                                      youAreMyCoachMessage: '',
                                                                                      welcomeLetterPrompt: '',
                                                                                      startingCategory: '',
                                                                                    ),
                                                                                    companiesRecordReference);
                                                                                // Update Companies Doc
                                                                                logFirebaseEvent('Button_UpdateCompaniesDoc');

                                                                                await _model.createdCompany!.reference.update({
                                                                                  ...createCompaniesRecordData(
                                                                                    companyDocId: _model.createdCompany?.reference.id,
                                                                                    updatedTime: getCurrentTimestamp,
                                                                                  ),
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'landingUrls': FieldValue.arrayUnion([
                                                                                        'https://newplatform.flutterflow.app/library?companiesDoc=${_model.createdCompany?.reference.id}'
                                                                                      ]),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                                // Create First Top Tile (vault)
                                                                                logFirebaseEvent('Button_CreateFirstTopTilevault');

                                                                                var tilesv2RecordReference1 = Tilesv2Record.collection.doc();
                                                                                await tilesv2RecordReference1.set(createTilesv2RecordData(
                                                                                  createdTime: getCurrentTimestamp,
                                                                                  updatedTime: getCurrentTimestamp,
                                                                                  type: '',
                                                                                  parentId: 'Nav',
                                                                                  tileName: 'Vault',
                                                                                  title: 'Vault',
                                                                                  tileTier: 0,
                                                                                  tileIndex: 0,
                                                                                  companyDocId: _model.createdCompany?.reference.id,
                                                                                ));
                                                                                _model.createdTopTilesVault = Tilesv2Record.getDocumentFromData(
                                                                                    createTilesv2RecordData(
                                                                                      createdTime: getCurrentTimestamp,
                                                                                      updatedTime: getCurrentTimestamp,
                                                                                      type: '',
                                                                                      parentId: 'Nav',
                                                                                      tileName: 'Vault',
                                                                                      title: 'Vault',
                                                                                      tileTier: 0,
                                                                                      tileIndex: 0,
                                                                                      companyDocId: _model.createdCompany?.reference.id,
                                                                                    ),
                                                                                    tilesv2RecordReference1);
                                                                                // Update Vault with ID
                                                                                logFirebaseEvent('Button_UpdateVaultwithID');

                                                                                await _model.createdTopTilesVault!.reference.update(createTilesv2RecordData(
                                                                                  tileId: _model.createdTopTilesVault?.reference.id,
                                                                                ));
                                                                                // Create First Top Tile (Events)
                                                                                logFirebaseEvent('Button_CreateFirstTopTileEvents');

                                                                                var tilesv2RecordReference2 = Tilesv2Record.collection.doc();
                                                                                await tilesv2RecordReference2.set(createTilesv2RecordData(
                                                                                  createdTime: getCurrentTimestamp,
                                                                                  updatedTime: getCurrentTimestamp,
                                                                                  type: '',
                                                                                  parentId: 'Nav',
                                                                                  tileName: 'Events',
                                                                                  title: 'Events',
                                                                                  tileTier: 0,
                                                                                  tileIndex: 0,
                                                                                  companyDocId: _model.createdCompany?.reference.id,
                                                                                ));
                                                                                _model.createdTopTilesEvents = Tilesv2Record.getDocumentFromData(
                                                                                    createTilesv2RecordData(
                                                                                      createdTime: getCurrentTimestamp,
                                                                                      updatedTime: getCurrentTimestamp,
                                                                                      type: '',
                                                                                      parentId: 'Nav',
                                                                                      tileName: 'Events',
                                                                                      title: 'Events',
                                                                                      tileTier: 0,
                                                                                      tileIndex: 0,
                                                                                      companyDocId: _model.createdCompany?.reference.id,
                                                                                    ),
                                                                                    tilesv2RecordReference2);
                                                                                // Create First Top Tile (Learning Journeys)
                                                                                logFirebaseEvent('Button_CreateFirstTopTileLearningJourney');

                                                                                var tilesv2RecordReference3 = Tilesv2Record.collection.doc();
                                                                                await tilesv2RecordReference3.set(createTilesv2RecordData(
                                                                                  createdTime: getCurrentTimestamp,
                                                                                  updatedTime: getCurrentTimestamp,
                                                                                  type: '',
                                                                                  parentId: 'Nav',
                                                                                  tileName: 'Learning Journeys',
                                                                                  title: 'Learning Journeys',
                                                                                  tileTier: 0,
                                                                                  tileIndex: 0,
                                                                                  companyDocId: _model.createdCompany?.reference.id,
                                                                                ));
                                                                                _model.createdTopTilesLearning = Tilesv2Record.getDocumentFromData(
                                                                                    createTilesv2RecordData(
                                                                                      createdTime: getCurrentTimestamp,
                                                                                      updatedTime: getCurrentTimestamp,
                                                                                      type: '',
                                                                                      parentId: 'Nav',
                                                                                      tileName: 'Learning Journeys',
                                                                                      title: 'Learning Journeys',
                                                                                      tileTier: 0,
                                                                                      tileIndex: 0,
                                                                                      companyDocId: _model.createdCompany?.reference.id,
                                                                                    ),
                                                                                    tilesv2RecordReference3);
                                                                                // Update Learning Journeys with ID
                                                                                logFirebaseEvent('Button_UpdateLearningJourneyswithID');

                                                                                await _model.createdTopTilesLearning!.reference.update(createTilesv2RecordData(
                                                                                  tileId: _model.createdTopTilesLearning?.reference.id,
                                                                                ));
                                                                                logFirebaseEvent('Button_navigate_to');

                                                                                context.pushNamed(
                                                                                  'Library-fixed',
                                                                                  queryParameters: {
                                                                                    'companiesDoc': serializeParam(
                                                                                      _model.createdCompany,
                                                                                      ParamType.Document,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                  extra: <String, dynamic>{
                                                                                    'companiesDoc': _model.createdCompany,
                                                                                  },
                                                                                );

                                                                                logFirebaseEvent('Button_alert_dialog');
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return WebViewAware(
                                                                                      child: AlertDialog(
                                                                                        title: const Text('Getting Topics'),
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
                                                                                logFirebaseEvent('Button_backend_call');
                                                                                _model.apiResult939 = await CloudFunctionsGroup.getTopicsCall.call(
                                                                                  sessionId: _model.sessionQueryOnPageLoad?.reference.id,
                                                                                  systemMessagePrompt: valueOrDefault<String>(
                                                                                    'As a business that${_model.createdCompany?.companyAiData.companySummary}in ${_model.createdCompany?.companyAiData.companyIndustry}lean on some famous frameworks if it helps.Each topic should  have a unique name and have 5 days of activities, these activities are delivered via an interactive ai chat in an app, so they can either be designed to get immediate responses or for the individual to take an action and then share their actions, either way the ai must get a response back of the activity that was completed.  The activity should be designed to last only 6-8 minutes, they are bite size.  The 5 days  must have a conclusion, whereby the person who has completed 1-5 activities feels satisfied and complete with a learning outcome that will move them forward. Please return JSON in the following format. Id increment by 1, start at 1 pillarCategory weeklyTopicName dailyActivity (list of 1-5 days of activities)  just the activity name a showAdminDate which is always on a Monday and each item will increase by one week and a showUsersDate which is on the friday following the monday.todays date is  ${dateTimeFormat('MMMMEEEEd', getCurrentTimestamp)} so the first date will be ${getCurrentTimestamp.toString()}nd will increase by a week per item  Always Use English UK Locale and Spelling',
                                                                                    'notset',
                                                                                  ),
                                                                                  learnCardId: 'notset',
                                                                                  flowiseUrl: valueOrDefault<String>(
                                                                                    _model.createdCompany?.flowiseUrl,
                                                                                    'https://nafya-flowise.alikibao.online/api/v1/prediction/bfca5688-5bd8-4c88-9f6f-0254aa400933 ',
                                                                                  ),
                                                                                  threadId: random_data.randomString(
                                                                                    8,
                                                                                    10,
                                                                                    true,
                                                                                    true,
                                                                                    true,
                                                                                  ),
                                                                                  companyDocId: valueOrDefault<String>(
                                                                                    _model.createdCompany?.reference.id,
                                                                                    'noCompanyDoc',
                                                                                  ),
                                                                                );
                                                                                if ((_model.apiResult939?.succeeded ?? true)) {
                                                                                  logFirebaseEvent('Button_alert_dialog');
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return WebViewAware(
                                                                                        child: AlertDialog(
                                                                                          title: const Text('GOT  TOPICS'),
                                                                                          content: Text((_model.apiResult939?.bodyText ?? '')),
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
                                                                                } else {
                                                                                  logFirebaseEvent('Button_alert_dialog');
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return WebViewAware(
                                                                                        child: AlertDialog(
                                                                                          title: const Text('get topics failed'),
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

                                                                                setState(() {});
                                                                              },
                                                                              text: 'Simulated Company',
                                                                              icon: const Icon(
                                                                                Icons.location_history,
                                                                                size: 15.0,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: 50.0,
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 4.0),
                                                                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).selectedButton,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 18.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                    ),
                                                                                elevation: 1.0,
                                                                                borderSide: const BorderSide(
                                                                                  color: Colors.transparent,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                          ),
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
                                                                            logFirebaseEvent('LIBRARY_FIXED_Container_6lhj49nb_ON_TAP');
                                                                            logFirebaseEvent('Container_update_app_state');
                                                                            setState(() {
                                                                              FFAppState().debugCount = FFAppState().debugCount + 1;
                                                                            });
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                300.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                              child: TextFormField(
                                                                                controller: _model.textController,
                                                                                focusNode: _model.textFieldFocusNode,
                                                                                autofocus: true,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  labelText: 'background URL',
                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                  enabledBorder: UnderlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  focusedBorder: UnderlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  errorBorder: UnderlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  focusedErrorBorder: UnderlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                validator: _model.textControllerValidator.asValidator(context),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                    tabletLandscape:
                                                                        false,
                                                                    desktop:
                                                                        false,
                                                                  ))
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          1.0,
                                                                          20.0,
                                                                          10.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'LIBRARY_FIXED_COACH_MENTOR_TEST_BTN_ON_T');
                                                                          // Checking to see if there has been any local behavior
                                                                          logFirebaseEvent(
                                                                              'Button_Checkingtoseeiftherehasbeenanyloc');
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return WebViewAware(
                                                                                child: AlertDialog(
                                                                                  title: const Text('ready to read '),
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
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          _model.readDocQuery = await SessionsRecord.getDocumentOnce(_model
                                                                              .sessionQueryOnPageLoad!
                                                                              .reference);
                                                                          logFirebaseEvent(
                                                                              'Button_alert_dialog');
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return WebViewAware(
                                                                                child: AlertDialog(
                                                                                  title: const Text('read on page load doc'),
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
                                                                          if (_model.readDocQuery?.coachMeThreadID != null &&
                                                                              _model.readDocQuery?.coachMeThreadID != '') {
                                                                            logFirebaseEvent('Button_alert_dialog');
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return WebViewAware(
                                                                                  child: AlertDialog(
                                                                                    title: const Text('The tread is '),
                                                                                    content: Text(_model.sessionQueryOnPageLoad!.coachMeThreadID),
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
                                                                            if (FFAppState().tempCoachMeThreadId ==
                                                                                _model.readDocQuery?.coachMeThreadID) {
                                                                              logFirebaseEvent('Button_alert_dialog');
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      title: const Text('they match'),
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
                                                                            } else {
                                                                              logFirebaseEvent('Button_alert_dialog');
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      title: const Text('they dont match'),
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
                                                                              logFirebaseEvent('Button_backend_call');

                                                                              await _model.readDocQuery!.reference.update(createSessionsRecordData(
                                                                                coachMeThreadID: FFAppState().tempCoachMeThreadId,
                                                                              ));
                                                                              logFirebaseEvent('Button_alert_dialog');
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      title: const Text('they dont match'),
                                                                                      content: Text(FFAppState().tempCoachMeThreadId == _model.readDocQuery?.coachMeThreadID ? 'they match now' : 'still no match'),
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
                                                                          } else {
                                                                            logFirebaseEvent('Button_alert_dialog');
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return WebViewAware(
                                                                                  child: AlertDialog(
                                                                                    title: const Text('The tread is empty'),
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
                                                                            logFirebaseEvent('Button_backend_call');

                                                                            await _model.sessionsCreated!.reference.update(createSessionsRecordData(
                                                                              coachMeThreadID: FFAppState().selectedThreadId,
                                                                            ));
                                                                          }

                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');

                                                                          await FlowiseChatsRecord
                                                                              .collection
                                                                              .doc()
                                                                              .set(createFlowiseChatsRecordData(
                                                                                userId: FFAppState().nonLoggedInSessionId,
                                                                                role: 'ai',
                                                                                text: 'I am your mentor, here to help with ... ',
                                                                                threadId: FFAppState().selectedThreadId,
                                                                              ));
                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          setState(
                                                                              () {
                                                                            FFAppState().selectedThreadId = _model.readDocQuery?.coachMeThreadID != null && _model.readDocQuery?.coachMeThreadID != ''
                                                                                ? _model.readDocQuery!.coachMeThreadID
                                                                                : random_data.randomString(
                                                                                    12,
                                                                                    12,
                                                                                    true,
                                                                                    true,
                                                                                    true,
                                                                                  );
                                                                          });
                                                                          logFirebaseEvent(
                                                                              'Button_bottom_sheet');
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return WebViewAware(
                                                                                child: GestureDetector(
                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: AICOMMUNICATIONOnPageMyMentorWidget(
                                                                                      companiesDoc: _model.companyByUrl!,
                                                                                      isLearnCard: false,
                                                                                      sessionsDoc: _model.sessionsCreated,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));

                                                                          setState(
                                                                              () {});
                                                                        },
                                                                        text:
                                                                            'Coach/Mentor Test',
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .location_history,
                                                                          size:
                                                                              15.0,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              50.0,
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              4.0,
                                                                              24.0,
                                                                              4.0),
                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).selectedButton,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 18.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                              ),
                                                                          elevation:
                                                                              1.0,
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'LIBRARY_FIXED_PAGE_BUTTON_BTN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'chatPage',
                                                                        queryParameters:
                                                                            {
                                                                          'companiesDoc':
                                                                              serializeParam(
                                                                            _model.companyByUrl,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'companiesDoc':
                                                                              _model.companyByUrl,
                                                                        },
                                                                      );
                                                                    },
                                                                    text:
                                                                        'Button',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          40.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                Colors.white,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
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
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.leftMenuModel,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: const LeftMenuWidget(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
