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

import 'dart:async';

import '/custom_code/widgets/timer_model.dart'; // Imports other custom widgets

// TimerModel singleton definition (make sure this is defined somewhere accessible)
// timer_control.dart

Future<void> timerControl(double countFrom, String action) async {
  TimerModel timerModel = TimerModel(); // Gets the singleton instance

  switch (action) {
    case 'start':
      timerModel.setInitialTime(countFrom);
      timerModel.startTimer();
      break;
    case 'stop':
      timerModel.stopTimer();
      break;
    case 'reset':
      timerModel.setInitialTime(countFrom);
      timerModel.resetTimer();
      break;
    default:
      // It's good practice to handle unexpected cases
      print('Unsupported action: $action');
      break;
  }
}
