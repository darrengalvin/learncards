import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class DeeperCommentsNewRecord extends FirestoreRecord {
  DeeperCommentsNewRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "datePosted" field.
  DateTime? _datePosted;
  DateTime? get datePosted => _datePosted;
  bool hasDatePosted() => _datePosted != null;

  void _initializeFields() {
    _datePosted = snapshotData['datePosted'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('deeperCommentsNew');

  static Stream<DeeperCommentsNewRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeeperCommentsNewRecord.fromSnapshot(s));

  static Future<DeeperCommentsNewRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DeeperCommentsNewRecord.fromSnapshot(s));

  static DeeperCommentsNewRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DeeperCommentsNewRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeeperCommentsNewRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeeperCommentsNewRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeeperCommentsNewRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeeperCommentsNewRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeeperCommentsNewRecordData({
  DateTime? datePosted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'datePosted': datePosted,
    }.withoutNulls,
  );

  return firestoreData;
}

class DeeperCommentsNewRecordDocumentEquality
    implements Equality<DeeperCommentsNewRecord> {
  const DeeperCommentsNewRecordDocumentEquality();

  @override
  bool equals(DeeperCommentsNewRecord? e1, DeeperCommentsNewRecord? e2) {
    return e1?.datePosted == e2?.datePosted;
  }

  @override
  int hash(DeeperCommentsNewRecord? e) =>
      const ListEquality().hash([e?.datePosted]);

  @override
  bool isValidKey(Object? o) => o is DeeperCommentsNewRecord;
}
