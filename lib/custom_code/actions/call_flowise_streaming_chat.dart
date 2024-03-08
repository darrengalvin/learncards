// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;

Future callFlowiseStreamingChat(
  String? question,
  String? systemPrompt,
  String? shopId,
  String? inputKey,
  String? outputKey,
  String? supabaseProjUrl,
  String? tableName,
  String? supabaseApiKey,
  String? queryName,
  bool? isLearnCards,
  Future<dynamic> Function()? callbackAction,
  Future<dynamic> Function() streamingCompleteAtion,
  String? supabaseMetadataFilter,
) async {
  // Add your function code here!
  // Initialize Socket.IO client
  IO.Socket socket =
      IO.io('https://nafya-flowise.alikibao.online', <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
  });

  // Listen to Socket.IO events
  socket.on('start', (_) => print('start'));
  // insert an empy object in the flowiseMessages appState set it as and updatable currentMessage

  // variable to add each new token to
  String incomingTokens = '';

  FlowiseMessagesStruct currentMessage = FlowiseMessagesStruct(
    message: "Checking...",
    role: 'ai',
    // productIdsList: [],
  );
  print('generated Struct');

  // Add currentMessage to the AppState
  FFAppState().flowiseMessages.add(currentMessage);

  // // Add currentMessage to the AppState (Uncomment and adjust this part)
  // FFAppState().update(() {
  //   FFAppState().flowiseMessages.add(currentMessage);
  // });

  socket.on('token', (token) {
    print('token: $token');
    // accumulate tokens in incomingTokens
    incomingTokens += '$token';

    // Update the message of currentMessage in AppState
    FFAppState().update(() {
      // Find the current message in AppState and update its content
      int indexToUpdate = FFAppState().flowiseMessages.indexOf(currentMessage);
      if (indexToUpdate != -1) {
        FFAppState().flowiseMessages[indexToUpdate].message = incomingTokens;
      }
    });

    print('adding tokens');

    // callback action used to scroll by update ui
    // https://youtu.be/ji2XbsDT_PY?t=727
    callbackAction!();
  });

  socket.on('sourceDocuments',
      (sourceDocuments) => print('sourceDocuments: $sourceDocuments'));
  socket.on('end', (_) => print('end'));

  // Connect to Socket.IO
  socket.connect();

  // Wait for connection to be established
  await Future.delayed(Duration(seconds: 2));

  //define override config which should look like this "overrideConfig": {"sessionId": "123"}
  Map<String, dynamic> overrideConfig = {
    "sessionId": FFAppState().nonLoggedInSessionId,
    "systemMessagePrompt": systemPrompt,
    "supabaseMetadataFilter": {"type": supabaseMetadataFilter}
  };

  // 1. Display the user's message in the chat UI.
  if (question == null) {
    print("User message is null. Aborting.");
    return '';
  }

  // Prepare the payload for the API call
  var body = json.encode({
    'question': question,
    'socketIOClientId': socket.id,
    'overrideConfig': overrideConfig,
    'inputKey': inputKey,
    'outputKey': outputKey,
    'supabaseProjUrl': supabaseProjUrl,
    'tableName': tableName,
    'supabaseApiKey': supabaseApiKey,
    'queryName': queryName,
    'isLearnCards': isLearnCards
  });

  // Send message to Flowise API
  var response = await http.post(
    Uri.parse(
        'https://nafya-flowise.alikibao.online/api/v1/prediction/bdae9275-a3cd-49db-9278-2b8f0789aca1'),
    //'https://nafya-flowise.alikibao.online/api/v1/prediction/c11114c4-237b-4525-b56c-f094432784b2'),
    //        'https://nafya-flowise.alikibao.online/api/v1/prediction/38b321da-5e0e-46d4-a4ec-6938235f2446'),

    headers: {
      'Content-Type': 'application/json',
    },
    body: body,
  );

  // Completer<FlowiseMessagesStruct> completer = Completer();

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    String message = data['text'] ?? 'No message provided';
    List<int> productIdsList = [];
    if (data['sourceDocuments'] != null) {
      for (var doc in data['sourceDocuments']) {
        if (doc['metadata'] != null && doc['metadata']['product_id'] != null) {
          productIdsList.add(doc['metadata']['product_id']);
        }
      }
    }

    // Create a new FlowiseMessagesStruct
    FlowiseMessagesStruct currentMessage = FlowiseMessagesStruct(
      message: message,
      role: 'ai',
      // productIdsList: productIdsList,
    );

    // call this to mark streaming as done
    streamingCompleteAtion();

    // delete the last message in the flowiseMessages appState
    FFAppState().update(() {
      FFAppState().flowiseMessages.removeLast();
    });

    // Add newMessage to the AppState (Uncomment and adjust this part)
    FFAppState().update(() {
      FFAppState().flowiseMessages.add(currentMessage);
    });

    // call this to mark streaming as done
    streamingCompleteAtion();

    return message;
  } else {
    print("Failed to send the message. Status Code: ${response.statusCode}");
  }

  // Disconnect the Socket.IO connection
  socket.disconnect();

  // call this to mark streaming as done
  streamingCompleteAtion();
  return 'Error: Failed to send the message with Status Code: ${response.statusCode}';

  // return completer.future;
}
