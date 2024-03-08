import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class QuestionsRecord extends FirestoreRecord {
  QuestionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "questions" field.
  String? _questions;
  String get questions => _questions ?? '';
  bool hasQuestions() => _questions != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  bool hasAnswer() => _answer != null;

  // "showhide" field.
  bool? _showhide;
  bool get showhide => _showhide ?? false;
  bool hasShowhide() => _showhide != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "profilepic" field.
  String? _profilepic;
  String get profilepic => _profilepic ?? '';
  bool hasProfilepic() => _profilepic != null;

  void _initializeFields() {
    _questions = snapshotData['questions'] as String?;
    _answer = snapshotData['answer'] as String?;
    _showhide = snapshotData['showhide'] as bool?;
    _time = snapshotData['time'] as DateTime?;
    _profilepic = snapshotData['profilepic'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('questions');

  static Stream<QuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionsRecord.fromSnapshot(s));

  static Future<QuestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionsRecord.fromSnapshot(s));

  static QuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionsRecordData({
  String? questions,
  String? answer,
  bool? showhide,
  DateTime? time,
  String? profilepic,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'questions': questions,
      'answer': answer,
      'showhide': showhide,
      'time': time,
      'profilepic': profilepic,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionsRecordDocumentEquality implements Equality<QuestionsRecord> {
  const QuestionsRecordDocumentEquality();

  @override
  bool equals(QuestionsRecord? e1, QuestionsRecord? e2) {
    return e1?.questions == e2?.questions &&
        e1?.answer == e2?.answer &&
        e1?.showhide == e2?.showhide &&
        e1?.time == e2?.time &&
        e1?.profilepic == e2?.profilepic;
  }

  @override
  int hash(QuestionsRecord? e) => const ListEquality()
      .hash([e?.questions, e?.answer, e?.showhide, e?.time, e?.profilepic]);

  @override
  bool isValidKey(Object? o) => o is QuestionsRecord;
}
