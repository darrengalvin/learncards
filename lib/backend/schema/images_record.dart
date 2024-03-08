import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ImagesRecord extends FirestoreRecord {
  ImagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "PageRef" field.
  DocumentReference? _pageRef;
  DocumentReference? get pageRef => _pageRef;
  bool hasPageRef() => _pageRef != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "tiles" field.
  List<String>? _tiles;
  List<String> get tiles => _tiles ?? const [];
  bool hasTiles() => _tiles != null;

  // "memberlevels" field.
  List<String>? _memberlevels;
  List<String> get memberlevels => _memberlevels ?? const [];
  bool hasMemberlevels() => _memberlevels != null;

  // "istabbedcontent" field.
  bool? _istabbedcontent;
  bool get istabbedcontent => _istabbedcontent ?? false;
  bool hasIstabbedcontent() => _istabbedcontent != null;

  // "linkedtotile" field.
  String? _linkedtotile;
  String get linkedtotile => _linkedtotile ?? '';
  bool hasLinkedtotile() => _linkedtotile != null;

  // "linkedtotab" field.
  String? _linkedtotab;
  String get linkedtotab => _linkedtotab ?? '';
  bool hasLinkedtotab() => _linkedtotab != null;

  // "imagesummary" field.
  String? _imagesummary;
  String get imagesummary => _imagesummary ?? '';
  bool hasImagesummary() => _imagesummary != null;

  // "imagefromurl" field.
  String? _imagefromurl;
  String get imagefromurl => _imagefromurl ?? '';
  bool hasImagefromurl() => _imagefromurl != null;

  // "uploadedimage" field.
  String? _uploadedimage;
  String get uploadedimage => _uploadedimage ?? '';
  bool hasUploadedimage() => _uploadedimage != null;

  void _initializeFields() {
    _pageRef = snapshotData['PageRef'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _tiles = getDataList(snapshotData['tiles']);
    _memberlevels = getDataList(snapshotData['memberlevels']);
    _istabbedcontent = snapshotData['istabbedcontent'] as bool?;
    _linkedtotile = snapshotData['linkedtotile'] as String?;
    _linkedtotab = snapshotData['linkedtotab'] as String?;
    _imagesummary = snapshotData['imagesummary'] as String?;
    _imagefromurl = snapshotData['imagefromurl'] as String?;
    _uploadedimage = snapshotData['uploadedimage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('images');

  static Stream<ImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImagesRecord.fromSnapshot(s));

  static Future<ImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImagesRecord.fromSnapshot(s));

  static ImagesRecord fromSnapshot(DocumentSnapshot snapshot) => ImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImagesRecordData({
  DocumentReference? pageRef,
  String? title,
  bool? istabbedcontent,
  String? linkedtotile,
  String? linkedtotab,
  String? imagesummary,
  String? imagefromurl,
  String? uploadedimage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'PageRef': pageRef,
      'title': title,
      'istabbedcontent': istabbedcontent,
      'linkedtotile': linkedtotile,
      'linkedtotab': linkedtotab,
      'imagesummary': imagesummary,
      'imagefromurl': imagefromurl,
      'uploadedimage': uploadedimage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ImagesRecordDocumentEquality implements Equality<ImagesRecord> {
  const ImagesRecordDocumentEquality();

  @override
  bool equals(ImagesRecord? e1, ImagesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.pageRef == e2?.pageRef &&
        e1?.title == e2?.title &&
        listEquality.equals(e1?.tiles, e2?.tiles) &&
        listEquality.equals(e1?.memberlevels, e2?.memberlevels) &&
        e1?.istabbedcontent == e2?.istabbedcontent &&
        e1?.linkedtotile == e2?.linkedtotile &&
        e1?.linkedtotab == e2?.linkedtotab &&
        e1?.imagesummary == e2?.imagesummary &&
        e1?.imagefromurl == e2?.imagefromurl &&
        e1?.uploadedimage == e2?.uploadedimage;
  }

  @override
  int hash(ImagesRecord? e) => const ListEquality().hash([
        e?.pageRef,
        e?.title,
        e?.tiles,
        e?.memberlevels,
        e?.istabbedcontent,
        e?.linkedtotile,
        e?.linkedtotab,
        e?.imagesummary,
        e?.imagefromurl,
        e?.uploadedimage
      ]);

  @override
  bool isValidKey(Object? o) => o is ImagesRecord;
}
