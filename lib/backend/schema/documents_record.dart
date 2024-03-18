import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocumentsRecord extends FirestoreRecord {
  DocumentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "documenttitle" field.
  String? _documenttitle;
  String get documenttitle => _documenttitle ?? '';
  bool hasDocumenttitle() => _documenttitle != null;

  // "documentupload" field.
  String? _documentupload;
  String get documentupload => _documentupload ?? '';
  bool hasDocumentupload() => _documentupload != null;

  // "documenturl" field.
  String? _documenturl;
  String get documenturl => _documenturl ?? '';
  bool hasDocumenturl() => _documenturl != null;

  // "documenttype" field.
  String? _documenttype;
  String get documenttype => _documenttype ?? '';
  bool hasDocumenttype() => _documenttype != null;

  // "tiles" field.
  List<String>? _tiles;
  List<String> get tiles => _tiles ?? const [];
  bool hasTiles() => _tiles != null;

  // "memberlevel" field.
  List<String>? _memberlevel;
  List<String> get memberlevel => _memberlevel ?? const [];
  bool hasMemberlevel() => _memberlevel != null;

  // "istabbedcontent" field.
  bool? _istabbedcontent;
  bool get istabbedcontent => _istabbedcontent ?? false;
  bool hasIstabbedcontent() => _istabbedcontent != null;

  // "tileref" field.
  List<DocumentReference>? _tileref;
  List<DocumentReference> get tileref => _tileref ?? const [];
  bool hasTileref() => _tileref != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "lastupdated" field.
  DateTime? _lastupdated;
  DateTime? get lastupdated => _lastupdated;
  bool hasLastupdated() => _lastupdated != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "doclistitle" field.
  List<String>? _doclistitle;
  List<String> get doclistitle => _doclistitle ?? const [];
  bool hasDoclistitle() => _doclistitle != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _documenttitle = snapshotData['documenttitle'] as String?;
    _documentupload = snapshotData['documentupload'] as String?;
    _documenturl = snapshotData['documenturl'] as String?;
    _documenttype = snapshotData['documenttype'] as String?;
    _tiles = getDataList(snapshotData['tiles']);
    _memberlevel = getDataList(snapshotData['memberlevel']);
    _istabbedcontent = snapshotData['istabbedcontent'] as bool?;
    _tileref = getDataList(snapshotData['tileref']);
    _description = snapshotData['description'] as String?;
    _lastupdated = snapshotData['lastupdated'] as DateTime?;
    _id = castToType<int>(snapshotData['id']);
    _doclistitle = getDataList(snapshotData['doclistitle']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('documents');

  static Stream<DocumentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DocumentsRecord.fromSnapshot(s));

  static Future<DocumentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DocumentsRecord.fromSnapshot(s));

  static DocumentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DocumentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DocumentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DocumentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DocumentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DocumentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDocumentsRecordData({
  DocumentReference? uid,
  String? documenttitle,
  String? documentupload,
  String? documenturl,
  String? documenttype,
  bool? istabbedcontent,
  String? description,
  DateTime? lastupdated,
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'documenttitle': documenttitle,
      'documentupload': documentupload,
      'documenturl': documenturl,
      'documenttype': documenttype,
      'istabbedcontent': istabbedcontent,
      'description': description,
      'lastupdated': lastupdated,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocumentsRecordDocumentEquality implements Equality<DocumentsRecord> {
  const DocumentsRecordDocumentEquality();

  @override
  bool equals(DocumentsRecord? e1, DocumentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.documenttitle == e2?.documenttitle &&
        e1?.documentupload == e2?.documentupload &&
        e1?.documenturl == e2?.documenturl &&
        e1?.documenttype == e2?.documenttype &&
        listEquality.equals(e1?.tiles, e2?.tiles) &&
        listEquality.equals(e1?.memberlevel, e2?.memberlevel) &&
        e1?.istabbedcontent == e2?.istabbedcontent &&
        listEquality.equals(e1?.tileref, e2?.tileref) &&
        e1?.description == e2?.description &&
        e1?.lastupdated == e2?.lastupdated &&
        e1?.id == e2?.id &&
        listEquality.equals(e1?.doclistitle, e2?.doclistitle);
  }

  @override
  int hash(DocumentsRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.documenttitle,
        e?.documentupload,
        e?.documenturl,
        e?.documenttype,
        e?.tiles,
        e?.memberlevel,
        e?.istabbedcontent,
        e?.tileref,
        e?.description,
        e?.lastupdated,
        e?.id,
        e?.doclistitle
      ]);

  @override
  bool isValidKey(Object? o) => o is DocumentsRecord;
}
