import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlockLayoutsRecord extends FirestoreRecord {
  BlockLayoutsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "updated_time" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  bool hasUpdatedTime() => _updatedTime != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "block_layout_id" field.
  String? _blockLayoutId;
  String get blockLayoutId => _blockLayoutId ?? '';
  bool hasBlockLayoutId() => _blockLayoutId != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _uid = snapshotData['uid'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _blockLayoutId = snapshotData['block_layout_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('block_layouts');

  static Stream<BlockLayoutsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BlockLayoutsRecord.fromSnapshot(s));

  static Future<BlockLayoutsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BlockLayoutsRecord.fromSnapshot(s));

  static BlockLayoutsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BlockLayoutsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BlockLayoutsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BlockLayoutsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BlockLayoutsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BlockLayoutsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBlockLayoutsRecordData({
  DateTime? createdTime,
  DateTime? updatedTime,
  DocumentReference? user,
  String? uid,
  bool? isActive,
  String? blockLayoutId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'updated_time': updatedTime,
      'user': user,
      'uid': uid,
      'isActive': isActive,
      'block_layout_id': blockLayoutId,
    }.withoutNulls,
  );

  return firestoreData;
}

class BlockLayoutsRecordDocumentEquality
    implements Equality<BlockLayoutsRecord> {
  const BlockLayoutsRecordDocumentEquality();

  @override
  bool equals(BlockLayoutsRecord? e1, BlockLayoutsRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.user == e2?.user &&
        e1?.uid == e2?.uid &&
        e1?.isActive == e2?.isActive &&
        e1?.blockLayoutId == e2?.blockLayoutId;
  }

  @override
  int hash(BlockLayoutsRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.updatedTime,
        e?.user,
        e?.uid,
        e?.isActive,
        e?.blockLayoutId
      ]);

  @override
  bool isValidKey(Object? o) => o is BlockLayoutsRecord;
}
