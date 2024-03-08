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

import 'dart:typed_data';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ThumbnailPicker extends StatefulWidget {
  final String videoPath;
  final double? width;
  final double? height;

  ThumbnailPicker({required this.videoPath, this.width, this.height});

  @override
  _ThumbnailPickerState createState() => _ThumbnailPickerState();
}

class _ThumbnailPickerState extends State<ThumbnailPicker> {
  Future<String> _downloadVideo(String url) async {
    try {
      log("Starting download from $url");
      var response = await http.get(Uri.parse(url));
      if (response.statusCode != 200) {
        throw Exception(
            "Error downloading video, status code: ${response.statusCode}");
      }
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/temp_video.mp4';
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      log("Downloaded video to $filePath");
      return filePath;
    } catch (e) {
      log("Error downloading video: $e");
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _downloadVideo(widget.videoPath),
      builder: (context, downloadSnapshot) {
        if (downloadSnapshot.connectionState == ConnectionState.waiting) {
          return Container(
            width: widget.width,
            height: widget.height,
            child: CircularProgressIndicator(),
          );
        } else if (downloadSnapshot.hasError) {
          log("Download error: ${downloadSnapshot.error}");
          return Container(
            width: widget.width,
            height: widget.height,
            color: Colors.red,
            child: Center(
              child: Text("Error downloading video"),
            ),
          );
        }

        return FutureBuilder<Uint8List?>(
          future: VideoThumbnail.thumbnailData(
            video: downloadSnapshot.data!,
            imageFormat: ImageFormat.JPEG,
            maxWidth: widget.width?.toInt() ?? 200,
            maxHeight: widget.height?.toInt() ?? 200,
            quality: 100,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                width: widget.width,
                height: widget.height,
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError || snapshot.data == null) {
              log("Thumbnail generation error: ${snapshot.error}");
              return Container(
                width: widget.width,
                height: widget.height,
                color: Colors.blue,
                child: Center(
                  child: Text("Image Loading Error"),
                ),
              );
            } else {
              return Image.memory(
                snapshot.data!,
                width: widget.width,
                height: widget.height,
              );
            }
          },
        );
      },
    );
  }
}
