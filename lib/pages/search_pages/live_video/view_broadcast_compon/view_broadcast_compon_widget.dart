import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/viewbroadcast_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_broadcast_compon_model.dart';
export 'view_broadcast_compon_model.dart';

class ViewBroadcastComponWidget extends StatefulWidget {
  const ViewBroadcastComponWidget({
    super.key,
    this.url,
    this.broadcastdocument,
    this.broadcastcomment,
    this.broadcastdocref,
    this.users,
    this.whosonlinelive,
  });

  final String? url;
  final BroadcastsRecord? broadcastdocument;
  final BroadcastcommentsRecord? broadcastcomment;
  final DocumentReference? broadcastdocref;
  final UsersRecord? users;
  final UsersonlineliveRecord? whosonlinelive;

  @override
  State<ViewBroadcastComponWidget> createState() =>
      _ViewBroadcastComponWidgetState();
}

class _ViewBroadcastComponWidgetState extends State<ViewBroadcastComponWidget> {
  late ViewBroadcastComponModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewBroadcastComponModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ViewBroadcastCompon'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VIEW_BROADCAST_COMPON_ViewBroadcastCompo');
      logFirebaseEvent('ViewBroadcastCompon_backend_call');

      await LivecommentsRecord.collection
          .doc()
          .set(createLivecommentsRecordData(
            videoid: widget.broadcastdocument?.reference,
            user: currentUserReference,
            time: getCurrentTimestamp,
            userimage: currentUserPhoto,
            broadcastID: widget.broadcastdocument?.reference,
            comments:
                '${currentUserDisplayName} has just joined the live video',
          ));
      logFirebaseEvent('ViewBroadcastCompon_backend_call');

      await widget.broadcastdocref!.update({
        ...mapToFirestore(
          {
            'online': FieldValue.arrayUnion([currentUserReference]),
          },
        ),
      });
    });

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
        title: 'ViewBroadcastCompon',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: responsiveVisibility(
              context: context,
              desktop: false,
            )
                ? AppBar(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    automaticallyImplyLeading: false,
                    leading: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'VIEW_BROADCAST_COMPON_arrow_back_rounded');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    actions: [
                      ToggleIcon(
                        onPressed: () async {
                          setState(() => FFAppState().commentson =
                              !FFAppState().commentson);
                        },
                        value: FFAppState().commentson,
                        onIcon: Icon(
                          Icons.remove_red_eye_rounded,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 25.0,
                        ),
                        offIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 25.0,
                        ),
                      ),
                    ],
                    centerTitle: true,
                    elevation: 2.0,
                  )
                : null,
            body: SafeArea(
              top: true,
              child: wrapWithModel(
                model: _model.viewbroadcastModel,
                updateCallback: () => setState(() {}),
                child: ViewbroadcastWidget(
                  parameter1: widget.url,
                  parameter2: widget.broadcastdocref,
                  parameter3: widget.users,
                ),
              ),
            ),
          ),
        ));
  }
}
