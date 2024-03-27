import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ReportedpostsRecord extends FirestoreRecord {
  ReportedpostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "postref" field.
  DocumentReference? _postref;
  DocumentReference? get postref => _postref;
  bool hasPostref() => _postref != null;

  // "postcreator" field.
  DocumentReference? _postcreator;
  DocumentReference? get postcreator => _postcreator;
  bool hasPostcreator() => _postcreator != null;

  // "reportedby" field.
  DocumentReference? _reportedby;
  DocumentReference? get reportedby => _reportedby;
  bool hasReportedby() => _reportedby != null;

  // "postcontent" field.
  String? _postcontent;
  String get postcontent => _postcontent ?? '';
  bool hasPostcontent() => _postcontent != null;

  // "reportedbyname" field.
  String? _reportedbyname;
  String get reportedbyname => _reportedbyname ?? '';
  bool hasReportedbyname() => _reportedbyname != null;

  void _initializeFields() {
    _postref = snapshotData['postref'] as DocumentReference?;
    _postcreator = snapshotData['postcreator'] as DocumentReference?;
    _reportedby = snapshotData['reportedby'] as DocumentReference?;
    _postcontent = snapshotData['postcontent'] as String?;
    _reportedbyname = snapshotData['reportedbyname'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reportedposts');

  static Stream<ReportedpostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportedpostsRecord.fromSnapshot(s));

  static Future<ReportedpostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportedpostsRecord.fromSnapshot(s));

  static ReportedpostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportedpostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportedpostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportedpostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportedpostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportedpostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportedpostsRecordData({
  DocumentReference? postref,
  DocumentReference? postcreator,
  DocumentReference? reportedby,
  String? postcontent,
  String? reportedbyname,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postref': postref,
      'postcreator': postcreator,
      'reportedby': reportedby,
      'postcontent': postcontent,
      'reportedbyname': reportedbyname,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportedpostsRecordDocumentEquality
    implements Equality<ReportedpostsRecord> {
  const ReportedpostsRecordDocumentEquality();

  @override
  bool equals(ReportedpostsRecord? e1, ReportedpostsRecord? e2) {
    return e1?.postref == e2?.postref &&
        e1?.postcreator == e2?.postcreator &&
        e1?.reportedby == e2?.reportedby &&
        e1?.postcontent == e2?.postcontent &&
        e1?.reportedbyname == e2?.reportedbyname;
  }

  @override
  int hash(ReportedpostsRecord? e) => const ListEquality().hash([
        e?.postref,
        e?.postcreator,
        e?.reportedby,
        e?.postcontent,
        e?.reportedbyname
      ]);

  @override
  bool isValidKey(Object? o) => o is ReportedpostsRecord;
}
