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

import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> onPageLoadCheckUrl() async {
  String pageUrl;

  if (kIsWeb) {
    // Execute web-only logic
    // Since we can't use dart:html, let's workaround by using Uri.base for web environments
    pageUrl = Uri.base.toString();
  } else {
    // Mobile or other platforms logic
    // Since there's no direct URL in mobile apps, use a placeholder or relevant action
    pageUrl = "Non-web platform context information";
  }

  debugPrint('Current context information: $pageUrl');
  FFAppState().selectedCompanyUrl = pageUrl;

  // No need for setState(), relying on FlutterFlow's state management
}
