import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'generate_chat_model.dart';
export 'generate_chat_model.dart';

class GenerateChatWidget extends StatefulWidget {
  const GenerateChatWidget({super.key});

  @override
  State<GenerateChatWidget> createState() => _GenerateChatWidgetState();
}

class _GenerateChatWidgetState extends State<GenerateChatWidget> {
  late GenerateChatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenerateChatModel());

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

    return FlutterFlowIconButton(
      borderColor: FlutterFlowTheme.of(context).primary,
      borderRadius: 5.0,
      borderWidth: 1.0,
      buttonSize: 55.0,
      fillColor: FlutterFlowTheme.of(context).accent1,
      icon: Icon(
        Icons.send_sharp,
        color: FlutterFlowTheme.of(context).primaryText,
        size: 24.0,
      ),
      showLoadingIndicator: true,
      onPressed: () async {
        logFirebaseEvent('GENERATE_CHAT_COMP_send_sharp_ICN_ON_TAP');
        if (FFAppState().sessionId == null || FFAppState().sessionId == '') {
          // generate app state
          logFirebaseEvent('IconButton_generateappstate');
          setState(() {
            FFAppState().sessionId = random_data.randomString(
              18,
              22,
              true,
              true,
              true,
            );
          });
        }
        if (!(FFAppState().activeThread != null &&
            FFAppState().activeThread != '')) {
          // generate active thread id
          logFirebaseEvent('IconButton_generateactivethreadid');
          setState(() {
            FFAppState().activeThread = random_data.randomString(
              12,
              22,
              true,
              true,
              true,
            );
          });
        }
        // question ready false
        logFirebaseEvent('IconButton_questionreadyfalse');
        setState(() {});
        // flowise chat document
        logFirebaseEvent('IconButton_flowisechatdocument');

        await FlowiseChatsRecord.collection
            .doc()
            .set(createFlowiseChatsRecordData(
              userId: loggedIn
                  ? currentUserReference?.id
                  : FFAppState().nonLoggedInSessionId,
              role: 'human',
              text: 'testing text',
              createdTime: getCurrentTimestamp,
              sessionId: FFAppState().sessionid,
              threadId: valueOrDefault<String>(
                FFAppState().activeThread,
                'no thread id was passed',
              ),
            ));
        logFirebaseEvent('IconButton_custom_action');
        await actions.callFlowiseStreaming(
          'Hi, I am testing',
          ' testing',
          ' ',
          () async {},
          () async {},
          'video',
        );
        // flowise chat document ai
        logFirebaseEvent('IconButton_flowisechatdocumentai');

        await FlowiseChatsRecord.collection
            .doc()
            .set(createFlowiseChatsRecordData(
              userId: loggedIn
                  ? currentUserReference?.id
                  : FFAppState().nonLoggedInSessionId,
              role: 'ai',
              text: FFAppState().flowiseMessages.first.message,
              createdTime: getCurrentTimestamp,
              sessionId: FFAppState().sessionid,
              threadId: valueOrDefault<String>(
                FFAppState().activeThread,
                'no thread id was found',
              ),
            ));
        logFirebaseEvent('IconButton_update_app_state');
        setState(() {
          FFAppState().flowiseMessages = [];
        });
        logFirebaseEvent('IconButton_update_component_state');
        setState(() {});
        logFirebaseEvent('IconButton_wait__delay');
        await Future.delayed(const Duration(milliseconds: 500));
      },
    );
  }
}
