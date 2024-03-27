import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_chips_model.dart';
export 'nav_chips_model.dart';

class NavChipsWidget extends StatefulWidget {
  const NavChipsWidget({super.key});

  @override
  State<NavChipsWidget> createState() => _NavChipsWidgetState();
}

class _NavChipsWidgetState extends State<NavChipsWidget> {
  late NavChipsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavChipsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.0,
      constraints: BoxConstraints(
        maxWidth: 400.0,
      ),
      decoration: BoxDecoration(),
      child: StreamBuilder<List<CategoriesRecord>>(
        stream: queryCategoriesRecord(
          queryBuilder: (categoriesRecord) => categoriesRecord.orderBy('index'),
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
          List<CategoriesRecord> listViewNCategoriesRecordList = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: listViewNCategoriesRecordList.length,
            itemBuilder: (context, listViewNIndex) {
              final listViewNCategoriesRecord =
                  listViewNCategoriesRecordList[listViewNIndex];
              return InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('NAV_CHIPS_COMP_Column_yv736jlh_ON_TAP');
                  logFirebaseEvent('Column_update_app_state');
                  FFAppState().update(() {
                    FFAppState().selectedcategory =
                        listViewNCategoriesRecord.categoryname;
                    FFAppState().selectedParentRef =
                        listViewNCategoriesRecord.firsttileref;
                    FFAppState().addToAudienceforlives(
                        listViewNCategoriesRecord.categoryname);
                  });
                  logFirebaseEvent('Column_haptic_feedback');
                  HapticFeedback.selectionClick();
                },
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'NAV_CHIPS_COMP_BUTTON_BTN_ON_TAP');
                            logFirebaseEvent('Button_update_app_state');
                            FFAppState().update(() {
                              FFAppState().selectedcategory =
                                  listViewNCategoriesRecord.categoryname;
                            });
                            if (listViewNCategoriesRecord.pushnotificationson
                                    .contains(currentUserReference) ==
                                true) {
                              logFirebaseEvent('Button_update_app_state');
                              setState(() {
                                FFAppState().catnotifications = true;
                              });
                            }
                          },
                          text: listViewNCategoriesRecord.categoryname,
                          options: FFButtonOptions(
                            height: 30.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            color: listViewNCategoriesRecord.categoryname ==
                                    listViewNCategoriesRecord.categoryname
                                ? FlutterFlowTheme.of(context).btnbk
                                : FlutterFlowTheme.of(context).btnbksel,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: listViewNCategoriesRecord.categoryname ==
                                      listViewNCategoriesRecord.categoryname
                                  ? FlutterFlowTheme.of(context).secondaryText
                                  : FlutterFlowTheme.of(context).info,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
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
    );
  }
}
