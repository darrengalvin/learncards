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

// convertListToJson.dart

Future<List<dynamic>> convertListToJson(
    List<ChatResponseStruct> responseList) async {
  // Log the incoming responseList
  print('convertListToJson - Incoming responseList: $responseList');

  // convert responseList to list of json body
  List<dynamic> jsonList = [];

  for (var response in responseList) {
    Map<String, dynamic> jsonBody = {
      "role": response.role,
      "content": response.content,
    };
    jsonList.add(jsonBody);

    // Log each converted jsonBody
    print('convertListToJson - Converted jsonBody: $jsonBody');
  }

  // Log the final jsonList before returning
  print('convertListToJson - Final jsonList: $jsonList');

  return jsonList;
}
