import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigsRecord extends FirestoreRecord {
  ConfigsRecord._(
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

  // "config_name" field.
  String? _configName;
  String get configName => _configName ?? '';
  bool hasConfigName() => _configName != null;

  // "config_id" field.
  String? _configId;
  String get configId => _configId ?? '';
  bool hasConfigId() => _configId != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "isLocked" field.
  bool? _isLocked;
  bool get isLocked => _isLocked ?? false;
  bool hasIsLocked() => _isLocked != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "config_type" field.
  String? _configType;
  String get configType => _configType ?? '';
  bool hasConfigType() => _configType != null;

  // "dataStringList" field.
  List<String>? _dataStringList;
  List<String> get dataStringList => _dataStringList ?? const [];
  bool hasDataStringList() => _dataStringList != null;

  // "dataIntList" field.
  List<int>? _dataIntList;
  List<int> get dataIntList => _dataIntList ?? const [];
  bool hasDataIntList() => _dataIntList != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _uid = snapshotData['uid'] as String?;
    _configName = snapshotData['config_name'] as String?;
    _configId = snapshotData['config_id'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _title = snapshotData['title'] as String?;
    _details = snapshotData['details'] as String?;
    _isLocked = snapshotData['isLocked'] as bool?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _configType = snapshotData['config_type'] as String?;
    _dataStringList = getDataList(snapshotData['dataStringList']);
    _dataIntList = getDataList(snapshotData['dataIntList']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('configs');

  static Stream<ConfigsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfigsRecord.fromSnapshot(s));

  static Future<ConfigsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConfigsRecord.fromSnapshot(s));

  static ConfigsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConfigsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfigsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfigsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfigsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfigsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfigsRecordData({
  DateTime? createdTime,
  DateTime? updatedTime,
  DocumentReference? user,
  String? uid,
  String? configName,
  String? configId,
  bool? isActive,
  String? title,
  String? details,
  bool? isLocked,
  bool? isAdmin,
  String? configType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'updated_time': updatedTime,
      'user': user,
      'uid': uid,
      'config_name': configName,
      'config_id': configId,
      'isActive': isActive,
      'title': title,
      'details': details,
      'isLocked': isLocked,
      'isAdmin': isAdmin,
      'config_type': configType,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfigsRecordDocumentEquality implements Equality<ConfigsRecord> {
  const ConfigsRecordDocumentEquality();

  @override
  bool equals(ConfigsRecord? e1, ConfigsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.user == e2?.user &&
        e1?.uid == e2?.uid &&
        e1?.configName == e2?.configName &&
        e1?.configId == e2?.configId &&
        e1?.isActive == e2?.isActive &&
        e1?.title == e2?.title &&
        e1?.details == e2?.details &&
        e1?.isLocked == e2?.isLocked &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.configType == e2?.configType &&
        listEquality.equals(e1?.dataStringList, e2?.dataStringList) &&
        listEquality.equals(e1?.dataIntList, e2?.dataIntList);
  }

  @override
  int hash(ConfigsRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.updatedTime,
        e?.user,
        e?.uid,
        e?.configName,
        e?.configId,
        e?.isActive,
        e?.title,
        e?.details,
        e?.isLocked,
        e?.isAdmin,
        e?.configType,
        e?.dataStringList,
        e?.dataIntList
      ]);

  @override
  bool isValidKey(Object? o) => o is ConfigsRecord;
}
