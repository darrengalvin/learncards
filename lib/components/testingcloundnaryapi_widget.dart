import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'testingcloundnaryapi_model.dart';
export 'testingcloundnaryapi_model.dart';

class TestingcloundnaryapiWidget extends StatefulWidget {
  const TestingcloundnaryapiWidget({
    super.key,
    this.blockId,
  });

  final TileBlocksRecord? blockId;

  @override
  State<TestingcloundnaryapiWidget> createState() =>
      _TestingcloundnaryapiWidgetState();
}

class _TestingcloundnaryapiWidgetState
    extends State<TestingcloundnaryapiWidget> {
  late TestingcloundnaryapiModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestingcloundnaryapiModel());

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

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              valueOrDefault<String>(
                FFAppState().convertedVideoUrl,
                'rede',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('TESTINGCLOUNDNARYAPI_BUTTON_BTN_ON_TAP');
                logFirebaseEvent('Button_alert_dialog');
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        title: const Text('trying now'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: const Text('Ok'),
                          ),
                        ],
                      ),
                    );
                  },
                );
                logFirebaseEvent('Button_update_app_state');
                setState(() {
                  FFAppState().convertedVideoUrl = widget.blockId!.blockId;
                });
                logFirebaseEvent('Button_alert_dialog');
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        title: const Text('tried'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: const Text('Ok'),
                          ),
                        ],
                      ),
                    );
                  },
                );
                logFirebaseEvent('Button_alert_dialog');
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        title: Text(
                            'Taken Video URLand converted it to a ${FFAppState().convertedVideoUrl}'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: const Text('Ok'),
                          ),
                        ],
                      ),
                    );
                  },
                );
                logFirebaseEvent('Button_backend_call');
                _model.sign = await CloudinaryGetSignatureCall.call();
                if ((_model.sign?.succeeded ?? true)) {
                  logFirebaseEvent('Button_backend_call');
                  _model.transcribe = await CloudinaryTranscribeCall.call(
                    timestamp: CloudinaryGetSignatureCall.timestamp(
                      (_model.sign?.jsonBody ?? ''),
                    ).toString(),
                    signature: CloudinaryGetSignatureCall.signature(
                      (_model.sign?.jsonBody ?? ''),
                    ),
                    file: FFAppState().convertedVideoUrl,
                    rawConvert: 'google_speech',
                    apiKey: '617667519725416',
                  );
                  if ((_model.transcribe?.succeeded ?? true)) {
                    logFirebaseEvent('Button_alert_dialog');
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return WebViewAware(
                          child: AlertDialog(
                            title: const Text('Got Public ID'),
                            content: Text(CloudinaryTranscribeCall.publicid(
                              (_model.transcribe?.jsonBody ?? ''),
                            )!),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: const Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                    while (CloudinaryAttemptAssetCall.status(
                          (_model.attemptAsset?.jsonBody ?? ''),
                        ) !=
                        'complete') {
                      logFirebaseEvent('Button_backend_call');
                      _model.attemptAsset =
                          await CloudinaryAttemptAssetCall.call(
                        publicId: CloudinaryTranscribeCall.publicid(
                          (_model.transcribe?.jsonBody ?? ''),
                        ),
                      );
                      logFirebaseEvent('Button_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return WebViewAware(
                            child: AlertDialog(
                              title: Text(CloudinaryAttemptAssetCall.status(
                                (_model.attemptAsset?.jsonBody ?? ''),
                              )!),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                      logFirebaseEvent('Button_wait__delay');
                      await Future.delayed(const Duration(milliseconds: 3000));
                    }
                    logFirebaseEvent('Button_alert_dialog');
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return WebViewAware(
                          child: AlertDialog(
                            title: const Text('Loop Finished '),
                            content: Text(
                                'PublicID. : ${CloudinaryTranscribeCall.publicid(
                              (_model.transcribe?.jsonBody ?? ''),
                            )}Version ID:  ${CloudinaryTranscribeCall.versionid(
                              (_model.transcribe?.jsonBody ?? ''),
                            )?.toString()}'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: const Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                    logFirebaseEvent('Button_wait__delay');
                    await Future.delayed(const Duration(milliseconds: 3000));
                    logFirebaseEvent('Button_backend_call');
                    _model.getTranscription =
                        await CloudinaryGetTranscriptionCall.call(
                      publicId: CloudinaryTranscribeCall.publicid(
                        (_model.transcribe?.jsonBody ?? ''),
                      ),
                      version: CloudinaryTranscribeCall.versionid(
                        (_model.transcribe?.jsonBody ?? ''),
                      )?.toString(),
                    );
                    if ((_model.getTranscription?.succeeded ?? true)) {
                      logFirebaseEvent('Button_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return WebViewAware(
                            child: AlertDialog(
                              title: const Text('TRANSCRIBE Obtained '),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                      logFirebaseEvent('Button_backend_call');

                      await QuizRecord.collection
                          .doc()
                          .set(createQuizRecordData(
                            correctAnswer: CloudinaryGetTranscriptionCall
                                .transcriptnotlist(
                              (_model.getTranscription?.jsonBody ?? ''),
                            ),
                            correctAnswers:
                                CloudinaryGetTranscriptionCall.transcript(
                              (_model.getTranscription?.jsonBody ?? ''),
                            )?.length,
                          ));
                      logFirebaseEvent('Button_update_component_state');
                      _model.updatePage(() {
                        _model.jsonResponse =
                            (_model.getTranscription?.jsonBody ?? '')
                                .toList()
                                .cast<dynamic>();
                        _model.transcriptList =
                            CloudinaryGetTranscriptionCall.transcript(
                          (_model.getTranscription?.jsonBody ?? ''),
                        )!
                                .toList()
                                .cast<String>();
                      });
                      logFirebaseEvent('Button_update_app_state');
                      _model.updatePage(() {});
                      logFirebaseEvent('Button_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return WebViewAware(
                            child: AlertDialog(
                              title: const Text('ready to send json to AI'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      logFirebaseEvent('Button_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return WebViewAware(
                            child: AlertDialog(
                              title: const Text('failed to get transcription'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                      logFirebaseEvent('Button_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return WebViewAware(
                            child: AlertDialog(
                              title: Text(
                                  (_model.getTranscription?.statusCode ?? 200)
                                      .toString()),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                      logFirebaseEvent('Button_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return WebViewAware(
                            child: AlertDialog(
                              title: Text(
                                  (_model.getTranscription?.jsonBody ?? '')
                                      .toString()),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                      logFirebaseEvent('Button_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return WebViewAware(
                            child: AlertDialog(
                              title: Text(
                                  (_model.getTranscription?.bodyText ?? '')),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  } else {
                    logFirebaseEvent('Button_alert_dialog');
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return WebViewAware(
                          child: AlertDialog(
                            title: const Text('FAILED'),
                            content: Text((_model.transcribe?.succeeded ?? true)
                                .toString()),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: const Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                    logFirebaseEvent('Button_alert_dialog');
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return WebViewAware(
                          child: AlertDialog(
                            title: const Text('FAILED'),
                            content: Text(
                                (_model.transcribe?.jsonBody ?? '').toString()),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: const Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                    logFirebaseEvent('Button_alert_dialog');
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return WebViewAware(
                          child: AlertDialog(
                            title: const Text('FAILED'),
                            content: Text((_model.transcribe?.bodyText ?? '')),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: const Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                } else {
                  logFirebaseEvent('Button_alert_dialog');
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return WebViewAware(
                        child: AlertDialog(
                          title: const Text('sign failed'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: const Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }

                setState(() {});
              },
              text: 'Button',
              options: FFButtonOptions(
                height: 40.0,
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily),
                    ),
                elevation: 3.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Builder(
              builder: (context) {
                final transcriptdetails = _model.transcriptList.toList();
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(transcriptdetails.length,
                      (transcriptdetailsIndex) {
                    final transcriptdetailsItem =
                        transcriptdetails[transcriptdetailsIndex];
                    return Text(
                      valueOrDefault<String>(
                        transcriptdetailsItem,
                        'TRANSCRIPT ',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    );
                  }),
                );
              },
            ),
            Builder(
              builder: (context) {
                final json = _model.jsonResponse.toList();
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(json.length, (jsonIndex) {
                    final jsonItem = json[jsonIndex];
                    return Text(
                      valueOrDefault<String>(
                        jsonItem.toString(),
                        'JSON',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    );
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
