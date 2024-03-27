import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'traffic_lights_model.dart';
export 'traffic_lights_model.dart';

class TrafficLightsWidget extends StatefulWidget {
  const TrafficLightsWidget({super.key});

  @override
  State<TrafficLightsWidget> createState() => _TrafficLightsWidgetState();
}

class _TrafficLightsWidgetState extends State<TrafficLightsWidget> {
  late TrafficLightsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrafficLightsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<QuizAnswersRecord>>(
      stream: queryQuizAnswersRecord(
        queryBuilder: (quizAnswersRecord) => quizAnswersRecord.where(
          'userId',
          isEqualTo: currentUserUid,
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
        List<QuizAnswersRecord> topNav1QuizAnswersRecordList = snapshot.data!;
        return Container(
          width: double.infinity,
          height: 40.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 8.0),
                    child: Builder(
                      builder: (context) {
                        final trafficLights =
                            topNav1QuizAnswersRecordList.toList();
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: List.generate(trafficLights.length,
                                (trafficLightsIndex) {
                              final trafficLightsItem =
                                  trafficLights[trafficLightsIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Container(
                                  width: 25.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                    color: trafficLightsItem.isCorrect == true
                                        ? FlutterFlowTheme.of(context)
                                            .darkSeaGreen
                                        : FlutterFlowTheme.of(context)
                                            .customColor3,
                                    borderRadius: BorderRadius.circular(45.0),
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
