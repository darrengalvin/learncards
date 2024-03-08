import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class LearnCardEntriesRecord extends FirestoreRecord {
  LearnCardEntriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "postedBy" field.
  String? _postedBy;
  String get postedBy => _postedBy ?? '';
  bool hasPostedBy() => _postedBy != null;

  // "skillsUsed" field.
  List<String>? _skillsUsed;
  List<String> get skillsUsed => _skillsUsed ?? const [];
  bool hasSkillsUsed() => _skillsUsed != null;

  // "postDetails" field.
  String? _postDetails;
  String get postDetails => _postDetails ?? '';
  bool hasPostDetails() => _postDetails != null;

  // "postLikes" field.
  List<String>? _postLikes;
  List<String> get postLikes => _postLikes ?? const [];
  bool hasPostLikes() => _postLikes != null;

  // "postedTime" field.
  DateTime? _postedTime;
  DateTime? get postedTime => _postedTime;
  bool hasPostedTime() => _postedTime != null;

  // "associatedLearnCard" field.
  String? _associatedLearnCard;
  String get associatedLearnCard => _associatedLearnCard ?? '';
  bool hasAssociatedLearnCard() => _associatedLearnCard != null;

  // "sessionId" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  bool hasSessionId() => _sessionId != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "userEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "private" field.
  bool? _private;
  bool get private => _private ?? false;
  bool hasPrivate() => _private != null;

  // "companyDocId" field.
  String? _companyDocId;
  String get companyDocId => _companyDocId ?? '';
  bool hasCompanyDocId() => _companyDocId != null;

  void _initializeFields() {
    _postedBy = snapshotData['postedBy'] as String?;
    _skillsUsed = getDataList(snapshotData['skillsUsed']);
    _postDetails = snapshotData['postDetails'] as String?;
    _postLikes = getDataList(snapshotData['postLikes']);
    _postedTime = snapshotData['postedTime'] as DateTime?;
    _associatedLearnCard = snapshotData['associatedLearnCard'] as String?;
    _sessionId = snapshotData['sessionId'] as String?;
    _userName = snapshotData['userName'] as String?;
    _userEmail = snapshotData['userEmail'] as String?;
    _private = snapshotData['private'] as bool?;
    _companyDocId = snapshotData['companyDocId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('learnCardEntries');

  static Stream<LearnCardEntriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LearnCardEntriesRecord.fromSnapshot(s));

  static Future<LearnCardEntriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => LearnCardEntriesRecord.fromSnapshot(s));

  static LearnCardEntriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LearnCardEntriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LearnCardEntriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LearnCardEntriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LearnCardEntriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LearnCardEntriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLearnCardEntriesRecordData({
  String? postedBy,
  String? postDetails,
  DateTime? postedTime,
  String? associatedLearnCard,
  String? sessionId,
  String? userName,
  String? userEmail,
  bool? private,
  String? companyDocId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postedBy': postedBy,
      'postDetails': postDetails,
      'postedTime': postedTime,
      'associatedLearnCard': associatedLearnCard,
      'sessionId': sessionId,
      'userName': userName,
      'userEmail': userEmail,
      'private': private,
      'companyDocId': companyDocId,
    }.withoutNulls,
  );

  return firestoreData;
}

class LearnCardEntriesRecordDocumentEquality
    implements Equality<LearnCardEntriesRecord> {
  const LearnCardEntriesRecordDocumentEquality();

  @override
  bool equals(LearnCardEntriesRecord? e1, LearnCardEntriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postedBy == e2?.postedBy &&
        listEquality.equals(e1?.skillsUsed, e2?.skillsUsed) &&
        e1?.postDetails == e2?.postDetails &&
        listEquality.equals(e1?.postLikes, e2?.postLikes) &&
        e1?.postedTime == e2?.postedTime &&
        e1?.associatedLearnCard == e2?.associatedLearnCard &&
        e1?.sessionId == e2?.sessionId &&
        e1?.userName == e2?.userName &&
        e1?.userEmail == e2?.userEmail &&
        e1?.private == e2?.private &&
        e1?.companyDocId == e2?.companyDocId;
  }

  @override
  int hash(LearnCardEntriesRecord? e) => const ListEquality().hash([
        e?.postedBy,
        e?.skillsUsed,
        e?.postDetails,
        e?.postLikes,
        e?.postedTime,
        e?.associatedLearnCard,
        e?.sessionId,
        e?.userName,
        e?.userEmail,
        e?.private,
        e?.companyDocId
      ]);

  @override
  bool isValidKey(Object? o) => o is LearnCardEntriesRecord;
}
