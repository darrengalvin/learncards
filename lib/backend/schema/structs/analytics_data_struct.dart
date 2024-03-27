// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnalyticsDataStruct extends FFFirebaseStruct {
  AnalyticsDataStruct({
    String? sessionId,
    int? videoDuration,
    int? videoWatchedTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _sessionId = sessionId,
        _videoDuration = videoDuration,
        _videoWatchedTime = videoWatchedTime,
        super(firestoreUtilData);

  // "sessionId" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  set sessionId(String? val) => _sessionId = val;
  bool hasSessionId() => _sessionId != null;

  // "videoDuration" field.
  int? _videoDuration;
  int get videoDuration => _videoDuration ?? 0;
  set videoDuration(int? val) => _videoDuration = val;
  void incrementVideoDuration(int amount) =>
      _videoDuration = videoDuration + amount;
  bool hasVideoDuration() => _videoDuration != null;

  // "VideoWatchedTime" field.
  int? _videoWatchedTime;
  int get videoWatchedTime => _videoWatchedTime ?? 0;
  set videoWatchedTime(int? val) => _videoWatchedTime = val;
  void incrementVideoWatchedTime(int amount) =>
      _videoWatchedTime = videoWatchedTime + amount;
  bool hasVideoWatchedTime() => _videoWatchedTime != null;

  static AnalyticsDataStruct fromMap(Map<String, dynamic> data) =>
      AnalyticsDataStruct(
        sessionId: data['sessionId'] as String?,
        videoDuration: castToType<int>(data['videoDuration']),
        videoWatchedTime: castToType<int>(data['VideoWatchedTime']),
      );

  static AnalyticsDataStruct? maybeFromMap(dynamic data) => data is Map
      ? AnalyticsDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sessionId': _sessionId,
        'videoDuration': _videoDuration,
        'VideoWatchedTime': _videoWatchedTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sessionId': serializeParam(
          _sessionId,
          ParamType.String,
        ),
        'videoDuration': serializeParam(
          _videoDuration,
          ParamType.int,
        ),
        'VideoWatchedTime': serializeParam(
          _videoWatchedTime,
          ParamType.int,
        ),
      }.withoutNulls;

  static AnalyticsDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      AnalyticsDataStruct(
        sessionId: deserializeParam(
          data['sessionId'],
          ParamType.String,
          false,
        ),
        videoDuration: deserializeParam(
          data['videoDuration'],
          ParamType.int,
          false,
        ),
        videoWatchedTime: deserializeParam(
          data['VideoWatchedTime'],
          ParamType.int,
          false,
        ),
      );

  static AnalyticsDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      AnalyticsDataStruct(
        sessionId: convertAlgoliaParam(
          data['sessionId'],
          ParamType.String,
          false,
        ),
        videoDuration: convertAlgoliaParam(
          data['videoDuration'],
          ParamType.int,
          false,
        ),
        videoWatchedTime: convertAlgoliaParam(
          data['VideoWatchedTime'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'AnalyticsDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AnalyticsDataStruct &&
        sessionId == other.sessionId &&
        videoDuration == other.videoDuration &&
        videoWatchedTime == other.videoWatchedTime;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([sessionId, videoDuration, videoWatchedTime]);
}

AnalyticsDataStruct createAnalyticsDataStruct({
  String? sessionId,
  int? videoDuration,
  int? videoWatchedTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AnalyticsDataStruct(
      sessionId: sessionId,
      videoDuration: videoDuration,
      videoWatchedTime: videoWatchedTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AnalyticsDataStruct? updateAnalyticsDataStruct(
  AnalyticsDataStruct? analyticsData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    analyticsData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAnalyticsDataStructData(
  Map<String, dynamic> firestoreData,
  AnalyticsDataStruct? analyticsData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (analyticsData == null) {
    return;
  }
  if (analyticsData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && analyticsData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final analyticsDataData =
      getAnalyticsDataFirestoreData(analyticsData, forFieldValue);
  final nestedData =
      analyticsDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = analyticsData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAnalyticsDataFirestoreData(
  AnalyticsDataStruct? analyticsData, [
  bool forFieldValue = false,
]) {
  if (analyticsData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(analyticsData.toMap());

  // Add any Firestore field values
  analyticsData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAnalyticsDataListFirestoreData(
  List<AnalyticsDataStruct>? analyticsDatas,
) =>
    analyticsDatas
        ?.map((e) => getAnalyticsDataFirestoreData(e, true))
        .toList() ??
    [];
