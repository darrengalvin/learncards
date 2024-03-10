import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/right_pane/social_feed_new_componant/social_feed_new_componant_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'social_feed_bottoms_h_e_e_t_model.dart';
export 'social_feed_bottoms_h_e_e_t_model.dart';

class SocialFeedBottomsHEETWidget extends StatefulWidget {
  const SocialFeedBottomsHEETWidget({
    super.key,
    bool? askingQuestion,
    required this.companiesDoc,
  }) : askingQuestion = askingQuestion ?? false;

  final bool askingQuestion;
  final CompaniesRecord? companiesDoc;

  @override
  State<SocialFeedBottomsHEETWidget> createState() =>
      _SocialFeedBottomsHEETWidgetState();
}

class _SocialFeedBottomsHEETWidgetState
    extends State<SocialFeedBottomsHEETWidget> {
  late SocialFeedBottomsHEETModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialFeedBottomsHEETModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SOCIAL_FEED_BOTTOMS_H_E_E_T_SocialFeedBo');
      logFirebaseEvent('SocialFeedBottomsHEET_update_component_s');
      setState(() {
        _model.questionReady = true;
      });
      logFirebaseEvent('SocialFeedBottomsHEET_wait__delay');
      await Future.delayed(const Duration(milliseconds: 2000));
      logFirebaseEvent('SocialFeedBottomsHEET_scroll_to');
      await _model.columnController?.animateTo(
        _model.columnController!.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
      );
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

    return SingleChildScrollView(
      controller: _model.columnController,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: StreamBuilder<List<SessionsRecord>>(
              stream: querySessionsRecord(
                queryBuilder: (sessionsRecord) => sessionsRecord.where(
                  'sessionId',
                  isEqualTo: FFAppState().nonLoggedInSessionId,
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
                List<SessionsRecord> containerSessionsRecordList =
                    snapshot.data!;
                return ClipRRect(
                  borderRadius: BorderRadius.circular(22.0),
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return 550.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return 580.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return 700.0;
                        } else {
                          return 1550.0;
                        }
                      }(),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    child: wrapWithModel(
                      model: _model.socialFeedNewComponantModel,
                      updateCallback: () => setState(() {}),
                      child: const SocialFeedNewComponantWidget(),
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (valueOrDefault<bool>(
                FFAppState().tempStreamingMessage != '',
                false,
              ))
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (valueOrDefault<bool>(
                FFAppState().debugCount >= 3,
                false,
              ))
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 10.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'SOCIAL_FEED_BOTTOMS_H_E_E_T_LEAVE_DEBUG_');
                      logFirebaseEvent('Button_update_app_state');
                      setState(() {
                        FFAppState().debugCount = 0;
                      });
                    },
                    text: 'Leave Debug Mode',
                    options: FFButtonOptions(
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 4.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).selectedButton,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 18.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
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
              if (FFAppState().debugCount >= 3)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 10.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'SOCIAL_FEED_BOTTOMS_H_E_E_T_START_OVER_B');
                      logFirebaseEvent('Button_update_app_state');
                      setState(() {
                        FFAppState().sessionId = '';
                        FFAppState().activeThread = '';
                        FFAppState().sessionid = '';
                        FFAppState().nonLoggedInSessionId = '';
                      });
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed(
                        'landing',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    text: 'Start Over',
                    options: FFButtonOptions(
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 4.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).selectedButton,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 18.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
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
    );
  }
}
