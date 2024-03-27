// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoStruct extends FFFirebaseStruct {
  VideoStruct({
    String? videoThumbnail,
    String? videoUrl,
    int? videoStartTime,
    String? videoTitle,
    String? videoDescription,
    DateTime? datePosted,
    int? views,
    int? duration,
    String? transcript,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _videoThumbnail = videoThumbnail,
        _videoUrl = videoUrl,
        _videoStartTime = videoStartTime,
        _videoTitle = videoTitle,
        _videoDescription = videoDescription,
        _datePosted = datePosted,
        _views = views,
        _duration = duration,
        _transcript = transcript,
        super(firestoreUtilData);

  // "videoThumbnail" field.
  String? _videoThumbnail;
  String get videoThumbnail => _videoThumbnail ?? '';
  set videoThumbnail(String? val) => _videoThumbnail = val;
  bool hasVideoThumbnail() => _videoThumbnail != null;

  // "videoUrl" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  set videoUrl(String? val) => _videoUrl = val;
  bool hasVideoUrl() => _videoUrl != null;

  // "videoStartTime" field.
  int? _videoStartTime;
  int get videoStartTime => _videoStartTime ?? 0;
  set videoStartTime(int? val) => _videoStartTime = val;
  void incrementVideoStartTime(int amount) =>
      _videoStartTime = videoStartTime + amount;
  bool hasVideoStartTime() => _videoStartTime != null;

  // "videoTitle" field.
  String? _videoTitle;
  String get videoTitle => _videoTitle ?? '';
  set videoTitle(String? val) => _videoTitle = val;
  bool hasVideoTitle() => _videoTitle != null;

  // "videoDescription" field.
  String? _videoDescription;
  String get videoDescription => _videoDescription ?? '';
  set videoDescription(String? val) => _videoDescription = val;
  bool hasVideoDescription() => _videoDescription != null;

  // "datePosted" field.
  DateTime? _datePosted;
  DateTime? get datePosted => _datePosted;
  set datePosted(DateTime? val) => _datePosted = val;
  bool hasDatePosted() => _datePosted != null;

  // "views" field.
  int? _views;
  int get views => _views ?? 0;
  set views(int? val) => _views = val;
  void incrementViews(int amount) => _views = views + amount;
  bool hasViews() => _views != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  set duration(int? val) => _duration = val;
  void incrementDuration(int amount) => _duration = duration + amount;
  bool hasDuration() => _duration != null;

  // "transcript" field.
  String? _transcript;
  String get transcript => _transcript ?? '';
  set transcript(String? val) => _transcript = val;
  bool hasTranscript() => _transcript != null;

  static VideoStruct fromMap(Map<String, dynamic> data) => VideoStruct(
        videoThumbnail: data['videoThumbnail'] as String?,
        videoUrl: data['videoUrl'] as String?,
        videoStartTime: castToType<int>(data['videoStartTime']),
        videoTitle: data['videoTitle'] as String?,
        videoDescription: data['videoDescription'] as String?,
        datePosted: data['datePosted'] as DateTime?,
        views: castToType<int>(data['views']),
        duration: castToType<int>(data['duration']),
        transcript: data['transcript'] as String?,
      );

  static VideoStruct? maybeFromMap(dynamic data) =>
      data is Map ? VideoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'videoThumbnail': _videoThumbnail,
        'videoUrl': _videoUrl,
        'videoStartTime': _videoStartTime,
        'videoTitle': _videoTitle,
        'videoDescription': _videoDescription,
        'datePosted': _datePosted,
        'views': _views,
        'duration': _duration,
        'transcript': _transcript,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'videoThumbnail': serializeParam(
          _videoThumbnail,
          ParamType.String,
        ),
        'videoUrl': serializeParam(
          _videoUrl,
          ParamType.String,
        ),
        'videoStartTime': serializeParam(
          _videoStartTime,
          ParamType.int,
        ),
        'videoTitle': serializeParam(
          _videoTitle,
          ParamType.String,
        ),
        'videoDescription': serializeParam(
          _videoDescription,
          ParamType.String,
        ),
        'datePosted': serializeParam(
          _datePosted,
          ParamType.DateTime,
        ),
        'views': serializeParam(
          _views,
          ParamType.int,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.int,
        ),
        'transcript': serializeParam(
          _transcript,
          ParamType.String,
        ),
      }.withoutNulls;

  static VideoStruct fromSerializableMap(Map<String, dynamic> data) =>
      VideoStruct(
        videoThumbnail: deserializeParam(
          data['videoThumbnail'],
          ParamType.String,
          false,
        ),
        videoUrl: deserializeParam(
          data['videoUrl'],
          ParamType.String,
          false,
        ),
        videoStartTime: deserializeParam(
          data['videoStartTime'],
          ParamType.int,
          false,
        ),
        videoTitle: deserializeParam(
          data['videoTitle'],
          ParamType.String,
          false,
        ),
        videoDescription: deserializeParam(
          data['videoDescription'],
          ParamType.String,
          false,
        ),
        datePosted: deserializeParam(
          data['datePosted'],
          ParamType.DateTime,
          false,
        ),
        views: deserializeParam(
          data['views'],
          ParamType.int,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.int,
          false,
        ),
        transcript: deserializeParam(
          data['transcript'],
          ParamType.String,
          false,
        ),
      );

  static VideoStruct fromAlgoliaData(Map<String, dynamic> data) => VideoStruct(
        videoThumbnail: convertAlgoliaParam(
          data['videoThumbnail'],
          ParamType.String,
          false,
        ),
        videoUrl: convertAlgoliaParam(
          data['videoUrl'],
          ParamType.String,
          false,
        ),
        videoStartTime: convertAlgoliaParam(
          data['videoStartTime'],
          ParamType.int,
          false,
        ),
        videoTitle: convertAlgoliaParam(
          data['videoTitle'],
          ParamType.String,
          false,
        ),
        videoDescription: convertAlgoliaParam(
          data['videoDescription'],
          ParamType.String,
          false,
        ),
        datePosted: convertAlgoliaParam(
          data['datePosted'],
          ParamType.DateTime,
          false,
        ),
        views: convertAlgoliaParam(
          data['views'],
          ParamType.int,
          false,
        ),
        duration: convertAlgoliaParam(
          data['duration'],
          ParamType.int,
          false,
        ),
        transcript: convertAlgoliaParam(
          data['transcript'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'VideoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VideoStruct &&
        videoThumbnail == other.videoThumbnail &&
        videoUrl == other.videoUrl &&
        videoStartTime == other.videoStartTime &&
        videoTitle == other.videoTitle &&
        videoDescription == other.videoDescription &&
        datePosted == other.datePosted &&
        views == other.views &&
        duration == other.duration &&
        transcript == other.transcript;
  }

  @override
  int get hashCode => const ListEquality().hash([
        videoThumbnail,
        videoUrl,
        videoStartTime,
        videoTitle,
        videoDescription,
        datePosted,
        views,
        duration,
        transcript
      ]);
}

VideoStruct createVideoStruct({
  String? videoThumbnail,
  String? videoUrl,
  int? videoStartTime,
  String? videoTitle,
  String? videoDescription,
  DateTime? datePosted,
  int? views,
  int? duration,
  String? transcript,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VideoStruct(
      videoThumbnail: videoThumbnail,
      videoUrl: videoUrl,
      videoStartTime: videoStartTime,
      videoTitle: videoTitle,
      videoDescription: videoDescription,
      datePosted: datePosted,
      views: views,
      duration: duration,
      transcript: transcript,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VideoStruct? updateVideoStruct(
  VideoStruct? video, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    video
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVideoStructData(
  Map<String, dynamic> firestoreData,
  VideoStruct? video,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (video == null) {
    return;
  }
  if (video.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && video.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final videoData = getVideoFirestoreData(video, forFieldValue);
  final nestedData = videoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = video.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVideoFirestoreData(
  VideoStruct? video, [
  bool forFieldValue = false,
]) {
  if (video == null) {
    return {};
  }
  final firestoreData = mapToFirestore(video.toMap());

  // Add any Firestore field values
  video.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVideoListFirestoreData(
  List<VideoStruct>? videos,
) =>
    videos?.map((e) => getVideoFirestoreData(e, true)).toList() ?? [];
