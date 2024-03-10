import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class PagesRecord extends FirestoreRecord {
  PagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "RefID" field.
  DocumentReference? _refID;
  DocumentReference? get refID => _refID;
  bool hasRefID() => _refID != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "videos" field.
  List<String>? _videos;
  List<String> get videos => _videos ?? const [];
  bool hasVideos() => _videos != null;

  void _initializeFields() {
    _refID = snapshotData['RefID'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _summary = snapshotData['summary'] as String?;
    _image = snapshotData['image'] as String?;
    _video = snapshotData['video'] as String?;
    _description = snapshotData['description'] as String?;
    _videos = getDataList(snapshotData['videos']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pages');

  static Stream<PagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PagesRecord.fromSnapshot(s));

  static Future<PagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PagesRecord.fromSnapshot(s));

  static PagesRecord fromSnapshot(DocumentSnapshot snapshot) => PagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPagesRecordData({
  DocumentReference? refID,
  String? title,
  String? summary,
  String? image,
  String? video,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'RefID': refID,
      'title': title,
      'summary': summary,
      'image': image,
      'video': video,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class PagesRecordDocumentEquality implements Equality<PagesRecord> {
  const PagesRecordDocumentEquality();

  @override
  bool equals(PagesRecord? e1, PagesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.refID == e2?.refID &&
        e1?.title == e2?.title &&
        e1?.summary == e2?.summary &&
        e1?.image == e2?.image &&
        e1?.video == e2?.video &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.videos, e2?.videos);
  }

  @override
  int hash(PagesRecord? e) => const ListEquality().hash([
        e?.refID,
        e?.title,
        e?.summary,
        e?.image,
        e?.video,
        e?.description,
        e?.videos
      ]);

  @override
  bool isValidKey(Object? o) => o is PagesRecord;
}
