import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'hybrid_chat_entry_model.dart';
export 'hybrid_chat_entry_model.dart';

class HybridChatEntryWidget extends StatefulWidget {
  const HybridChatEntryWidget({
    super.key,
    required this.sessionDoc,
    required this.companyDoc,
  });

  final SessionsRecord? sessionDoc;
  final CompaniesRecord? companyDoc;

  @override
  State<HybridChatEntryWidget> createState() => _HybridChatEntryWidgetState();
}

class _HybridChatEntryWidgetState extends State<HybridChatEntryWidget> {
  late HybridChatEntryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HybridChatEntryModel());

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
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Respond here..',
                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      maxLines: 3,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).primary,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.send_outlined,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                logFirebaseEvent('HYBRID_CHAT_ENTRY_send_outlined_ICN_ON_T');
                // flowise chat document
                logFirebaseEvent('IconButton_flowisechatdocument');

                var flowiseChatsRecordReference =
                    FlowiseChatsRecord.collection.doc();
                await flowiseChatsRecordReference
                    .set(createFlowiseChatsRecordData(
                  userId: loggedIn
                      ? currentUserReference?.id
                      : FFAppState().nonLoggedInSessionId,
                  role: 'ai',
                  text: _model.textController.text,
                  createdTime: getCurrentTimestamp,
                  sessionId: valueOrDefault<String>(
                    widget.sessionDoc?.reference.id,
                    'notSet',
                  ),
                  threadId: valueOrDefault<String>(
                    widget.sessionDoc?.threads.first.threadId,
                    'notSet',
                  ),
                  companyName: valueOrDefault<String>(
                    widget.companyDoc?.reference.id,
                    'notSet',
                  ),
                  chatType: valueOrDefault<String>(
                    FFAppState().chatType,
                    'none',
                  ),
                  companyDocId: valueOrDefault<String>(
                    widget.companyDoc?.reference.id,
                    'notSet',
                  ),
                  threadDetails: createThreadsStruct(
                    threadId: valueOrDefault<String>(
                      FFAppState().selectedThreadId,
                      'notSetThread',
                    ),
                    threadName: 'Welcome Chat',
                    clearUnsetFields: false,
                    create: true,
                  ),
                ));
                _model.createdThread = FlowiseChatsRecord.getDocumentFromData(
                    createFlowiseChatsRecordData(
                      userId: loggedIn
                          ? currentUserReference?.id
                          : FFAppState().nonLoggedInSessionId,
                      role: 'ai',
                      text: _model.textController.text,
                      createdTime: getCurrentTimestamp,
                      sessionId: valueOrDefault<String>(
                        widget.sessionDoc?.reference.id,
                        'notSet',
                      ),
                      threadId: valueOrDefault<String>(
                        widget.sessionDoc?.threads.first.threadId,
                        'notSet',
                      ),
                      companyName: valueOrDefault<String>(
                        widget.companyDoc?.reference.id,
                        'notSet',
                      ),
                      chatType: valueOrDefault<String>(
                        FFAppState().chatType,
                        'none',
                      ),
                      companyDocId: valueOrDefault<String>(
                        widget.companyDoc?.reference.id,
                        'notSet',
                      ),
                      threadDetails: createThreadsStruct(
                        threadId: valueOrDefault<String>(
                          FFAppState().selectedThreadId,
                          'notSetThread',
                        ),
                        threadName: 'Welcome Chat',
                        clearUnsetFields: false,
                        create: true,
                      ),
                    ),
                    flowiseChatsRecordReference);

                setState(() {});
              },
            ),
          ],
        ),
      ],
    );
  }
}
