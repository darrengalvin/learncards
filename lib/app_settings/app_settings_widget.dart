import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_settings_model.dart';
export 'app_settings_model.dart';

class AppSettingsWidget extends StatefulWidget {
  const AppSettingsWidget({super.key});

  @override
  State<AppSettingsWidget> createState() => _AppSettingsWidgetState();
}

class _AppSettingsWidgetState extends State<AppSettingsWidget> {
  late AppSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppSettingsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AppSettings'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'AppSettings',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: responsiveVisibility(
            context: context,
            desktop: false,
          )
              ? AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'APP_SETTINGS_arrow_back_rounded_ICN_ON_T');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.safePop();
                    },
                  ),
                  title: Text(
                    'Settings',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).headlineMediumFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 22.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context)
                                  .headlineMediumFamily),
                        ),
                  ),
                  actions: const [],
                  centerTitle: false,
                  elevation: 0.0,
                )
              : null,
          body: StreamBuilder<List<CategoriesRecord>>(
            stream: queryCategoriesRecord(
              queryBuilder: (categoriesRecord) => categoriesRecord.where(
                'categoryname',
                isEqualTo: FFAppState().selectedcategory,
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
              List<CategoriesRecord> listViewCategoriesRecordList =
                  snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final listViewCategoriesRecord =
                  listViewCategoriesRecordList.isNotEmpty
                      ? listViewCategoriesRecordList.first
                      : null;
              return ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Choose what notifcations you want to recieve below and we will update the settings.\n\n',
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 0.0, 0.0),
                    child: Text(
                      listViewCategoriesRecord!.categoryname,
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                  ),
                  if (listViewCategoriesRecord.categoryname ==
                      FFAppState().selectedcategory)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: SwitchListTile.adaptive(
                        value: _model.switchListTileValue ??=
                            FFAppState().catnotifications,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.switchListTileValue = newValue);
                          if (newValue) {
                            logFirebaseEvent(
                                'APP_SETTINGS_SwitchListTile_sacrr903_ON_');
                            logFirebaseEvent('SwitchListTile_backend_call');

                            await listViewCategoriesRecord.reference.update({
                              ...mapToFirestore(
                                {
                                  'pushnotificationson': FieldValue.arrayUnion(
                                      [currentUserReference]),
                                  'pushnotificationsoff':
                                      FieldValue.arrayRemove(
                                          [currentUserReference]),
                                },
                              ),
                            });
                          } else {
                            logFirebaseEvent(
                                'APP_SETTINGS_SwitchListTile_sacrr903_ON_');
                            logFirebaseEvent('SwitchListTile_backend_call');

                            await listViewCategoriesRecord.reference.update({
                              ...mapToFirestore(
                                {
                                  'pushnotificationsoff': FieldValue.arrayUnion(
                                      [currentUserReference]),
                                  'pushnotificationson': FieldValue.arrayRemove(
                                      [currentUserReference]),
                                },
                              ),
                            });
                          }
                        },
                        title: Text(
                          'Push Notifications  ${listViewCategoriesRecord.pushnotificationson.contains(currentUserReference) ? 'On' : 'Off'}',
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                        subtitle: Text(
                          'Receive Push notifications on a semi regular basis.',
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                        activeColor: FlutterFlowTheme.of(context).warning,
                        activeTrackColor: const Color(0x8A4B39EF),
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 12.0),
                      ),
                    ),
                ],
              );
            },
          ),
        ));
  }
}
