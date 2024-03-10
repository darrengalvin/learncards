import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class InputAndResponsePairsRecord extends FirestoreRecord {
  InputAndResponsePairsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "input" field.
  String? _input;
  String get input => _input ?? '';
  bool hasInput() => _input != null;

  // "response" field.
  String? _response;
  String get response => _response ?? '';
  bool hasResponse() => _response != null;

  // "tile_block_id" field.
  String? _tileBlockId;
  String get tileBlockId => _tileBlockId ?? '';
  bool hasTileBlockId() => _tileBlockId != null;

  // "learningActivityId" field.
  String? _learningActivityId;
  String get learningActivityId => _learningActivityId ?? '';
  bool hasLearningActivityId() => _learningActivityId != null;

  // "dateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "learningActivity" field.
  DocumentReference? _learningActivity;
  DocumentReference? get learningActivity => _learningActivity;
  bool hasLearningActivity() => _learningActivity != null;

  void _initializeFields() {
    _input = snapshotData['input'] as String?;
    _response = snapshotData['response'] as String?;
    _tileBlockId = snapshotData['tile_block_id'] as String?;
    _learningActivityId = snapshotData['learningActivityId'] as String?;
    _dateCreated = snapshotData['dateCreated'] as DateTime?;
    _learningActivity = snapshotData['learningActivity'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('inputAndResponsePairs');

  static Stream<InputAndResponsePairsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => InputAndResponsePairsRecord.fromSnapshot(s));

  static Future<InputAndResponsePairsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => InputAndResponsePairsRecord.fromSnapshot(s));

  static InputAndResponsePairsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InputAndResponsePairsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InputAndResponsePairsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InputAndResponsePairsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InputAndResponsePairsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InputAndResponsePairsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInputAndResponsePairsRecordData({
  String? input,
  String? response,
  String? tileBlockId,
  String? learningActivityId,
  DateTime? dateCreated,
  DocumentReference? learningActivity,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'input': input,
      'response': response,
      'tile_block_id': tileBlockId,
      'learningActivityId': learningActivityId,
      'dateCreated': dateCreated,
      'learningActivity': learningActivity,
    }.withoutNulls,
  );

  return firestoreData;
}

class InputAndResponsePairsRecordDocumentEquality
    implements Equality<InputAndResponsePairsRecord> {
  const InputAndResponsePairsRecordDocumentEquality();

  @override
  bool equals(
      InputAndResponsePairsRecord? e1, InputAndResponsePairsRecord? e2) {
    return e1?.input == e2?.input &&
        e1?.response == e2?.response &&
        e1?.tileBlockId == e2?.tileBlockId &&
        e1?.learningActivityId == e2?.learningActivityId &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.learningActivity == e2?.learningActivity;
  }

  @override
  int hash(InputAndResponsePairsRecord? e) => const ListEquality().hash([
        e?.input,
        e?.response,
        e?.tileBlockId,
        e?.learningActivityId,
        e?.dateCreated,
        e?.learningActivity
      ]);

  @override
  bool isValidKey(Object? o) => o is InputAndResponsePairsRecord;
}
