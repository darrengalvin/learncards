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

class VideoWithStopPlay extends StatefulWidget {
  const VideoWithStopPlay({
    Key? key,
    this.width,
    this.height,
    required this.videoUrl,
    required this.isPlaying,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? videoUrl;
  final bool isPlaying;

  @override
  VideoWithStopPlayState createState() => VideoWithStopPlayState();
}

class VideoWithStopPlayState extends State<VideoWithStopPlay> {
  late VideoPlayerController _controller;
  late StreamController<bool> _pauseStreamController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl!)
      ..initialize().then((_) {
        setState(() {});
        _controller.setVolume(1.0);
      });
    _pauseStreamController = StreamController<bool>.broadcast();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _controller.value.isInitialized
            ? Stack(
                children: [
                  Positioned(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Container(
                        width: double.infinity,
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: LinearProgressIndicator(
                      value: _controller.value.position.inSeconds /
                          _controller.value.duration.inSeconds,
                      backgroundColor: Colors.grey[300],
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
                    ),
                  ),
                ],
              )
            : Container(),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: StreamBuilder<bool>(
              stream: _pauseStreamController.stream,
              initialData: widget.isPlaying,
              builder: (context, snapshot) {
                bool isPlaying = snapshot.data ?? widget.isPlaying;
                return GestureDetector(
                  onTap: () {
                    isPlaying = !isPlaying;
                    _pauseStreamController.add(!isPlaying);
                    if (isPlaying) {
                      _controller.play();
                    } else {
                      _controller.pause();
                    }
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: isPlaying
                        ? Container()
                        : Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 70.0,
                          ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _pauseStreamController.close();
  }
}

class VideoPlayerController extends Listenable {
  get value => null;

  static network(String s) {}

  void setVolume(double d) {}

  void dispose() {}

  void play() {}

  void pause() {}

  @override
  void addListener(listener) {}

  @override
  void removeListener(listener) {}
}

class VideoPlayer extends StatelessWidget {
  final VideoPlayerController controller;

  VideoPlayer(this.controller);

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(controller);
  }
}
