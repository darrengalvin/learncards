import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LearnCardsRecord extends FirestoreRecord {
  LearnCardsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "learnCardsRemaining" field.
  int? _learnCardsRemaining;
  int get learnCardsRemaining => _learnCardsRemaining ?? 0;
  bool hasLearnCardsRemaining() => _learnCardsRemaining != null;

  // "sessionId" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  bool hasSessionId() => _sessionId != null;

  // "associatedTileBlock" field.
  String? _associatedTileBlock;
  String get associatedTileBlock => _associatedTileBlock ?? '';
  bool hasAssociatedTileBlock() => _associatedTileBlock != null;

  // "htmlContent" field.
  String? _htmlContent;
  String get htmlContent => _htmlContent ?? '';
  bool hasHtmlContent() => _htmlContent != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "learnCardId" field.
  String? _learnCardId;
  String get learnCardId => _learnCardId ?? '';
  bool hasLearnCardId() => _learnCardId != null;

  // "started" field.
  bool? _started;
  bool get started => _started ?? false;
  bool hasStarted() => _started != null;

  // "inputKey" field.
  String? _inputKey;
  String get inputKey => _inputKey ?? '';
  bool hasInputKey() => _inputKey != null;

  // "outputKey" field.
  String? _outputKey;
  String get outputKey => _outputKey ?? '';
  bool hasOutputKey() => _outputKey != null;

  // "isDemo" field.
  bool? _isDemo;
  bool get isDemo => _isDemo ?? false;
  bool hasIsDemo() => _isDemo != null;

  // "tile_id" field.
  String? _tileId;
  String get tileId => _tileId ?? '';
  bool hasTileId() => _tileId != null;

  // "parent_tile_id" field.
  String? _parentTileId;
  String get parentTileId => _parentTileId ?? '';
  bool hasParentTileId() => _parentTileId != null;

  // "companyDocId" field.
  String? _companyDocId;
  String get companyDocId => _companyDocId ?? '';
  bool hasCompanyDocId() => _companyDocId != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "isWeeklyTopic" field.
  bool? _isWeeklyTopic;
  bool get isWeeklyTopic => _isWeeklyTopic ?? false;
  bool hasIsWeeklyTopic() => _isWeeklyTopic != null;

  // "mentorMessages" field.
  List<String>? _mentorMessages;
  List<String> get mentorMessages => _mentorMessages ?? const [];
  bool hasMentorMessages() => _mentorMessages != null;

  // "usersId" field.
  List<String>? _usersId;
  List<String> get usersId => _usersId ?? const [];
  bool hasUsersId() => _usersId != null;

  // "sessionsActiveId" field.
  List<String>? _sessionsActiveId;
  List<String> get sessionsActiveId => _sessionsActiveId ?? const [];
  bool hasSessionsActiveId() => _sessionsActiveId != null;

  // "mentorSuggestion" field.
  String? _mentorSuggestion;
  String get mentorSuggestion => _mentorSuggestion ?? '';
  bool hasMentorSuggestion() => _mentorSuggestion != null;

  // "mentorQuestion" field.
  String? _mentorQuestion;
  String get mentorQuestion => _mentorQuestion ?? '';
  bool hasMentorQuestion() => _mentorQuestion != null;

  void _initializeFields() {
    _learnCardsRemaining = castToType<int>(snapshotData['learnCardsRemaining']);
    _sessionId = snapshotData['sessionId'] as String?;
    _associatedTileBlock = snapshotData['associatedTileBlock'] as String?;
    _htmlContent = snapshotData['htmlContent'] as String?;
    _title = snapshotData['title'] as String?;
    _summary = snapshotData['summary'] as String?;
    _type = snapshotData['type'] as String?;
    _learnCardId = snapshotData['learnCardId'] as String?;
    _started = snapshotData['started'] as bool?;
    _inputKey = snapshotData['inputKey'] as String?;
    _outputKey = snapshotData['outputKey'] as String?;
    _isDemo = snapshotData['isDemo'] as bool?;
    _tileId = snapshotData['tile_id'] as String?;
    _parentTileId = snapshotData['parent_tile_id'] as String?;
    _companyDocId = snapshotData['companyDocId'] as String?;
    _description = snapshotData['description'] as String?;
    _isWeeklyTopic = snapshotData['isWeeklyTopic'] as bool?;
    _mentorMessages = getDataList(snapshotData['mentorMessages']);
    _usersId = getDataList(snapshotData['usersId']);
    _sessionsActiveId = getDataList(snapshotData['sessionsActiveId']);
    _mentorSuggestion = snapshotData['mentorSuggestion'] as String?;
    _mentorQuestion = snapshotData['mentorQuestion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('learnCards');

  static Stream<LearnCardsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LearnCardsRecord.fromSnapshot(s));

  static Future<LearnCardsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LearnCardsRecord.fromSnapshot(s));

  static LearnCardsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LearnCardsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LearnCardsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LearnCardsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LearnCardsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LearnCardsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLearnCardsRecordData({
  int? learnCardsRemaining,
  String? sessionId,
  String? associatedTileBlock,
  String? htmlContent,
  String? title,
  String? summary,
  String? type,
  String? learnCardId,
  bool? started,
  String? inputKey,
  String? outputKey,
  bool? isDemo,
  String? tileId,
  String? parentTileId,
  String? companyDocId,
  String? description,
  bool? isWeeklyTopic,
  String? mentorSuggestion,
  String? mentorQuestion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'learnCardsRemaining': learnCardsRemaining,
      'sessionId': sessionId,
      'associatedTileBlock': associatedTileBlock,
      'htmlContent': htmlContent,
      'title': title,
      'summary': summary,
      'type': type,
      'learnCardId': learnCardId,
      'started': started,
      'inputKey': inputKey,
      'outputKey': outputKey,
      'isDemo': isDemo,
      'tile_id': tileId,
      'parent_tile_id': parentTileId,
      'companyDocId': companyDocId,
      'description': description,
      'isWeeklyTopic': isWeeklyTopic,
      'mentorSuggestion': mentorSuggestion,
      'mentorQuestion': mentorQuestion,
    }.withoutNulls,
  );

  return firestoreData;
}

class LearnCardsRecordDocumentEquality implements Equality<LearnCardsRecord> {
  const LearnCardsRecordDocumentEquality();

  @override
  bool equals(LearnCardsRecord? e1, LearnCardsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.learnCardsRemaining == e2?.learnCardsRemaining &&
        e1?.sessionId == e2?.sessionId &&
        e1?.associatedTileBlock == e2?.associatedTileBlock &&
        e1?.htmlContent == e2?.htmlContent &&
        e1?.title == e2?.title &&
        e1?.summary == e2?.summary &&
        e1?.type == e2?.type &&
        e1?.learnCardId == e2?.learnCardId &&
        e1?.started == e2?.started &&
        e1?.inputKey == e2?.inputKey &&
        e1?.outputKey == e2?.outputKey &&
        e1?.isDemo == e2?.isDemo &&
        e1?.tileId == e2?.tileId &&
        e1?.parentTileId == e2?.parentTileId &&
        e1?.companyDocId == e2?.companyDocId &&
        e1?.description == e2?.description &&
        e1?.isWeeklyTopic == e2?.isWeeklyTopic &&
        listEquality.equals(e1?.mentorMessages, e2?.mentorMessages) &&
        listEquality.equals(e1?.usersId, e2?.usersId) &&
        listEquality.equals(e1?.sessionsActiveId, e2?.sessionsActiveId) &&
        e1?.mentorSuggestion == e2?.mentorSuggestion &&
        e1?.mentorQuestion == e2?.mentorQuestion;
  }

  @override
  int hash(LearnCardsRecord? e) => const ListEquality().hash([
        e?.learnCardsRemaining,
        e?.sessionId,
        e?.associatedTileBlock,
        e?.htmlContent,
        e?.title,
        e?.summary,
        e?.type,
        e?.learnCardId,
        e?.started,
        e?.inputKey,
        e?.outputKey,
        e?.isDemo,
        e?.tileId,
        e?.parentTileId,
        e?.companyDocId,
        e?.description,
        e?.isWeeklyTopic,
        e?.mentorMessages,
        e?.usersId,
        e?.sessionsActiveId,
        e?.mentorSuggestion,
        e?.mentorQuestion
      ]);

  @override
  bool isValidKey(Object? o) => o is LearnCardsRecord;
}
