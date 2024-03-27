import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TilesRecord extends FirestoreRecord {
  TilesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "categories" field.
  List<String>? _categories;
  List<String> get categories => _categories ?? const [];
  bool hasCategories() => _categories != null;

  // "memberlevels" field.
  List<String>? _memberlevels;
  List<String> get memberlevels => _memberlevels ?? const [];
  bool hasMemberlevels() => _memberlevels != null;

  // "subtopics" field.
  List<String>? _subtopics;
  List<String> get subtopics => _subtopics ?? const [];
  bool hasSubtopics() => _subtopics != null;

  // "templatelist" field.
  List<String>? _templatelist;
  List<String> get templatelist => _templatelist ?? const [];
  bool hasTemplatelist() => _templatelist != null;

  // "withtabs" field.
  bool? _withtabs;
  bool get withtabs => _withtabs ?? false;
  bool hasWithtabs() => _withtabs != null;

  // "tabs" field.
  List<String>? _tabs;
  List<String> get tabs => _tabs ?? const [];
  bool hasTabs() => _tabs != null;

  // "tier" field.
  int? _tier;
  int get tier => _tier ?? 0;
  bool hasTier() => _tier != null;

  // "parent" field.
  DocumentReference? _parent;
  DocumentReference? get parent => _parent;
  bool hasParent() => _parent != null;

  // "children" field.
  List<DocumentReference>? _children;
  List<DocumentReference> get children => _children ?? const [];
  bool hasChildren() => _children != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "pinned" field.
  List<DocumentReference>? _pinned;
  List<DocumentReference> get pinned => _pinned ?? const [];
  bool hasPinned() => _pinned != null;

  // "showvideoslider" field.
  bool? _showvideoslider;
  bool get showvideoslider => _showvideoslider ?? false;
  bool hasShowvideoslider() => _showvideoslider != null;

  // "pagelink" field.
  String? _pagelink;
  String get pagelink => _pagelink ?? '';
  bool hasPagelink() => _pagelink != null;

  // "showsubtiles" field.
  bool? _showsubtiles;
  bool get showsubtiles => _showsubtiles ?? false;
  bool hasShowsubtiles() => _showsubtiles != null;

  // "showtextblocks" field.
  bool? _showtextblocks;
  bool get showtextblocks => _showtextblocks ?? false;
  bool hasShowtextblocks() => _showtextblocks != null;

  // "showdocs" field.
  bool? _showdocs;
  bool get showdocs => _showdocs ?? false;
  bool hasShowdocs() => _showdocs != null;

  // "show" field.
  bool? _show;
  bool get show => _show ?? false;
  bool hasShow() => _show != null;

  // "refAsString" field.
  String? _refAsString;
  String get refAsString => _refAsString ?? '';
  bool hasRefAsString() => _refAsString != null;

  // "showLinks" field.
  bool? _showLinks;
  bool get showLinks => _showLinks ?? false;
  bool hasShowLinks() => _showLinks != null;

  // "showbuttons" field.
  bool? _showbuttons;
  bool get showbuttons => _showbuttons ?? false;
  bool hasShowbuttons() => _showbuttons != null;

  // "showtilesintiles" field.
  bool? _showtilesintiles;
  bool get showtilesintiles => _showtilesintiles ?? false;
  bool hasShowtilesintiles() => _showtilesintiles != null;

  // "tileref" field.
  DocumentReference? _tileref;
  DocumentReference? get tileref => _tileref;
  bool hasTileref() => _tileref != null;

  // "isFeatured" field.
  bool? _isFeatured;
  bool get isFeatured => _isFeatured ?? false;
  bool hasIsFeatured() => _isFeatured != null;

  // "dismissed" field.
  List<DocumentReference>? _dismissed;
  List<DocumentReference> get dismissed => _dismissed ?? const [];
  bool hasDismissed() => _dismissed != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "previousTileRef" field.
  DocumentReference? _previousTileRef;
  DocumentReference? get previousTileRef => _previousTileRef;
  bool hasPreviousTileRef() => _previousTileRef != null;

  // "aivideo" field.
  String? _aivideo;
  String get aivideo => _aivideo ?? '';
  bool hasAivideo() => _aivideo != null;

  // "aiResponse" field.
  String? _aiResponse;
  String get aiResponse => _aiResponse ?? '';
  bool hasAiResponse() => _aiResponse != null;

  // "isAI" field.
  bool? _isAI;
  bool get isAI => _isAI ?? false;
  bool hasIsAI() => _isAI != null;

  // "subTilesOnPage" field.
  List<DocumentReference>? _subTilesOnPage;
  List<DocumentReference> get subTilesOnPage => _subTilesOnPage ?? const [];
  bool hasSubTilesOnPage() => _subTilesOnPage != null;

  // "AI_ID" field.
  int? _aiId;
  int get aiId => _aiId ?? 0;
  bool hasAiId() => _aiId != null;

  // "showToMembers" field.
  List<DocumentReference>? _showToMembers;
  List<DocumentReference> get showToMembers => _showToMembers ?? const [];
  bool hasShowToMembers() => _showToMembers != null;

  // "onlyShowToMembers" field.
  bool? _onlyShowToMembers;
  bool get onlyShowToMembers => _onlyShowToMembers ?? false;
  bool hasOnlyShowToMembers() => _onlyShowToMembers != null;

  // "maintileref" field.
  DocumentReference? _maintileref;
  DocumentReference? get maintileref => _maintileref;
  bool hasMaintileref() => _maintileref != null;

  // "grandParentRef" field.
  DocumentReference? _grandParentRef;
  DocumentReference? get grandParentRef => _grandParentRef;
  bool hasGrandParentRef() => _grandParentRef != null;

  // "buttonType" field.
  String? _buttonType;
  String get buttonType => _buttonType ?? '';
  bool hasButtonType() => _buttonType != null;

  // "linetest" field.
  bool? _linetest;
  bool get linetest => _linetest ?? false;
  bool hasLinetest() => _linetest != null;

  // "subscriptions" field.
  List<String>? _subscriptions;
  List<String> get subscriptions => _subscriptions ?? const [];
  bool hasSubscriptions() => _subscriptions != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "updated_time" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  bool hasUpdatedTime() => _updatedTime != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "image_thumbnail" field.
  String? _imageThumbnail;
  String get imageThumbnail => _imageThumbnail ?? '';
  bool hasImageThumbnail() => _imageThumbnail != null;

  // "parent_id" field.
  String? _parentId;
  String get parentId => _parentId ?? '';
  bool hasParentId() => _parentId != null;

  // "companyId" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  // "dateadded" field.
  DateTime? _dateadded;
  DateTime? get dateadded => _dateadded;
  bool hasDateadded() => _dateadded != null;

  // "dateposted" field.
  DateTime? _dateposted;
  DateTime? get dateposted => _dateposted;
  bool hasDateposted() => _dateposted != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _summary = snapshotData['summary'] as String?;
    _image = snapshotData['image'] as String?;
    _categories = getDataList(snapshotData['categories']);
    _memberlevels = getDataList(snapshotData['memberlevels']);
    _subtopics = getDataList(snapshotData['subtopics']);
    _templatelist = getDataList(snapshotData['templatelist']);
    _withtabs = snapshotData['withtabs'] as bool?;
    _tabs = getDataList(snapshotData['tabs']);
    _tier = castToType<int>(snapshotData['tier']);
    _parent = snapshotData['parent'] as DocumentReference?;
    _children = getDataList(snapshotData['children']);
    _id = castToType<int>(snapshotData['id']);
    _pinned = getDataList(snapshotData['pinned']);
    _showvideoslider = snapshotData['showvideoslider'] as bool?;
    _pagelink = snapshotData['pagelink'] as String?;
    _showsubtiles = snapshotData['showsubtiles'] as bool?;
    _showtextblocks = snapshotData['showtextblocks'] as bool?;
    _showdocs = snapshotData['showdocs'] as bool?;
    _show = snapshotData['show'] as bool?;
    _refAsString = snapshotData['refAsString'] as String?;
    _showLinks = snapshotData['showLinks'] as bool?;
    _showbuttons = snapshotData['showbuttons'] as bool?;
    _showtilesintiles = snapshotData['showtilesintiles'] as bool?;
    _tileref = snapshotData['tileref'] as DocumentReference?;
    _isFeatured = snapshotData['isFeatured'] as bool?;
    _dismissed = getDataList(snapshotData['dismissed']);
    _video = snapshotData['video'] as String?;
    _previousTileRef = snapshotData['previousTileRef'] as DocumentReference?;
    _aivideo = snapshotData['aivideo'] as String?;
    _aiResponse = snapshotData['aiResponse'] as String?;
    _isAI = snapshotData['isAI'] as bool?;
    _subTilesOnPage = getDataList(snapshotData['subTilesOnPage']);
    _aiId = castToType<int>(snapshotData['AI_ID']);
    _showToMembers = getDataList(snapshotData['showToMembers']);
    _onlyShowToMembers = snapshotData['onlyShowToMembers'] as bool?;
    _maintileref = snapshotData['maintileref'] as DocumentReference?;
    _grandParentRef = snapshotData['grandParentRef'] as DocumentReference?;
    _buttonType = snapshotData['buttonType'] as String?;
    _linetest = snapshotData['linetest'] as bool?;
    _subscriptions = getDataList(snapshotData['subscriptions']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _uid = snapshotData['uid'] as String?;
    _imageThumbnail = snapshotData['image_thumbnail'] as String?;
    _parentId = snapshotData['parent_id'] as String?;
    _companyId = snapshotData['companyId'] as String?;
    _tag = snapshotData['tag'] as String?;
    _dateadded = snapshotData['dateadded'] as DateTime?;
    _dateposted = snapshotData['dateposted'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tiles');

  static Stream<TilesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TilesRecord.fromSnapshot(s));

  static Future<TilesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TilesRecord.fromSnapshot(s));

  static TilesRecord fromSnapshot(DocumentSnapshot snapshot) => TilesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TilesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TilesRecord._(reference, mapFromFirestore(data));

  static TilesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      TilesRecord.getDocumentFromData(
        {
          'title': snapshot.data['title'],
          'summary': snapshot.data['summary'],
          'image': snapshot.data['image'],
          'categories': safeGet(
            () => snapshot.data['categories'].toList(),
          ),
          'memberlevels': safeGet(
            () => snapshot.data['memberlevels'].toList(),
          ),
          'subtopics': safeGet(
            () => snapshot.data['subtopics'].toList(),
          ),
          'templatelist': safeGet(
            () => snapshot.data['templatelist'].toList(),
          ),
          'withtabs': snapshot.data['withtabs'],
          'tabs': safeGet(
            () => snapshot.data['tabs'].toList(),
          ),
          'tier': convertAlgoliaParam(
            snapshot.data['tier'],
            ParamType.int,
            false,
          ),
          'parent': convertAlgoliaParam(
            snapshot.data['parent'],
            ParamType.DocumentReference,
            false,
          ),
          'children': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['children'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'id': convertAlgoliaParam(
            snapshot.data['id'],
            ParamType.int,
            false,
          ),
          'pinned': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['pinned'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'showvideoslider': snapshot.data['showvideoslider'],
          'pagelink': snapshot.data['pagelink'],
          'showsubtiles': snapshot.data['showsubtiles'],
          'showtextblocks': snapshot.data['showtextblocks'],
          'showdocs': snapshot.data['showdocs'],
          'show': snapshot.data['show'],
          'refAsString': snapshot.data['refAsString'],
          'showLinks': snapshot.data['showLinks'],
          'showbuttons': snapshot.data['showbuttons'],
          'showtilesintiles': snapshot.data['showtilesintiles'],
          'tileref': convertAlgoliaParam(
            snapshot.data['tileref'],
            ParamType.DocumentReference,
            false,
          ),
          'isFeatured': snapshot.data['isFeatured'],
          'dismissed': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['dismissed'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'video': snapshot.data['video'],
          'previousTileRef': convertAlgoliaParam(
            snapshot.data['previousTileRef'],
            ParamType.DocumentReference,
            false,
          ),
          'aivideo': snapshot.data['aivideo'],
          'aiResponse': snapshot.data['aiResponse'],
          'isAI': snapshot.data['isAI'],
          'subTilesOnPage': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['subTilesOnPage'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'AI_ID': convertAlgoliaParam(
            snapshot.data['AI_ID'],
            ParamType.int,
            false,
          ),
          'showToMembers': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['showToMembers'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'onlyShowToMembers': snapshot.data['onlyShowToMembers'],
          'maintileref': convertAlgoliaParam(
            snapshot.data['maintileref'],
            ParamType.DocumentReference,
            false,
          ),
          'grandParentRef': convertAlgoliaParam(
            snapshot.data['grandParentRef'],
            ParamType.DocumentReference,
            false,
          ),
          'buttonType': snapshot.data['buttonType'],
          'linetest': snapshot.data['linetest'],
          'subscriptions': safeGet(
            () => snapshot.data['subscriptions'].toList(),
          ),
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'updated_time': convertAlgoliaParam(
            snapshot.data['updated_time'],
            ParamType.DateTime,
            false,
          ),
          'user': convertAlgoliaParam(
            snapshot.data['user'],
            ParamType.DocumentReference,
            false,
          ),
          'uid': snapshot.data['uid'],
          'image_thumbnail': snapshot.data['image_thumbnail'],
          'parent_id': snapshot.data['parent_id'],
          'companyId': snapshot.data['companyId'],
          'tag': snapshot.data['tag'],
          'dateadded': convertAlgoliaParam(
            snapshot.data['dateadded'],
            ParamType.DateTime,
            false,
          ),
          'dateposted': convertAlgoliaParam(
            snapshot.data['dateposted'],
            ParamType.DateTime,
            false,
          ),
        },
        TilesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<TilesRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'tiles',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'TilesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TilesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTilesRecordData({
  String? title,
  String? summary,
  String? image,
  bool? withtabs,
  int? tier,
  DocumentReference? parent,
  int? id,
  bool? showvideoslider,
  String? pagelink,
  bool? showsubtiles,
  bool? showtextblocks,
  bool? showdocs,
  bool? show,
  String? refAsString,
  bool? showLinks,
  bool? showbuttons,
  bool? showtilesintiles,
  DocumentReference? tileref,
  bool? isFeatured,
  String? video,
  DocumentReference? previousTileRef,
  String? aivideo,
  String? aiResponse,
  bool? isAI,
  int? aiId,
  bool? onlyShowToMembers,
  DocumentReference? maintileref,
  DocumentReference? grandParentRef,
  String? buttonType,
  bool? linetest,
  DateTime? createdTime,
  DateTime? updatedTime,
  DocumentReference? user,
  String? uid,
  String? imageThumbnail,
  String? parentId,
  String? companyId,
  String? tag,
  DateTime? dateadded,
  DateTime? dateposted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'summary': summary,
      'image': image,
      'withtabs': withtabs,
      'tier': tier,
      'parent': parent,
      'id': id,
      'showvideoslider': showvideoslider,
      'pagelink': pagelink,
      'showsubtiles': showsubtiles,
      'showtextblocks': showtextblocks,
      'showdocs': showdocs,
      'show': show,
      'refAsString': refAsString,
      'showLinks': showLinks,
      'showbuttons': showbuttons,
      'showtilesintiles': showtilesintiles,
      'tileref': tileref,
      'isFeatured': isFeatured,
      'video': video,
      'previousTileRef': previousTileRef,
      'aivideo': aivideo,
      'aiResponse': aiResponse,
      'isAI': isAI,
      'AI_ID': aiId,
      'onlyShowToMembers': onlyShowToMembers,
      'maintileref': maintileref,
      'grandParentRef': grandParentRef,
      'buttonType': buttonType,
      'linetest': linetest,
      'created_time': createdTime,
      'updated_time': updatedTime,
      'user': user,
      'uid': uid,
      'image_thumbnail': imageThumbnail,
      'parent_id': parentId,
      'companyId': companyId,
      'tag': tag,
      'dateadded': dateadded,
      'dateposted': dateposted,
    }.withoutNulls,
  );

  return firestoreData;
}

class TilesRecordDocumentEquality implements Equality<TilesRecord> {
  const TilesRecordDocumentEquality();

  @override
  bool equals(TilesRecord? e1, TilesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.summary == e2?.summary &&
        e1?.image == e2?.image &&
        listEquality.equals(e1?.categories, e2?.categories) &&
        listEquality.equals(e1?.memberlevels, e2?.memberlevels) &&
        listEquality.equals(e1?.subtopics, e2?.subtopics) &&
        listEquality.equals(e1?.templatelist, e2?.templatelist) &&
        e1?.withtabs == e2?.withtabs &&
        listEquality.equals(e1?.tabs, e2?.tabs) &&
        e1?.tier == e2?.tier &&
        e1?.parent == e2?.parent &&
        listEquality.equals(e1?.children, e2?.children) &&
        e1?.id == e2?.id &&
        listEquality.equals(e1?.pinned, e2?.pinned) &&
        e1?.showvideoslider == e2?.showvideoslider &&
        e1?.pagelink == e2?.pagelink &&
        e1?.showsubtiles == e2?.showsubtiles &&
        e1?.showtextblocks == e2?.showtextblocks &&
        e1?.showdocs == e2?.showdocs &&
        e1?.show == e2?.show &&
        e1?.refAsString == e2?.refAsString &&
        e1?.showLinks == e2?.showLinks &&
        e1?.showbuttons == e2?.showbuttons &&
        e1?.showtilesintiles == e2?.showtilesintiles &&
        e1?.tileref == e2?.tileref &&
        e1?.isFeatured == e2?.isFeatured &&
        listEquality.equals(e1?.dismissed, e2?.dismissed) &&
        e1?.video == e2?.video &&
        e1?.previousTileRef == e2?.previousTileRef &&
        e1?.aivideo == e2?.aivideo &&
        e1?.aiResponse == e2?.aiResponse &&
        e1?.isAI == e2?.isAI &&
        listEquality.equals(e1?.subTilesOnPage, e2?.subTilesOnPage) &&
        e1?.aiId == e2?.aiId &&
        listEquality.equals(e1?.showToMembers, e2?.showToMembers) &&
        e1?.onlyShowToMembers == e2?.onlyShowToMembers &&
        e1?.maintileref == e2?.maintileref &&
        e1?.grandParentRef == e2?.grandParentRef &&
        e1?.buttonType == e2?.buttonType &&
        e1?.linetest == e2?.linetest &&
        listEquality.equals(e1?.subscriptions, e2?.subscriptions) &&
        e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.user == e2?.user &&
        e1?.uid == e2?.uid &&
        e1?.imageThumbnail == e2?.imageThumbnail &&
        e1?.parentId == e2?.parentId &&
        e1?.companyId == e2?.companyId &&
        e1?.tag == e2?.tag &&
        e1?.dateadded == e2?.dateadded &&
        e1?.dateposted == e2?.dateposted;
  }

  @override
  int hash(TilesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.summary,
        e?.image,
        e?.categories,
        e?.memberlevels,
        e?.subtopics,
        e?.templatelist,
        e?.withtabs,
        e?.tabs,
        e?.tier,
        e?.parent,
        e?.children,
        e?.id,
        e?.pinned,
        e?.showvideoslider,
        e?.pagelink,
        e?.showsubtiles,
        e?.showtextblocks,
        e?.showdocs,
        e?.show,
        e?.refAsString,
        e?.showLinks,
        e?.showbuttons,
        e?.showtilesintiles,
        e?.tileref,
        e?.isFeatured,
        e?.dismissed,
        e?.video,
        e?.previousTileRef,
        e?.aivideo,
        e?.aiResponse,
        e?.isAI,
        e?.subTilesOnPage,
        e?.aiId,
        e?.showToMembers,
        e?.onlyShowToMembers,
        e?.maintileref,
        e?.grandParentRef,
        e?.buttonType,
        e?.linetest,
        e?.subscriptions,
        e?.createdTime,
        e?.updatedTime,
        e?.user,
        e?.uid,
        e?.imageThumbnail,
        e?.parentId,
        e?.companyId,
        e?.tag,
        e?.dateadded,
        e?.dateposted
      ]);

  @override
  bool isValidKey(Object? o) => o is TilesRecord;
}
