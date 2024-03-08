import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'broadcast_name_input_model.dart';
export 'broadcast_name_input_model.dart';

class BroadcastNameInputWidget extends StatefulWidget {
  const BroadcastNameInputWidget({
    super.key,
    this.categories,
    this.users,
    this.usersdoc,
    this.broadcastsdoc,
    this.audience,
  });

  final CategoriesRecord? categories;
  final DocumentReference? users;
  final UsersRecord? usersdoc;
  final BroadcastsRecord? broadcastsdoc;
  final List<DocumentReference>? audience;

  @override
  State<BroadcastNameInputWidget> createState() =>
      _BroadcastNameInputWidgetState();
}

class _BroadcastNameInputWidgetState extends State<BroadcastNameInputWidget> {
  late BroadcastNameInputModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BroadcastNameInputModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).primaryBackground,
            FlutterFlowTheme.of(context).secondary
          ],
          stops: const [0.0, 1.0],
          begin: const AlignmentDirectional(0.0, -1.0),
          end: const AlignmentDirectional(0, 1.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: Icon(
                              Icons.settings_input_antenna,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 54.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: SelectionArea(
                                child: Text(
                              'Lets go live ',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            )),
                          ),
                          StreamBuilder<List<CategoriesRecord>>(
                            stream: queryCategoriesRecord(),
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
                              List<CategoriesRecord>
                                  listViewCategoriesRecordList = snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewCategoriesRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewCategoriesRecord =
                                      listViewCategoriesRecordList[
                                          listViewIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'BROADCAST_NAME_INPUT_Container_bcrxkfuk_');
                                            logFirebaseEvent(
                                                'Container_update_app_state');
                                            setState(() {
                                              FFAppState().addToSelectedForLive(
                                                  listViewCategoriesRecord
                                                      .categoryname);
                                            });
                                            if (_model.selectedcatRef.contains(
                                                    listViewCategoriesRecord
                                                        .reference) ==
                                                true) {
                                              logFirebaseEvent(
                                                  'Container_update_component_state');
                                              setState(() {
                                                _model.removeFromSelectedcatRef(
                                                    listViewCategoriesRecord
                                                        .reference);
                                              });
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              setState(() {
                                                FFAppState()
                                                    .addToAudienceforlives(
                                                        listViewCategoriesRecord
                                                            .categoryname);
                                              });
                                            } else {
                                              logFirebaseEvent(
                                                  'Container_update_component_state');
                                              setState(() {
                                                _model.addToSelectedcatRef(
                                                    listViewCategoriesRecord
                                                        .reference);
                                              });
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              setState(() {
                                                FFAppState()
                                                    .removeFromAudienceforlives(
                                                        listViewCategoriesRecord
                                                            .categoryname);
                                              });
                                            }
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color: _model.selectedcatRef.contains(
                                                          listViewCategoriesRecord
                                                              .reference) ==
                                                      true
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .accent4,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                listViewCategoriesRecord
                                                    .categoryname,
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
              child: TextFormField(
                controller: _model.textController,
                focusNode: _model.textFieldFocusNode,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Video Name',
                  hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodySmallFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodySmallFamily),
                      ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'BROADCAST_NAME_INPUT_I_AM_READY_BTN_ON_T');
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed(
                        'StartBroadcast',
                        queryParameters: {
                          'broadcastName': serializeParam(
                            _model.textController.text,
                            ParamType.String,
                          ),
                          'broadcastLocation': serializeParam(
                            '',
                            ParamType.String,
                          ),
                          'categorydoc': serializeParam(
                            widget.categories,
                            ParamType.Document,
                          ),
                          'audience': serializeParam(
                            _model.selectedcatRef,
                            ParamType.DocumentReference,
                            true,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'categorydoc': widget.categories,
                        },
                      );

                      logFirebaseEvent('Button_bottom_sheet');
                      Navigator.pop(context);
                    },
                    text: 'I am ready',
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      elevation: 2.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
