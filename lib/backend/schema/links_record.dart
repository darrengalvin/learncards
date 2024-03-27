import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LinksRecord extends FirestoreRecord {
  LinksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "linkurl" field.
  String? _linkurl;
  String get linkurl => _linkurl ?? '';
  bool hasLinkurl() => _linkurl != null;

  // "tiles" field.
  List<String>? _tiles;
  List<String> get tiles => _tiles ?? const [];
  bool hasTiles() => _tiles != null;

  // "memberlevel" field.
  List<String>? _memberlevel;
  List<String> get memberlevel => _memberlevel ?? const [];
  bool hasMemberlevel() => _memberlevel != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "istabbedcontent" field.
  bool? _istabbedcontent;
  bool get istabbedcontent => _istabbedcontent ?? false;
  bool hasIstabbedcontent() => _istabbedcontent != null;

  // "tileref" field.
  List<DocumentReference>? _tileref;
  List<DocumentReference> get tileref => _tileref ?? const [];
  bool hasTileref() => _tileref != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  void _initializeFields() {
    _linkurl = snapshotData['linkurl'] as String?;
    _tiles = getDataList(snapshotData['tiles']);
    _memberlevel = getDataList(snapshotData['memberlevel']);
    _title = snapshotData['title'] as String?;
    _istabbedcontent = snapshotData['istabbedcontent'] as bool?;
    _tileref = getDataList(snapshotData['tileref']);
    _summary = snapshotData['summary'] as String?;
    _image = snapshotData['image'] as String?;
    _id = castToType<int>(snapshotData['id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('links');

  static Stream<LinksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LinksRecord.fromSnapshot(s));

  static Future<LinksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LinksRecord.fromSnapshot(s));

  static LinksRecord fromSnapshot(DocumentSnapshot snapshot) => LinksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LinksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LinksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LinksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LinksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLinksRecordData({
  String? linkurl,
  String? title,
  bool? istabbedcontent,
  String? summary,
  String? image,
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'linkurl': linkurl,
      'title': title,
      'istabbedcontent': istabbedcontent,
      'summary': summary,
      'image': image,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class LinksRecordDocumentEquality implements Equality<LinksRecord> {
  const LinksRecordDocumentEquality();

  @override
  bool equals(LinksRecord? e1, LinksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.linkurl == e2?.linkurl &&
        listEquality.equals(e1?.tiles, e2?.tiles) &&
        listEquality.equals(e1?.memberlevel, e2?.memberlevel) &&
        e1?.title == e2?.title &&
        e1?.istabbedcontent == e2?.istabbedcontent &&
        listEquality.equals(e1?.tileref, e2?.tileref) &&
        e1?.summary == e2?.summary &&
        e1?.image == e2?.image &&
        e1?.id == e2?.id;
  }

  @override
  int hash(LinksRecord? e) => const ListEquality().hash([
        e?.linkurl,
        e?.tiles,
        e?.memberlevel,
        e?.title,
        e?.istabbedcontent,
        e?.tileref,
        e?.summary,
        e?.image,
        e?.id
      ]);

  @override
  bool isValidKey(Object? o) => o is LinksRecord;
}
