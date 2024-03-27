import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class AppsRecord extends FirestoreRecord {
  AppsRecord._(
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

  // "app_id" field.
  String? _appId;
  String get appId => _appId ?? '';
  bool hasAppId() => _appId != null;

  // "app_type" field.
  String? _appType;
  String get appType => _appType ?? '';
  bool hasAppType() => _appType != null;

  // "app_status" field.
  String? _appStatus;
  String get appStatus => _appStatus ?? '';
  bool hasAppStatus() => _appStatus != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "owner_id" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  bool hasOwnerId() => _ownerId != null;

  // "admins" field.
  List<String>? _admins;
  List<String> get admins => _admins ?? const [];
  bool hasAdmins() => _admins != null;

  // "app_name" field.
  String? _appName;
  String get appName => _appName ?? '';
  bool hasAppName() => _appName != null;

  // "app_image" field.
  String? _appImage;
  String get appImage => _appImage ?? '';
  bool hasAppImage() => _appImage != null;

  // "settings" field.
  AppStruct? _settings;
  AppStruct get settings => _settings ?? AppStruct();
  bool hasSettings() => _settings != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _uid = snapshotData['uid'] as String?;
    _appId = snapshotData['app_id'] as String?;
    _appType = snapshotData['app_type'] as String?;
    _appStatus = snapshotData['app_status'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _ownerId = snapshotData['owner_id'] as String?;
    _admins = getDataList(snapshotData['admins']);
    _appName = snapshotData['app_name'] as String?;
    _appImage = snapshotData['app_image'] as String?;
    _settings = AppStruct.maybeFromMap(snapshotData['settings']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('apps');

  static Stream<AppsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppsRecord.fromSnapshot(s));

  static Future<AppsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppsRecord.fromSnapshot(s));

  static AppsRecord fromSnapshot(DocumentSnapshot snapshot) => AppsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppsRecordData({
  DateTime? createdTime,
  DateTime? updatedTime,
  DocumentReference? user,
  String? uid,
  String? appId,
  String? appType,
  String? appStatus,
  DocumentReference? owner,
  String? ownerId,
  String? appName,
  String? appImage,
  AppStruct? settings,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'updated_time': updatedTime,
      'user': user,
      'uid': uid,
      'app_id': appId,
      'app_type': appType,
      'app_status': appStatus,
      'owner': owner,
      'owner_id': ownerId,
      'app_name': appName,
      'app_image': appImage,
      'settings': AppStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "settings" field.
  addAppStructData(firestoreData, settings, 'settings');

  return firestoreData;
}

class AppsRecordDocumentEquality implements Equality<AppsRecord> {
  const AppsRecordDocumentEquality();

  @override
  bool equals(AppsRecord? e1, AppsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.user == e2?.user &&
        e1?.uid == e2?.uid &&
        e1?.appId == e2?.appId &&
        e1?.appType == e2?.appType &&
        e1?.appStatus == e2?.appStatus &&
        e1?.owner == e2?.owner &&
        e1?.ownerId == e2?.ownerId &&
        listEquality.equals(e1?.admins, e2?.admins) &&
        e1?.appName == e2?.appName &&
        e1?.appImage == e2?.appImage &&
        e1?.settings == e2?.settings;
  }

  @override
  int hash(AppsRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.updatedTime,
        e?.user,
        e?.uid,
        e?.appId,
        e?.appType,
        e?.appStatus,
        e?.owner,
        e?.ownerId,
        e?.admins,
        e?.appName,
        e?.appImage,
        e?.settings
      ]);

  @override
  bool isValidKey(Object? o) => o is AppsRecord;
}
