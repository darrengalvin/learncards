import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class PushnotificationRecord extends FirestoreRecord {
  PushnotificationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "pushenabled" field.
  List<DocumentReference>? _pushenabled;
  List<DocumentReference> get pushenabled => _pushenabled ?? const [];
  bool hasPushenabled() => _pushenabled != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "sent" field.
  DateTime? _sent;
  DateTime? get sent => _sent;
  bool hasSent() => _sent != null;

  // "sentby" field.
  DocumentReference? _sentby;
  DocumentReference? get sentby => _sentby;
  bool hasSentby() => _sentby != null;

  // "sentto" field.
  List<DocumentReference>? _sentto;
  List<DocumentReference> get sentto => _sentto ?? const [];
  bool hasSentto() => _sentto != null;

  void _initializeFields() {
    _pushenabled = getDataList(snapshotData['pushenabled']);
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _sent = snapshotData['sent'] as DateTime?;
    _sentby = snapshotData['sentby'] as DocumentReference?;
    _sentto = getDataList(snapshotData['sentto']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pushnotification');

  static Stream<PushnotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PushnotificationRecord.fromSnapshot(s));

  static Future<PushnotificationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PushnotificationRecord.fromSnapshot(s));

  static PushnotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PushnotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PushnotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PushnotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PushnotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PushnotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPushnotificationRecordData({
  String? title,
  String? description,
  DateTime? sent,
  DocumentReference? sentby,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'sent': sent,
      'sentby': sentby,
    }.withoutNulls,
  );

  return firestoreData;
}

class PushnotificationRecordDocumentEquality
    implements Equality<PushnotificationRecord> {
  const PushnotificationRecordDocumentEquality();

  @override
  bool equals(PushnotificationRecord? e1, PushnotificationRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.pushenabled, e2?.pushenabled) &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.sent == e2?.sent &&
        e1?.sentby == e2?.sentby &&
        listEquality.equals(e1?.sentto, e2?.sentto);
  }

  @override
  int hash(PushnotificationRecord? e) => const ListEquality().hash([
        e?.pushenabled,
        e?.title,
        e?.description,
        e?.sent,
        e?.sentby,
        e?.sentto
      ]);

  @override
  bool isValidKey(Object? o) => o is PushnotificationRecord;
}
