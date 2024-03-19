import '/backend/backend.dart';
import '/components/blockv3_widget.dart';
import '/components/drawer_empty_list_tiles_widget.dart';
import '/components/learning_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'body_content_model.dart';
export 'body_content_model.dart';

class BodyContentWidget extends StatefulWidget {
  const BodyContentWidget({
    super.key,
    required this.companyDoc,
    required this.sessionId,
  });

  final CompaniesRecord? companyDoc;
  final SessionsRecord? sessionId;

  @override
  State<BodyContentWidget> createState() => _BodyContentWidgetState();
}

class _BodyContentWidgetState extends State<BodyContentWidget> {
  late BodyContentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BodyContentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BODY_CONTENT_BodyContent_ON_INIT_STATE');
      logFirebaseEvent('BodyContent_update_app_state');
      setState(() {
        FFAppState().showLearnCard = true;
      });
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

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
            child: StreamBuilder<List<LearnCardsRecord>>(
              stream: queryLearnCardsRecord(
                queryBuilder: (learnCardsRecord) => learnCardsRecord.where(
                  'tile_id',
                  isEqualTo: FFAppState().viewTileContentId,
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
                List<LearnCardsRecord> containerLearnCardsRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final containerLearnCardsRecord =
                    containerLearnCardsRecordList.isNotEmpty
                        ? containerLearnCardsRecordList.first
                        : null;
                return Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.easeInOut,
                                    constraints: const BoxConstraints(
                                      maxWidth: 600.0,
                                    ),
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 6.0),
                                      child: wrapWithModel(
                                        model: _model.learningCardModel1,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: LearningCardWidget(
                                          learnCard: containerLearnCardsRecord!,
                                          companyDoc: widget.companyDoc!,
                                          sessionsDoc: widget.sessionId!,
                                          showLearnCard:
                                              FFAppState().showLearnCard,
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
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Opacity(
                                        opacity: 0.9,
                                        child: StreamBuilder<
                                            List<TileBlocksRecord>>(
                                          stream: queryTileBlocksRecord(
                                            queryBuilder: (tileBlocksRecord) =>
                                                tileBlocksRecord.where(
                                              'tile_id',
                                              isEqualTo: FFAppState()
                                                  .viewTileContentId,
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
                                            List<TileBlocksRecord>
                                                containerTileBlocksRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final containerTileBlocksRecord =
                                                containerTileBlocksRecordList
                                                        .isNotEmpty
                                                    ? containerTileBlocksRecordList
                                                        .first
                                                    : null;
                                            return Container(
                                              constraints: BoxConstraints(
                                                maxWidth: () {
                                                  if (MediaQuery.sizeOf(context)
                                                          .width <
                                                      kBreakpointSmall) {
                                                    return 500.0;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointMedium) {
                                                    return 700.0;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointLarge) {
                                                    return 800.0;
                                                  } else {
                                                    return 900.0;
                                                  }
                                                }(),
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 6.0,
                                                                0.0, 6.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0xB2FAFAFA),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color:
                                                              const Color(0xFFE0E3E7),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Opacity(
                                                            opacity: 0.9,
                                                            child: Container(
                                                              decoration:
                                                                  const BoxDecoration(
                                                                color: Color(
                                                                    0xFFF5F5F5),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Container(
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                () {
                                                                              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                return 550.0;
                                                                              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                return 600.0;
                                                                              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                return 900.0;
                                                                              } else {
                                                                                return 1550.0;
                                                                              }
                                                                            }(),
                                                                          ),
                                                                          decoration:
                                                                              const BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Html(
                                                                                data: valueOrDefault<String>(
                                                                                  containerTileBlocksRecord?.htmlContent,
                                                                                  'notset',
                                                                                ),
                                                                                onLinkTap: (url, _, __, ___) => launchURL(url!),
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
                                                          ),
                                                          Container(
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .stretch,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          20.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                width: double.infinity,
                                                                                constraints: const BoxConstraints(
                                                                                  maxWidth: 400.0,
                                                                                ),
                                                                                decoration: const BoxDecoration(),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
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
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<List<TileBlocksRecord>>(
                                        stream: queryTileBlocksRecord(
                                          queryBuilder: (tileBlocksRecord) =>
                                              tileBlocksRecord.where(
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
                                          List<TileBlocksRecord>
                                              containerTileBlocksRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final containerTileBlocksRecord =
                                              containerTileBlocksRecordList
                                                      .isNotEmpty
                                                  ? containerTileBlocksRecordList
                                                      .first
                                                  : null;
                                          return Container(
                                            constraints: BoxConstraints(
                                              maxWidth: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return 500.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return 700.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 800.0;
                                                } else {
                                                  return 900.0;
                                                }
                                              }(),
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 15.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      StreamBuilder<List<TileBlocksRecord>>(
                                        stream: FFAppState().tileBlocksIndex(
                                          requestFn: () =>
                                              queryTileBlocksRecord(
                                            queryBuilder: (tileBlocksRecord) =>
                                                tileBlocksRecord
                                                    .orderBy('block_index'),
                                          ),
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
                                          List<TileBlocksRecord>
                                              containerTileBlocksRecordList =
                                              snapshot.data!;
                                          return Container(
                                            constraints: const BoxConstraints(
                                              maxWidth: 550.0,
                                              maxHeight: 1400.0,
                                            ),
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Builder(
                                                    builder: (context) {
                                                      final tileContent =
                                                          containerTileBlocksRecordList
                                                              .where((e) =>
                                                                  valueOrDefault<
                                                                      bool>(
                                                                    e.tileId ==
                                                                        FFAppState()
                                                                            .viewTileContentId,
                                                                    false,
                                                                  ))
                                                              .toList();
                                                      if (tileContent.isEmpty) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 640.0,
                                                            child:
                                                                DrawerEmptyListTilesWidget(
                                                              action:
                                                                  () async {},
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            tileContent.length,
                                                        itemBuilder: (context,
                                                            tileContentIndex) {
                                                          final tileContentItem =
                                                              tileContent[
                                                                  tileContentIndex];
                                                          return Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .stretch,
                                                              children: [
                                                                Container(
                                                                  key: ValueKey(
                                                                      tileContentItem
                                                                          .reference
                                                                          .id),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .blockv3Models
                                                                        .getModel(
                                                                      tileContentItem
                                                                          .reference
                                                                          .id,
                                                                      tileContentIndex,
                                                                    ),
                                                                    updateCallback: () =>
                                                                        setState(
                                                                            () {}),
                                                                    updateOnChange:
                                                                        true,
                                                                    child:
                                                                        Blockv3Widget(
                                                                      key: Key(
                                                                        'Keyosv_${tileContentItem.reference.id}',
                                                                      ),
                                                                      tileBlock:
                                                                          tileContentItem,
                                                                      topicItem:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        containerTileBlocksRecordList
                                                                            .first
                                                                            .title,
                                                                        'topic not set',
                                                                      ),
                                                                      readingItem:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        tileContentItem
                                                                            .title,
                                                                        'reading list item is not set',
                                                                      ),
                                                                      sessionId:
                                                                          widget
                                                                              .sessionId!,
                                                                      companyDoc:
                                                                          widget
                                                                              .companyDoc!,
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
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeInOut,
                            constraints: const BoxConstraints(
                              maxWidth: 600.0,
                            ),
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 6.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'BODY_CONTENT_Container_zt7ril1p_ON_TAP');
                                  logFirebaseEvent('learningCard_backend_call');

                                  await containerLearnCardsRecord.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'usersId': FieldValue.arrayUnion([
                                          valueOrDefault<String>(
                                            widget.sessionId?.userEmail,
                                            'userIdNotSet',
                                          )
                                        ]),
                                        'sessionsActiveId':
                                            FieldValue.arrayUnion([
                                          valueOrDefault<String>(
                                            widget.sessionId?.reference.id,
                                            'userIdNotSet',
                                          )
                                        ]),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('learningCard_backend_call');

                                  await widget.sessionId!.reference
                                      .update(createSessionsRecordData(
                                    activeLearnCard:
                                        containerLearnCardsRecord.title,
                                  ));
                                },
                                child: wrapWithModel(
                                  model: _model.learningCardModel2,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: LearningCardWidget(
                                    learnCard: containerLearnCardsRecord,
                                    companyDoc: widget.companyDoc!,
                                    sessionsDoc: widget.sessionId!,
                                    showLearnCard: FFAppState().showLearnCard,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
