import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "following" field.
  List<DocumentReference>? _following;
  List<DocumentReference> get following => _following ?? const [];
  bool hasFollowing() => _following != null;

  // "likesqty" field.
  int? _likesqty;
  int get likesqty => _likesqty ?? 0;
  bool hasLikesqty() => _likesqty != null;

  // "mobilenumber" field.
  int? _mobilenumber;
  int get mobilenumber => _mobilenumber ?? 0;
  bool hasMobilenumber() => _mobilenumber != null;

  // "schoolname" field.
  String? _schoolname;
  String get schoolname => _schoolname ?? '';
  bool hasSchoolname() => _schoolname != null;

  // "hasaccess" field.
  List<String>? _hasaccess;
  List<String> get hasaccess => _hasaccess ?? const [];
  bool hasHasaccess() => _hasaccess != null;

  // "isadmin" field.
  bool? _isadmin;
  bool get isadmin => _isadmin ?? false;
  bool hasIsadmin() => _isadmin != null;

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "memberlevel" field.
  List<String>? _memberlevel;
  List<String> get memberlevel => _memberlevel ?? const [];
  bool hasMemberlevel() => _memberlevel != null;

  // "categoryselected" field.
  String? _categoryselected;
  String get categoryselected => _categoryselected ?? '';
  bool hasCategoryselected() => _categoryselected != null;

  // "accessrequested" field.
  String? _accessrequested;
  String get accessrequested => _accessrequested ?? '';
  bool hasAccessrequested() => _accessrequested != null;

  // "lastonline" field.
  DateTime? _lastonline;
  DateTime? get lastonline => _lastonline;
  bool hasLastonline() => _lastonline != null;

  // "allowedtoadmin" field.
  bool? _allowedtoadmin;
  bool get allowedtoadmin => _allowedtoadmin ?? false;
  bool hasAllowedtoadmin() => _allowedtoadmin != null;

  // "lasttiletouched" field.
  List<DocumentReference>? _lasttiletouched;
  List<DocumentReference> get lasttiletouched => _lasttiletouched ?? const [];
  bool hasLasttiletouched() => _lasttiletouched != null;

  // "notify" field.
  List<DocumentReference>? _notify;
  List<DocumentReference> get notify => _notify ?? const [];
  bool hasNotify() => _notify != null;

  // "AI_ID" field.
  int? _aiId;
  int get aiId => _aiId ?? 0;
  bool hasAiId() => _aiId != null;

  // "idDEV" field.
  bool? _idDEV;
  bool get idDEV => _idDEV ?? false;
  bool hasIdDEV() => _idDEV != null;

  // "isowner" field.
  bool? _isowner;
  bool get isowner => _isowner ?? false;
  bool hasIsowner() => _isowner != null;

  // "aiName" field.
  String? _aiName;
  String get aiName => _aiName ?? '';
  bool hasAiName() => _aiName != null;

  // "aiimage" field.
  String? _aiimage;
  String get aiimage => _aiimage ?? '';
  bool hasAiimage() => _aiimage != null;

  // "cpdscore" field.
  String? _cpdscore;
  String get cpdscore => _cpdscore ?? '';
  bool hasCpdscore() => _cpdscore != null;

  // "startingtile" field.
  DocumentReference? _startingtile;
  DocumentReference? get startingtile => _startingtile;
  bool hasStartingtile() => _startingtile != null;

  // "subscriptions" field.
  List<String>? _subscriptions;
  List<String> get subscriptions => _subscriptions ?? const [];
  bool hasSubscriptions() => _subscriptions != null;

  // "users" field.
  List<String>? _users;
  List<String> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "groups" field.
  List<String>? _groups;
  List<String> get groups => _groups ?? const [];
  bool hasGroups() => _groups != null;

  // "admins" field.
  List<String>? _admins;
  List<String> get admins => _admins ?? const [];
  bool hasAdmins() => _admins != null;

  // "CPDTime" field.
  int? _cPDTime;
  int get cPDTime => _cPDTime ?? 0;
  bool hasCPDTime() => _cPDTime != null;

  // "mySessions" field.
  List<String>? _mySessions;
  List<String> get mySessions => _mySessions ?? const [];
  bool hasMySessions() => _mySessions != null;

  // "hasSyncedProgress" field.
  bool? _hasSyncedProgress;
  bool get hasSyncedProgress => _hasSyncedProgress ?? false;
  bool hasHasSyncedProgress() => _hasSyncedProgress != null;

  // "totalLearnCards" field.
  int? _totalLearnCards;
  int get totalLearnCards => _totalLearnCards ?? 0;
  bool hasTotalLearnCards() => _totalLearnCards != null;

  // "coachMeThreadID" field.
  String? _coachMeThreadID;
  String get coachMeThreadID => _coachMeThreadID ?? '';
  bool hasCoachMeThreadID() => _coachMeThreadID != null;

  // "companyId" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  // "lastSessionId" field.
  String? _lastSessionId;
  String get lastSessionId => _lastSessionId ?? '';
  bool hasLastSessionId() => _lastSessionId != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _following = getDataList(snapshotData['following']);
    _likesqty = castToType<int>(snapshotData['likesqty']);
    _mobilenumber = castToType<int>(snapshotData['mobilenumber']);
    _schoolname = snapshotData['schoolname'] as String?;
    _hasaccess = getDataList(snapshotData['hasaccess']);
    _isadmin = snapshotData['isadmin'] as bool?;
    _userref = snapshotData['userref'] as DocumentReference?;
    _location = snapshotData['location'] as String?;
    _memberlevel = getDataList(snapshotData['memberlevel']);
    _categoryselected = snapshotData['categoryselected'] as String?;
    _accessrequested = snapshotData['accessrequested'] as String?;
    _lastonline = snapshotData['lastonline'] as DateTime?;
    _allowedtoadmin = snapshotData['allowedtoadmin'] as bool?;
    _lasttiletouched = getDataList(snapshotData['lasttiletouched']);
    _notify = getDataList(snapshotData['notify']);
    _aiId = castToType<int>(snapshotData['AI_ID']);
    _idDEV = snapshotData['idDEV'] as bool?;
    _isowner = snapshotData['isowner'] as bool?;
    _aiName = snapshotData['aiName'] as String?;
    _aiimage = snapshotData['aiimage'] as String?;
    _cpdscore = snapshotData['cpdscore'] as String?;
    _startingtile = snapshotData['startingtile'] as DocumentReference?;
    _subscriptions = getDataList(snapshotData['subscriptions']);
    _users = getDataList(snapshotData['users']);
    _groups = getDataList(snapshotData['groups']);
    _admins = getDataList(snapshotData['admins']);
    _cPDTime = castToType<int>(snapshotData['CPDTime']);
    _mySessions = getDataList(snapshotData['mySessions']);
    _hasSyncedProgress = snapshotData['hasSyncedProgress'] as bool?;
    _totalLearnCards = castToType<int>(snapshotData['totalLearnCards']);
    _coachMeThreadID = snapshotData['coachMeThreadID'] as String?;
    _companyId = snapshotData['companyId'] as String?;
    _lastSessionId = snapshotData['lastSessionId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  int? likesqty,
  int? mobilenumber,
  String? schoolname,
  bool? isadmin,
  DocumentReference? userref,
  String? location,
  String? categoryselected,
  String? accessrequested,
  DateTime? lastonline,
  bool? allowedtoadmin,
  int? aiId,
  bool? idDEV,
  bool? isowner,
  String? aiName,
  String? aiimage,
  String? cpdscore,
  DocumentReference? startingtile,
  int? cPDTime,
  bool? hasSyncedProgress,
  int? totalLearnCards,
  String? coachMeThreadID,
  String? companyId,
  String? lastSessionId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'likesqty': likesqty,
      'mobilenumber': mobilenumber,
      'schoolname': schoolname,
      'isadmin': isadmin,
      'userref': userref,
      'location': location,
      'categoryselected': categoryselected,
      'accessrequested': accessrequested,
      'lastonline': lastonline,
      'allowedtoadmin': allowedtoadmin,
      'AI_ID': aiId,
      'idDEV': idDEV,
      'isowner': isowner,
      'aiName': aiName,
      'aiimage': aiimage,
      'cpdscore': cpdscore,
      'startingtile': startingtile,
      'CPDTime': cPDTime,
      'hasSyncedProgress': hasSyncedProgress,
      'totalLearnCards': totalLearnCards,
      'coachMeThreadID': coachMeThreadID,
      'companyId': companyId,
      'lastSessionId': lastSessionId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.following, e2?.following) &&
        e1?.likesqty == e2?.likesqty &&
        e1?.mobilenumber == e2?.mobilenumber &&
        e1?.schoolname == e2?.schoolname &&
        listEquality.equals(e1?.hasaccess, e2?.hasaccess) &&
        e1?.isadmin == e2?.isadmin &&
        e1?.userref == e2?.userref &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.memberlevel, e2?.memberlevel) &&
        e1?.categoryselected == e2?.categoryselected &&
        e1?.accessrequested == e2?.accessrequested &&
        e1?.lastonline == e2?.lastonline &&
        e1?.allowedtoadmin == e2?.allowedtoadmin &&
        listEquality.equals(e1?.lasttiletouched, e2?.lasttiletouched) &&
        listEquality.equals(e1?.notify, e2?.notify) &&
        e1?.aiId == e2?.aiId &&
        e1?.idDEV == e2?.idDEV &&
        e1?.isowner == e2?.isowner &&
        e1?.aiName == e2?.aiName &&
        e1?.aiimage == e2?.aiimage &&
        e1?.cpdscore == e2?.cpdscore &&
        e1?.startingtile == e2?.startingtile &&
        listEquality.equals(e1?.subscriptions, e2?.subscriptions) &&
        listEquality.equals(e1?.users, e2?.users) &&
        listEquality.equals(e1?.groups, e2?.groups) &&
        listEquality.equals(e1?.admins, e2?.admins) &&
        e1?.cPDTime == e2?.cPDTime &&
        listEquality.equals(e1?.mySessions, e2?.mySessions) &&
        e1?.hasSyncedProgress == e2?.hasSyncedProgress &&
        e1?.totalLearnCards == e2?.totalLearnCards &&
        e1?.coachMeThreadID == e2?.coachMeThreadID &&
        e1?.companyId == e2?.companyId &&
        e1?.lastSessionId == e2?.lastSessionId;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.following,
        e?.likesqty,
        e?.mobilenumber,
        e?.schoolname,
        e?.hasaccess,
        e?.isadmin,
        e?.userref,
        e?.location,
        e?.memberlevel,
        e?.categoryselected,
        e?.accessrequested,
        e?.lastonline,
        e?.allowedtoadmin,
        e?.lasttiletouched,
        e?.notify,
        e?.aiId,
        e?.idDEV,
        e?.isowner,
        e?.aiName,
        e?.aiimage,
        e?.cpdscore,
        e?.startingtile,
        e?.subscriptions,
        e?.users,
        e?.groups,
        e?.admins,
        e?.cPDTime,
        e?.mySessions,
        e?.hasSyncedProgress,
        e?.totalLearnCards,
        e?.coachMeThreadID,
        e?.companyId,
        e?.lastSessionId
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
