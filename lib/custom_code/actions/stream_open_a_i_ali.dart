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

import 'package:http/http.dart' as http;

Future<void> streamOpenAIAli(Future Function()? callbackAction) async {
  final Uri uri = Uri.parse('https://api.openai.com/v1/chat/completions');
  final String openaiApiKey = 'your_api_key_here';

  final client = http.Client();
  final request = http.Request('POST', uri)
    ..headers['Content-Type'] = 'application/json'
    ..headers['Authorization'] = 'Bearer $openaiApiKey'
    ..body =
        '{"model": "gpt-4-0613", "messages": [{"role": "user", "content": "Hello!"}], "stream": true}';

  try {
    final streamedResponse = await client.send(request);
    streamedResponse.stream
        .transform(utf8.decoder)
        .transform(LineSplitter())
        .listen(
      (line) {
        if (line.isNotEmpty) {
          final json = jsonDecode(line);
          // Handle your data here.
          // Update your FFAppState here with the new data.
        }
      },
      onError: (error) {
        print('Error: $error');
        client.close();
      },
      onDone: () {
        client.close();
        if (callbackAction != null) {
          callbackAction();
        }
      },
      cancelOnError: true, // closes the connection on error
    );
  } catch (e) {
    print('Error calling OpenAI: $e');
    client.close();
  }
}
