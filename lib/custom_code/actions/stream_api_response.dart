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

// Assuming other required FlutterFlow imports and custom actions are already defined above

final _client = http.Client();

bool isSimulationMode =
    false; // Toggle this to switch between simulation and real API

Future<void> streamApiResponse(
    List<dynamic> jsonBody, Future<dynamic> Function() callbackAction) async {
  if (isSimulationMode) {
    await simulateStreamApiResponse(callbackAction);
  } else {
    final url = 'https://api.openai.com/v1/chat/completions';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${FFAppState().apiKey}',
    };

    String body = getApiBody(jsonBody);
    var request = http.Request("POST", Uri.parse(url))
      ..headers.addAll(headers)
      ..body = body;

    try {
      await for (var response in _client.send(request).asStream()) {
        response.stream.transform(utf8.decoder).listen((value) {
          addToChatHistory(data: value, callbackAction: callbackAction);
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

Future<void> simulateStreamApiResponse(
    Future<dynamic> Function() callbackAction) async {
  // Simulate multiple chunks
  List<String> simulatedChunks = List.generate(
      10, // Number of chunks
      (index) =>
          '{"choices": [{"message": {"role": "assistant", "content": "Simulated response $index"}}]}');

  // Process each chunk with a delay to simulate streaming
  for (String chunk in simulatedChunks) {
    await Future.delayed(
        Duration(seconds: 1)); // Delay to simulate time between chunks
    addToChatHistory(data: chunk, callbackAction: callbackAction);
  }
}

// void addToChatHistory({required String data, required dynamic callbackAction}) {
//   print("Processing chunk: $data"); // Log the raw data chunk

//   final response = jsonDecode(data);

//   if (response['choices'] != null) {
//     for (var choice in response['choices']) {
//       if (choice['message'] != null) {
//         final role = choice['message']['role'];
//         final content = choice['message']['content'];

//         final chatResponse = ChatResponseStruct(role: role, content: content);
//         FFAppState().chatHistory.add(chatResponse);

//         print("Processed chat response: Role: $role, Content: $content");
//       } else {
//         print("Message field not found in choice: ${choice.keys}");
//       }
//     }
//     print("Updated chat history: ${FFAppState().chatHistory}");
//   } else {
//     print("Choices field not found in response: ${response.keys}");
//   }

//   print("Executing callbackAction");
//   callbackAction();
// }

//GPT 3 STUFF

// String getApiBody(List<dynamic> jsonBody) {
//   return jsonEncode({
//     "model": "gpt-3.5-turbo",
//     "messages": jsonBody,
//   });
// }

void addToChatHistory({required String data, required dynamic callbackAction}) {
  print("Received chunk for processing: $data");

  final response = jsonDecode(data);
  print("Decoded response: $response");

  if (response['choices'] != null) {
    print("Found 'choices' in response.");

    for (var choice in response['choices']) {
      print("Processing choice: $choice");

      if (choice['delta'] != null) {
        final role = choice['delta']['role'] ?? 'assistant';
        final content = choice['delta']['content'];

        final chatResponse = ChatResponseStruct(role: role, content: content);
        FFAppState().chatHistory.add(chatResponse);

        print("Added to chat history: Role: $role, Content: $content");
      } else {
        print("Delta field not found in choice: ${choice.keys}");
      }
    }

    print("Updated chat history: ${FFAppState().chatHistory}");
  } else {
    print("Choices field not found in response: ${response.keys}");
  }

  print("About to execute callbackAction");
  callbackAction();
}

String getApiBody(dynamic jsonBody) {
  String body = jsonEncode({
    "model": "gpt-4-1106-preview", // Keeping your specific model
    "messages": jsonBody,
    "stream": true,
  });
  return body;
}

class ContentResponse {
  String? id;
  String? object;
  int? created;
  String? model;
  List<Choices>? choices;

  ContentResponse(
      {this.id, this.object, this.created, this.model, this.choices});

  factory ContentResponse.fromJson(Map<String, dynamic> json) {
    return ContentResponse(
      id: json['id'],
      object: json['object'],
      created: json['created'],
      model: json['model'],
      choices:
          (json['choices'] as List?)?.map((e) => Choices.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'object': object,
      'created': created,
      'model': model,
      'choices': choices?.map((v) => v.toJson()).toList(),
    };
  }
}

class Choices {
  int? index;
  Delta? delta;
  String? finishReason;

  Choices({this.index, this.delta, this.finishReason});

  factory Choices.fromJson(Map<String, dynamic> json) {
    return Choices(
      index: json['index'],
      delta: json['delta'] != null ? Delta.fromJson(json['delta']) : null,
      finishReason: json['finish_reason'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      if (delta != null) 'delta': delta!.toJson(),
      'finish_reason': finishReason,
    };
  }
}

class Delta {
  String? content;

  Delta({this.content});

  factory Delta.fromJson(Map<String, dynamic> json) {
    return Delta(
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
    };
  }
}
