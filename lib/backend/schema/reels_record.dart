import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReelsRecord extends FirestoreRecord {
  ReelsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "reelname" field.
  String? _reelname;
  String get reelname => _reelname ?? '';
  bool hasReelname() => _reelname != null;

  // "reeldescription" field.
  String? _reeldescription;
  String get reeldescription => _reeldescription ?? '';
  bool hasReeldescription() => _reeldescription != null;

  // "linkedtile" field.
  DocumentReference? _linkedtile;
  DocumentReference? get linkedtile => _linkedtile;
  bool hasLinkedtile() => _linkedtile != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _category = snapshotData['category'] as String?;
    _video = snapshotData['video'] as String?;
    _reelname = snapshotData['reelname'] as String?;
    _reeldescription = snapshotData['reeldescription'] as String?;
    _linkedtile = snapshotData['linkedtile'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reels');

  static Stream<ReelsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReelsRecord.fromSnapshot(s));

  static Future<ReelsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReelsRecord.fromSnapshot(s));

  static ReelsRecord fromSnapshot(DocumentSnapshot snapshot) => ReelsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReelsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReelsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReelsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReelsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReelsRecordData({
  int? id,
  String? category,
  String? video,
  String? reelname,
  String? reeldescription,
  DocumentReference? linkedtile,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'category': category,
      'video': video,
      'reelname': reelname,
      'reeldescription': reeldescription,
      'linkedtile': linkedtile,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReelsRecordDocumentEquality implements Equality<ReelsRecord> {
  const ReelsRecordDocumentEquality();

  @override
  bool equals(ReelsRecord? e1, ReelsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.category == e2?.category &&
        e1?.video == e2?.video &&
        e1?.reelname == e2?.reelname &&
        e1?.reeldescription == e2?.reeldescription &&
        e1?.linkedtile == e2?.linkedtile;
  }

  @override
  int hash(ReelsRecord? e) => const ListEquality().hash([
        e?.id,
        e?.category,
        e?.video,
        e?.reelname,
        e?.reeldescription,
        e?.linkedtile
      ]);

  @override
  bool isValidKey(Object? o) => o is ReelsRecord;
}
