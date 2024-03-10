import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class AppModulesRecord extends FirestoreRecord {
  AppModulesRecord._(
    super.reference,
    super.data,
  ) {
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

  // "module_id" field.
  String? _moduleId;
  String get moduleId => _moduleId ?? '';
  bool hasModuleId() => _moduleId != null;

  // "module_type" field.
  String? _moduleType;
  String get moduleType => _moduleType ?? '';
  bool hasModuleType() => _moduleType != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "config" field.
  ConfigStruct? _config;
  ConfigStruct get config => _config ?? ConfigStruct();
  bool hasConfig() => _config != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _uid = snapshotData['uid'] as String?;
    _moduleId = snapshotData['module_id'] as String?;
    _moduleType = snapshotData['module_type'] as String?;
    _name = snapshotData['name'] as String?;
    _details = snapshotData['details'] as String?;
    _config = ConfigStruct.maybeFromMap(snapshotData['config']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('app_modules');

  static Stream<AppModulesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppModulesRecord.fromSnapshot(s));

  static Future<AppModulesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppModulesRecord.fromSnapshot(s));

  static AppModulesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppModulesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppModulesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppModulesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppModulesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppModulesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppModulesRecordData({
  DateTime? createdTime,
  DateTime? updatedTime,
  DocumentReference? user,
  String? uid,
  String? moduleId,
  String? moduleType,
  String? name,
  String? details,
  ConfigStruct? config,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'updated_time': updatedTime,
      'user': user,
      'uid': uid,
      'module_id': moduleId,
      'module_type': moduleType,
      'name': name,
      'details': details,
      'config': ConfigStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "config" field.
  addConfigStructData(firestoreData, config, 'config');

  return firestoreData;
}

class AppModulesRecordDocumentEquality implements Equality<AppModulesRecord> {
  const AppModulesRecordDocumentEquality();

  @override
  bool equals(AppModulesRecord? e1, AppModulesRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.user == e2?.user &&
        e1?.uid == e2?.uid &&
        e1?.moduleId == e2?.moduleId &&
        e1?.moduleType == e2?.moduleType &&
        e1?.name == e2?.name &&
        e1?.details == e2?.details &&
        e1?.config == e2?.config;
  }

  @override
  int hash(AppModulesRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.updatedTime,
        e?.user,
        e?.uid,
        e?.moduleId,
        e?.moduleType,
        e?.name,
        e?.details,
        e?.config
      ]);

  @override
  bool isValidKey(Object? o) => o is AppModulesRecord;
}
