import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TokenUsageRecord extends FirestoreRecord {
  TokenUsageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sessionId" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  bool hasSessionId() => _sessionId != null;

  // "tokenCount" field.
  int? _tokenCount;
  int get tokenCount => _tokenCount ?? 0;
  bool hasTokenCount() => _tokenCount != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  void _initializeFields() {
    _sessionId = snapshotData['sessionId'] as String?;
    _tokenCount = castToType<int>(snapshotData['tokenCount']);
    _reason = snapshotData['reason'] as String?;
    _dateTime = snapshotData['dateTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tokenUsage');

  static Stream<TokenUsageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TokenUsageRecord.fromSnapshot(s));

  static Future<TokenUsageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TokenUsageRecord.fromSnapshot(s));

  static TokenUsageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TokenUsageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TokenUsageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TokenUsageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TokenUsageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TokenUsageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTokenUsageRecordData({
  String? sessionId,
  int? tokenCount,
  String? reason,
  DateTime? dateTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sessionId': sessionId,
      'tokenCount': tokenCount,
      'reason': reason,
      'dateTime': dateTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class TokenUsageRecordDocumentEquality implements Equality<TokenUsageRecord> {
  const TokenUsageRecordDocumentEquality();

  @override
  bool equals(TokenUsageRecord? e1, TokenUsageRecord? e2) {
    return e1?.sessionId == e2?.sessionId &&
        e1?.tokenCount == e2?.tokenCount &&
        e1?.reason == e2?.reason &&
        e1?.dateTime == e2?.dateTime;
  }

  @override
  int hash(TokenUsageRecord? e) => const ListEquality()
      .hash([e?.sessionId, e?.tokenCount, e?.reason, e?.dateTime]);

  @override
  bool isValidKey(Object? o) => o is TokenUsageRecord;
}
