import '/backend/backend.dart';
import '/components/learning_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'preparing_model.dart';
export 'preparing_model.dart';

class PreparingWidget extends StatefulWidget {
  const PreparingWidget({
    super.key,
    required this.companyDoc,
    required this.sessionsDoc,
  });

  final CompaniesRecord? companyDoc;
  final SessionsRecord? sessionsDoc;

  @override
  State<PreparingWidget> createState() => _PreparingWidgetState();
}

class _PreparingWidgetState extends State<PreparingWidget> {
  late PreparingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PreparingModel());

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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              constraints: BoxConstraints(
                minWidth: double.infinity,
                maxWidth: () {
                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                    return 340.0;
                  } else if (MediaQuery.sizeOf(context).width <
                      kBreakpointMedium) {
                    return 400.0;
                  } else if (MediaQuery.sizeOf(context).width <
                      kBreakpointLarge) {
                    return 500.0;
                  } else {
                    return 400.0;
                  }
                }(),
              ),
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(17.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 10.0),
                            child: Text(
                              'Hello and welcome! ',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.0, 0.0, 25.0, 0.0),
                            child: Text(
                              'I am currently  delving through hundreds of hours and thousands of documents, to tailor a unique and effective learning journey specifically for you. This process is intricate and will take a little while to complete. In the meantime, you have two choices: you can engage in the learncard activity below, which will offer you a glimpse into what your learning journey could be like, or you can choose to return later. If you haven\'t experienced a learncard before, I highly recommend trying it out for a valuable insight into your potential learning journey. I\'ll notify you via email once everything is ready for you.\n',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(25.0),
                        child: StreamBuilder<List<LearnCardsRecord>>(
                          stream: queryLearnCardsRecord(
                            queryBuilder: (learnCardsRecord) =>
                                learnCardsRecord.where(
                              'isDemo',
                              isEqualTo: true,
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
                            List<LearnCardsRecord>
                                learningCardLearnCardsRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final learningCardLearnCardsRecord =
                                learningCardLearnCardsRecordList.isNotEmpty
                                    ? learningCardLearnCardsRecordList.first
                                    : null;
                            return wrapWithModel(
                              model: _model.learningCardModel,
                              updateCallback: () => setState(() {}),
                              child: LearningCardWidget(
                                sessionsDoc: widget.sessionsDoc!,
                                companyDoc: widget.companyDoc!,
                                learnCard: learningCardLearnCardsRecord!,
                                showLearnCard: FFAppState().showLearnCard,
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
    );
  }
}
