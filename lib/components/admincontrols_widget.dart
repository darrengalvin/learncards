import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'admincontrols_model.dart';
export 'admincontrols_model.dart';

class AdmincontrolsWidget extends StatefulWidget {
  const AdmincontrolsWidget({
    super.key,
    this.historydoc,
    this.historyref,
    this.tileref,
    this.tiledoc,
  });

  final HistoryRecord? historydoc;
  final DocumentReference? historyref;
  final DocumentReference? tileref;
  final TilesRecord? tiledoc;

  @override
  State<AdmincontrolsWidget> createState() => _AdmincontrolsWidgetState();
}

class _AdmincontrolsWidgetState extends State<AdmincontrolsWidget> {
  late AdmincontrolsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdmincontrolsModel());

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
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 50.0, 0.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('ADMINCONTROLS_arrow_back_ios_sharp_ICN_O');
                  logFirebaseEvent('IconButton_update_app_state');
                  setState(() {
                    FFAppState().historyActive = true;
                  });
                },
              ),
              if ((valueOrDefault<bool>(currentUserDocument?.isadmin, false) ==
                      true) &&
                  (FFAppState().historyActive == false))
                AuthUserStreamWidget(
                  builder: (context) => Text(
                    _model.currentPageLink,
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if ((valueOrDefault<bool>(
                                  currentUserDocument?.isadmin, false) ==
                              true) &&
                          (FFAppState().historyActive == false))
                        Builder(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.link_sharp,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ADMINCONTROLS_COMP_link_sharp_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_generate_current_page_link');
                                  _model.currentPageLink =
                                      await generateCurrentPageLink(
                                    context,
                                    title: 'link generated',
                                  );

                                  logFirebaseEvent('IconButton_share');
                                  await Share.share(
                                    _model.currentPageLink,
                                    sharePositionOrigin:
                                        getWidgetBoundingBox(context),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.push_pin,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'ADMINCONTROLS_COMP_push_pin_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_backend_call');

                            await widget.tileref!.update({
                              ...mapToFirestore(
                                {
                                  'pinned': FieldValue.arrayUnion(
                                      [currentUserReference]),
                                },
                              ),
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
