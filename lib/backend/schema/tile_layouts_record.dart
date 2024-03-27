import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TileLayoutsRecord extends FirestoreRecord {
  TileLayoutsRecord._(
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

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "options" field.
  List<KeyValueStruct>? _options;
  List<KeyValueStruct> get options => _options ?? const [];
  bool hasOptions() => _options != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _uid = snapshotData['uid'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _name = snapshotData['name'] as String?;
    _details = snapshotData['details'] as String?;
    _options = getStructList(
      snapshotData['options'],
      KeyValueStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tile_layouts');

  static Stream<TileLayoutsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TileLayoutsRecord.fromSnapshot(s));

  static Future<TileLayoutsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TileLayoutsRecord.fromSnapshot(s));

  static TileLayoutsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TileLayoutsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TileLayoutsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TileLayoutsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TileLayoutsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TileLayoutsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTileLayoutsRecordData({
  DateTime? createdTime,
  DateTime? updatedTime,
  DocumentReference? user,
  String? uid,
  bool? isActive,
  String? name,
  String? details,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'updated_time': updatedTime,
      'user': user,
      'uid': uid,
      'isActive': isActive,
      'name': name,
      'details': details,
    }.withoutNulls,
  );

  return firestoreData;
}

class TileLayoutsRecordDocumentEquality implements Equality<TileLayoutsRecord> {
  const TileLayoutsRecordDocumentEquality();

  @override
  bool equals(TileLayoutsRecord? e1, TileLayoutsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.user == e2?.user &&
        e1?.uid == e2?.uid &&
        e1?.isActive == e2?.isActive &&
        e1?.name == e2?.name &&
        e1?.details == e2?.details &&
        listEquality.equals(e1?.options, e2?.options);
  }

  @override
  int hash(TileLayoutsRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.updatedTime,
        e?.user,
        e?.uid,
        e?.isActive,
        e?.name,
        e?.details,
        e?.options
      ]);

  @override
  bool isValidKey(Object? o) => o is TileLayoutsRecord;
}
