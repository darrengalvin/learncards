import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_entry_new_front_model.dart';
export 'app_entry_new_front_model.dart';

class AppEntryNewFrontWidget extends StatefulWidget {
  const AppEntryNewFrontWidget({
    super.key,
    this.tileref,
    this.tiledoc,
  });

  final DocumentReference? tileref;
  final TilesRecord? tiledoc;

  @override
  State<AppEntryNewFrontWidget> createState() => _AppEntryNewFrontWidgetState();
}

class _AppEntryNewFrontWidgetState extends State<AppEntryNewFrontWidget> {
  late AppEntryNewFrontModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppEntryNewFrontModel());

    _model.replyController ??= TextEditingController();
    _model.replyFocusNode ??= FocusNode();

    _model.titleController ??=
        TextEditingController(text: widget.tiledoc?.title);
    _model.titleFocusNode ??= FocusNode();

    _model.videurlController ??= TextEditingController(
        text: functions.urlToString(widget.tiledoc!.video));
    _model.videurlFocusNode ??= FocusNode();

    _model.qnotshownController ??=
        TextEditingController(text: widget.tiledoc?.summary);
    _model.qnotshownFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x2B202529),
              offset: Offset(0.0, 2.0),
            )
          ],
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).primaryBackground,
              FlutterFlowTheme.of(context).secondary
            ],
            stops: const [0.0, 1.0],
            begin: const AlignmentDirectional(0.0, -1.0),
            end: const AlignmentDirectional(0, 1.0),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x2B202529),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).primaryBackground,
                        FlutterFlowTheme.of(context).secondary
                      ],
                      stops: const [0.0, 1.0],
                      begin: const AlignmentDirectional(0.0, -1.0),
                      end: const AlignmentDirectional(0, 1.0),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 10.0, 0.0, 10.0),
                              child: Text(
                                widget.tiledoc!.title,
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      fontSize: 14.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 70.0),
                            child: SizedBox(
                              width: 370.0,
                              height: 290.0,
                              child: custom_widgets.VideoWithPlay(
                                width: 370.0,
                                height: 290.0,
                                videoUrl: functions
                                    .urlToString(widget.tiledoc!.video),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDADADA),
                                  borderRadius: BorderRadius.circular(17.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1.0,
                                  ),
                                ),
                                child: Visibility(
                                  visible: widget.tiledoc?.summary != null &&
                                      widget.tiledoc?.summary != '',
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: TextFormField(
                                      controller: _model.replyController,
                                      focusNode: _model.replyFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.replyController',
                                        const Duration(milliseconds: 2000),
                                        () async {
                                          logFirebaseEvent(
                                              'APP_ENTRY_NEW_FRONT_Reply_ON_TEXTFIELD_C');
                                          logFirebaseEvent(
                                              'Reply_update_component_state');
                                          setState(() {
                                            _model.appEntriesResponse =
                                                _model.replyController.text;
                                          });
                                        },
                                      ),
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(17.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(17.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(17.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(17.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      maxLines: 5,
                                      keyboardType: TextInputType.multiline,
                                      validator: _model.replyControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFDADADA),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.85),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (widget.tiledoc?.summary != null &&
                                    widget.tiledoc?.summary != '')
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 10.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'APP_ENTRY_NEW_FRONT_COMP_SAVE_BTN_ON_TAP');
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        setState(() {
                                          FFAppState().currentAIiD =
                                              widget.tiledoc!.aiId;
                                        });
                                        logFirebaseEvent('Button_backend_call');

                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          aiId: widget.tiledoc?.aiId,
                                        ));
                                        logFirebaseEvent('Button_backend_call');

                                        await AppEntriesRecord.collection
                                            .doc()
                                            .set(createAppEntriesRecordData(
                                              uid: currentUserReference,
                                              reply:
                                                  _model.replyController.text,
                                              dateposted: getCurrentTimestamp,
                                              isai: false,
                                              video:
                                                  _model.videurlController.text,
                                              image: '',
                                              question:
                                                  _model.titleController.text,
                                              questionnotshown: _model
                                                  .qnotshownController.text,
                                            ));
                                        logFirebaseEvent(
                                            'Button_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Saved',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        logFirebaseEvent(
                                            'Button_clear_text_fields_pin_codes');
                                        setState(() {
                                          _model.replyController?.clear();
                                        });
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        setState(() {
                                          FFAppState().SelectedTileRef =
                                              widget.tileref;
                                          FFAppState().selectedTile =
                                              widget.tiledoc!.title;
                                        });
                                        if (widget.tileref == null) {
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          await widget.tileref!
                                              .update(createTilesRecordData(
                                            tileref: widget.tiledoc?.reference,
                                          ));
                                        }
                                        logFirebaseEvent('Button_backend_call');

                                        await currentUserReference!.update({
                                          ...mapToFirestore(
                                            {
                                              'AI_ID': FieldValue.increment(1),
                                            },
                                          ),
                                        });
                                      },
                                      text: 'Save',
                                      icon: const Icon(
                                        Icons.cloud_download_rounded,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 130.0,
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                if (widget.tiledoc?.summary == null ||
                                    widget.tiledoc?.summary == '')
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 10.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'APP_ENTRY_NEW_FRONT_COMP_NEXT_BTN_ON_TAP');
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        setState(() {
                                          FFAppState().currentAIiD =
                                              widget.tiledoc!.aiId;
                                        });
                                        logFirebaseEvent('Button_backend_call');

                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          aiId: widget.tiledoc?.aiId,
                                        ));
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        setState(() {
                                          FFAppState().SelectedTileRef =
                                              widget.tileref;
                                          FFAppState().selectedTile =
                                              widget.tiledoc!.title;
                                        });
                                        if (widget.tileref == null) {
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          await widget.tileref!
                                              .update(createTilesRecordData(
                                            tileref: widget.tiledoc?.reference,
                                          ));
                                        }
                                        logFirebaseEvent('Button_backend_call');

                                        await currentUserReference!.update({
                                          ...mapToFirestore(
                                            {
                                              'AI_ID': FieldValue.increment(1),
                                            },
                                          ),
                                        });
                                      },
                                      text: 'Next',
                                      icon: const Icon(
                                        Icons.skip_next_rounded,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 130.0,
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
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
                if (valueOrDefault<bool>(currentUserDocument?.idDEV, false) ==
                    true)
                  AuthUserStreamWidget(
                    builder: (context) => TextFormField(
                      controller: _model.titleController,
                      focusNode: _model.titleFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: '[Some hint text...]',
                        hintStyle: FlutterFlowTheme.of(context).bodySmall,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      validator:
                          _model.titleControllerValidator.asValidator(context),
                    ),
                  ),
                if (valueOrDefault<bool>(currentUserDocument?.idDEV, false) ==
                    true)
                  AuthUserStreamWidget(
                    builder: (context) => TextFormField(
                      controller: _model.videurlController,
                      focusNode: _model.videurlFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: '[Some hint text...]',
                        hintStyle: FlutterFlowTheme.of(context).bodySmall,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      validator: _model.videurlControllerValidator
                          .asValidator(context),
                    ),
                  ),
                if (valueOrDefault<bool>(currentUserDocument?.idDEV, false) ==
                    true)
                  AuthUserStreamWidget(
                    builder: (context) => TextFormField(
                      controller: _model.qnotshownController,
                      focusNode: _model.qnotshownFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: '[Some hint text...]',
                        hintStyle: FlutterFlowTheme.of(context).bodySmall,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      validator: _model.qnotshownControllerValidator
                          .asValidator(context),
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
