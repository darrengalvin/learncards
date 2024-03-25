import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'learning_card_model.dart';
export 'learning_card_model.dart';

class LearningCardWidget extends StatefulWidget {
  const LearningCardWidget({
    super.key,
    required this.learnCard,
    required this.companyDoc,
    required this.sessionsDoc,
    required this.showLearnCard,
  });

  final LearnCardsRecord? learnCard;
  final CompaniesRecord? companyDoc;
  final SessionsRecord? sessionsDoc;
  final bool? showLearnCard;

  @override
  State<LearningCardWidget> createState() => _LearningCardWidgetState();
}

class _LearningCardWidgetState extends State<LearningCardWidget> {
  late LearningCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LearningCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Align(
        alignment: const AlignmentDirectional(-1.0, -1.0),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: () {
              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                return 320.0;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                return 550.0;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                return 550.0;
              } else {
                return 600.0;
              }
            }(),
          ),
          decoration: BoxDecoration(
            color: widget.companyDoc?.colors.secondaryTextColor,
            borderRadius: BorderRadius.circular(17.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('LEARNING_CARD_Column_x4h0mb4q_ON_TAP');
                logFirebaseEvent('Column_update_app_state');
                FFAppState().update(() {
                  FFAppState().selectedLearnCardId = valueOrDefault<String>(
                    widget.learnCard?.reference.id,
                    '000',
                  );
                  FFAppState().middlePane = 'learnCardsContent';
                  FFAppState().middleColumnShow = true;
                  FFAppState().learnCardDescription = valueOrDefault<String>(
                    widget.learnCard?.description,
                    'description not found',
                  );
                });
                logFirebaseEvent('Column_backend_call');

                await widget.learnCard!.reference.update({
                  ...mapToFirestore(
                    {
                      'usersId': FieldValue.arrayUnion([
                        valueOrDefault<String>(
                          widget.sessionsDoc?.username,
                          'email missing',
                        )
                      ]),
                      'sessionsActiveId': FieldValue.arrayUnion([
                        valueOrDefault<String>(
                          widget.sessionsDoc?.reference.id,
                          'sessionid',
                        )
                      ]),
                    },
                  ),
                });
                logFirebaseEvent('Column_backend_call');

                await widget.sessionsDoc!.reference
                    .update(createSessionsRecordData(
                  activeLearnCard: valueOrDefault<String>(
                    widget.learnCard?.title,
                    'NOTSET',
                  ),
                  currentNavJourney: 'learnCard',
                ));
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 0.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Activity: ${valueOrDefault<String>(
                                    widget.learnCard?.title,
                                    'title',
                                  )}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyLargeFamily,
                                        color: widget
                                            .companyDoc?.colors.primaryColor,
                                        fontSize: valueOrDefault<double>(
                                          () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 13.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 16.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 16.0;
                                            } else {
                                              return 16.0;
                                            }
                                          }(),
                                          13.0,
                                        ),
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'LEARNING_CARD_COMP_Icon_jveev3a2_ON_TAP');
                          logFirebaseEvent('Icon_update_app_state');
                          FFAppState().update(() {
                            FFAppState().selectedLearnCardId =
                                valueOrDefault<String>(
                              widget.learnCard?.reference.id,
                              '000',
                            );
                            FFAppState().middlePane = 'learnCardsContent';
                            FFAppState().middleColumnShow = true;
                          });
                        },
                        child: Icon(
                          Icons.info_outline,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
