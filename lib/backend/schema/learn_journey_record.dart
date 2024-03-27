import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LearnJourneyRecord extends FirestoreRecord {
  LearnJourneyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "searchPhrase" field.
  String? _searchPhrase;
  String get searchPhrase => _searchPhrase ?? '';
  bool hasSearchPhrase() => _searchPhrase != null;

  // "totalTime" field.
  String? _totalTime;
  String get totalTime => _totalTime ?? '';
  bool hasTotalTime() => _totalTime != null;

  // "learnCardsUsed" field.
  int? _learnCardsUsed;
  int get learnCardsUsed => _learnCardsUsed ?? 0;
  bool hasLearnCardsUsed() => _learnCardsUsed != null;

  // "associatedUserId" field.
  String? _associatedUserId;
  String get associatedUserId => _associatedUserId ?? '';
  bool hasAssociatedUserId() => _associatedUserId != null;

  // "associatedSessionId" field.
  String? _associatedSessionId;
  String get associatedSessionId => _associatedSessionId ?? '';
  bool hasAssociatedSessionId() => _associatedSessionId != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _searchPhrase = snapshotData['searchPhrase'] as String?;
    _totalTime = snapshotData['totalTime'] as String?;
    _learnCardsUsed = castToType<int>(snapshotData['learnCardsUsed']);
    _associatedUserId = snapshotData['associatedUserId'] as String?;
    _associatedSessionId = snapshotData['associatedSessionId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('LearnJourney');

  static Stream<LearnJourneyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LearnJourneyRecord.fromSnapshot(s));

  static Future<LearnJourneyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LearnJourneyRecord.fromSnapshot(s));

  static LearnJourneyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LearnJourneyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LearnJourneyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LearnJourneyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LearnJourneyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LearnJourneyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLearnJourneyRecordData({
  String? title,
  String? searchPhrase,
  String? totalTime,
  int? learnCardsUsed,
  String? associatedUserId,
  String? associatedSessionId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'searchPhrase': searchPhrase,
      'totalTime': totalTime,
      'learnCardsUsed': learnCardsUsed,
      'associatedUserId': associatedUserId,
      'associatedSessionId': associatedSessionId,
    }.withoutNulls,
  );

  return firestoreData;
}

class LearnJourneyRecordDocumentEquality
    implements Equality<LearnJourneyRecord> {
  const LearnJourneyRecordDocumentEquality();

  @override
  bool equals(LearnJourneyRecord? e1, LearnJourneyRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.searchPhrase == e2?.searchPhrase &&
        e1?.totalTime == e2?.totalTime &&
        e1?.learnCardsUsed == e2?.learnCardsUsed &&
        e1?.associatedUserId == e2?.associatedUserId &&
        e1?.associatedSessionId == e2?.associatedSessionId;
  }

  @override
  int hash(LearnJourneyRecord? e) => const ListEquality().hash([
        e?.title,
        e?.searchPhrase,
        e?.totalTime,
        e?.learnCardsUsed,
        e?.associatedUserId,
        e?.associatedSessionId
      ]);

  @override
  bool isValidKey(Object? o) => o is LearnJourneyRecord;
}
