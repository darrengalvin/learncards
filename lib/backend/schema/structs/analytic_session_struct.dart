// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnalyticSessionStruct extends FFFirebaseStruct {
  AnalyticSessionStruct({
    DocumentReference? userRef,
    String? userId,
    String? tileId,
    DateTime? dateTime,
    int? videoDuration,
    int? videoWatchedTime,
    int? videoSkippedTime,
    String? sessionId,
    List<int>? bitArray,
    int? playStart,
    int? playEnd,
    List<String>? sessionBitArray,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userRef = userRef,
        _userId = userId,
        _tileId = tileId,
        _dateTime = dateTime,
        _videoDuration = videoDuration,
        _videoWatchedTime = videoWatchedTime,
        _videoSkippedTime = videoSkippedTime,
        _sessionId = sessionId,
        _bitArray = bitArray,
        _playStart = playStart,
        _playEnd = playEnd,
        _sessionBitArray = sessionBitArray,
        super(firestoreUtilData);

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? val) => _userRef = val;
  bool hasUserRef() => _userRef != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;
  bool hasUserId() => _userId != null;

  // "tileId" field.
  String? _tileId;
  String get tileId => _tileId ?? '';
  set tileId(String? val) => _tileId = val;
  bool hasTileId() => _tileId != null;

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  set dateTime(DateTime? val) => _dateTime = val;
  bool hasDateTime() => _dateTime != null;

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

  // "VideoSkippedTime" field.
  int? _videoSkippedTime;
  int get videoSkippedTime => _videoSkippedTime ?? 0;
  set videoSkippedTime(int? val) => _videoSkippedTime = val;
  void incrementVideoSkippedTime(int amount) =>
      _videoSkippedTime = videoSkippedTime + amount;
  bool hasVideoSkippedTime() => _videoSkippedTime != null;

  // "sessionId" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  set sessionId(String? val) => _sessionId = val;
  bool hasSessionId() => _sessionId != null;

  // "bitArray" field.
  List<int>? _bitArray;
  List<int> get bitArray => _bitArray ?? const [];
  set bitArray(List<int>? val) => _bitArray = val;
  void updateBitArray(Function(List<int>) updateFn) =>
      updateFn(_bitArray ??= []);
  bool hasBitArray() => _bitArray != null;

  // "playStart" field.
  int? _playStart;
  int get playStart => _playStart ?? 0;
  set playStart(int? val) => _playStart = val;
  void incrementPlayStart(int amount) => _playStart = playStart + amount;
  bool hasPlayStart() => _playStart != null;

  // "playEnd" field.
  int? _playEnd;
  int get playEnd => _playEnd ?? 0;
  set playEnd(int? val) => _playEnd = val;
  void incrementPlayEnd(int amount) => _playEnd = playEnd + amount;
  bool hasPlayEnd() => _playEnd != null;

  // "sessionBitArray" field.
  List<String>? _sessionBitArray;
  List<String> get sessionBitArray => _sessionBitArray ?? const [];
  set sessionBitArray(List<String>? val) => _sessionBitArray = val;
  void updateSessionBitArray(Function(List<String>) updateFn) =>
      updateFn(_sessionBitArray ??= []);
  bool hasSessionBitArray() => _sessionBitArray != null;

  static AnalyticSessionStruct fromMap(Map<String, dynamic> data) =>
      AnalyticSessionStruct(
        userRef: data['userRef'] as DocumentReference?,
        userId: data['userId'] as String?,
        tileId: data['tileId'] as String?,
        dateTime: data['dateTime'] as DateTime?,
        videoDuration: castToType<int>(data['videoDuration']),
        videoWatchedTime: castToType<int>(data['VideoWatchedTime']),
        videoSkippedTime: castToType<int>(data['VideoSkippedTime']),
        sessionId: data['sessionId'] as String?,
        bitArray: getDataList(data['bitArray']),
        playStart: castToType<int>(data['playStart']),
        playEnd: castToType<int>(data['playEnd']),
        sessionBitArray: getDataList(data['sessionBitArray']),
      );

  static AnalyticSessionStruct? maybeFromMap(dynamic data) => data is Map
      ? AnalyticSessionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userRef': _userRef,
        'userId': _userId,
        'tileId': _tileId,
        'dateTime': _dateTime,
        'videoDuration': _videoDuration,
        'VideoWatchedTime': _videoWatchedTime,
        'VideoSkippedTime': _videoSkippedTime,
        'sessionId': _sessionId,
        'bitArray': _bitArray,
        'playStart': _playStart,
        'playEnd': _playEnd,
        'sessionBitArray': _sessionBitArray,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userRef': serializeParam(
          _userRef,
          ParamType.DocumentReference,
        ),
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
        'tileId': serializeParam(
          _tileId,
          ParamType.String,
        ),
        'dateTime': serializeParam(
          _dateTime,
          ParamType.DateTime,
        ),
        'videoDuration': serializeParam(
          _videoDuration,
          ParamType.int,
        ),
        'VideoWatchedTime': serializeParam(
          _videoWatchedTime,
          ParamType.int,
        ),
        'VideoSkippedTime': serializeParam(
          _videoSkippedTime,
          ParamType.int,
        ),
        'sessionId': serializeParam(
          _sessionId,
          ParamType.String,
        ),
        'bitArray': serializeParam(
          _bitArray,
          ParamType.int,
          true,
        ),
        'playStart': serializeParam(
          _playStart,
          ParamType.int,
        ),
        'playEnd': serializeParam(
          _playEnd,
          ParamType.int,
        ),
        'sessionBitArray': serializeParam(
          _sessionBitArray,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static AnalyticSessionStruct fromSerializableMap(Map<String, dynamic> data) =>
      AnalyticSessionStruct(
        userRef: deserializeParam(
          data['userRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
        tileId: deserializeParam(
          data['tileId'],
          ParamType.String,
          false,
        ),
        dateTime: deserializeParam(
          data['dateTime'],
          ParamType.DateTime,
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
        videoSkippedTime: deserializeParam(
          data['VideoSkippedTime'],
          ParamType.int,
          false,
        ),
        sessionId: deserializeParam(
          data['sessionId'],
          ParamType.String,
          false,
        ),
        bitArray: deserializeParam<int>(
          data['bitArray'],
          ParamType.int,
          true,
        ),
        playStart: deserializeParam(
          data['playStart'],
          ParamType.int,
          false,
        ),
        playEnd: deserializeParam(
          data['playEnd'],
          ParamType.int,
          false,
        ),
        sessionBitArray: deserializeParam<String>(
          data['sessionBitArray'],
          ParamType.String,
          true,
        ),
      );

  static AnalyticSessionStruct fromAlgoliaData(Map<String, dynamic> data) =>
      AnalyticSessionStruct(
        userRef: convertAlgoliaParam(
          data['userRef'],
          ParamType.DocumentReference,
          false,
        ),
        userId: convertAlgoliaParam(
          data['userId'],
          ParamType.String,
          false,
        ),
        tileId: convertAlgoliaParam(
          data['tileId'],
          ParamType.String,
          false,
        ),
        dateTime: convertAlgoliaParam(
          data['dateTime'],
          ParamType.DateTime,
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
        videoSkippedTime: convertAlgoliaParam(
          data['VideoSkippedTime'],
          ParamType.int,
          false,
        ),
        sessionId: convertAlgoliaParam(
          data['sessionId'],
          ParamType.String,
          false,
        ),
        bitArray: convertAlgoliaParam<int>(
          data['bitArray'],
          ParamType.int,
          true,
        ),
        playStart: convertAlgoliaParam(
          data['playStart'],
          ParamType.int,
          false,
        ),
        playEnd: convertAlgoliaParam(
          data['playEnd'],
          ParamType.int,
          false,
        ),
        sessionBitArray: convertAlgoliaParam<String>(
          data['sessionBitArray'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'AnalyticSessionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AnalyticSessionStruct &&
        userRef == other.userRef &&
        userId == other.userId &&
        tileId == other.tileId &&
        dateTime == other.dateTime &&
        videoDuration == other.videoDuration &&
        videoWatchedTime == other.videoWatchedTime &&
        videoSkippedTime == other.videoSkippedTime &&
        sessionId == other.sessionId &&
        listEquality.equals(bitArray, other.bitArray) &&
        playStart == other.playStart &&
        playEnd == other.playEnd &&
        listEquality.equals(sessionBitArray, other.sessionBitArray);
  }

  @override
  int get hashCode => const ListEquality().hash([
        userRef,
        userId,
        tileId,
        dateTime,
        videoDuration,
        videoWatchedTime,
        videoSkippedTime,
        sessionId,
        bitArray,
        playStart,
        playEnd,
        sessionBitArray
      ]);
}

AnalyticSessionStruct createAnalyticSessionStruct({
  DocumentReference? userRef,
  String? userId,
  String? tileId,
  DateTime? dateTime,
  int? videoDuration,
  int? videoWatchedTime,
  int? videoSkippedTime,
  String? sessionId,
  int? playStart,
  int? playEnd,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AnalyticSessionStruct(
      userRef: userRef,
      userId: userId,
      tileId: tileId,
      dateTime: dateTime,
      videoDuration: videoDuration,
      videoWatchedTime: videoWatchedTime,
      videoSkippedTime: videoSkippedTime,
      sessionId: sessionId,
      playStart: playStart,
      playEnd: playEnd,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AnalyticSessionStruct? updateAnalyticSessionStruct(
  AnalyticSessionStruct? analyticSession, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    analyticSession
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAnalyticSessionStructData(
  Map<String, dynamic> firestoreData,
  AnalyticSessionStruct? analyticSession,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (analyticSession == null) {
    return;
  }
  if (analyticSession.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && analyticSession.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final analyticSessionData =
      getAnalyticSessionFirestoreData(analyticSession, forFieldValue);
  final nestedData =
      analyticSessionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = analyticSession.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAnalyticSessionFirestoreData(
  AnalyticSessionStruct? analyticSession, [
  bool forFieldValue = false,
]) {
  if (analyticSession == null) {
    return {};
  }
  final firestoreData = mapToFirestore(analyticSession.toMap());

  // Add any Firestore field values
  analyticSession.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAnalyticSessionListFirestoreData(
  List<AnalyticSessionStruct>? analyticSessions,
) =>
    analyticSessions
        ?.map((e) => getAnalyticSessionFirestoreData(e, true))
        .toList() ??
    [];
