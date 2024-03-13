import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TotalTokensLoggedInUsersRecord extends FirestoreRecord {
  TotalTokensLoggedInUsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userDocumentId" field.
  String? _userDocumentId;
  String get userDocumentId => _userDocumentId ?? '';
  bool hasUserDocumentId() => _userDocumentId != null;

  // "newTotal" field.
  int? _newTotal;
  int get newTotal => _newTotal ?? 0;
  bool hasNewTotal() => _newTotal != null;

  // "dateUpdated" field.
  DateTime? _dateUpdated;
  DateTime? get dateUpdated => _dateUpdated;
  bool hasDateUpdated() => _dateUpdated != null;

  void _initializeFields() {
    _userDocumentId = snapshotData['userDocumentId'] as String?;
    _newTotal = castToType<int>(snapshotData['newTotal']);
    _dateUpdated = snapshotData['dateUpdated'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('totalTokensLoggedInUsers');

  static Stream<TotalTokensLoggedInUsersRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => TotalTokensLoggedInUsersRecord.fromSnapshot(s));

  static Future<TotalTokensLoggedInUsersRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TotalTokensLoggedInUsersRecord.fromSnapshot(s));

  static TotalTokensLoggedInUsersRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      TotalTokensLoggedInUsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TotalTokensLoggedInUsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TotalTokensLoggedInUsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TotalTokensLoggedInUsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TotalTokensLoggedInUsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTotalTokensLoggedInUsersRecordData({
  String? userDocumentId,
  int? newTotal,
  DateTime? dateUpdated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userDocumentId': userDocumentId,
      'newTotal': newTotal,
      'dateUpdated': dateUpdated,
    }.withoutNulls,
  );

  return firestoreData;
}

class TotalTokensLoggedInUsersRecordDocumentEquality
    implements Equality<TotalTokensLoggedInUsersRecord> {
  const TotalTokensLoggedInUsersRecordDocumentEquality();

  @override
  bool equals(
      TotalTokensLoggedInUsersRecord? e1, TotalTokensLoggedInUsersRecord? e2) {
    return e1?.userDocumentId == e2?.userDocumentId &&
        e1?.newTotal == e2?.newTotal &&
        e1?.dateUpdated == e2?.dateUpdated;
  }

  @override
  int hash(TotalTokensLoggedInUsersRecord? e) => const ListEquality()
      .hash([e?.userDocumentId, e?.newTotal, e?.dateUpdated]);

  @override
  bool isValidKey(Object? o) => o is TotalTokensLoggedInUsersRecord;
}
