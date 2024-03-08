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

import 'package:random_text_reveal/random_text_reveal.dart';

final GlobalKey<RandomTextRevealState> globalKey = GlobalKey();

class RandomTextRevealWidget extends StatefulWidget {
  const RandomTextRevealWidget({
    Key? key,
    this.width,
    this.height,
    required this.textList,
    this.duration,
    this.textColor = Colors.blue,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String> textList;
  final int? duration;
  final Color textColor;

  @override
  _RandomTextRevealWidgetState createState() => _RandomTextRevealWidgetState();
}

class _RandomTextRevealWidgetState extends State<RandomTextRevealWidget> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: RandomTextReveal(
        key: globalKey,
        text: widget.textList[index],
        duration: Duration(seconds: widget.duration ?? 2),
        style: TextStyle(
          fontSize: 36,
          color: widget.textColor,
          fontWeight: FontWeight.bold,
        ),
        onFinished: () {
          setState(() {
            index = (index + 1) % widget.textList.length;
          });
          globalKey.currentState?.play();
        },
      ),
    );
  }
}
