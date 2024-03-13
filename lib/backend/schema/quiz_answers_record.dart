import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class QuizAnswersRecord extends FirestoreRecord {
  QuizAnswersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "answerStatus" field.
  String? _answerStatus;
  String get answerStatus => _answerStatus ?? '';
  bool hasAnswerStatus() => _answerStatus != null;

  // "isCorrect" field.
  bool? _isCorrect;
  bool get isCorrect => _isCorrect ?? false;
  bool hasIsCorrect() => _isCorrect != null;

  // "blockId" field.
  String? _blockId;
  String get blockId => _blockId ?? '';
  bool hasBlockId() => _blockId != null;

  // "answeredAt" field.
  DateTime? _answeredAt;
  DateTime? get answeredAt => _answeredAt;
  bool hasAnsweredAt() => _answeredAt != null;

  // "selectedOption" field.
  String? _selectedOption;
  String get selectedOption => _selectedOption ?? '';
  bool hasSelectedOption() => _selectedOption != null;

  // "tileId" field.
  String? _tileId;
  String get tileId => _tileId ?? '';
  bool hasTileId() => _tileId != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _answerStatus = snapshotData['answerStatus'] as String?;
    _isCorrect = snapshotData['isCorrect'] as bool?;
    _blockId = snapshotData['blockId'] as String?;
    _answeredAt = snapshotData['answeredAt'] as DateTime?;
    _selectedOption = snapshotData['selectedOption'] as String?;
    _tileId = snapshotData['tileId'] as String?;
    _userId = snapshotData['userId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quiz_answers');

  static Stream<QuizAnswersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizAnswersRecord.fromSnapshot(s));

  static Future<QuizAnswersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizAnswersRecord.fromSnapshot(s));

  static QuizAnswersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizAnswersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizAnswersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizAnswersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizAnswersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizAnswersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizAnswersRecordData({
  String? answerStatus,
  bool? isCorrect,
  String? blockId,
  DateTime? answeredAt,
  String? selectedOption,
  String? tileId,
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'answerStatus': answerStatus,
      'isCorrect': isCorrect,
      'blockId': blockId,
      'answeredAt': answeredAt,
      'selectedOption': selectedOption,
      'tileId': tileId,
      'userId': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizAnswersRecordDocumentEquality implements Equality<QuizAnswersRecord> {
  const QuizAnswersRecordDocumentEquality();

  @override
  bool equals(QuizAnswersRecord? e1, QuizAnswersRecord? e2) {
    return e1?.answerStatus == e2?.answerStatus &&
        e1?.isCorrect == e2?.isCorrect &&
        e1?.blockId == e2?.blockId &&
        e1?.answeredAt == e2?.answeredAt &&
        e1?.selectedOption == e2?.selectedOption &&
        e1?.tileId == e2?.tileId &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(QuizAnswersRecord? e) => const ListEquality().hash([
        e?.answerStatus,
        e?.isCorrect,
        e?.blockId,
        e?.answeredAt,
        e?.selectedOption,
        e?.tileId,
        e?.userId
      ]);

  @override
  bool isValidKey(Object? o) => o is QuizAnswersRecord;
}
