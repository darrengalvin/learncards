import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizRecord extends FirestoreRecord {
  QuizRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "moduleName" field.
  String? _moduleName;
  String get moduleName => _moduleName ?? '';
  bool hasModuleName() => _moduleName != null;

  // "index_Id" field.
  int? _indexId;
  int get indexId => _indexId ?? 0;
  bool hasIndexId() => _indexId != null;

  // "correctAnswer" field.
  String? _correctAnswer;
  String get correctAnswer => _correctAnswer ?? '';
  bool hasCorrectAnswer() => _correctAnswer != null;

  // "correctAnswers" field.
  int? _correctAnswers;
  int get correctAnswers => _correctAnswers ?? 0;
  bool hasCorrectAnswers() => _correctAnswers != null;

  // "incorrectAnswers" field.
  int? _incorrectAnswers;
  int get incorrectAnswers => _incorrectAnswers ?? 0;
  bool hasIncorrectAnswers() => _incorrectAnswers != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "possibleAnswers" field.
  List<String>? _possibleAnswers;
  List<String> get possibleAnswers => _possibleAnswers ?? const [];
  bool hasPossibleAnswers() => _possibleAnswers != null;

  // "tries" field.
  int? _tries;
  int get tries => _tries ?? 0;
  bool hasTries() => _tries != null;

  // "tile_block_id" field.
  String? _tileBlockId;
  String get tileBlockId => _tileBlockId ?? '';
  bool hasTileBlockId() => _tileBlockId != null;

  // "document_id" field.
  List<String>? _documentId;
  List<String> get documentId => _documentId ?? const [];
  bool hasDocumentId() => _documentId != null;

  void _initializeFields() {
    _moduleName = snapshotData['moduleName'] as String?;
    _indexId = castToType<int>(snapshotData['index_Id']);
    _correctAnswer = snapshotData['correctAnswer'] as String?;
    _correctAnswers = castToType<int>(snapshotData['correctAnswers']);
    _incorrectAnswers = castToType<int>(snapshotData['incorrectAnswers']);
    _question = snapshotData['question'] as String?;
    _possibleAnswers = getDataList(snapshotData['possibleAnswers']);
    _tries = castToType<int>(snapshotData['tries']);
    _tileBlockId = snapshotData['tile_block_id'] as String?;
    _documentId = getDataList(snapshotData['document_id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quiz');

  static Stream<QuizRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizRecord.fromSnapshot(s));

  static Future<QuizRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizRecord.fromSnapshot(s));

  static QuizRecord fromSnapshot(DocumentSnapshot snapshot) => QuizRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizRecordData({
  String? moduleName,
  int? indexId,
  String? correctAnswer,
  int? correctAnswers,
  int? incorrectAnswers,
  String? question,
  int? tries,
  String? tileBlockId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'moduleName': moduleName,
      'index_Id': indexId,
      'correctAnswer': correctAnswer,
      'correctAnswers': correctAnswers,
      'incorrectAnswers': incorrectAnswers,
      'question': question,
      'tries': tries,
      'tile_block_id': tileBlockId,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizRecordDocumentEquality implements Equality<QuizRecord> {
  const QuizRecordDocumentEquality();

  @override
  bool equals(QuizRecord? e1, QuizRecord? e2) {
    const listEquality = ListEquality();
    return e1?.moduleName == e2?.moduleName &&
        e1?.indexId == e2?.indexId &&
        e1?.correctAnswer == e2?.correctAnswer &&
        e1?.correctAnswers == e2?.correctAnswers &&
        e1?.incorrectAnswers == e2?.incorrectAnswers &&
        e1?.question == e2?.question &&
        listEquality.equals(e1?.possibleAnswers, e2?.possibleAnswers) &&
        e1?.tries == e2?.tries &&
        e1?.tileBlockId == e2?.tileBlockId &&
        listEquality.equals(e1?.documentId, e2?.documentId);
  }

  @override
  int hash(QuizRecord? e) => const ListEquality().hash([
        e?.moduleName,
        e?.indexId,
        e?.correctAnswer,
        e?.correctAnswers,
        e?.incorrectAnswers,
        e?.question,
        e?.possibleAnswers,
        e?.tries,
        e?.tileBlockId,
        e?.documentId
      ]);

  @override
  bool isValidKey(Object? o) => o is QuizRecord;
}
