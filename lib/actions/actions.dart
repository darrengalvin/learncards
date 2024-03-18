import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future selectVideo(BuildContext context) async {}

Future<bool?> updateToggleValue(
  BuildContext context, {
  required bool? currentValue,
}) async {
  logFirebaseEvent('updateToggleValue_update_app_state');
  FFAppState().tempBoolean = currentValue! ? false : true;

  return null;
}

Future setPageInitialState(
  BuildContext context, {
  required bool? showSnackBar,
  required String? showNotificationsBar,
}) async {}

Future checkQuizStatus(
  BuildContext context, {
  required int? quizId,
  required double? timerTime,
  String? correctAnswer,
  required String? answerGivenRadio,
  required QuizRecord? quizDocument,
}) async {
  if (valueOrDefault<bool>(
        answerGivenRadio != null && answerGivenRadio != '',
        false,
      ) &&
      (correctAnswer != answerGivenRadio)) {
    logFirebaseEvent('CheckQuizStatus_alert_dialog');
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return WebViewAware(
          child: AlertDialog(
            title: Text('Incorrect answer given'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          ),
        );
      },
    );
  } else if (valueOrDefault<bool>(
        answerGivenRadio != null && answerGivenRadio != '',
        false,
      ) &&
      (correctAnswer == answerGivenRadio)) {
    logFirebaseEvent('CheckQuizStatus_alert_dialog');
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return WebViewAware(
          child: AlertDialog(
            title: Text('correct answer given'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          ),
        );
      },
    );
  } else if (valueOrDefault<bool>(
    answerGivenRadio == null || answerGivenRadio == '',
    false,
  )) {
    logFirebaseEvent('CheckQuizStatus_action_block');
    unawaited(
      () async {
        await action_blocks.onQuizStart(
          context,
          quizDocument: quizDocument,
        );
      }(),
    );
  }
}

Future timerEnded(
  BuildContext context, {
  required int? localQuizId,
}) async {
  logFirebaseEvent('timerEnded_alert_dialog');
  unawaited(
    () async {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              title: Text('Timer Ended Chain'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            ),
          );
        },
      );
    }(),
  );
  logFirebaseEvent('timerEnded_update_app_state');
  FFAppState().update(() {
    FFAppState().localQuizId = FFAppState().localQuizId + 1;
    FFAppState().QuizReadyToMoveOn = true;
  });
  logFirebaseEvent('timerEnded_custom_action');
  await actions.timerControl(
    30.0,
    'reset',
  );
}

Future onTimerStop(BuildContext context) async {
  logFirebaseEvent('onTimerStop_alert_dialog');
  unawaited(
    () async {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              title: Text('Timer has stopped'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            ),
          );
        },
      );
    }(),
  );
}

Future onQuizStart(
  BuildContext context, {
  required QuizRecord? quizDocument,
  double? timer,
}) async {
  logFirebaseEvent('onQuizStart_action_block');
  unawaited(
    () async {
      await action_blocks.onTimerStop(context);
    }(),
  );
}

Future endDrawer(BuildContext context) async {}

Future tempStreamingWelcomeUserMessages(
  BuildContext context, {
  required SessionsRecord? sessionsDoc,
}) async {
  logFirebaseEvent('TempStreamingWelcomeUserMessages_update_');
  FFAppState().update(() {
    FFAppState().tempStreamingMessage =
        'I am going to prepare you some content';
  });
  logFirebaseEvent('TempStreamingWelcomeUserMessages_wait__d');
  await Future.delayed(const Duration(milliseconds: 2000));
  logFirebaseEvent('TempStreamingWelcomeUserMessages_update_');
  FFAppState().update(() {
    FFAppState().tempStreamingMessage =
        'Please wait, we will get you on your learning journey shortly';
  });
  logFirebaseEvent('TempStreamingWelcomeUserMessages_wait__d');
  await Future.delayed(const Duration(milliseconds: 3000));
  logFirebaseEvent('TempStreamingWelcomeUserMessages_update_');
  FFAppState().update(() {
    FFAppState().tempStreamingMessage = 'Thinking of some interesting topics';
  });
  logFirebaseEvent('TempStreamingWelcomeUserMessages_wait__d');
  await Future.delayed(const Duration(milliseconds: 2000));
  logFirebaseEvent('TempStreamingWelcomeUserMessages_update_');
  FFAppState().update(() {
    FFAppState().tempStreamingMessage =
        'I have found some great topics you will enjoy learning';
  });
  logFirebaseEvent('TempStreamingWelcomeUserMessages_wait__d');
  await Future.delayed(const Duration(milliseconds: 2000));
  logFirebaseEvent('TempStreamingWelcomeUserMessages_update_');
  FFAppState().update(() {
    FFAppState().tempStreamingMessage = 'Preparing your welcome content';
  });
  logFirebaseEvent('TempStreamingWelcomeUserMessages_wait__d');
  await Future.delayed(const Duration(milliseconds: 3000));
  logFirebaseEvent('TempStreamingWelcomeUserMessages_update_');
  FFAppState().update(() {
    FFAppState().tempStreamingMessage = 'Excellent, we are nearly there';
  });
  logFirebaseEvent('TempStreamingWelcomeUserMessages_wait__d');
  await Future.delayed(const Duration(milliseconds: 3000));
  logFirebaseEvent('TempStreamingWelcomeUserMessages_update_');
  FFAppState().update(() {
    FFAppState().tempStreamingMessage = 'One final step.. ';
  });
  logFirebaseEvent('TempStreamingWelcomeUserMessages_wait__d');
  await Future.delayed(const Duration(milliseconds: 2000));
  logFirebaseEvent('TempStreamingWelcomeUserMessages_update_');
  FFAppState().update(() {
    FFAppState().tempStreamingMessage = 'Getting ready to redirect you.';
  });
  logFirebaseEvent('TempStreamingWelcomeUserMessages_wait__d');
  await Future.delayed(const Duration(milliseconds: 3000));
  logFirebaseEvent('TempStreamingWelcomeUserMessages_update_');
  FFAppState().update(() {
    FFAppState().tempStreamingMessage = '3';
  });
  logFirebaseEvent('TempStreamingWelcomeUserMessages_wait__d');
  await Future.delayed(const Duration(milliseconds: 1000));
  logFirebaseEvent('TempStreamingWelcomeUserMessages_update_');
  FFAppState().update(() {
    FFAppState().tempStreamingMessage = '2';
  });
  logFirebaseEvent('TempStreamingWelcomeUserMessages_wait__d');
  await Future.delayed(const Duration(milliseconds: 1000));
  logFirebaseEvent('TempStreamingWelcomeUserMessages_update_');
  FFAppState().update(() {
    FFAppState().tempStreamingMessage = '1';
  });
  logFirebaseEvent('TempStreamingWelcomeUserMessages_wait__d');
  await Future.delayed(const Duration(milliseconds: 1000));
  logFirebaseEvent('TempStreamingWelcomeUserMessages_update_');
  FFAppState().update(() {
    FFAppState().tempStreamingMessage = '';
  });
}

Future triggerInitialMessage(BuildContext context) async {}

Future getSomeTileNames(
  BuildContext context, {
  required CompaniesRecord? companyDoc,
}) async {
  ApiCallResponse? apiResult5ed;

  logFirebaseEvent('getSomeTileNames_backend_call');
  unawaited(
    () async {
      apiResult5ed = await FlowiseGetTileNameCall.call(
        sessionId: FFAppState().nonLoggedInSessionId,
        systemMessagePrompt: companyDoc?.getTilesPrompt,
        supabaseProjUrl: valueOrDefault<String>(
          companyDoc?.supabaseProjUrl,
          'https://nafya-flowise.alikibao.online/api/v1/prediction/bdae9275-a3cd-49db-9278-2b8f0789aca1',
        ),
        tableName: companyDoc?.tableName,
        queryName: companyDoc?.queryName,
        isLearnCards: companyDoc?.isLearnCards,
        flowiseUrl: valueOrDefault<String>(
          companyDoc?.flowiseUrl,
          'urlNotPresent',
        ),
        threadId: valueOrDefault<String>(
          FFAppState().selectedThreadId,
          'notset',
        ),
        companyDocId: companyDoc?.reference.id,
      );
    }(),
  );
  if ((apiResult5ed?.succeeded ?? true) == true) {
    logFirebaseEvent('getSomeTileNames_alert_dialog');
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return WebViewAware(
          child: AlertDialog(
            title: Text('Tile Names Completed '),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          ),
        );
      },
    );
  }
}

Future welcomeUserInitialContent(
  BuildContext context, {
  required CompaniesRecord? companyDocPassed,
}) async {
  Tilesv2Record? createdTile;
  TileBlocksRecord? createdTileBlock;
  ApiCallResponse? welcomeLetter;

  logFirebaseEvent('welcomeUserInitialContent_backend_call');

  var tilesv2RecordReference = Tilesv2Record.collection.doc();
  await tilesv2RecordReference.set(createTilesv2RecordData(
    createdTime: getCurrentTimestamp,
    updatedTime: getCurrentTimestamp,
    sessionIdUser: valueOrDefault<String>(
      FFAppState().nonLoggedInSessionId,
      '1',
    ),
    title: 'Welcome to your Learning Journey',
    tileTier: 1,
    parentId: companyDocPassed?.primaryTile,
    tileIndex: 0,
    isWelcomeTile: true,
    triggerWeekly: false,
    showDate: getCurrentTimestamp,
  ));
  createdTile = Tilesv2Record.getDocumentFromData(
      createTilesv2RecordData(
        createdTime: getCurrentTimestamp,
        updatedTime: getCurrentTimestamp,
        sessionIdUser: valueOrDefault<String>(
          FFAppState().nonLoggedInSessionId,
          '1',
        ),
        title: 'Welcome to your Learning Journey',
        tileTier: 1,
        parentId: companyDocPassed?.primaryTile,
        tileIndex: 0,
        isWelcomeTile: true,
        triggerWeekly: false,
        showDate: getCurrentTimestamp,
      ),
      tilesv2RecordReference);
  logFirebaseEvent('welcomeUserInitialContent_alert_dialog');
  await showDialog(
    context: context,
    builder: (alertDialogContext) {
      return WebViewAware(
        child: AlertDialog(
          title: Text('Welcome Tile Created'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        ),
      );
    },
  );
  logFirebaseEvent('welcomeUserInitialContent_backend_call');

  var tileBlocksRecordReference = TileBlocksRecord.collection.doc();
  await tileBlocksRecordReference.set(createTileBlocksRecordData(
    createdTime: getCurrentTimestamp,
    updatedTime: getCurrentTimestamp,
    blockIndex: 0,
    tileId: createdTile?.reference.id,
    htmlContent:
        '<!DOCTYPE html> <html> <head>     <title>Content Generation in Progress</title>     <style>         body {             font-family: Arial, sans-serif;             background-color: #f2f2f2;             text-align: center;             padding: 50px;         }         .message-box {             background-color: #fff;             margin: auto;             padding: 20px;             border-radius: 8px;             box-shadow: 0 4px 8px rgba(0,0,0,0.1);             max-width: 400px;         }         .message-header {             font-size: 24px;             color: #333;             margin-bottom: 10px;         }         .message-body {             font-size: 16px;             color: #666;         }         .loader {             border: 4px solid #f3f3f3;             border-radius: 50%;             border-top: 4px solid #3498db;             width: 30px;             height: 30px;             -webkit-animation: spin 2s linear infinite;             animation: spin 2s linear infinite;             margin: 10px auto;         }         @-webkit-keyframes spin {             0% { -webkit-transform: rotate(0deg); }             100% { -webkit-transform: rotate(360deg); }         }         @keyframes spin {             0% { transform: rotate(0deg); }             100% { transform: rotate(360deg); }         }     </style> </head> <body>     <div class=\"message-box\">         <div class=\"message-header\">Generating Your Content</div>         <div class=\"loader\"></div>         <div class=\"message-body\">             We are still generating your content, it should take no more than a minute or two. Hang tight!         </div>     </div> </body> </html>',
  ));
  createdTileBlock = TileBlocksRecord.getDocumentFromData(
      createTileBlocksRecordData(
        createdTime: getCurrentTimestamp,
        updatedTime: getCurrentTimestamp,
        blockIndex: 0,
        tileId: createdTile?.reference.id,
        htmlContent:
            '<!DOCTYPE html> <html> <head>     <title>Content Generation in Progress</title>     <style>         body {             font-family: Arial, sans-serif;             background-color: #f2f2f2;             text-align: center;             padding: 50px;         }         .message-box {             background-color: #fff;             margin: auto;             padding: 20px;             border-radius: 8px;             box-shadow: 0 4px 8px rgba(0,0,0,0.1);             max-width: 400px;         }         .message-header {             font-size: 24px;             color: #333;             margin-bottom: 10px;         }         .message-body {             font-size: 16px;             color: #666;         }         .loader {             border: 4px solid #f3f3f3;             border-radius: 50%;             border-top: 4px solid #3498db;             width: 30px;             height: 30px;             -webkit-animation: spin 2s linear infinite;             animation: spin 2s linear infinite;             margin: 10px auto;         }         @-webkit-keyframes spin {             0% { -webkit-transform: rotate(0deg); }             100% { -webkit-transform: rotate(360deg); }         }         @keyframes spin {             0% { transform: rotate(0deg); }             100% { transform: rotate(360deg); }         }     </style> </head> <body>     <div class=\"message-box\">         <div class=\"message-header\">Generating Your Content</div>         <div class=\"loader\"></div>         <div class=\"message-body\">             We are still generating your content, it should take no more than a minute or two. Hang tight!         </div>     </div> </body> </html>',
      ),
      tileBlocksRecordReference);
  logFirebaseEvent('welcomeUserInitialContent_alert_dialog');
  await showDialog(
    context: context,
    builder: (alertDialogContext) {
      return WebViewAware(
        child: AlertDialog(
          title: Text('Tile Block Created'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        ),
      );
    },
  );
  logFirebaseEvent('welcomeUserInitialContent_backend_call');
  welcomeLetter = await FlowiseGroup.flowiseAPICallCall.call(
    systemMessagePrompt: companyDocPassed?.welcomeLetterPrompt,
    sessionId: FFAppState().nonLoggedInSessionId,
    supabaseMetadataFilter: 'unknown',
  );
  while (FlowiseGroup.flowiseAPICallCall.text(
            (welcomeLetter?.jsonBody ?? ''),
          ) ==
          null ||
      FlowiseGroup.flowiseAPICallCall.text(
            (welcomeLetter?.jsonBody ?? ''),
          ) ==
          '') {
    logFirebaseEvent('welcomeUserInitialContent_wait__delay');
    await Future.delayed(const Duration(milliseconds: 1000));
  }
  logFirebaseEvent('welcomeUserInitialContent_alert_dialog');
  await showDialog(
    context: context,
    builder: (alertDialogContext) {
      return WebViewAware(
        child: AlertDialog(
          title: Text('API Completed swith content '),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        ),
      );
    },
  );
  logFirebaseEvent('welcomeUserInitialContent_backend_call');

  await createdTileBlock!.reference.update(createTileBlocksRecordData(
    htmlContent: FlowiseGroup.flowiseAPICallCall.text(
      (welcomeLetter?.jsonBody ?? ''),
    ),
  ));
  logFirebaseEvent('welcomeUserInitialContent_alert_dialog');
  await showDialog(
    context: context,
    builder: (alertDialogContext) {
      return WebViewAware(
        child: AlertDialog(
          title: Text('API Content Updated on Welcome Tile'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        ),
      );
    },
  );
}

Future tempStreamingBlocks(
  BuildContext context, {
  required TileBlocksRecord? createdTileBlock,
  required Tilesv2Record? tilev2,
}) async {
  logFirebaseEvent('tempStreamingBlocks_update_app_state');
  FFAppState().update(() {
    FFAppState().tempStreamingMessage = 'Generating Your Content';
  });
  logFirebaseEvent('tempStreamingBlocks_wait__delay');
  await Future.delayed(const Duration(milliseconds: 2000));
  while (tilev2?.stopStreaming != true) {
    logFirebaseEvent('tempStreamingBlocks_update_app_state');
    FFAppState().update(() {
      FFAppState().tempStreamingMessage = 'Now the first paragraph';
    });
    logFirebaseEvent('tempStreamingBlocks_wait__delay');
    await Future.delayed(const Duration(milliseconds: 2000));
    logFirebaseEvent('tempStreamingBlocks_update_app_state');
    FFAppState().update(() {
      FFAppState().tempStreamingMessage = 'Setting out the page structure';
    });
    logFirebaseEvent('tempStreamingBlocks_wait__delay');
    await Future.delayed(const Duration(milliseconds: 2000));
    logFirebaseEvent('tempStreamingBlocks_update_app_state');
    FFAppState().update(() {
      FFAppState().tempStreamingMessage = 'Nearly there';
    });
    logFirebaseEvent('tempStreamingBlocks_wait__delay');
    await Future.delayed(const Duration(milliseconds: 3000));
    while (tilev2?.stopStreaming != true) {
      logFirebaseEvent('tempStreamingBlocks_update_app_state');
      FFAppState().update(() {
        FFAppState().tempStreamingMessage = 'Generating Content .';
      });
      logFirebaseEvent('tempStreamingBlocks_wait__delay');
      await Future.delayed(const Duration(milliseconds: 1000));
      logFirebaseEvent('tempStreamingBlocks_update_app_state');
      FFAppState().update(() {
        FFAppState().tempStreamingMessage = '';
      });
      logFirebaseEvent('tempStreamingBlocks_wait__delay');
      await Future.delayed(const Duration(milliseconds: 2000));
      logFirebaseEvent('tempStreamingBlocks_update_app_state');
      FFAppState().update(() {
        FFAppState().tempStreamingMessage = 'Generating Content ..';
      });
      logFirebaseEvent('tempStreamingBlocks_wait__delay');
      await Future.delayed(const Duration(milliseconds: 2000));
      logFirebaseEvent('tempStreamingBlocks_update_app_state');
      FFAppState().update(() {
        FFAppState().tempStreamingMessage = 'Generating Content ...';
      });
      logFirebaseEvent('tempStreamingBlocks_wait__delay');
      await Future.delayed(const Duration(milliseconds: 2000));
    }
  }
  logFirebaseEvent('tempStreamingBlocks_update_app_state');
  FFAppState().update(() {
    FFAppState().tempStreamingMessage = '';
  });
  logFirebaseEvent('tempStreamingBlocks_backend_call');

  await createdTileBlock!.reference.update(createTileBlocksRecordData(
    stopStreaming: false,
  ));
  logFirebaseEvent('tempStreamingBlocks_navigate_to');

  context.pushNamed(
    'Library-fixed',
    extra: <String, dynamic>{
      kTransitionInfoKey: TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      ),
    },
  );
}

Future drawerOpen(BuildContext context) async {
  logFirebaseEvent('drawerOpen_close_dialog,_drawer,_etc');
  Navigator.pop(context);
}

Future dismissBottomSheet(BuildContext context) async {}

Future buildingChatMessages(BuildContext context) async {
  logFirebaseEvent('buildingChatMessages_wait__delay');
  await Future.delayed(const Duration(milliseconds: 2000));
  logFirebaseEvent('buildingChatMessages_backend_call');

  await FlowiseChatsRecord.collection.doc().set(createFlowiseChatsRecordData(
        role: 'system',
        text: 'I have found some great topics you will enjoy learning',
        createdTime: getCurrentTimestamp,
        sessionId: FFAppState().nonLoggedInSessionId,
        tileId: '',
        threadId: FFAppState().selectedThreadId,
        userId: FFAppState().nonLoggedInSessionId,
      ));
  logFirebaseEvent('buildingChatMessages_wait__delay');
  await Future.delayed(const Duration(milliseconds: 3000));
  logFirebaseEvent('buildingChatMessages_backend_call');

  await FlowiseChatsRecord.collection.doc().set(createFlowiseChatsRecordData(
        role: 'system',
        text: 'Excellent, we are nearly there',
        createdTime: getCurrentTimestamp,
        sessionId: FFAppState().nonLoggedInSessionId,
        tileId: '',
        threadId: FFAppState().selectedThreadId,
        userId: FFAppState().nonLoggedInSessionId,
      ));
  logFirebaseEvent('buildingChatMessages_wait__delay');
  await Future.delayed(const Duration(milliseconds: 3000));
  logFirebaseEvent('buildingChatMessages_backend_call');

  await FlowiseChatsRecord.collection.doc().set(createFlowiseChatsRecordData(
        role: 'system',
        text: 'Excellent, we are nearly there',
        createdTime: getCurrentTimestamp,
        sessionId: FFAppState().nonLoggedInSessionId,
        tileId: '',
        threadId: FFAppState().selectedThreadId,
        userId: FFAppState().nonLoggedInSessionId,
      ));
  logFirebaseEvent('buildingChatMessages_wait__delay');
  await Future.delayed(const Duration(milliseconds: 2000));
  logFirebaseEvent('buildingChatMessages_backend_call');

  await FlowiseChatsRecord.collection.doc().set(createFlowiseChatsRecordData(
        role: 'system',
        text: 'One final step.. ',
        createdTime: getCurrentTimestamp,
        sessionId: FFAppState().nonLoggedInSessionId,
        tileId: '',
        threadId: FFAppState().selectedThreadId,
        userId: FFAppState().nonLoggedInSessionId,
      ));
  logFirebaseEvent('buildingChatMessages_wait__delay');
  await Future.delayed(const Duration(milliseconds: 3000));
  logFirebaseEvent('buildingChatMessages_backend_call');

  await FlowiseChatsRecord.collection.doc().set(createFlowiseChatsRecordData(
        role: 'system',
        text: 'Getting ready to redirect you.',
        createdTime: getCurrentTimestamp,
        sessionId: FFAppState().nonLoggedInSessionId,
        tileId: '',
        threadId: FFAppState().selectedThreadId,
        userId: FFAppState().nonLoggedInSessionId,
      ));
  logFirebaseEvent('buildingChatMessages_wait__delay');
  await Future.delayed(const Duration(milliseconds: 1000));
  logFirebaseEvent('buildingChatMessages_backend_call');

  await FlowiseChatsRecord.collection.doc().set(createFlowiseChatsRecordData(
        role: 'system',
        text: '3',
        createdTime: getCurrentTimestamp,
        sessionId: FFAppState().nonLoggedInSessionId,
        tileId: '',
        threadId: FFAppState().selectedThreadId,
        userId: FFAppState().nonLoggedInSessionId,
      ));
  logFirebaseEvent('buildingChatMessages_wait__delay');
  await Future.delayed(const Duration(milliseconds: 1000));
  logFirebaseEvent('buildingChatMessages_backend_call');

  await FlowiseChatsRecord.collection.doc().set(createFlowiseChatsRecordData(
        role: 'system',
        text: '2',
        createdTime: getCurrentTimestamp,
        sessionId: FFAppState().nonLoggedInSessionId,
        tileId: '',
        threadId: FFAppState().selectedThreadId,
        userId: FFAppState().nonLoggedInSessionId,
      ));
  logFirebaseEvent('buildingChatMessages_wait__delay');
  await Future.delayed(const Duration(milliseconds: 1000));
  logFirebaseEvent('buildingChatMessages_backend_call');

  await FlowiseChatsRecord.collection.doc().set(createFlowiseChatsRecordData(
        role: 'system',
        text: '1',
        createdTime: getCurrentTimestamp,
        sessionId: FFAppState().nonLoggedInSessionId,
        tileId: '',
        threadId: FFAppState().selectedThreadId,
        userId: FFAppState().nonLoggedInSessionId,
      ));
  logFirebaseEvent('buildingChatMessages_backend_call');

  await FlowiseChatsRecord.collection.doc().set(createFlowiseChatsRecordData(
        role: 'system',
        text: 'I am going to prepare you some content',
        createdTime: getCurrentTimestamp,
        sessionId: FFAppState().nonLoggedInSessionId,
        tileId: '',
        threadId: FFAppState().selectedThreadId,
        userId: FFAppState().nonLoggedInSessionId,
      ));
}

Future scroll(BuildContext context) async {}
