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
import 'package:video_player/video_player.dart';

class VideoWithPlayAndEnd extends StatefulWidget {
  const VideoWithPlayAndEnd({
    Key? key,
    this.width,
    this.height,
    required this.videoUrl,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? videoUrl;

  @override
  _VideoWithPlayAndEndState createState() => _VideoWithPlayAndEndState();
}

class _VideoWithPlayAndEndState extends State<VideoWithPlayAndEnd> {
  late VideoPlayerController _controller;
  bool play = false;
  bool videoIsPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl!)
      ..initialize().then((_) {
        setState(() {});
        _controller.setVolume(1.0);
        _controller.addListener(() {
          if (_controller.value.position >= _controller.value.duration) {
            setState(() {
              videoIsPlaying = false;
            });
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  children: [
                    VideoPlayer(_controller),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: LinearProgressIndicator(
                        value: _controller.value.position.inSeconds /
                            _controller.value.duration.inSeconds,
                        backgroundColor: Colors.grey[300],
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFF1AADF9)),
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  play = !play;
                  if (play) {
                    _controller.play();
                    videoIsPlaying = true;
                  } else {
                    _controller.pause();
                    videoIsPlaying = false;
                  }
                });
              },
              child: Container(
                color: Colors.transparent,
                child: play
                    ? Container()
                    : Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 70.0,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
