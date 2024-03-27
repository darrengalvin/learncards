import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocumentsandlinksRecord extends FirestoreRecord {
  DocumentsandlinksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "PageRef" field.
  DocumentReference? _pageRef;
  DocumentReference? get pageRef => _pageRef;
  bool hasPageRef() => _pageRef != null;

  // "buttontitle" field.
  String? _buttontitle;
  String get buttontitle => _buttontitle ?? '';
  bool hasButtontitle() => _buttontitle != null;

  // "buttonsummary" field.
  String? _buttonsummary;
  String get buttonsummary => _buttonsummary ?? '';
  bool hasButtonsummary() => _buttonsummary != null;

  // "buttonink" field.
  String? _buttonink;
  String get buttonink => _buttonink ?? '';
  bool hasButtonink() => _buttonink != null;

  // "buttontext" field.
  String? _buttontext;
  String get buttontext => _buttontext ?? '';
  bool hasButtontext() => _buttontext != null;

  void _initializeFields() {
    _pageRef = snapshotData['PageRef'] as DocumentReference?;
    _buttontitle = snapshotData['buttontitle'] as String?;
    _buttonsummary = snapshotData['buttonsummary'] as String?;
    _buttonink = snapshotData['buttonink'] as String?;
    _buttontext = snapshotData['buttontext'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('documentsandlinks');

  static Stream<DocumentsandlinksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DocumentsandlinksRecord.fromSnapshot(s));

  static Future<DocumentsandlinksRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DocumentsandlinksRecord.fromSnapshot(s));

  static DocumentsandlinksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DocumentsandlinksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DocumentsandlinksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DocumentsandlinksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DocumentsandlinksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DocumentsandlinksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDocumentsandlinksRecordData({
  DocumentReference? pageRef,
  String? buttontitle,
  String? buttonsummary,
  String? buttonink,
  String? buttontext,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'PageRef': pageRef,
      'buttontitle': buttontitle,
      'buttonsummary': buttonsummary,
      'buttonink': buttonink,
      'buttontext': buttontext,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocumentsandlinksRecordDocumentEquality
    implements Equality<DocumentsandlinksRecord> {
  const DocumentsandlinksRecordDocumentEquality();

  @override
  bool equals(DocumentsandlinksRecord? e1, DocumentsandlinksRecord? e2) {
    return e1?.pageRef == e2?.pageRef &&
        e1?.buttontitle == e2?.buttontitle &&
        e1?.buttonsummary == e2?.buttonsummary &&
        e1?.buttonink == e2?.buttonink &&
        e1?.buttontext == e2?.buttontext;
  }

  @override
  int hash(DocumentsandlinksRecord? e) => const ListEquality().hash([
        e?.pageRef,
        e?.buttontitle,
        e?.buttonsummary,
        e?.buttonink,
        e?.buttontext
      ]);

  @override
  bool isValidKey(Object? o) => o is DocumentsandlinksRecord;
}
