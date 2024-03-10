import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

String getPlaybackIdFromUrl(String url) {
  String str1 = url.replaceAll(".m3u8", "");
  return str1.split("/").last;
}

String createUrlFromPlaybackId(String playbackId) {
  return 'https://stream.mux.com/$playbackId.m3u8';
}

int? plusOneToVariable(int? addtoWhat) {
  return addtoWhat != null ? addtoWhat + 1 : null;
}

String urlToString(String videoUrlInput) {
  // return a video Url  argument  to String
  String videoUrl = videoUrlInput;
  String videoUrlString = videoUrl.toString();
  return videoUrlString;
}

DocumentReference? getDocumentsByDateAdded() {
  Future<List<DocumentSnapshot>> getDocumentsByDateAdded() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('myCollection')
        .orderBy('dateAdded', descending: true)
        .get();
    return snapshot.docs;
  }
}

List<String> mapAppNames(List<AppsRecord>? inputList) {
  inputList = inputList ?? [];

  List<String> tempList = [];

  if (inputList != null) {
    for (AppsRecord app in inputList) {
      tempList.add(app.appName); // Fixed the missing parenthesis here
    }
  }

  return tempList;
}

String formatText(String? input) {
  input = input ?? '';

  // Split the input into sentences using punctuation marks as delimiters.
  List<String> sentences = input.split(RegExp(r'[.!?]'));

  // Initialize an empty result string.
  String result = '';

  // Iterate through the sentences and add line breaks after each sentence.
  for (String sentence in sentences) {
    sentence = sentence.trim();
    if (sentence.isNotEmpty) {
      result += sentence + '.\n\n'; // Add two line breaks for paragraphs.
    }
  }

  // Remove trailing paragraph breaks if there are any.
  result = result.trim();

  // MODIFY CODE ONLY ABOVE THIS LINE
  return result;
}

String stringToVideo(String? input) {
  input = input ?? '';

  return input;
}

List<String> emptyImageList() {
  List<String> result = [];
  return result;
}

List<String> emptyVideoList() {
  return [];
}

List<String> emptyAudioList() {
  return [];
}

String splitText(
  int? returnIndex,
  String? splitOnText,
  String? input,
) {
  input = input ?? '';
  splitOnText = splitOnText ?? '';
  returnIndex = returnIndex ?? 0;
  String result = '';
  // Split the input string using the provided delimiter
  List<String> parts = input.split(splitOnText);

  // Check if the specified return index is valid
  if (returnIndex >= 0 && returnIndex < parts.length) {
    // Trim any leading or trailing whitespace from the result

    result = parts[returnIndex].trim();
  }
  return result;
}

List<String> merggeVideoLists(
  List<String>? inputList1,
  List<String>? inputList2,
) {
  inputList1 = inputList1 ?? [];
  inputList2 = inputList2 ?? [];

  Set<String> mergedSet = Set<String>.from([...inputList1, ...inputList2]);
  List<String> mergedList = mergedSet.toList();

  // MODIFY CODE ONLY ABOVE THIS LINE
  return mergedList;
}

List<String> subStringList(
  List<String>? inputList,
  int? startIndex,
  int? endIndex,
) {
  // If inputList is null, return an empty list
  inputList = inputList ?? [];

  // Default values
  startIndex = startIndex ?? 0;
  endIndex = endIndex ?? inputList.length;

  // Clamping the indices to make sure they are within the bounds of the list
  startIndex = startIndex.clamp(0, inputList.length);
  endIndex = endIndex.clamp(0, inputList.length);

  List<String> result = [];
  for (int i = startIndex; i < endIndex; i++) {
    result.add(inputList[i]);
  }

  return result;
}

int getIndex(
  List<String>? inputList,
  String? input,
) {
  inputList = inputList ?? [];
  input = input ?? '';
  int result = 0;
  result = inputList?.indexWhere((element) => element == input) ?? -1;
  return result ?? 0;
}

List<Tilesv2Record> emptyTilesList() {
//  List<Tilesv2Record> result = [...inputList];
  List<Tilesv2Record> result = [];

  return result;
}

double stringToDouble(String inputString) {
  // string to double
// The function should take in a string as input and return a double value.
// The string may contain any combination of digits, decimal points, and a negative sign.
// If the string cannot be converted to a double, the function should return 0.0.

  try {
    return double.parse(inputString);
  } catch (e) {
    return 0.0;
  }
}

String? imageToString(String? imagepath) {
  return imagepath ?? "";
}

int? getTimeStamp(DateTime? dateTimeIn) {
  int getCurrentTimestamp() {
    return (DateTime.now().millisecondsSinceEpoch / 1000).floor();
  }
}

double? convertMsToSec(double? ms) {
  // convert milisecond into seconds
  if (ms == null) return null;
  return ms / 1000;
}

int? convertDoubleToMS(double? secondsDouble) {
  // Convert Double To Milliseconds
  if (secondsDouble == null) {
    return null;
  }
  return (secondsDouble * 1000).toInt();
}

String? splitMessage(
  String? inputMessage,
  String? splitOnText,
  int? extractIndex,
) {
  inputMessage = inputMessage ?? '';
  splitOnText = splitOnText ?? '';
  extractIndex = extractIndex ?? 0;
  return inputMessage.split(splitOnText)[extractIndex];
}

int getSplitLength(
  String? input,
  String? splitOnText,
) {
  input = input ?? '';
  splitOnText = splitOnText ?? '';
  return input.split(splitOnText).length ?? 0;
}

List<String>? extractLinks(String? input) {
  input = input ?? '';
  List<String> extractedLinks = [];
  // Update the regex to exclude trailing " } ]
  RegExp regex = RegExp(r'(https?:\/\/[^\s"\}\]]+)|(www\.[^\s"\}\]]+)',
      caseSensitive: false);
  List<String> urls = regex.allMatches(input).map((match) {
    String url = match.group(0)!; // Add '!' to indicate it won't be null
    if (url.startsWith('www.')) {
      url = 'https://' + url;
    }
    return url.toLowerCase();
  }).toList();

  extractedLinks = urls.toSet().toList(); // Convert the set to a list

  return extractedLinks;
}

List<String>? extractLinkName(String? input) {
  input = input ?? '';
  List<String> extractedLinkNames = [];
  RegExp regex = RegExp(r'"link_name": "(.*?)"', caseSensitive: false);

  extractedLinkNames = regex.allMatches(input).map((match) {
    return match.group(1)!; // The link name is captured in the first group
  }).toList();

  return extractedLinkNames;
}

String? stringToImagePath(String? string) {
  // string to imagepath
  if (string == null) {
    return null;
  }
  final bytes = utf8.encode(string);
  final buffer = StringBuffer();
  for (final byte in bytes) {
    buffer.write('${byte.toRadixString(16).padLeft(2, '0')}');
  }
  final hexString = buffer.toString();
  return 'images/$hexString.png';
}

String? stringifyJSON(String? json) {
  if (json == null) {
    return null;
  }
  try {
    var decodedJson = jsonDecode(json);
    return jsonEncode(decodedJson);
  } catch (e) {
    // Log the error and return null in case of an exception
    print('Error stringifying JSON: $e');
    return null;
  }
}
