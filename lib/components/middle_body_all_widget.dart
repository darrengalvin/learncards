import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/left_pane/left_column/left_column_widget.dart';
import '/middle_pane/middle_column/middle_column_widget.dart';
import '/right_pane/right_column/right_column_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'middle_body_all_model.dart';
export 'middle_body_all_model.dart';

class MiddleBodyAllWidget extends StatefulWidget {
  const MiddleBodyAllWidget({
    super.key,
    this.companyDocId,
    required this.tilesv2Doc,
  });

  final String? companyDocId;
  final Tilesv2Record? tilesv2Doc;

  @override
  State<MiddleBodyAllWidget> createState() => _MiddleBodyAllWidgetState();
}

class _MiddleBodyAllWidgetState extends State<MiddleBodyAllWidget> {
  late MiddleBodyAllModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiddleBodyAllModel());

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

    return StreamBuilder<List<SessionsRecord>>(
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
        List<SessionsRecord> containerSessionsRecordList = snapshot.data!;
        return Container(
          decoration: BoxDecoration(),
          child: StreamBuilder<List<CompaniesRecord>>(
            stream: queryCompaniesRecord(
              queryBuilder: (companiesRecord) => companiesRecord.where(
                'companyDocId',
                isEqualTo: valueOrDefault<String>(
                  FFAppState().selectedCompanyId,
                  'notset',
                ),
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
              List<CompaniesRecord> containerCompaniesRecordList =
                  snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final containerCompaniesRecord =
                  containerCompaniesRecordList.isNotEmpty
                      ? containerCompaniesRecordList.first
                      : null;
              return Container(
                constraints: BoxConstraints(
                  maxHeight: double.infinity,
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
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 600.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                            ),
                            decoration: BoxDecoration(),
                            child: wrapWithModel(
                              model: _model.leftColumnModel,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: LeftColumnWidget(
                                isLeftShow: FFAppState().leftColumnShow,
                                sessionsDoc: containerSessionsRecordList.first,
                                companiesDoc: containerCompaniesRecord,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: 480.0,
                            ),
                            decoration: BoxDecoration(),
                            child: wrapWithModel(
                              model: _model.middleColumnModel,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: MiddleColumnWidget(
                                companyDoc: containerCompaniesRecord!,
                                sessionsDoc: containerSessionsRecordList.first,
                                isMiddleShow: FFAppState().middleColumnShow,
                                tilev2doc: widget.tilesv2Doc!,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: 450.0,
                            ),
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.sizeOf(context).width * 1.0,
                                ),
                                decoration: BoxDecoration(),
                                child: wrapWithModel(
                                  model: _model.rightColumnModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: RightColumnWidget(
                                    sessionsDoc:
                                        containerSessionsRecordList.first,
                                    companyDoc: containerCompaniesRecord!,
                                    rightColumnShow:
                                        FFAppState().rightColumnShow,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
