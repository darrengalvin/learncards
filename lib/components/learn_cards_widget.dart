import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/right_pane/chata_c_t_i_v_i_t_y/chata_c_t_i_v_i_t_y_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'learn_cards_model.dart';
export 'learn_cards_model.dart';

class LearnCardsWidget extends StatefulWidget {
  const LearnCardsWidget({
    super.key,
    this.color,
    required this.sessionsDoc,
    required this.companyDoc,
    bool? showRight,
  }) : this.showRight = showRight ?? false;

  final Color? color;
  final SessionsRecord? sessionsDoc;
  final CompaniesRecord? companyDoc;
  final bool showRight;

  @override
  State<LearnCardsWidget> createState() => _LearnCardsWidgetState();
}

class _LearnCardsWidgetState extends State<LearnCardsWidget> {
  late LearnCardsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LearnCardsModel());

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

    return Visibility(
      visible: valueOrDefault<bool>(
        FFAppState().rightColumnShow,
        false,
      ),
      child: Container(
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 550.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 650.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 800.0;
                          } else {
                            return 550.0;
                          }
                        }(),
                      ),
                      decoration: BoxDecoration(),
                      child: StreamBuilder<List<LearnCardsRecord>>(
                        stream: queryLearnCardsRecord(
                          queryBuilder: (learnCardsRecord) =>
                              learnCardsRecord.where(
                            'companyDocId',
                            isEqualTo: widget.companyDoc?.reference.id,
                          ),
                          limit: 10,
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
                          List<LearnCardsRecord> listViewLearnCardsRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewLearnCardsRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewLearnCardsRecord =
                                  listViewLearnCardsRecordList[listViewIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (valueOrDefault<bool>(
                                    FFAppState().isAParent
                                        ? true
                                        : (listViewLearnCardsRecord
                                                .parentTileId ==
                                            FFAppState().viewTileContentId),
                                    false,
                                  ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 15.0),
                                      child: ChataCTIVITYWidget(
                                        key: Key(
                                            'Keyedv_${listViewIndex}_of_${listViewLearnCardsRecordList.length}'),
                                        learnCardTitle:
                                            listViewLearnCardsRecord.title,
                                        learnCardType:
                                            listViewLearnCardsRecord.type,
                                        learnCardSummary:
                                            listViewLearnCardsRecord.summary,
                                        parameter4: widget.color,
                                        learningCardId: listViewLearnCardsRecord
                                            .reference.id,
                                        sessionsDoc: widget.sessionsDoc,
                                        learnCardDocument:
                                            listViewLearnCardsRecord,
                                        companyDoc: widget.companyDoc,
                                      ),
                                    ),
                                ],
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
    );
  }
}
