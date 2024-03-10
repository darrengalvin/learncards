// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

class TimerModel with ChangeNotifier {
  static final TimerModel _instance = TimerModel._internal();
  factory TimerModel() => _instance;

  Timer? _timer;
  double _time = 60.0; // Initialize with a default value of 60 seconds
  VoidCallback? onTimerEndCallback;
  VoidCallback? onStopCallback;

  TimerModel._internal();

  double get time => _time;

  void setInitialTime(double newTime) {
    _time = newTime;
    FFAppState().currentTimer =
        _time; // Update FFAppState with the new time value

    notifyListeners();
  }

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_time > 0) {
        _time--;
        FFAppState().currentTimer =
            _time; // Update FFAppState with the current time value

        notifyListeners();
      } else {
        _timer?.cancel();
        _timer = null;
        FFAppState().currentTimer = 0; // Update FFAppState when timer ends

        onTimerEndCallback?.call(); // Call the onTimerEnd callback if set
        notifyListeners();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
    FFAppState().currentTimer = _time; // Update FFAppState when the timer stops
    onStopCallback?.call(); // Call the onStop callback if set
    notifyListeners();
  }

  void resetTimer() {
    _time = 60.0; // Reset to the default initial time value
    FFAppState().currentTimer =
        _time; // Update FFAppState with the reset time value

    notifyListeners();
  }

  void setOnTimerEnd(VoidCallback callback) {
    onTimerEndCallback = callback;
  }

  void setOnStop(VoidCallback callback) {
    onStopCallback = callback;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
