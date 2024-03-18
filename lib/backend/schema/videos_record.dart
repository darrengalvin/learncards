import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideosRecord extends FirestoreRecord {
  VideosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "uploadedvideos" field.
  String? _uploadedvideos;
  String get uploadedvideos => _uploadedvideos ?? '';
  bool hasUploadedvideos() => _uploadedvideos != null;

  // "videofromurl" field.
  String? _videofromurl;
  String get videofromurl => _videofromurl ?? '';
  bool hasVideofromurl() => _videofromurl != null;

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

  // "videosummary" field.
  String? _videosummary;
  String get videosummary => _videosummary ?? '';
  bool hasVideosummary() => _videosummary != null;

  // "tileref" field.
  List<DocumentReference>? _tileref;
  List<DocumentReference> get tileref => _tileref ?? const [];
  bool hasTileref() => _tileref != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "videoby" field.
  String? _videoby;
  String get videoby => _videoby ?? '';
  bool hasVideoby() => _videoby != null;

  // "headertag" field.
  String? _headertag;
  String get headertag => _headertag ?? '';
  bool hasHeadertag() => _headertag != null;

  // "videobyref" field.
  DocumentReference? _videobyref;
  DocumentReference? get videobyref => _videobyref;
  bool hasVideobyref() => _videobyref != null;

  // "videobyimage" field.
  String? _videobyimage;
  String get videobyimage => _videobyimage ?? '';
  bool hasVideobyimage() => _videobyimage != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "isai" field.
  bool? _isai;
  bool get isai => _isai ?? false;
  bool hasIsai() => _isai != null;

  // "questionnotshown" field.
  String? _questionnotshown;
  String get questionnotshown => _questionnotshown ?? '';
  bool hasQuestionnotshown() => _questionnotshown != null;

  // "thumbnail" field.
  String? _thumbnail;
  String get thumbnail => _thumbnail ?? '';
  bool hasThumbnail() => _thumbnail != null;

  // "videoThumbnail" field.
  String? _videoThumbnail;
  String get videoThumbnail => _videoThumbnail ?? '';
  bool hasVideoThumbnail() => _videoThumbnail != null;

  void _initializeFields() {
    _pageRef = snapshotData['PageRef'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _tiles = getDataList(snapshotData['tiles']);
    _memberlevels = getDataList(snapshotData['memberlevels']);
    _uploadedvideos = snapshotData['uploadedvideos'] as String?;
    _videofromurl = snapshotData['videofromurl'] as String?;
    _istabbedcontent = snapshotData['istabbedcontent'] as bool?;
    _linkedtotile = snapshotData['linkedtotile'] as String?;
    _linkedtotab = snapshotData['linkedtotab'] as String?;
    _videosummary = snapshotData['videosummary'] as String?;
    _tileref = getDataList(snapshotData['tileref']);
    _index = castToType<int>(snapshotData['index']);
    _videoby = snapshotData['videoby'] as String?;
    _headertag = snapshotData['headertag'] as String?;
    _videobyref = snapshotData['videobyref'] as DocumentReference?;
    _videobyimage = snapshotData['videobyimage'] as String?;
    _id = castToType<int>(snapshotData['id']);
    _isai = snapshotData['isai'] as bool?;
    _questionnotshown = snapshotData['questionnotshown'] as String?;
    _thumbnail = snapshotData['thumbnail'] as String?;
    _videoThumbnail = snapshotData['videoThumbnail'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('videos');

  static Stream<VideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideosRecord.fromSnapshot(s));

  static Future<VideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideosRecord.fromSnapshot(s));

  static VideosRecord fromSnapshot(DocumentSnapshot snapshot) => VideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideosRecord._(reference, mapFromFirestore(data));

  static VideosRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      VideosRecord.getDocumentFromData(
        {
          'PageRef': convertAlgoliaParam(
            snapshot.data['PageRef'],
            ParamType.DocumentReference,
            false,
          ),
          'title': snapshot.data['title'],
          'tiles': safeGet(
            () => snapshot.data['tiles'].toList(),
          ),
          'memberlevels': safeGet(
            () => snapshot.data['memberlevels'].toList(),
          ),
          'uploadedvideos': snapshot.data['uploadedvideos'],
          'videofromurl': snapshot.data['videofromurl'],
          'istabbedcontent': snapshot.data['istabbedcontent'],
          'linkedtotile': snapshot.data['linkedtotile'],
          'linkedtotab': snapshot.data['linkedtotab'],
          'videosummary': snapshot.data['videosummary'],
          'tileref': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['tileref'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'index': convertAlgoliaParam(
            snapshot.data['index'],
            ParamType.int,
            false,
          ),
          'videoby': snapshot.data['videoby'],
          'headertag': snapshot.data['headertag'],
          'videobyref': convertAlgoliaParam(
            snapshot.data['videobyref'],
            ParamType.DocumentReference,
            false,
          ),
          'videobyimage': snapshot.data['videobyimage'],
          'id': convertAlgoliaParam(
            snapshot.data['id'],
            ParamType.int,
            false,
          ),
          'isai': snapshot.data['isai'],
          'questionnotshown': snapshot.data['questionnotshown'],
          'thumbnail': snapshot.data['thumbnail'],
          'videoThumbnail': snapshot.data['videoThumbnail'],
        },
        VideosRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<VideosRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'videos',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'VideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideosRecordData({
  DocumentReference? pageRef,
  String? title,
  String? uploadedvideos,
  String? videofromurl,
  bool? istabbedcontent,
  String? linkedtotile,
  String? linkedtotab,
  String? videosummary,
  int? index,
  String? videoby,
  String? headertag,
  DocumentReference? videobyref,
  String? videobyimage,
  int? id,
  bool? isai,
  String? questionnotshown,
  String? thumbnail,
  String? videoThumbnail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'PageRef': pageRef,
      'title': title,
      'uploadedvideos': uploadedvideos,
      'videofromurl': videofromurl,
      'istabbedcontent': istabbedcontent,
      'linkedtotile': linkedtotile,
      'linkedtotab': linkedtotab,
      'videosummary': videosummary,
      'index': index,
      'videoby': videoby,
      'headertag': headertag,
      'videobyref': videobyref,
      'videobyimage': videobyimage,
      'id': id,
      'isai': isai,
      'questionnotshown': questionnotshown,
      'thumbnail': thumbnail,
      'videoThumbnail': videoThumbnail,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideosRecordDocumentEquality implements Equality<VideosRecord> {
  const VideosRecordDocumentEquality();

  @override
  bool equals(VideosRecord? e1, VideosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.pageRef == e2?.pageRef &&
        e1?.title == e2?.title &&
        listEquality.equals(e1?.tiles, e2?.tiles) &&
        listEquality.equals(e1?.memberlevels, e2?.memberlevels) &&
        e1?.uploadedvideos == e2?.uploadedvideos &&
        e1?.videofromurl == e2?.videofromurl &&
        e1?.istabbedcontent == e2?.istabbedcontent &&
        e1?.linkedtotile == e2?.linkedtotile &&
        e1?.linkedtotab == e2?.linkedtotab &&
        e1?.videosummary == e2?.videosummary &&
        listEquality.equals(e1?.tileref, e2?.tileref) &&
        e1?.index == e2?.index &&
        e1?.videoby == e2?.videoby &&
        e1?.headertag == e2?.headertag &&
        e1?.videobyref == e2?.videobyref &&
        e1?.videobyimage == e2?.videobyimage &&
        e1?.id == e2?.id &&
        e1?.isai == e2?.isai &&
        e1?.questionnotshown == e2?.questionnotshown &&
        e1?.thumbnail == e2?.thumbnail &&
        e1?.videoThumbnail == e2?.videoThumbnail;
  }

  @override
  int hash(VideosRecord? e) => const ListEquality().hash([
        e?.pageRef,
        e?.title,
        e?.tiles,
        e?.memberlevels,
        e?.uploadedvideos,
        e?.videofromurl,
        e?.istabbedcontent,
        e?.linkedtotile,
        e?.linkedtotab,
        e?.videosummary,
        e?.tileref,
        e?.index,
        e?.videoby,
        e?.headertag,
        e?.videobyref,
        e?.videobyimage,
        e?.id,
        e?.isai,
        e?.questionnotshown,
        e?.thumbnail,
        e?.videoThumbnail
      ]);

  @override
  bool isValidKey(Object? o) => o is VideosRecord;
}
