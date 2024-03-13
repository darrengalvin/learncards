import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class GroupsRecord extends FirestoreRecord {
  GroupsRecord._(
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

  // "group_type" field.
  String? _groupType;
  String get groupType => _groupType ?? '';
  bool hasGroupType() => _groupType != null;

  // "group_id" field.
  String? _groupId;
  String get groupId => _groupId ?? '';
  bool hasGroupId() => _groupId != null;

  // "users" field.
  List<String>? _users;
  List<String> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "members" field.
  List<String>? _members;
  List<String> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "admins" field.
  List<String>? _admins;
  List<String> get admins => _admins ?? const [];
  bool hasAdmins() => _admins != null;

  // "isPublic" field.
  bool? _isPublic;
  bool get isPublic => _isPublic ?? false;
  bool hasIsPublic() => _isPublic != null;

  // "invite_code" field.
  String? _inviteCode;
  String get inviteCode => _inviteCode ?? '';
  bool hasInviteCode() => _inviteCode != null;

  // "invited" field.
  List<String>? _invited;
  List<String> get invited => _invited ?? const [];
  bool hasInvited() => _invited != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _uid = snapshotData['uid'] as String?;
    _groupType = snapshotData['group_type'] as String?;
    _groupId = snapshotData['group_id'] as String?;
    _users = getDataList(snapshotData['users']);
    _members = getDataList(snapshotData['members']);
    _admins = getDataList(snapshotData['admins']);
    _isPublic = snapshotData['isPublic'] as bool?;
    _inviteCode = snapshotData['invite_code'] as String?;
    _invited = getDataList(snapshotData['invited']);
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('groups');

  static Stream<GroupsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupsRecord.fromSnapshot(s));

  static Future<GroupsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupsRecord.fromSnapshot(s));

  static GroupsRecord fromSnapshot(DocumentSnapshot snapshot) => GroupsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupsRecordData({
  DateTime? createdTime,
  DateTime? updatedTime,
  DocumentReference? user,
  String? uid,
  String? groupType,
  String? groupId,
  bool? isPublic,
  String? inviteCode,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'updated_time': updatedTime,
      'user': user,
      'uid': uid,
      'group_type': groupType,
      'group_id': groupId,
      'isPublic': isPublic,
      'invite_code': inviteCode,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupsRecordDocumentEquality implements Equality<GroupsRecord> {
  const GroupsRecordDocumentEquality();

  @override
  bool equals(GroupsRecord? e1, GroupsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.user == e2?.user &&
        e1?.uid == e2?.uid &&
        e1?.groupType == e2?.groupType &&
        e1?.groupId == e2?.groupId &&
        listEquality.equals(e1?.users, e2?.users) &&
        listEquality.equals(e1?.members, e2?.members) &&
        listEquality.equals(e1?.admins, e2?.admins) &&
        e1?.isPublic == e2?.isPublic &&
        e1?.inviteCode == e2?.inviteCode &&
        listEquality.equals(e1?.invited, e2?.invited) &&
        e1?.name == e2?.name;
  }

  @override
  int hash(GroupsRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.updatedTime,
        e?.user,
        e?.uid,
        e?.groupType,
        e?.groupId,
        e?.users,
        e?.members,
        e?.admins,
        e?.isPublic,
        e?.inviteCode,
        e?.invited,
        e?.name
      ]);

  @override
  bool isValidKey(Object? o) => o is GroupsRecord;
}
