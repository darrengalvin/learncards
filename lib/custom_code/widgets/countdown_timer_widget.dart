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

// countdown_timer_widget.dart
import 'package:provider/provider.dart';
import '/custom_code/widgets/timer_model.dart'; // Imports other custom widgets

class CountdownTimerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final int initialTime;
  final Future<dynamic> Function()? onTimerEnd;
  final Future<dynamic> Function()? onStop;

  CountdownTimerWidget({
    Key? key,
    this.width,
    this.height,
    this.initialTime = 30, // Default to 60 seconds if not provided
    this.onTimerEnd,
    this.onStop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Since TimerModel is a singleton, we don't create it here, we just provide it
    return ChangeNotifierProvider<TimerModel>.value(
      value: TimerModel(), // This accesses the singleton instance
      child: Consumer<TimerModel>(
        builder: (context, timerModel, child) => Container(
          width: width ?? double.infinity,
          height: height ?? double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '${timerModel.time}',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  timerModel.startTimer();
                  // The onTimerEnd callback should not be called here
                },
                child: Text('Start'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  timerModel.stopTimer();
                  onStop?.call();
                },
                child: Text('Stop'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: timerModel.resetTimer,
                child: Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
