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

import 'package:shared_preferences/shared_preferences.dart';

import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:permission_handler/permission_handler.dart';

class Recordmp3 extends StatefulWidget {
  Recordmp3({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _Recordmp3State createState() => _Recordmp3State();
}

class _Recordmp3State extends State<Recordmp3> {
  String statusText = "";
  bool isComplete = false;
  late String recordFilePath =
      ""; // initialize recordFilePath with a default value

  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> _saveRecordedFile(String filePath) async {
    await _prefs.setString('recorded_file', filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                child: Container(
                  height: 48.0,
                  decoration: BoxDecoration(color: Colors.red.shade300),
                  child: Center(
                    child: Text(
                      'start',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                onTap: () async {
                  startRecord();
                },
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: Container(
                  height: 48.0,
                  decoration: BoxDecoration(color: Colors.blue.shade300),
                  child: Center(
                    child: Text(
                      RecordMp3.instance.status == RecordStatus.PAUSE
                          ? 'resume'
                          : 'pause',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                onTap: () {
                  pauseRecord();
                },
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: Container(
                  height: 48.0,
                  decoration: BoxDecoration(color: Colors.green.shade300),
                  child: Center(
                    child: Text(
                      'stop',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                onTap: () {
                  stopRecord();
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            statusText,
            style: TextStyle(color: Colors.red, fontSize: 20),
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            play();
          },
          child: Container(
            margin: EdgeInsets.only(top: 30),
            alignment: AlignmentDirectional.center,
            width: 100,
            height: 50,
            child: isComplete && recordFilePath != null
                ? Text(
                    "play",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  )
                : Container(),
          ),
        ),
      ],
    );
  }

  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  void startRecord() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      statusText = "Recording...";
      recordFilePath = await getFilePath();
      isComplete = false;
      RecordMp3.instance.start(recordFilePath, (type) {
        statusText = "Record error--->$type";
        setState(() {});
      });
    } else {
      statusText = "No microphone permission";
    }
    setState(() {});
  }

  void pauseRecord() {
    if (RecordMp3.instance.status == RecordStatus.PAUSE) {
      bool s = RecordMp3.instance.resume();
      if (s) {
        statusText = "Recording...";
        setState(() {});
      }
    } else {
      bool s = RecordMp3.instance.pause();
      if (s) {
        statusText = "Recording pause...";
        setState(() {});
      }
    }
  }

  void stopRecord() async {
    bool s = RecordMp3.instance.stop();
    if (s) {
      statusText = "Record complete";
      isComplete = true;
      setState(() {});
      await _saveRecordedFile(recordFilePath);
    }
  }

  void resumeRecord() {
    bool s = RecordMp3.instance.resume();
    if (s) {
      statusText = "Recording...";
      setState(() {});
    }
  }

  void play() async {
    String? filePath = _prefs.getString('recorded_file');
    if (filePath != null && File(filePath).existsSync()) {
      AudioPlayer audioPlayer = AudioPlayer();
      String filePath = _prefs.getString('recorded_file')!;
    }
  }

  int i = 0;

  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = storageDirectory.path + "/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/test_${i++}.mp3";
  }
}
