import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SessionsRecord extends FirestoreRecord {
  SessionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "backgroundImage" field.
  String? _backgroundImage;
  String get backgroundImage => _backgroundImage ?? '';
  bool hasBackgroundImage() => _backgroundImage != null;

  // "wantToLearn" field.
  String? _wantToLearn;
  String get wantToLearn => _wantToLearn ?? '';
  bool hasWantToLearn() => _wantToLearn != null;

  // "sessionId" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  bool hasSessionId() => _sessionId != null;

  // "userAiData" field.
  UserDataForAiStruct? _userAiData;
  UserDataForAiStruct get userAiData => _userAiData ?? UserDataForAiStruct();
  bool hasUserAiData() => _userAiData != null;

  // "learnCardCount" field.
  int? _learnCardCount;
  int get learnCardCount => _learnCardCount ?? 0;
  bool hasLearnCardCount() => _learnCardCount != null;

  // "learnTimeMinutes" field.
  int? _learnTimeMinutes;
  int get learnTimeMinutes => _learnTimeMinutes ?? 0;
  bool hasLearnTimeMinutes() => _learnTimeMinutes != null;

  // "buttonValues" field.
  List<ButtonShowsStruct>? _buttonValues;
  List<ButtonShowsStruct> get buttonValues => _buttonValues ?? const [];
  bool hasButtonValues() => _buttonValues != null;

  // "learnCardsCompleted" field.
  List<LearnCardsCompleteStruct>? _learnCardsCompleted;
  List<LearnCardsCompleteStruct> get learnCardsCompleted =>
      _learnCardsCompleted ?? const [];
  bool hasLearnCardsCompleted() => _learnCardsCompleted != null;

  // "learnCardFeedbackGivenIds" field.
  List<String>? _learnCardFeedbackGivenIds;
  List<String> get learnCardFeedbackGivenIds =>
      _learnCardFeedbackGivenIds ?? const [];
  bool hasLearnCardFeedbackGivenIds() => _learnCardFeedbackGivenIds != null;

  // "freeCardsIssueCount" field.
  int? _freeCardsIssueCount;
  int get freeCardsIssueCount => _freeCardsIssueCount ?? 0;
  bool hasFreeCardsIssueCount() => _freeCardsIssueCount != null;

  // "defaultThreadId" field.
  String? _defaultThreadId;
  String get defaultThreadId => _defaultThreadId ?? '';
  bool hasDefaultThreadId() => _defaultThreadId != null;

  // "coachMeThreadID" field.
  String? _coachMeThreadID;
  String get coachMeThreadID => _coachMeThreadID ?? '';
  bool hasCoachMeThreadID() => _coachMeThreadID != null;

  // "sessionOwner" field.
  DocumentReference? _sessionOwner;
  DocumentReference? get sessionOwner => _sessionOwner;
  bool hasSessionOwner() => _sessionOwner != null;

  // "sessionOwnerId" field.
  String? _sessionOwnerId;
  String get sessionOwnerId => _sessionOwnerId ?? '';
  bool hasSessionOwnerId() => _sessionOwnerId != null;

  // "currentNavJourney" field.
  String? _currentNavJourney;
  String get currentNavJourney => _currentNavJourney ?? '';
  bool hasCurrentNavJourney() => _currentNavJourney != null;

  // "userEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "hasAccess" field.
  List<String>? _hasAccess;
  List<String> get hasAccess => _hasAccess ?? const [];
  bool hasHasAccess() => _hasAccess != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "person1ThreadId" field.
  String? _person1ThreadId;
  String get person1ThreadId => _person1ThreadId ?? '';
  bool hasPerson1ThreadId() => _person1ThreadId != null;

  // "person2ThreadId" field.
  String? _person2ThreadId;
  String get person2ThreadId => _person2ThreadId ?? '';
  bool hasPerson2ThreadId() => _person2ThreadId != null;

  // "person3ThreadId" field.
  String? _person3ThreadId;
  String get person3ThreadId => _person3ThreadId ?? '';
  bool hasPerson3ThreadId() => _person3ThreadId != null;

  // "person4ThreadId" field.
  String? _person4ThreadId;
  String get person4ThreadId => _person4ThreadId ?? '';
  bool hasPerson4ThreadId() => _person4ThreadId != null;

  // "person5ThreadId" field.
  String? _person5ThreadId;
  String get person5ThreadId => _person5ThreadId ?? '';
  bool hasPerson5ThreadId() => _person5ThreadId != null;

  // "startingUrl" field.
  String? _startingUrl;
  String get startingUrl => _startingUrl ?? '';
  bool hasStartingUrl() => _startingUrl != null;

  // "companyId" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  // "lastActive" field.
  DateTime? _lastActive;
  DateTime? get lastActive => _lastActive;
  bool hasLastActive() => _lastActive != null;

  // "threads" field.
  List<ThreadsStruct>? _threads;
  List<ThreadsStruct> get threads => _threads ?? const [];
  bool hasThreads() => _threads != null;

  // "aiQuestionAsked" field.
  String? _aiQuestionAsked;
  String get aiQuestionAsked => _aiQuestionAsked ?? '';
  bool hasAiQuestionAsked() => _aiQuestionAsked != null;

  void _initializeFields() {
    _dateTime = snapshotData['dateTime'] as DateTime?;
    _backgroundImage = snapshotData['backgroundImage'] as String?;
    _wantToLearn = snapshotData['wantToLearn'] as String?;
    _sessionId = snapshotData['sessionId'] as String?;
    _userAiData = UserDataForAiStruct.maybeFromMap(snapshotData['userAiData']);
    _learnCardCount = castToType<int>(snapshotData['learnCardCount']);
    _learnTimeMinutes = castToType<int>(snapshotData['learnTimeMinutes']);
    _buttonValues = getStructList(
      snapshotData['buttonValues'],
      ButtonShowsStruct.fromMap,
    );
    _learnCardsCompleted = getStructList(
      snapshotData['learnCardsCompleted'],
      LearnCardsCompleteStruct.fromMap,
    );
    _learnCardFeedbackGivenIds =
        getDataList(snapshotData['learnCardFeedbackGivenIds']);
    _freeCardsIssueCount = castToType<int>(snapshotData['freeCardsIssueCount']);
    _defaultThreadId = snapshotData['defaultThreadId'] as String?;
    _coachMeThreadID = snapshotData['coachMeThreadID'] as String?;
    _sessionOwner = snapshotData['sessionOwner'] as DocumentReference?;
    _sessionOwnerId = snapshotData['sessionOwnerId'] as String?;
    _currentNavJourney = snapshotData['currentNavJourney'] as String?;
    _userEmail = snapshotData['userEmail'] as String?;
    _hasAccess = getDataList(snapshotData['hasAccess']);
    _username = snapshotData['username'] as String?;
    _person1ThreadId = snapshotData['person1ThreadId'] as String?;
    _person2ThreadId = snapshotData['person2ThreadId'] as String?;
    _person3ThreadId = snapshotData['person3ThreadId'] as String?;
    _person4ThreadId = snapshotData['person4ThreadId'] as String?;
    _person5ThreadId = snapshotData['person5ThreadId'] as String?;
    _startingUrl = snapshotData['startingUrl'] as String?;
    _companyId = snapshotData['companyId'] as String?;
    _lastActive = snapshotData['lastActive'] as DateTime?;
    _threads = getStructList(
      snapshotData['threads'],
      ThreadsStruct.fromMap,
    );
    _aiQuestionAsked = snapshotData['aiQuestionAsked'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sessions');

  static Stream<SessionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SessionsRecord.fromSnapshot(s));

  static Future<SessionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SessionsRecord.fromSnapshot(s));

  static SessionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SessionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SessionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SessionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SessionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SessionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSessionsRecordData({
  DateTime? dateTime,
  String? backgroundImage,
  String? wantToLearn,
  String? sessionId,
  UserDataForAiStruct? userAiData,
  int? learnCardCount,
  int? learnTimeMinutes,
  int? freeCardsIssueCount,
  String? defaultThreadId,
  String? coachMeThreadID,
  DocumentReference? sessionOwner,
  String? sessionOwnerId,
  String? currentNavJourney,
  String? userEmail,
  String? username,
  String? person1ThreadId,
  String? person2ThreadId,
  String? person3ThreadId,
  String? person4ThreadId,
  String? person5ThreadId,
  String? startingUrl,
  String? companyId,
  DateTime? lastActive,
  String? aiQuestionAsked,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dateTime': dateTime,
      'backgroundImage': backgroundImage,
      'wantToLearn': wantToLearn,
      'sessionId': sessionId,
      'userAiData': UserDataForAiStruct().toMap(),
      'learnCardCount': learnCardCount,
      'learnTimeMinutes': learnTimeMinutes,
      'freeCardsIssueCount': freeCardsIssueCount,
      'defaultThreadId': defaultThreadId,
      'coachMeThreadID': coachMeThreadID,
      'sessionOwner': sessionOwner,
      'sessionOwnerId': sessionOwnerId,
      'currentNavJourney': currentNavJourney,
      'userEmail': userEmail,
      'username': username,
      'person1ThreadId': person1ThreadId,
      'person2ThreadId': person2ThreadId,
      'person3ThreadId': person3ThreadId,
      'person4ThreadId': person4ThreadId,
      'person5ThreadId': person5ThreadId,
      'startingUrl': startingUrl,
      'companyId': companyId,
      'lastActive': lastActive,
      'aiQuestionAsked': aiQuestionAsked,
    }.withoutNulls,
  );

  // Handle nested data for "userAiData" field.
  addUserDataForAiStructData(firestoreData, userAiData, 'userAiData');

  return firestoreData;
}

class SessionsRecordDocumentEquality implements Equality<SessionsRecord> {
  const SessionsRecordDocumentEquality();

  @override
  bool equals(SessionsRecord? e1, SessionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dateTime == e2?.dateTime &&
        e1?.backgroundImage == e2?.backgroundImage &&
        e1?.wantToLearn == e2?.wantToLearn &&
        e1?.sessionId == e2?.sessionId &&
        e1?.userAiData == e2?.userAiData &&
        e1?.learnCardCount == e2?.learnCardCount &&
        e1?.learnTimeMinutes == e2?.learnTimeMinutes &&
        listEquality.equals(e1?.buttonValues, e2?.buttonValues) &&
        listEquality.equals(e1?.learnCardsCompleted, e2?.learnCardsCompleted) &&
        listEquality.equals(
            e1?.learnCardFeedbackGivenIds, e2?.learnCardFeedbackGivenIds) &&
        e1?.freeCardsIssueCount == e2?.freeCardsIssueCount &&
        e1?.defaultThreadId == e2?.defaultThreadId &&
        e1?.coachMeThreadID == e2?.coachMeThreadID &&
        e1?.sessionOwner == e2?.sessionOwner &&
        e1?.sessionOwnerId == e2?.sessionOwnerId &&
        e1?.currentNavJourney == e2?.currentNavJourney &&
        e1?.userEmail == e2?.userEmail &&
        listEquality.equals(e1?.hasAccess, e2?.hasAccess) &&
        e1?.username == e2?.username &&
        e1?.person1ThreadId == e2?.person1ThreadId &&
        e1?.person2ThreadId == e2?.person2ThreadId &&
        e1?.person3ThreadId == e2?.person3ThreadId &&
        e1?.person4ThreadId == e2?.person4ThreadId &&
        e1?.person5ThreadId == e2?.person5ThreadId &&
        e1?.startingUrl == e2?.startingUrl &&
        e1?.companyId == e2?.companyId &&
        e1?.lastActive == e2?.lastActive &&
        listEquality.equals(e1?.threads, e2?.threads) &&
        e1?.aiQuestionAsked == e2?.aiQuestionAsked;
  }

  @override
  int hash(SessionsRecord? e) => const ListEquality().hash([
        e?.dateTime,
        e?.backgroundImage,
        e?.wantToLearn,
        e?.sessionId,
        e?.userAiData,
        e?.learnCardCount,
        e?.learnTimeMinutes,
        e?.buttonValues,
        e?.learnCardsCompleted,
        e?.learnCardFeedbackGivenIds,
        e?.freeCardsIssueCount,
        e?.defaultThreadId,
        e?.coachMeThreadID,
        e?.sessionOwner,
        e?.sessionOwnerId,
        e?.currentNavJourney,
        e?.userEmail,
        e?.hasAccess,
        e?.username,
        e?.person1ThreadId,
        e?.person2ThreadId,
        e?.person3ThreadId,
        e?.person4ThreadId,
        e?.person5ThreadId,
        e?.startingUrl,
        e?.companyId,
        e?.lastActive,
        e?.threads,
        e?.aiQuestionAsked
      ]);

  @override
  bool isValidKey(Object? o) => o is SessionsRecord;
}
