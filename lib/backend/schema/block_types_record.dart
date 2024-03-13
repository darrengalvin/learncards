import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlockTypesRecord extends FirestoreRecord {
  BlockTypesRecord._(
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

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "isListView" field.
  bool? _isListView;
  bool get isListView => _isListView ?? false;
  bool hasIsListView() => _isListView != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _uid = snapshotData['uid'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _blockLayoutId = snapshotData['block_layout_id'] as String?;
    _name = snapshotData['name'] as String?;
    _details = snapshotData['details'] as String?;
    _isListView = snapshotData['isListView'] as bool?;
    _tags = getDataList(snapshotData['tags']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('block_types');

  static Stream<BlockTypesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BlockTypesRecord.fromSnapshot(s));

  static Future<BlockTypesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BlockTypesRecord.fromSnapshot(s));

  static BlockTypesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BlockTypesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BlockTypesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BlockTypesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BlockTypesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BlockTypesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBlockTypesRecordData({
  DateTime? createdTime,
  DateTime? updatedTime,
  DocumentReference? user,
  String? uid,
  bool? isActive,
  String? blockLayoutId,
  String? name,
  String? details,
  bool? isListView,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'updated_time': updatedTime,
      'user': user,
      'uid': uid,
      'isActive': isActive,
      'block_layout_id': blockLayoutId,
      'name': name,
      'details': details,
      'isListView': isListView,
    }.withoutNulls,
  );

  return firestoreData;
}

class BlockTypesRecordDocumentEquality implements Equality<BlockTypesRecord> {
  const BlockTypesRecordDocumentEquality();

  @override
  bool equals(BlockTypesRecord? e1, BlockTypesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.user == e2?.user &&
        e1?.uid == e2?.uid &&
        e1?.isActive == e2?.isActive &&
        e1?.blockLayoutId == e2?.blockLayoutId &&
        e1?.name == e2?.name &&
        e1?.details == e2?.details &&
        e1?.isListView == e2?.isListView &&
        listEquality.equals(e1?.tags, e2?.tags);
  }

  @override
  int hash(BlockTypesRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.updatedTime,
        e?.user,
        e?.uid,
        e?.isActive,
        e?.blockLayoutId,
        e?.name,
        e?.details,
        e?.isListView,
        e?.tags
      ]);

  @override
  bool isValidKey(Object? o) => o is BlockTypesRecord;
}
