import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'type_chips_model.dart';
export 'type_chips_model.dart';

class TypeChipsWidget extends StatefulWidget {
  const TypeChipsWidget({super.key});

  @override
  State<TypeChipsWidget> createState() => _TypeChipsWidgetState();
}

class _TypeChipsWidgetState extends State<TypeChipsWidget> {
  late TypeChipsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TypeChipsModel());

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 40.0,
            constraints: const BoxConstraints(
              maxHeight: 50.0,
            ),
            decoration: const BoxDecoration(),
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Align(
              alignment: const AlignmentDirectional(0.0, 0.05),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(30.0, 1.0, 0.0, 0.0),
                child: StreamBuilder<List<TypesRecord>>(
                  stream: queryTypesRecord(
                    queryBuilder: (typesRecord) => typesRecord.orderBy('id'),
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
                    List<TypesRecord> listViewNTypesRecordList = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: listViewNTypesRecordList.length,
                      itemBuilder: (context, listViewNIndex) {
                        final listViewNTypesRecord =
                            listViewNTypesRecordList[listViewNIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'TYPE_CHIPS_COMP_Column_spwhf3b0_ON_TAP');
                            logFirebaseEvent('Column_update_app_state');
                            _model.updatePage(() {
                              FFAppState().selectedType =
                                  listViewNTypesRecord.type;
                            });
                          },
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100.0,
                                  decoration: const BoxDecoration(),
                                  child: Visibility(
                                    visible: listViewNTypesRecord.show == true,
                                    child: Text(
                                      listViewNTypesRecord.type,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: listViewNTypesRecord.type ==
                                                    FFAppState().selectedType
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryBtnText
                                                : FlutterFlowTheme.of(context)
                                                    .grayIcon,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
