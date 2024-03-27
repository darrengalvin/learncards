import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LogsRecord extends FirestoreRecord {
  LogsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "result" field.
  String? _result;
  String get result => _result ?? '';
  bool hasResult() => _result != null;

  // "logDetail" field.
  List<LogsStruct>? _logDetail;
  List<LogsStruct> get logDetail => _logDetail ?? const [];
  bool hasLogDetail() => _logDetail != null;

  // "sessionId" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  bool hasSessionId() => _sessionId != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _code = snapshotData['code'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _message = snapshotData['message'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _result = snapshotData['result'] as String?;
    _logDetail = getStructList(
      snapshotData['logDetail'],
      LogsStruct.fromMap,
    );
    _sessionId = snapshotData['sessionId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('logs');

  static Stream<LogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LogsRecord.fromSnapshot(s));

  static Future<LogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LogsRecord.fromSnapshot(s));

  static LogsRecord fromSnapshot(DocumentSnapshot snapshot) => LogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLogsRecordData({
  String? uid,
  String? code,
  DateTime? time,
  String? message,
  DocumentReference? user,
  String? result,
  String? sessionId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'code': code,
      'time': time,
      'message': message,
      'user': user,
      'result': result,
      'sessionId': sessionId,
    }.withoutNulls,
  );

  return firestoreData;
}

class LogsRecordDocumentEquality implements Equality<LogsRecord> {
  const LogsRecordDocumentEquality();

  @override
  bool equals(LogsRecord? e1, LogsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.code == e2?.code &&
        e1?.time == e2?.time &&
        e1?.message == e2?.message &&
        e1?.user == e2?.user &&
        e1?.result == e2?.result &&
        listEquality.equals(e1?.logDetail, e2?.logDetail) &&
        e1?.sessionId == e2?.sessionId;
  }

  @override
  int hash(LogsRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.code,
        e?.time,
        e?.message,
        e?.user,
        e?.result,
        e?.logDetail,
        e?.sessionId
      ]);

  @override
  bool isValidKey(Object? o) => o is LogsRecord;
}
