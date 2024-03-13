import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/non_logged_in_warning_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'trigger_a_p_i_c_a_l_l_s_model.dart';
export 'trigger_a_p_i_c_a_l_l_s_model.dart';

class TriggerAPICALLSWidget extends StatefulWidget {
  const TriggerAPICALLSWidget({
    super.key,
    required this.topic,
    required this.learningItem,
    this.tileBlockRef,
  });

  final String? topic;
  final String? learningItem;
  final DocumentReference? tileBlockRef;

  @override
  State<TriggerAPICALLSWidget> createState() => _TriggerAPICALLSWidgetState();
}

class _TriggerAPICALLSWidgetState extends State<TriggerAPICALLSWidget> {
  late TriggerAPICALLSModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TriggerAPICALLSModel());

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
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: 399.0,
              height: 300.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('TRIGGER_A_P_I_C_A_L_L_S_BUTTON_BTN_ON_TA');
                  logFirebaseEvent('Button_firestore_query');
                  _model.companyOwner = await queryCompaniesRecordOnce(
                    queryBuilder: (companiesRecord) => companiesRecord.where(
                      'isowner',
                      isEqualTo: true,
                    ),
                  );
                  if (!loggedIn) {
                    logFirebaseEvent('Button_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: NonLoggedInWarningWidget(),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  }
                  logFirebaseEvent('Button_backend_call');
                  _model.apiResult9jb =
                      await FlowiseGroup.flowiseAPICallCall.call(
                    question: FFAppState().selectedReadingItem,
                    systemMessagePrompt:
                        'The body text will be in HTML with H1,H2,P tag start the html <!DOCTYPE html> make sure there are no backticks, or quotation marks around the json. Always use UK english spelling and locale I am using a self guided learning platform ${_model.companyOwner?.first?.companyname}You are generating learn cards, the primary topic I have been studying is  ${valueOrDefault<String>(
                      FFAppState().selectedTopic,
                      'selected topic was not set',
                    )}and the learn card I am ready to generate is  ${valueOrDefault<String>(
                      FFAppState().selectedReadingItem,
                      'selected reading item is not set',
                    )}I need an introduction text (HTMLbodyText) that engages me in the topic with a view of educating me further,  You will explain the topic and decide on an activity that we can do together via interactive chat, (H1) Activity a name (H2) summary (P) description and you will explain in the body text why you have chosen this for me based on what you know about me (userData)  You will give me an estimated (bold) time (/bold)  to complete activity.  You will invite me to engage in said activity by using one of my learn cards by clicking on the button below I will supply the button you do not need to  ‘generate learn card’.   I need an introduction text (HTMLbodyText) that engages me in the topic with a view of educating me,  You will decide on an activity that we can do together via interactive chat, You will give that activity a name, description and you will explain in the body text why you have chosen this for me. You will give me an estimated time between 15-30 minutes to complete said activity.  You will invite me to engage in said activity by using one of my learn cards by clicking on the button below ‘generate learn card’.  The body text will be in HTMLI need a HTML sttring with H1,H2,P tagsstart the html <!DOCTYPE html> make sure there are no backticks, or quatation marks around the json',
                    topic: widget.topic,
                    readingItem: widget.learningItem,
                  );
                  while ((_model.apiResult9jb?.succeeded ?? true) != true) {
                    logFirebaseEvent('Button_wait__delay');
                    await Future.delayed(const Duration(milliseconds: 1000));
                  }
                  logFirebaseEvent('Button_backend_call');

                  await widget.tileBlockRef!.update(createTileBlocksRecordData(
                    htmlContent: FlowiseGroup.flowiseAPICallCall.text(
                      (_model.apiResult9jb?.jsonBody ?? ''),
                    ),
                  ));

                  setState(() {});
                },
                text: 'Button',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
