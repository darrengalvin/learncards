import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LearningActivitiesRecord extends FirestoreRecord {
  LearningActivitiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "htmlActivityGenerated" field.
  String? _htmlActivityGenerated;
  String get htmlActivityGenerated => _htmlActivityGenerated ?? '';
  bool hasHtmlActivityGenerated() => _htmlActivityGenerated != null;

  // "htmlPassed" field.
  String? _htmlPassed;
  String get htmlPassed => _htmlPassed ?? '';
  bool hasHtmlPassed() => _htmlPassed != null;

  // "tileId" field.
  String? _tileId;
  String get tileId => _tileId ?? '';
  bool hasTileId() => _tileId != null;

  // "titleOfSuggestedActivity" field.
  String? _titleOfSuggestedActivity;
  String get titleOfSuggestedActivity => _titleOfSuggestedActivity ?? '';
  bool hasTitleOfSuggestedActivity() => _titleOfSuggestedActivity != null;

  // "topicOfSuggestedActivityInteractiveQuizonGardeningBasics" field.
  String? _topicOfSuggestedActivityInteractiveQuizonGardeningBasics;
  String get topicOfSuggestedActivityInteractiveQuizonGardeningBasics =>
      _topicOfSuggestedActivityInteractiveQuizonGardeningBasics ?? '';
  bool hasTopicOfSuggestedActivityInteractiveQuizonGardeningBasics() =>
      _topicOfSuggestedActivityInteractiveQuizonGardeningBasics != null;

  // "responses" field.
  List<ResponsesStruct>? _responses;
  List<ResponsesStruct> get responses => _responses ?? const [];
  bool hasResponses() => _responses != null;

  // "tile_block_id" field.
  String? _tileBlockId;
  String get tileBlockId => _tileBlockId ?? '';
  bool hasTileBlockId() => _tileBlockId != null;

  // "topicOfSuggestedActivity" field.
  String? _topicOfSuggestedActivity;
  String get topicOfSuggestedActivity => _topicOfSuggestedActivity ?? '';
  bool hasTopicOfSuggestedActivity() => _topicOfSuggestedActivity != null;

  void _initializeFields() {
    _dateCreated = snapshotData['dateCreated'] as DateTime?;
    _htmlActivityGenerated = snapshotData['htmlActivityGenerated'] as String?;
    _htmlPassed = snapshotData['htmlPassed'] as String?;
    _tileId = snapshotData['tileId'] as String?;
    _titleOfSuggestedActivity =
        snapshotData['titleOfSuggestedActivity'] as String?;
    _topicOfSuggestedActivityInteractiveQuizonGardeningBasics =
        snapshotData['topicOfSuggestedActivityInteractiveQuizonGardeningBasics']
            as String?;
    _responses = getStructList(
      snapshotData['responses'],
      ResponsesStruct.fromMap,
    );
    _tileBlockId = snapshotData['tile_block_id'] as String?;
    _topicOfSuggestedActivity =
        snapshotData['topicOfSuggestedActivity'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('learningActivities');

  static Stream<LearningActivitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LearningActivitiesRecord.fromSnapshot(s));

  static Future<LearningActivitiesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => LearningActivitiesRecord.fromSnapshot(s));

  static LearningActivitiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LearningActivitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LearningActivitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LearningActivitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LearningActivitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LearningActivitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLearningActivitiesRecordData({
  DateTime? dateCreated,
  String? htmlActivityGenerated,
  String? htmlPassed,
  String? tileId,
  String? titleOfSuggestedActivity,
  String? topicOfSuggestedActivityInteractiveQuizonGardeningBasics,
  String? tileBlockId,
  String? topicOfSuggestedActivity,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dateCreated': dateCreated,
      'htmlActivityGenerated': htmlActivityGenerated,
      'htmlPassed': htmlPassed,
      'tileId': tileId,
      'titleOfSuggestedActivity': titleOfSuggestedActivity,
      'topicOfSuggestedActivityInteractiveQuizonGardeningBasics':
          topicOfSuggestedActivityInteractiveQuizonGardeningBasics,
      'tile_block_id': tileBlockId,
      'topicOfSuggestedActivity': topicOfSuggestedActivity,
    }.withoutNulls,
  );

  return firestoreData;
}

class LearningActivitiesRecordDocumentEquality
    implements Equality<LearningActivitiesRecord> {
  const LearningActivitiesRecordDocumentEquality();

  @override
  bool equals(LearningActivitiesRecord? e1, LearningActivitiesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dateCreated == e2?.dateCreated &&
        e1?.htmlActivityGenerated == e2?.htmlActivityGenerated &&
        e1?.htmlPassed == e2?.htmlPassed &&
        e1?.tileId == e2?.tileId &&
        e1?.titleOfSuggestedActivity == e2?.titleOfSuggestedActivity &&
        e1?.topicOfSuggestedActivityInteractiveQuizonGardeningBasics ==
            e2?.topicOfSuggestedActivityInteractiveQuizonGardeningBasics &&
        listEquality.equals(e1?.responses, e2?.responses) &&
        e1?.tileBlockId == e2?.tileBlockId &&
        e1?.topicOfSuggestedActivity == e2?.topicOfSuggestedActivity;
  }

  @override
  int hash(LearningActivitiesRecord? e) => const ListEquality().hash([
        e?.dateCreated,
        e?.htmlActivityGenerated,
        e?.htmlPassed,
        e?.tileId,
        e?.titleOfSuggestedActivity,
        e?.topicOfSuggestedActivityInteractiveQuizonGardeningBasics,
        e?.responses,
        e?.tileBlockId,
        e?.topicOfSuggestedActivity
      ]);

  @override
  bool isValidKey(Object? o) => o is LearningActivitiesRecord;
}
