import '/backend/backend.dart';
import '/components/commenting_thread_widget.dart';
import '/components/respond_to_activity_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'body_contentt_learn_cards_model.dart';
export 'body_contentt_learn_cards_model.dart';

class BodyContenttLearnCardsWidget extends StatefulWidget {
  const BodyContenttLearnCardsWidget({
    super.key,
    required this.companyDoc,
    required this.sessionId,
    bool? rightColumnShow,
  }) : rightColumnShow = rightColumnShow ?? false;

  final CompaniesRecord? companyDoc;
  final SessionsRecord? sessionId;
  final bool rightColumnShow;

  @override
  State<BodyContenttLearnCardsWidget> createState() =>
      _BodyContenttLearnCardsWidgetState();
}

class _BodyContenttLearnCardsWidgetState
    extends State<BodyContenttLearnCardsWidget> {
  late BodyContenttLearnCardsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BodyContenttLearnCardsModel());

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

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<List<LearnCardsRecord>>(
                stream: queryLearnCardsRecord(
                  queryBuilder: (learnCardsRecord) => learnCardsRecord.where(
                    'tile_id',
                    isEqualTo: FFAppState().viewTileContentId,
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
                  List<LearnCardsRecord> containerLearnCardsRecordList =
                      snapshot.data!;
                  return Container(
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Opacity(
                                  opacity: 0.9,
                                  child: StreamBuilder<List<TileBlocksRecord>>(
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
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 6.0, 0.0, 6.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: const Color(0xB2FAFAFA),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: const Color(0xFFE0E3E7),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Opacity(
                                                      opacity: 0.9,
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0xFFF5F5F5),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
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
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            () {
                                                                          if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall) {
                                                                            return 400.0;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointMedium) {
                                                                            return 550.0;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointLarge) {
                                                                            return 700.0;
                                                                          } else {
                                                                            return 700.0;
                                                                          }
                                                                        }(),
                                                                      ),
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Html(
                                                                                data: containerLearnCardsRecordList.first.description,
                                                                                onLinkTap: (url, _, __, ___) => launchURL(url!),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Opacity(
                                                                            opacity:
                                                                                0.9,
                                                                            child:
                                                                                StreamBuilder<List<LearnCardsRecord>>(
                                                                              stream: queryLearnCardsRecord(
                                                                                queryBuilder: (learnCardsRecord) => learnCardsRecord.where(
                                                                                  'learnCardId',
                                                                                  isEqualTo: FFAppState().selectedLearnCardId,
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
                                                                                List<LearnCardsRecord> containerLearnCardsRecordList = snapshot.data!;
                                                                                // Return an empty Container when the item does not exist.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final containerLearnCardsRecord = containerLearnCardsRecordList.isNotEmpty ? containerLearnCardsRecordList.first : null;
                                                                                return Container(
                                                                                  decoration: const BoxDecoration(
                                                                                    color: Color(0xFFF5F5F5),
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                      bottomRight: Radius.circular(0.0),
                                                                                      topLeft: Radius.circular(17.0),
                                                                                      topRight: Radius.circular(0.0),
                                                                                    ),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: const AlignmentDirectional(0.0, -1.0),
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 0.0,
                                                                                                decoration: const BoxDecoration(),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          constraints: const BoxConstraints(
                                                                                                            maxWidth: 500.0,
                                                                                                          ),
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        constraints: const BoxConstraints(
                                                                                                                          maxWidth: 500.0,
                                                                                                                        ),
                                                                                                                        decoration: const BoxDecoration(),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                                                                                                                        child: FFButtonWidget(
                                                                                                                          onPressed: () async {
                                                                                                                            logFirebaseEvent('BODY_CONTENTT_LEARN_CARDS_ADD_TO_JOURNAL');
                                                                                                                            logFirebaseEvent('Button_bottom_sheet');
                                                                                                                            await showModalBottomSheet(
                                                                                                                              isScrollControlled: true,
                                                                                                                              backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                                              context: context,
                                                                                                                              builder: (context) {
                                                                                                                                return WebViewAware(
                                                                                                                                  child: Padding(
                                                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                    child: SizedBox(
                                                                                                                                      height: MediaQuery.sizeOf(context).height * 0.45,
                                                                                                                                      child: RespondToActivityWidget(
                                                                                                                                        learnCardId: valueOrDefault<String>(
                                                                                                                                          FFAppState().selectedLearnCardId,
                                                                                                                                          'b',
                                                                                                                                        ),
                                                                                                                                        sessionId: widget.sessionId?.reference.id,
                                                                                                                                        companyDocId: widget.companyDoc!.reference.id,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                                          },
                                                                                                                          text: 'Add to Journal',
                                                                                                                          icon: const FaIcon(
                                                                                                                            FontAwesomeIcons.pencilAlt,
                                                                                                                          ),
                                                                                                                          options: FFButtonOptions(
                                                                                                                            height: 50.0,
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 4.0),
                                                                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                            color: FlutterFlowTheme.of(context).selectedButton,
                                                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 14.0,
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
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                              Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: Container(
                                                                                                                          width: 300.0,
                                                                                                                          decoration: const BoxDecoration(),
                                                                                                                          child: Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Text(
                                                                                                                                'The below messages are for the app owner to see what the user will recieve throughout the day as customised prompting. - They will not be visible on a live environment. ',
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                              ),
                                                                                                                              Divider(
                                                                                                                                thickness: 2.0,
                                                                                                                                color: FlutterFlowTheme.of(context).accent4,
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
                                                                                                                      Container(
                                                                                                                        width: 300.0,
                                                                                                                        decoration: const BoxDecoration(),
                                                                                                                        child: Builder(
                                                                                                                          builder: (context) {
                                                                                                                            final mentoMessages = containerLearnCardsRecord?.mentorMessages.toList() ?? [];
                                                                                                                            return Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                              children: List.generate(mentoMessages.length, (mentoMessagesIndex) {
                                                                                                                                final mentoMessagesItem = mentoMessages[mentoMessagesIndex];
                                                                                                                                return Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
                                                                                                                                    Expanded(
                                                                                                                                      child: Padding(
                                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                                        child: Column(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                          children: [
                                                                                                                                            Text(
                                                                                                                                              valueOrDefault<String>(
                                                                                                                                                mentoMessagesItem,
                                                                                                                                                'mentorMessage',
                                                                                                                                              ),
                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                            ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                );
                                                                                                                              }),
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
                                                                                      Align(
                                                                                        alignment: const AlignmentDirectional(0.0, -1.0),
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                            children: [
                                                                                              StreamBuilder<List<LearnCardEntriesRecord>>(
                                                                                                stream: queryLearnCardEntriesRecord(
                                                                                                  queryBuilder: (learnCardEntriesRecord) => learnCardEntriesRecord
                                                                                                      .where(
                                                                                                        'associatedLearnCard',
                                                                                                        isEqualTo: containerLearnCardsRecord?.reference.id,
                                                                                                      )
                                                                                                      .where(
                                                                                                        'sessionId',
                                                                                                        isEqualTo: FFAppState().nonLoggedInSessionId,
                                                                                                      )
                                                                                                      .where(
                                                                                                        'companyDocId',
                                                                                                        isEqualTo: FFAppState().selectedCompanyId,
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
                                                                                                  List<LearnCardEntriesRecord> containerLearnCardEntriesRecordList = snapshot.data!;
                                                                                                  // Return an empty Container when the item does not exist.
                                                                                                  if (snapshot.data!.isEmpty) {
                                                                                                    return Container();
                                                                                                  }
                                                                                                  final containerLearnCardEntriesRecord = containerLearnCardEntriesRecordList.isNotEmpty ? containerLearnCardEntriesRecordList.first : null;
                                                                                                  return Container(
                                                                                                    decoration: const BoxDecoration(),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              constraints: const BoxConstraints(
                                                                                                                maxHeight: 1000.0,
                                                                                                              ),
                                                                                                              decoration: const BoxDecoration(),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    constraints: const BoxConstraints(
                                                                                                                      maxWidth: 550.0,
                                                                                                                    ),
                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                    child: wrapWithModel(
                                                                                                                      model: _model.commentingThreadModel,
                                                                                                                      updateCallback: () => setState(() {}),
                                                                                                                      child: const CommentingThreadWidget(),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
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
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
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
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
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
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
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
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
