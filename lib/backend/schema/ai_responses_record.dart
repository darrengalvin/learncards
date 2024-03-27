import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AiResponsesRecord extends FirestoreRecord {
  AiResponsesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "timeresponded" field.
  DateTime? _timeresponded;
  DateTime? get timeresponded => _timeresponded;
  bool hasTimeresponded() => _timeresponded != null;

  // "response" field.
  String? _response;
  String get response => _response ?? '';
  bool hasResponse() => _response != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _timeresponded = snapshotData['timeresponded'] as DateTime?;
    _response = snapshotData['response'] as String?;
    _audio = snapshotData['audio'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('aiResponses')
          : FirebaseFirestore.instance.collectionGroup('aiResponses');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('aiResponses').doc(id);

  static Stream<AiResponsesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AiResponsesRecord.fromSnapshot(s));

  static Future<AiResponsesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AiResponsesRecord.fromSnapshot(s));

  static AiResponsesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AiResponsesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AiResponsesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AiResponsesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AiResponsesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AiResponsesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAiResponsesRecordData({
  String? title,
  DateTime? timeresponded,
  String? response,
  String? audio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'timeresponded': timeresponded,
      'response': response,
      'audio': audio,
    }.withoutNulls,
  );

  return firestoreData;
}

class AiResponsesRecordDocumentEquality implements Equality<AiResponsesRecord> {
  const AiResponsesRecordDocumentEquality();

  @override
  bool equals(AiResponsesRecord? e1, AiResponsesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.timeresponded == e2?.timeresponded &&
        e1?.response == e2?.response &&
        e1?.audio == e2?.audio;
  }

  @override
  int hash(AiResponsesRecord? e) => const ListEquality()
      .hash([e?.title, e?.timeresponded, e?.response, e?.audio]);

  @override
  bool isValidKey(Object? o) => o is AiResponsesRecord;
}
