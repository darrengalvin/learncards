import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ErrorLogRecord extends FirestoreRecord {
  ErrorLogRecord._(
    super.reference,
    super.data,
  ) {
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

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _code = snapshotData['code'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _message = snapshotData['message'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('error_log');

  static Stream<ErrorLogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ErrorLogRecord.fromSnapshot(s));

  static Future<ErrorLogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ErrorLogRecord.fromSnapshot(s));

  static ErrorLogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ErrorLogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ErrorLogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ErrorLogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ErrorLogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ErrorLogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createErrorLogRecordData({
  String? uid,
  String? code,
  DateTime? time,
  String? message,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'code': code,
      'time': time,
      'message': message,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class ErrorLogRecordDocumentEquality implements Equality<ErrorLogRecord> {
  const ErrorLogRecordDocumentEquality();

  @override
  bool equals(ErrorLogRecord? e1, ErrorLogRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.code == e2?.code &&
        e1?.time == e2?.time &&
        e1?.message == e2?.message &&
        e1?.user == e2?.user;
  }

  @override
  int hash(ErrorLogRecord? e) => const ListEquality()
      .hash([e?.uid, e?.code, e?.time, e?.message, e?.user]);

  @override
  bool isValidKey(Object? o) => o is ErrorLogRecord;
}
