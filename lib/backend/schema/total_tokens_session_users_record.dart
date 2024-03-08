import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TotalTokensSessionUsersRecord extends FirestoreRecord {
  TotalTokensSessionUsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "newTotal" field.
  int? _newTotal;
  int get newTotal => _newTotal ?? 0;
  bool hasNewTotal() => _newTotal != null;

  // "dateUpdated" field.
  DateTime? _dateUpdated;
  DateTime? get dateUpdated => _dateUpdated;
  bool hasDateUpdated() => _dateUpdated != null;

  // "userSessionId" field.
  String? _userSessionId;
  String get userSessionId => _userSessionId ?? '';
  bool hasUserSessionId() => _userSessionId != null;

  void _initializeFields() {
    _newTotal = castToType<int>(snapshotData['newTotal']);
    _dateUpdated = snapshotData['dateUpdated'] as DateTime?;
    _userSessionId = snapshotData['userSessionId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('totalTokensSessionUsers');

  static Stream<TotalTokensSessionUsersRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => TotalTokensSessionUsersRecord.fromSnapshot(s));

  static Future<TotalTokensSessionUsersRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TotalTokensSessionUsersRecord.fromSnapshot(s));

  static TotalTokensSessionUsersRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      TotalTokensSessionUsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TotalTokensSessionUsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TotalTokensSessionUsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TotalTokensSessionUsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TotalTokensSessionUsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTotalTokensSessionUsersRecordData({
  int? newTotal,
  DateTime? dateUpdated,
  String? userSessionId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'newTotal': newTotal,
      'dateUpdated': dateUpdated,
      'userSessionId': userSessionId,
    }.withoutNulls,
  );

  return firestoreData;
}

class TotalTokensSessionUsersRecordDocumentEquality
    implements Equality<TotalTokensSessionUsersRecord> {
  const TotalTokensSessionUsersRecordDocumentEquality();

  @override
  bool equals(
      TotalTokensSessionUsersRecord? e1, TotalTokensSessionUsersRecord? e2) {
    return e1?.newTotal == e2?.newTotal &&
        e1?.dateUpdated == e2?.dateUpdated &&
        e1?.userSessionId == e2?.userSessionId;
  }

  @override
  int hash(TotalTokensSessionUsersRecord? e) => const ListEquality()
      .hash([e?.newTotal, e?.dateUpdated, e?.userSessionId]);

  @override
  bool isValidKey(Object? o) => o is TotalTokensSessionUsersRecord;
}
