import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeaturedpagesRecord extends FirestoreRecord {
  FeaturedpagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "mainvideo" field.
  String? _mainvideo;
  String get mainvideo => _mainvideo ?? '';
  bool hasMainvideo() => _mainvideo != null;

  // "mainimage" field.
  String? _mainimage;
  String get mainimage => _mainimage ?? '';
  bool hasMainimage() => _mainimage != null;

  // "bodytext" field.
  String? _bodytext;
  String get bodytext => _bodytext ?? '';
  bool hasBodytext() => _bodytext != null;

  // "dismissed" field.
  List<DocumentReference>? _dismissed;
  List<DocumentReference> get dismissed => _dismissed ?? const [];
  bool hasDismissed() => _dismissed != null;

  // "memberlevels" field.
  List<String>? _memberlevels;
  List<String> get memberlevels => _memberlevels ?? const [];
  bool hasMemberlevels() => _memberlevels != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "cantbedismissed" field.
  bool? _cantbedismissed;
  bool get cantbedismissed => _cantbedismissed ?? false;
  bool hasCantbedismissed() => _cantbedismissed != null;

  // "isform" field.
  bool? _isform;
  bool get isform => _isform ?? false;
  bool hasIsform() => _isform != null;

  // "dateposted" field.
  DateTime? _dateposted;
  DateTime? get dateposted => _dateposted;
  bool hasDateposted() => _dateposted != null;

  // "ref" field.
  DocumentReference? _ref;
  DocumentReference? get ref => _ref;
  bool hasRef() => _ref != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _summary = snapshotData['summary'] as String?;
    _mainvideo = snapshotData['mainvideo'] as String?;
    _mainimage = snapshotData['mainimage'] as String?;
    _bodytext = snapshotData['bodytext'] as String?;
    _dismissed = getDataList(snapshotData['dismissed']);
    _memberlevels = getDataList(snapshotData['memberlevels']);
    _index = castToType<int>(snapshotData['index']);
    _cantbedismissed = snapshotData['cantbedismissed'] as bool?;
    _isform = snapshotData['isform'] as bool?;
    _dateposted = snapshotData['dateposted'] as DateTime?;
    _ref = snapshotData['ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('featuredpages');

  static Stream<FeaturedpagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeaturedpagesRecord.fromSnapshot(s));

  static Future<FeaturedpagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeaturedpagesRecord.fromSnapshot(s));

  static FeaturedpagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeaturedpagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeaturedpagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeaturedpagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeaturedpagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeaturedpagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeaturedpagesRecordData({
  String? title,
  String? summary,
  String? mainvideo,
  String? mainimage,
  String? bodytext,
  int? index,
  bool? cantbedismissed,
  bool? isform,
  DateTime? dateposted,
  DocumentReference? ref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'summary': summary,
      'mainvideo': mainvideo,
      'mainimage': mainimage,
      'bodytext': bodytext,
      'index': index,
      'cantbedismissed': cantbedismissed,
      'isform': isform,
      'dateposted': dateposted,
      'ref': ref,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeaturedpagesRecordDocumentEquality
    implements Equality<FeaturedpagesRecord> {
  const FeaturedpagesRecordDocumentEquality();

  @override
  bool equals(FeaturedpagesRecord? e1, FeaturedpagesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.summary == e2?.summary &&
        e1?.mainvideo == e2?.mainvideo &&
        e1?.mainimage == e2?.mainimage &&
        e1?.bodytext == e2?.bodytext &&
        listEquality.equals(e1?.dismissed, e2?.dismissed) &&
        listEquality.equals(e1?.memberlevels, e2?.memberlevels) &&
        e1?.index == e2?.index &&
        e1?.cantbedismissed == e2?.cantbedismissed &&
        e1?.isform == e2?.isform &&
        e1?.dateposted == e2?.dateposted &&
        e1?.ref == e2?.ref;
  }

  @override
  int hash(FeaturedpagesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.summary,
        e?.mainvideo,
        e?.mainimage,
        e?.bodytext,
        e?.dismissed,
        e?.memberlevels,
        e?.index,
        e?.cantbedismissed,
        e?.isform,
        e?.dateposted,
        e?.ref
      ]);

  @override
  bool isValidKey(Object? o) => o is FeaturedpagesRecord;
}
