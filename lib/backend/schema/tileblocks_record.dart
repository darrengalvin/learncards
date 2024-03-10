import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TileblocksRecord extends FirestoreRecord {
  TileblocksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

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

  // "textblock" field.
  String? _textblock;
  String get textblock => _textblock ?? '';
  bool hasTextblock() => _textblock != null;

  // "headertext" field.
  String? _headertext;
  String get headertext => _headertext ?? '';
  bool hasHeadertext() => _headertext != null;

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

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "tileref" field.
  List<DocumentReference>? _tileref;
  List<DocumentReference> get tileref => _tileref ?? const [];
  bool hasTileref() => _tileref != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "linktopage" field.
  String? _linktopage;
  String get linktopage => _linktopage ?? '';
  bool hasLinktopage() => _linktopage != null;

  // "buttontextlinktopage" field.
  String? _buttontextlinktopage;
  String get buttontextlinktopage => _buttontextlinktopage ?? '';
  bool hasButtontextlinktopage() => _buttontextlinktopage != null;

  // "showInTiles" field.
  List<DocumentReference>? _showInTiles;
  List<DocumentReference> get showInTiles => _showInTiles ?? const [];
  bool hasShowInTiles() => _showInTiles != null;

  // "showbutton" field.
  bool? _showbutton;
  bool get showbutton => _showbutton ?? false;
  bool hasShowbutton() => _showbutton != null;

  // "showtileintile" field.
  bool? _showtileintile;
  bool get showtileintile => _showtileintile ?? false;
  bool hasShowtileintile() => _showtileintile != null;

  // "tileintiletext" field.
  String? _tileintiletext;
  String get tileintiletext => _tileintiletext ?? '';
  bool hasTileintiletext() => _tileintiletext != null;

  // "linkintext" field.
  String? _linkintext;
  String get linkintext => _linkintext ?? '';
  bool hasLinkintext() => _linkintext != null;

  // "docintext" field.
  String? _docintext;
  String get docintext => _docintext ?? '';
  bool hasDocintext() => _docintext != null;

  // "showvideo" field.
  bool? _showvideo;
  bool get showvideo => _showvideo ?? false;
  bool hasShowvideo() => _showvideo != null;

  // "videointext" field.
  String? _videointext;
  String get videointext => _videointext ?? '';
  bool hasVideointext() => _videointext != null;

  // "showheadertext" field.
  bool? _showheadertext;
  bool get showheadertext => _showheadertext ?? false;
  bool hasShowheadertext() => _showheadertext != null;

  // "showparagraphtext" field.
  bool? _showparagraphtext;
  bool get showparagraphtext => _showparagraphtext ?? false;
  bool hasShowparagraphtext() => _showparagraphtext != null;

  // "shoeimage" field.
  bool? _shoeimage;
  bool get shoeimage => _shoeimage ?? false;
  bool hasShoeimage() => _shoeimage != null;

  // "videolist" field.
  List<String>? _videolist;
  List<String> get videolist => _videolist ?? const [];
  bool hasVideolist() => _videolist != null;

  // "videolisttitle" field.
  List<String>? _videolisttitle;
  List<String> get videolisttitle => _videolisttitle ?? const [];
  bool hasVideolisttitle() => _videolisttitle != null;

  // "doclistitle" field.
  List<String>? _doclistitle;
  List<String> get doclistitle => _doclistitle ?? const [];
  bool hasDoclistitle() => _doclistitle != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "isAI" field.
  bool? _isAI;
  bool get isAI => _isAI ?? false;
  bool hasIsAI() => _isAI != null;

  // "tileWithinTileRef" field.
  List<DocumentReference>? _tileWithinTileRef;
  List<DocumentReference> get tileWithinTileRef =>
      _tileWithinTileRef ?? const [];
  bool hasTileWithinTileRef() => _tileWithinTileRef != null;

  // "hassocialfeed" field.
  bool? _hassocialfeed;
  bool get hassocialfeed => _hassocialfeed ?? false;
  bool hasHassocialfeed() => _hassocialfeed != null;

  // "block_id" field.
  String? _blockId;
  String get blockId => _blockId ?? '';
  bool hasBlockId() => _blockId != null;

  // "tilerefid" field.
  String? _tilerefid;
  String get tilerefid => _tilerefid ?? '';
  bool hasTilerefid() => _tilerefid != null;

  // "companyId" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  void _initializeFields() {
    _tiles = getDataList(snapshotData['tiles']);
    _memberlevel = getDataList(snapshotData['memberlevel']);
    _title = snapshotData['title'] as String?;
    _textblock = snapshotData['textblock'] as String?;
    _headertext = snapshotData['headertext'] as String?;
    _istabbedcontent = snapshotData['istabbedcontent'] as bool?;
    _linkedtotile = snapshotData['linkedtotile'] as String?;
    _linkedtotab = snapshotData['linkedtotab'] as String?;
    _image = snapshotData['image'] as String?;
    _tileref = getDataList(snapshotData['tileref']);
    _id = castToType<int>(snapshotData['id']);
    _linktopage = snapshotData['linktopage'] as String?;
    _buttontextlinktopage = snapshotData['buttontextlinktopage'] as String?;
    _showInTiles = getDataList(snapshotData['showInTiles']);
    _showbutton = snapshotData['showbutton'] as bool?;
    _showtileintile = snapshotData['showtileintile'] as bool?;
    _tileintiletext = snapshotData['tileintiletext'] as String?;
    _linkintext = snapshotData['linkintext'] as String?;
    _docintext = snapshotData['docintext'] as String?;
    _showvideo = snapshotData['showvideo'] as bool?;
    _videointext = snapshotData['videointext'] as String?;
    _showheadertext = snapshotData['showheadertext'] as bool?;
    _showparagraphtext = snapshotData['showparagraphtext'] as bool?;
    _shoeimage = snapshotData['shoeimage'] as bool?;
    _videolist = getDataList(snapshotData['videolist']);
    _videolisttitle = getDataList(snapshotData['videolisttitle']);
    _doclistitle = getDataList(snapshotData['doclistitle']);
    _date = snapshotData['date'] as DateTime?;
    _isAI = snapshotData['isAI'] as bool?;
    _tileWithinTileRef = getDataList(snapshotData['tileWithinTileRef']);
    _hassocialfeed = snapshotData['hassocialfeed'] as bool?;
    _blockId = snapshotData['block_id'] as String?;
    _tilerefid = snapshotData['tilerefid'] as String?;
    _companyId = snapshotData['companyId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tileblocks');

  static Stream<TileblocksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TileblocksRecord.fromSnapshot(s));

  static Future<TileblocksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TileblocksRecord.fromSnapshot(s));

  static TileblocksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TileblocksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TileblocksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TileblocksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TileblocksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TileblocksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTileblocksRecordData({
  String? title,
  String? textblock,
  String? headertext,
  bool? istabbedcontent,
  String? linkedtotile,
  String? linkedtotab,
  String? image,
  int? id,
  String? linktopage,
  String? buttontextlinktopage,
  bool? showbutton,
  bool? showtileintile,
  String? tileintiletext,
  String? linkintext,
  String? docintext,
  bool? showvideo,
  String? videointext,
  bool? showheadertext,
  bool? showparagraphtext,
  bool? shoeimage,
  DateTime? date,
  bool? isAI,
  bool? hassocialfeed,
  String? blockId,
  String? tilerefid,
  String? companyId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'textblock': textblock,
      'headertext': headertext,
      'istabbedcontent': istabbedcontent,
      'linkedtotile': linkedtotile,
      'linkedtotab': linkedtotab,
      'image': image,
      'id': id,
      'linktopage': linktopage,
      'buttontextlinktopage': buttontextlinktopage,
      'showbutton': showbutton,
      'showtileintile': showtileintile,
      'tileintiletext': tileintiletext,
      'linkintext': linkintext,
      'docintext': docintext,
      'showvideo': showvideo,
      'videointext': videointext,
      'showheadertext': showheadertext,
      'showparagraphtext': showparagraphtext,
      'shoeimage': shoeimage,
      'date': date,
      'isAI': isAI,
      'hassocialfeed': hassocialfeed,
      'block_id': blockId,
      'tilerefid': tilerefid,
      'companyId': companyId,
    }.withoutNulls,
  );

  return firestoreData;
}

class TileblocksRecordDocumentEquality implements Equality<TileblocksRecord> {
  const TileblocksRecordDocumentEquality();

  @override
  bool equals(TileblocksRecord? e1, TileblocksRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.tiles, e2?.tiles) &&
        listEquality.equals(e1?.memberlevel, e2?.memberlevel) &&
        e1?.title == e2?.title &&
        e1?.textblock == e2?.textblock &&
        e1?.headertext == e2?.headertext &&
        e1?.istabbedcontent == e2?.istabbedcontent &&
        e1?.linkedtotile == e2?.linkedtotile &&
        e1?.linkedtotab == e2?.linkedtotab &&
        e1?.image == e2?.image &&
        listEquality.equals(e1?.tileref, e2?.tileref) &&
        e1?.id == e2?.id &&
        e1?.linktopage == e2?.linktopage &&
        e1?.buttontextlinktopage == e2?.buttontextlinktopage &&
        listEquality.equals(e1?.showInTiles, e2?.showInTiles) &&
        e1?.showbutton == e2?.showbutton &&
        e1?.showtileintile == e2?.showtileintile &&
        e1?.tileintiletext == e2?.tileintiletext &&
        e1?.linkintext == e2?.linkintext &&
        e1?.docintext == e2?.docintext &&
        e1?.showvideo == e2?.showvideo &&
        e1?.videointext == e2?.videointext &&
        e1?.showheadertext == e2?.showheadertext &&
        e1?.showparagraphtext == e2?.showparagraphtext &&
        e1?.shoeimage == e2?.shoeimage &&
        listEquality.equals(e1?.videolist, e2?.videolist) &&
        listEquality.equals(e1?.videolisttitle, e2?.videolisttitle) &&
        listEquality.equals(e1?.doclistitle, e2?.doclistitle) &&
        e1?.date == e2?.date &&
        e1?.isAI == e2?.isAI &&
        listEquality.equals(e1?.tileWithinTileRef, e2?.tileWithinTileRef) &&
        e1?.hassocialfeed == e2?.hassocialfeed &&
        e1?.blockId == e2?.blockId &&
        e1?.tilerefid == e2?.tilerefid &&
        e1?.companyId == e2?.companyId;
  }

  @override
  int hash(TileblocksRecord? e) => const ListEquality().hash([
        e?.tiles,
        e?.memberlevel,
        e?.title,
        e?.textblock,
        e?.headertext,
        e?.istabbedcontent,
        e?.linkedtotile,
        e?.linkedtotab,
        e?.image,
        e?.tileref,
        e?.id,
        e?.linktopage,
        e?.buttontextlinktopage,
        e?.showInTiles,
        e?.showbutton,
        e?.showtileintile,
        e?.tileintiletext,
        e?.linkintext,
        e?.docintext,
        e?.showvideo,
        e?.videointext,
        e?.showheadertext,
        e?.showparagraphtext,
        e?.shoeimage,
        e?.videolist,
        e?.videolisttitle,
        e?.doclistitle,
        e?.date,
        e?.isAI,
        e?.tileWithinTileRef,
        e?.hassocialfeed,
        e?.blockId,
        e?.tilerefid,
        e?.companyId
      ]);

  @override
  bool isValidKey(Object? o) => o is TileblocksRecord;
}
