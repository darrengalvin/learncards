import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'session_checks_model.dart';
export 'session_checks_model.dart';

class SessionChecksWidget extends StatefulWidget {
  const SessionChecksWidget({
    super.key,
    required this.email,
    required this.password,
    required this.sessionDoc,
  });

  final String? email;
  final String? password;
  final SessionsRecord? sessionDoc;

  @override
  State<SessionChecksWidget> createState() => _SessionChecksWidgetState();
}

class _SessionChecksWidgetState extends State<SessionChecksWidget> {
  late SessionChecksModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SessionChecksModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                StreamBuilder<List<ErrorChecksRecord>>(
                  stream: queryErrorChecksRecord(
                    queryBuilder: (errorChecksRecord) => errorChecksRecord
                        .where(
                          'checkSession',
                          isEqualTo: widget.sessionDoc?.reference.id,
                        )
                        .orderBy('checkDate'),
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
                    List<ErrorChecksRecord> listViewErrorChecksRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewErrorChecksRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewErrorChecksRecord =
                            listViewErrorChecksRecordList[listViewIndex];
                        return Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 1.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 0.0,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    offset: const Offset(0.0, 1.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(0.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 16.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              listViewErrorChecksRecord
                                                  .checkName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            listViewErrorChecksRecord
                                                                .checkDescription,
                                                            'description',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            listViewErrorChecksRecord
                                                                .resultMessage,
                                                            '-',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                color: () {
                                                                  if ((listViewErrorChecksRecord
                                                                              .checkStatus !=
                                                                          true) &&
                                                                      (listViewErrorChecksRecord
                                                                              .warningFlag !=
                                                                          true)) {
                                                                    return FlutterFlowTheme.of(
                                                                            context)
                                                                        .error;
                                                                  } else if ((listViewErrorChecksRecord
                                                                              .checkStatus !=
                                                                          true) &&
                                                                      valueOrDefault<
                                                                          bool>(
                                                                        listViewErrorChecksRecord.warningFlag ==
                                                                            true,
                                                                        false,
                                                                      )) {
                                                                    return const Color(
                                                                        0xFFFB920B);
                                                                  } else {
                                                                    return FlutterFlowTheme.of(
                                                                            context)
                                                                        .success;
                                                                  }
                                                                }(),
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 44.0,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Stack(
                                          children: [
                                            if (listViewErrorChecksRecord
                                                    .checkStatus ==
                                                true)
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons.check,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .success,
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            if (valueOrDefault<bool>(
                                              (listViewErrorChecksRecord
                                                          .checkStatus ==
                                                      false) &&
                                                  valueOrDefault<bool>(
                                                    listViewErrorChecksRecord
                                                            .warningFlag !=
                                                        true,
                                                    false,
                                                  ),
                                              false,
                                            ))
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.close_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            if (valueOrDefault<bool>(
                                              (listViewErrorChecksRecord
                                                          .checkStatus ==
                                                      false) &&
                                                  valueOrDefault<bool>(
                                                    listViewErrorChecksRecord
                                                            .warningFlag ==
                                                        true,
                                                    false,
                                                  ),
                                              false,
                                            ))
                                              const Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.warning_amber_rounded,
                                                    color: Color(0xFFFB920B),
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
