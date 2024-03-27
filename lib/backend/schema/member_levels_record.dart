import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MemberLevelsRecord extends FirestoreRecord {
  MemberLevelsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "categorylist" field.
  List<String>? _categorylist;
  List<String> get categorylist => _categorylist ?? const [];
  bool hasCategorylist() => _categorylist != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "userswithaccess" field.
  List<DocumentReference>? _userswithaccess;
  List<DocumentReference> get userswithaccess => _userswithaccess ?? const [];
  bool hasUserswithaccess() => _userswithaccess != null;

  // "usersrequestingaccess" field.
  List<DocumentReference>? _usersrequestingaccess;
  List<DocumentReference> get usersrequestingaccess =>
      _usersrequestingaccess ?? const [];
  bool hasUsersrequestingaccess() => _usersrequestingaccess != null;

  // "requestaccess" field.
  List<String>? _requestaccess;
  List<String> get requestaccess => _requestaccess ?? const [];
  bool hasRequestaccess() => _requestaccess != null;

  // "noaccesstitle" field.
  String? _noaccesstitle;
  String get noaccesstitle => _noaccesstitle ?? '';
  bool hasNoaccesstitle() => _noaccesstitle != null;

  // "noaccessbody" field.
  String? _noaccessbody;
  String get noaccessbody => _noaccessbody ?? '';
  bool hasNoaccessbody() => _noaccessbody != null;

  // "hasaccess" field.
  List<bool>? _hasaccess;
  List<bool> get hasaccess => _hasaccess ?? const [];
  bool hasHasaccess() => _hasaccess != null;

  // "headerbkground" field.
  String? _headerbkground;
  String get headerbkground => _headerbkground ?? '';
  bool hasHeaderbkground() => _headerbkground != null;

  // "shield" field.
  String? _shield;
  String get shield => _shield ?? '';
  bool hasShield() => _shield != null;

  // "istellmemore" field.
  bool? _istellmemore;
  bool get istellmemore => _istellmemore ?? false;
  bool hasIstellmemore() => _istellmemore != null;

  // "accesspending" field.
  bool? _accesspending;
  bool get accesspending => _accesspending ?? false;
  bool hasAccesspending() => _accesspending != null;

  // "userspendingaccess" field.
  List<DocumentReference>? _userspendingaccess;
  List<DocumentReference> get userspendingaccess =>
      _userspendingaccess ?? const [];
  bool hasUserspendingaccess() => _userspendingaccess != null;

  // "accesspendngmessage" field.
  String? _accesspendngmessage;
  String get accesspendngmessage => _accesspendngmessage ?? '';
  bool hasAccesspendngmessage() => _accesspendngmessage != null;

  // "ison" field.
  bool? _ison;
  bool get ison => _ison ?? false;
  bool hasIson() => _ison != null;

  // "accesscode" field.
  String? _accesscode;
  String get accesscode => _accesscode ?? '';
  bool hasAccesscode() => _accesscode != null;

  // "firsttileref" field.
  DocumentReference? _firsttileref;
  DocumentReference? get firsttileref => _firsttileref;
  bool hasFirsttileref() => _firsttileref != null;

  // "pushnotificationson" field.
  List<DocumentReference>? _pushnotificationson;
  List<DocumentReference> get pushnotificationson =>
      _pushnotificationson ?? const [];
  bool hasPushnotificationson() => _pushnotificationson != null;

  // "pushnotificationsoff" field.
  List<DocumentReference>? _pushnotificationsoff;
  List<DocumentReference> get pushnotificationsoff =>
      _pushnotificationsoff ?? const [];
  bool hasPushnotificationsoff() => _pushnotificationsoff != null;

  // "isDefaultOnLoad" field.
  bool? _isDefaultOnLoad;
  bool get isDefaultOnLoad => _isDefaultOnLoad ?? false;
  bool hasIsDefaultOnLoad() => _isDefaultOnLoad != null;

  // "categoryOwnerId" field.
  String? _categoryOwnerId;
  String get categoryOwnerId => _categoryOwnerId ?? '';
  bool hasCategoryOwnerId() => _categoryOwnerId != null;

  // "memberLevelName" field.
  String? _memberLevelName;
  String get memberLevelName => _memberLevelName ?? '';
  bool hasMemberLevelName() => _memberLevelName != null;

  // "categoriesInMemberLevel" field.
  List<DocumentReference>? _categoriesInMemberLevel;
  List<DocumentReference> get categoriesInMemberLevel =>
      _categoriesInMemberLevel ?? const [];
  bool hasCategoriesInMemberLevel() => _categoriesInMemberLevel != null;

  // "companyDocId" field.
  String? _companyDocId;
  String get companyDocId => _companyDocId ?? '';
  bool hasCompanyDocId() => _companyDocId != null;

  // "leftColumn" field.
  String? _leftColumn;
  String get leftColumn => _leftColumn ?? '';
  bool hasLeftColumn() => _leftColumn != null;

  // "middleColumn" field.
  String? _middleColumn;
  String get middleColumn => _middleColumn ?? '';
  bool hasMiddleColumn() => _middleColumn != null;

  // "rightColumn" field.
  String? _rightColumn;
  String get rightColumn => _rightColumn ?? '';
  bool hasRightColumn() => _rightColumn != null;

  void _initializeFields() {
    _categorylist = getDataList(snapshotData['categorylist']);
    _index = castToType<int>(snapshotData['index']);
    _userswithaccess = getDataList(snapshotData['userswithaccess']);
    _usersrequestingaccess = getDataList(snapshotData['usersrequestingaccess']);
    _requestaccess = getDataList(snapshotData['requestaccess']);
    _noaccesstitle = snapshotData['noaccesstitle'] as String?;
    _noaccessbody = snapshotData['noaccessbody'] as String?;
    _hasaccess = getDataList(snapshotData['hasaccess']);
    _headerbkground = snapshotData['headerbkground'] as String?;
    _shield = snapshotData['shield'] as String?;
    _istellmemore = snapshotData['istellmemore'] as bool?;
    _accesspending = snapshotData['accesspending'] as bool?;
    _userspendingaccess = getDataList(snapshotData['userspendingaccess']);
    _accesspendngmessage = snapshotData['accesspendngmessage'] as String?;
    _ison = snapshotData['ison'] as bool?;
    _accesscode = snapshotData['accesscode'] as String?;
    _firsttileref = snapshotData['firsttileref'] as DocumentReference?;
    _pushnotificationson = getDataList(snapshotData['pushnotificationson']);
    _pushnotificationsoff = getDataList(snapshotData['pushnotificationsoff']);
    _isDefaultOnLoad = snapshotData['isDefaultOnLoad'] as bool?;
    _categoryOwnerId = snapshotData['categoryOwnerId'] as String?;
    _memberLevelName = snapshotData['memberLevelName'] as String?;
    _categoriesInMemberLevel =
        getDataList(snapshotData['categoriesInMemberLevel']);
    _companyDocId = snapshotData['companyDocId'] as String?;
    _leftColumn = snapshotData['leftColumn'] as String?;
    _middleColumn = snapshotData['middleColumn'] as String?;
    _rightColumn = snapshotData['rightColumn'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('memberLevels');

  static Stream<MemberLevelsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MemberLevelsRecord.fromSnapshot(s));

  static Future<MemberLevelsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MemberLevelsRecord.fromSnapshot(s));

  static MemberLevelsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MemberLevelsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MemberLevelsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MemberLevelsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MemberLevelsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MemberLevelsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMemberLevelsRecordData({
  int? index,
  String? noaccesstitle,
  String? noaccessbody,
  String? headerbkground,
  String? shield,
  bool? istellmemore,
  bool? accesspending,
  String? accesspendngmessage,
  bool? ison,
  String? accesscode,
  DocumentReference? firsttileref,
  bool? isDefaultOnLoad,
  String? categoryOwnerId,
  String? memberLevelName,
  String? companyDocId,
  String? leftColumn,
  String? middleColumn,
  String? rightColumn,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'index': index,
      'noaccesstitle': noaccesstitle,
      'noaccessbody': noaccessbody,
      'headerbkground': headerbkground,
      'shield': shield,
      'istellmemore': istellmemore,
      'accesspending': accesspending,
      'accesspendngmessage': accesspendngmessage,
      'ison': ison,
      'accesscode': accesscode,
      'firsttileref': firsttileref,
      'isDefaultOnLoad': isDefaultOnLoad,
      'categoryOwnerId': categoryOwnerId,
      'memberLevelName': memberLevelName,
      'companyDocId': companyDocId,
      'leftColumn': leftColumn,
      'middleColumn': middleColumn,
      'rightColumn': rightColumn,
    }.withoutNulls,
  );

  return firestoreData;
}

class MemberLevelsRecordDocumentEquality
    implements Equality<MemberLevelsRecord> {
  const MemberLevelsRecordDocumentEquality();

  @override
  bool equals(MemberLevelsRecord? e1, MemberLevelsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.categorylist, e2?.categorylist) &&
        e1?.index == e2?.index &&
        listEquality.equals(e1?.userswithaccess, e2?.userswithaccess) &&
        listEquality.equals(
            e1?.usersrequestingaccess, e2?.usersrequestingaccess) &&
        listEquality.equals(e1?.requestaccess, e2?.requestaccess) &&
        e1?.noaccesstitle == e2?.noaccesstitle &&
        e1?.noaccessbody == e2?.noaccessbody &&
        listEquality.equals(e1?.hasaccess, e2?.hasaccess) &&
        e1?.headerbkground == e2?.headerbkground &&
        e1?.shield == e2?.shield &&
        e1?.istellmemore == e2?.istellmemore &&
        e1?.accesspending == e2?.accesspending &&
        listEquality.equals(e1?.userspendingaccess, e2?.userspendingaccess) &&
        e1?.accesspendngmessage == e2?.accesspendngmessage &&
        e1?.ison == e2?.ison &&
        e1?.accesscode == e2?.accesscode &&
        e1?.firsttileref == e2?.firsttileref &&
        listEquality.equals(e1?.pushnotificationson, e2?.pushnotificationson) &&
        listEquality.equals(
            e1?.pushnotificationsoff, e2?.pushnotificationsoff) &&
        e1?.isDefaultOnLoad == e2?.isDefaultOnLoad &&
        e1?.categoryOwnerId == e2?.categoryOwnerId &&
        e1?.memberLevelName == e2?.memberLevelName &&
        listEquality.equals(
            e1?.categoriesInMemberLevel, e2?.categoriesInMemberLevel) &&
        e1?.companyDocId == e2?.companyDocId &&
        e1?.leftColumn == e2?.leftColumn &&
        e1?.middleColumn == e2?.middleColumn &&
        e1?.rightColumn == e2?.rightColumn;
  }

  @override
  int hash(MemberLevelsRecord? e) => const ListEquality().hash([
        e?.categorylist,
        e?.index,
        e?.userswithaccess,
        e?.usersrequestingaccess,
        e?.requestaccess,
        e?.noaccesstitle,
        e?.noaccessbody,
        e?.hasaccess,
        e?.headerbkground,
        e?.shield,
        e?.istellmemore,
        e?.accesspending,
        e?.userspendingaccess,
        e?.accesspendngmessage,
        e?.ison,
        e?.accesscode,
        e?.firsttileref,
        e?.pushnotificationson,
        e?.pushnotificationsoff,
        e?.isDefaultOnLoad,
        e?.categoryOwnerId,
        e?.memberLevelName,
        e?.categoriesInMemberLevel,
        e?.companyDocId,
        e?.leftColumn,
        e?.middleColumn,
        e?.rightColumn
      ]);

  @override
  bool isValidKey(Object? o) => o is MemberLevelsRecord;
}
