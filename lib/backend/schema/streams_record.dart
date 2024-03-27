import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StreamsRecord extends FirestoreRecord {
  StreamsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "chunks" field.
  List<String>? _chunks;
  List<String> get chunks => _chunks ?? const [];
  bool hasChunks() => _chunks != null;

  // "firebaseChatResponse" field.
  List<ChatResponseStruct>? _firebaseChatResponse;
  List<ChatResponseStruct> get firebaseChatResponse =>
      _firebaseChatResponse ?? const [];
  bool hasFirebaseChatResponse() => _firebaseChatResponse != null;

  void _initializeFields() {
    _chunks = getDataList(snapshotData['chunks']);
    _firebaseChatResponse = getStructList(
      snapshotData['firebaseChatResponse'],
      ChatResponseStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('streams');

  static Stream<StreamsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StreamsRecord.fromSnapshot(s));

  static Future<StreamsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StreamsRecord.fromSnapshot(s));

  static StreamsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StreamsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StreamsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StreamsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StreamsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StreamsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStreamsRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class StreamsRecordDocumentEquality implements Equality<StreamsRecord> {
  const StreamsRecordDocumentEquality();

  @override
  bool equals(StreamsRecord? e1, StreamsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.chunks, e2?.chunks) &&
        listEquality.equals(e1?.firebaseChatResponse, e2?.firebaseChatResponse);
  }

  @override
  int hash(StreamsRecord? e) =>
      const ListEquality().hash([e?.chunks, e?.firebaseChatResponse]);

  @override
  bool isValidKey(Object? o) => o is StreamsRecord;
}
