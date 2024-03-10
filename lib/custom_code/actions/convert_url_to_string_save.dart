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

Future<void> convertUrlToStringSave(
    BuildContext context, String videoPath) async {
  // Explicitly convert videoPath to a String, even if it's already a String type
  String stringUrl = videoPath.toString();

  // Save the string URL to FFAppState
  FFAppState().convertedVideoUrl = stringUrl;

  // If FFAppState is a ChangeNotifier, you would call notifyListeners here
  // FFAppState().notifyListeners();

  // Show an alert with the saved value
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Video URL Saved'),
        content: Text(stringUrl), // Show the saved video URL
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
            },
          ),
        ],
      );
    },
  );
}
