import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LearnRequestsRecord extends FirestoreRecord {
  LearnRequestsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "items" field.
  List<String>? _items;
  List<String> get items => _items ?? const [];
  bool hasItems() => _items != null;

  // "learnRequest" field.
  String? _learnRequest;
  String get learnRequest => _learnRequest ?? '';
  bool hasLearnRequest() => _learnRequest != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _name = snapshotData['name'] as String?;
    _items = getDataList(snapshotData['items']);
    _learnRequest = snapshotData['learnRequest'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('learnRequests');

  static Stream<LearnRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LearnRequestsRecord.fromSnapshot(s));

  static Future<LearnRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LearnRequestsRecord.fromSnapshot(s));

  static LearnRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LearnRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LearnRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LearnRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LearnRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LearnRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLearnRequestsRecordData({
  int? id,
  String? name,
  String? learnRequest,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'learnRequest': learnRequest,
    }.withoutNulls,
  );

  return firestoreData;
}

class LearnRequestsRecordDocumentEquality
    implements Equality<LearnRequestsRecord> {
  const LearnRequestsRecordDocumentEquality();

  @override
  bool equals(LearnRequestsRecord? e1, LearnRequestsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        listEquality.equals(e1?.items, e2?.items) &&
        e1?.learnRequest == e2?.learnRequest;
  }

  @override
  int hash(LearnRequestsRecord? e) =>
      const ListEquality().hash([e?.id, e?.name, e?.items, e?.learnRequest]);

  @override
  bool isValidKey(Object? o) => o is LearnRequestsRecord;
}
