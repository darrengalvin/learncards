import '/backend/backend.dart';
import '/components/social_feed_bottoms_h_e_e_t_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/middle_pane/body_content/body_content_widget.dart';
import '/middle_pane/body_content_mainiles/body_content_mainiles_widget.dart';
import '/middle_pane/body_contentt_learn_cards/body_contentt_learn_cards_widget.dart';
import '/middle_pane/preparing/preparing_widget.dart';
import '/right_pane/social_feed_new_componant/social_feed_new_componant_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'middle_column_model.dart';
export 'middle_column_model.dart';

class MiddleColumnWidget extends StatefulWidget {
  const MiddleColumnWidget({
    super.key,
    required this.companyDoc,
    required this.sessionsDoc,
    bool? isMiddleShow,
    required this.tilev2doc,
  }) : this.isMiddleShow = isMiddleShow ?? false;

  final CompaniesRecord? companyDoc;
  final SessionsRecord? sessionsDoc;
  final bool isMiddleShow;
  final Tilesv2Record? tilev2doc;

  @override
  State<MiddleColumnWidget> createState() => _MiddleColumnWidgetState();
}

class _MiddleColumnWidgetState extends State<MiddleColumnWidget> {
  late MiddleColumnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiddleColumnModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MIDDLE_COLUMN_MiddleColumn_ON_INIT_STATE');
      logFirebaseEvent('MiddleColumn_update_app_state');
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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            StreamBuilder<List<Tilesv2Record>>(
              stream: queryTilesv2Record(
                queryBuilder: (tilesv2Record) => tilesv2Record
                    .where(
                      'companyDocId',
                      isEqualTo: widget.companyDoc?.reference.id,
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
                  constraints: BoxConstraints(
                    maxWidth: 850.0,
                  ),
                  decoration: BoxDecoration(),
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
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.chevron_left,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'MIDDLE_COLUMN_chevron_left_ICN_ON_TAP');
                                              logFirebaseEvent(
                                                  'IconButton_update_app_state');
                                              setState(() {
                                                FFAppState().leftColumnShow =
                                                    true;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            StreamBuilder<
                                                List<CategoriesRecord>>(
                                              stream: queryCategoriesRecord(
                                                queryBuilder:
                                                    (categoriesRecord) =>
                                                        categoriesRecord.where(
                                                  'showToMemberLevelsId',
                                                  arrayContains: FFAppState()
                                                      .selectedMemberLevel,
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<CategoriesRecord>
                                                    containerCatCategoriesRecordList =
                                                    snapshot.data!;
                                                return Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                );
                                              },
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
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        if (valueOrDefault<bool>(
          (FFAppState().middleColumnShow == true) ||
              valueOrDefault<bool>(
                widget.isMiddleShow,
                false,
              ),
          false,
        ))
          SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Builder(
                    builder: (context) {
                      if (FFAppState().middlePane == 'preparing') {
                        return wrapWithModel(
                          model: _model.preparingModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: PreparingWidget(
                            companyDoc: widget.companyDoc!,
                            sessionsDoc: widget.sessionsDoc!,
                          ),
                        );
                      } else if (FFAppState().middlePane == 'bodyContent') {
                        return wrapWithModel(
                          model: _model.bodyContentModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: BodyContentWidget(
                            companyDoc: widget.companyDoc!,
                            sessionId: widget.sessionsDoc!,
                            tilesv2Doc: widget.tilev2doc!,
                          ),
                        );
                      } else if (FFAppState().middlePane == 'social') {
                        return wrapWithModel(
                          model: _model.socialFeedNewComponantModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: SocialFeedNewComponantWidget(),
                        );
                      } else if (FFAppState().middlePane ==
                          'bodyContentMainTiles') {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.bodyContentMainTilesModel,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: BodyContentMainilesWidget(
                                companyDoc: widget.companyDoc!,
                                sessionId: widget.sessionsDoc!,
                              ),
                            ),
                          ],
                        );
                      } else if (FFAppState().middlePane == 'Social') {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.socialFeedBottomsHEETModel,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: SocialFeedBottomsHEETWidget(
                                askingQuestion: false,
                                companiesDoc: widget.companyDoc!,
                              ),
                            ),
                          ],
                        );
                      } else if (FFAppState().middlePane ==
                          'learnCardsContent') {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.bodyContenttLearnCardsModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: BodyContenttLearnCardsWidget(
                                  companyDoc: widget.companyDoc!,
                                  sessionId: widget.sessionsDoc!,
                                  rightColumnShow: false,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
