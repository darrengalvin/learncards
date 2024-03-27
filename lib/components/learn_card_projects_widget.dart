import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'learn_card_projects_model.dart';
export 'learn_card_projects_model.dart';

class LearnCardProjectsWidget extends StatefulWidget {
  const LearnCardProjectsWidget({
    super.key,
    required this.companyDoc,
  });

  final CompaniesRecord? companyDoc;

  @override
  State<LearnCardProjectsWidget> createState() =>
      _LearnCardProjectsWidgetState();
}

class _LearnCardProjectsWidgetState extends State<LearnCardProjectsWidget> {
  late LearnCardProjectsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LearnCardProjectsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 15.0, 16.0, 15.0),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: () {
              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                return 310.0;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                return 360.0;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                return 600.0;
              } else {
                return 650.0;
              }
            }(),
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 3.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 1.0),
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryBackground,
              width: 1.0,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              valueOrDefault<String>(
                                widget.companyDoc?.companylogo,
                                'https://res.cloudinary.com/dplpckpbm/image/upload/v1703535226/learningPathwaysBright_b3strj.webp',
                              ),
                            ).image,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              widget.companyDoc?.companylogo,
                              'https://res.cloudinary.com/dplpckpbm/image/upload/v1703535226/learningPathwaysBright_b3strj.webp',
                            ),
                            height: 300.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget.companyDoc?.companyAiData.companyName,
                                'detaisls a',
                              ),
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.companyDoc?.companyAiData
                                      .companyIndustry,
                                  'detaisls a',
                                ),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.companyDoc?.companyAiData
                                      .companySummary,
                                  'detaisls a',
                                ),
                                style: FlutterFlowTheme.of(context).labelSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'LEARN_CARD_PROJECTS_CHOOSE_THIS_DEMO_BTN');
                                logFirebaseEvent('Button_update_app_state');
                                _model.updatePage(() {
                                  FFAppState().companySecretCode =
                                      widget.companyDoc!.companyCode;
                                });
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'demo',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              text: 'Choose this demo',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 2.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(40.0),
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
    );
  }
}
