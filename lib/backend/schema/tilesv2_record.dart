import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Tilesv2Record extends FirestoreRecord {
  Tilesv2Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

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

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "subtitle" field.
  String? _subtitle;
  String get subtitle => _subtitle ?? '';
  bool hasSubtitle() => _subtitle != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "thumbnail" field.
  String? _thumbnail;
  String get thumbnail => _thumbnail ?? '';
  bool hasThumbnail() => _thumbnail != null;

  // "isPublished" field.
  bool? _isPublished;
  bool get isPublished => _isPublished ?? false;
  bool hasIsPublished() => _isPublished != null;

  // "layout" field.
  String? _layout;
  String get layout => _layout ?? '';
  bool hasLayout() => _layout != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "isPublic" field.
  bool? _isPublic;
  bool get isPublic => _isPublic ?? false;
  bool hasIsPublic() => _isPublic != null;

  // "isPinned" field.
  bool? _isPinned;
  bool get isPinned => _isPinned ?? false;
  bool hasIsPinned() => _isPinned != null;

  // "isFeatured" field.
  bool? _isFeatured;
  bool get isFeatured => _isFeatured ?? false;
  bool hasIsFeatured() => _isFeatured != null;

  // "parent_id" field.
  String? _parentId;
  String get parentId => _parentId ?? '';
  bool hasParentId() => _parentId != null;

  // "parent_ref" field.
  DocumentReference? _parentRef;
  DocumentReference? get parentRef => _parentRef;
  bool hasParentRef() => _parentRef != null;

  // "children" field.
  List<String>? _children;
  List<String> get children => _children ?? const [];
  bool hasChildren() => _children != null;

  // "children_refs" field.
  List<DocumentReference>? _childrenRefs;
  List<DocumentReference> get childrenRefs => _childrenRefs ?? const [];
  bool hasChildrenRefs() => _childrenRefs != null;

  // "tile_tier" field.
  int? _tileTier;
  int get tileTier => _tileTier ?? 0;
  bool hasTileTier() => _tileTier != null;

  // "tile_index" field.
  int? _tileIndex;
  int get tileIndex => _tileIndex ?? 0;
  bool hasTileIndex() => _tileIndex != null;

  // "tileBlocks" field.
  List<String>? _tileBlocks;
  List<String> get tileBlocks => _tileBlocks ?? const [];
  bool hasTileBlocks() => _tileBlocks != null;

  // "isContent" field.
  bool? _isContent;
  bool get isContent => _isContent ?? false;
  bool hasIsContent() => _isContent != null;

  // "access_users" field.
  List<String>? _accessUsers;
  List<String> get accessUsers => _accessUsers ?? const [];
  bool hasAccessUsers() => _accessUsers != null;

  // "access_groups" field.
  List<String>? _accessGroups;
  List<String> get accessGroups => _accessGroups ?? const [];
  bool hasAccessGroups() => _accessGroups != null;

  // "admin_users" field.
  List<String>? _adminUsers;
  List<String> get adminUsers => _adminUsers ?? const [];
  bool hasAdminUsers() => _adminUsers != null;

  // "tile_id" field.
  String? _tileId;
  String get tileId => _tileId ?? '';
  bool hasTileId() => _tileId != null;

  // "tile_type" field.
  String? _tileType;
  String get tileType => _tileType ?? '';
  bool hasTileType() => _tileType != null;

  // "tile_name" field.
  String? _tileName;
  String get tileName => _tileName ?? '';
  bool hasTileName() => _tileName != null;

  // "tile_status" field.
  String? _tileStatus;
  String get tileStatus => _tileStatus ?? '';
  bool hasTileStatus() => _tileStatus != null;

  // "featured_image" field.
  String? _featuredImage;
  String get featuredImage => _featuredImage ?? '';
  bool hasFeaturedImage() => _featuredImage != null;

  // "aiComplete" field.
  bool? _aiComplete;
  bool get aiComplete => _aiComplete ?? false;
  bool hasAiComplete() => _aiComplete != null;

  // "userMessage" field.
  String? _userMessage;
  String get userMessage => _userMessage ?? '';
  bool hasUserMessage() => _userMessage != null;

  // "sessionIdUser" field.
  String? _sessionIdUser;
  String get sessionIdUser => _sessionIdUser ?? '';
  bool hasSessionIdUser() => _sessionIdUser != null;

  // "isMainDefaultTile" field.
  bool? _isMainDefaultTile;
  bool get isMainDefaultTile => _isMainDefaultTile ?? false;
  bool hasIsMainDefaultTile() => _isMainDefaultTile != null;

  // "stopStreaming" field.
  bool? _stopStreaming;
  bool get stopStreaming => _stopStreaming ?? false;
  bool hasStopStreaming() => _stopStreaming != null;

  // "isWelcomeTile" field.
  bool? _isWelcomeTile;
  bool get isWelcomeTile => _isWelcomeTile ?? false;
  bool hasIsWelcomeTile() => _isWelcomeTile != null;

  // "showToAll" field.
  bool? _showToAll;
  bool get showToAll => _showToAll ?? false;
  bool hasShowToAll() => _showToAll != null;

  // "isAdminOnly" field.
  bool? _isAdminOnly;
  bool get isAdminOnly => _isAdminOnly ?? false;
  bool hasIsAdminOnly() => _isAdminOnly != null;

  // "showDate" field.
  DateTime? _showDate;
  DateTime? get showDate => _showDate;
  bool hasShowDate() => _showDate != null;

  // "weekNo" field.
  int? _weekNo;
  int get weekNo => _weekNo ?? 0;
  bool hasWeekNo() => _weekNo != null;

  // "triggerWeekly" field.
  bool? _triggerWeekly;
  bool get triggerWeekly => _triggerWeekly ?? false;
  bool hasTriggerWeekly() => _triggerWeekly != null;

  // "companyDocId" field.
  String? _companyDocId;
  String get companyDocId => _companyDocId ?? '';
  bool hasCompanyDocId() => _companyDocId != null;

  // "tileToday" field.
  bool? _tileToday;
  bool get tileToday => _tileToday ?? false;
  bool hasTileToday() => _tileToday != null;

  // "processed" field.
  bool? _processed;
  bool get processed => _processed ?? false;
  bool hasProcessed() => _processed != null;

  // "dailyActivities" field.
  List<String>? _dailyActivities;
  List<String> get dailyActivities => _dailyActivities ?? const [];
  bool hasDailyActivities() => _dailyActivities != null;

  // "whyChosen" field.
  String? _whyChosen;
  String get whyChosen => _whyChosen ?? '';
  bool hasWhyChosen() => _whyChosen != null;

  // "showUsersDate" field.
  DateTime? _showUsersDate;
  DateTime? get showUsersDate => _showUsersDate;
  bool hasShowUsersDate() => _showUsersDate != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _uid = snapshotData['uid'] as String?;
    _type = snapshotData['type'] as String?;
    _title = snapshotData['title'] as String?;
    _subtitle = snapshotData['subtitle'] as String?;
    _details = snapshotData['details'] as String?;
    _image = snapshotData['image'] as String?;
    _thumbnail = snapshotData['thumbnail'] as String?;
    _isPublished = snapshotData['isPublished'] as bool?;
    _layout = snapshotData['layout'] as String?;
    _tags = getDataList(snapshotData['tags']);
    _category = snapshotData['category'] as String?;
    _isPublic = snapshotData['isPublic'] as bool?;
    _isPinned = snapshotData['isPinned'] as bool?;
    _isFeatured = snapshotData['isFeatured'] as bool?;
    _parentId = snapshotData['parent_id'] as String?;
    _parentRef = snapshotData['parent_ref'] as DocumentReference?;
    _children = getDataList(snapshotData['children']);
    _childrenRefs = getDataList(snapshotData['children_refs']);
    _tileTier = castToType<int>(snapshotData['tile_tier']);
    _tileIndex = castToType<int>(snapshotData['tile_index']);
    _tileBlocks = getDataList(snapshotData['tileBlocks']);
    _isContent = snapshotData['isContent'] as bool?;
    _accessUsers = getDataList(snapshotData['access_users']);
    _accessGroups = getDataList(snapshotData['access_groups']);
    _adminUsers = getDataList(snapshotData['admin_users']);
    _tileId = snapshotData['tile_id'] as String?;
    _tileType = snapshotData['tile_type'] as String?;
    _tileName = snapshotData['tile_name'] as String?;
    _tileStatus = snapshotData['tile_status'] as String?;
    _featuredImage = snapshotData['featured_image'] as String?;
    _aiComplete = snapshotData['aiComplete'] as bool?;
    _userMessage = snapshotData['userMessage'] as String?;
    _sessionIdUser = snapshotData['sessionIdUser'] as String?;
    _isMainDefaultTile = snapshotData['isMainDefaultTile'] as bool?;
    _stopStreaming = snapshotData['stopStreaming'] as bool?;
    _isWelcomeTile = snapshotData['isWelcomeTile'] as bool?;
    _showToAll = snapshotData['showToAll'] as bool?;
    _isAdminOnly = snapshotData['isAdminOnly'] as bool?;
    _showDate = snapshotData['showDate'] as DateTime?;
    _weekNo = castToType<int>(snapshotData['weekNo']);
    _triggerWeekly = snapshotData['triggerWeekly'] as bool?;
    _companyDocId = snapshotData['companyDocId'] as String?;
    _tileToday = snapshotData['tileToday'] as bool?;
    _processed = snapshotData['processed'] as bool?;
    _dailyActivities = getDataList(snapshotData['dailyActivities']);
    _whyChosen = snapshotData['whyChosen'] as String?;
    _showUsersDate = snapshotData['showUsersDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tilesv2');

  static Stream<Tilesv2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Tilesv2Record.fromSnapshot(s));

  static Future<Tilesv2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Tilesv2Record.fromSnapshot(s));

  static Tilesv2Record fromSnapshot(DocumentSnapshot snapshot) =>
      Tilesv2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Tilesv2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Tilesv2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Tilesv2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Tilesv2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTilesv2RecordData({
  DateTime? createdTime,
  DateTime? updatedTime,
  DocumentReference? user,
  String? uid,
  String? type,
  String? title,
  String? subtitle,
  String? details,
  String? image,
  String? thumbnail,
  bool? isPublished,
  String? layout,
  String? category,
  bool? isPublic,
  bool? isPinned,
  bool? isFeatured,
  String? parentId,
  DocumentReference? parentRef,
  int? tileTier,
  int? tileIndex,
  bool? isContent,
  String? tileId,
  String? tileType,
  String? tileName,
  String? tileStatus,
  String? featuredImage,
  bool? aiComplete,
  String? userMessage,
  String? sessionIdUser,
  bool? isMainDefaultTile,
  bool? stopStreaming,
  bool? isWelcomeTile,
  bool? showToAll,
  bool? isAdminOnly,
  DateTime? showDate,
  int? weekNo,
  bool? triggerWeekly,
  String? companyDocId,
  bool? tileToday,
  bool? processed,
  String? whyChosen,
  DateTime? showUsersDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'updated_time': updatedTime,
      'user': user,
      'uid': uid,
      'type': type,
      'title': title,
      'subtitle': subtitle,
      'details': details,
      'image': image,
      'thumbnail': thumbnail,
      'isPublished': isPublished,
      'layout': layout,
      'category': category,
      'isPublic': isPublic,
      'isPinned': isPinned,
      'isFeatured': isFeatured,
      'parent_id': parentId,
      'parent_ref': parentRef,
      'tile_tier': tileTier,
      'tile_index': tileIndex,
      'isContent': isContent,
      'tile_id': tileId,
      'tile_type': tileType,
      'tile_name': tileName,
      'tile_status': tileStatus,
      'featured_image': featuredImage,
      'aiComplete': aiComplete,
      'userMessage': userMessage,
      'sessionIdUser': sessionIdUser,
      'isMainDefaultTile': isMainDefaultTile,
      'stopStreaming': stopStreaming,
      'isWelcomeTile': isWelcomeTile,
      'showToAll': showToAll,
      'isAdminOnly': isAdminOnly,
      'showDate': showDate,
      'weekNo': weekNo,
      'triggerWeekly': triggerWeekly,
      'companyDocId': companyDocId,
      'tileToday': tileToday,
      'processed': processed,
      'whyChosen': whyChosen,
      'showUsersDate': showUsersDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class Tilesv2RecordDocumentEquality implements Equality<Tilesv2Record> {
  const Tilesv2RecordDocumentEquality();

  @override
  bool equals(Tilesv2Record? e1, Tilesv2Record? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.user == e2?.user &&
        e1?.uid == e2?.uid &&
        e1?.type == e2?.type &&
        e1?.title == e2?.title &&
        e1?.subtitle == e2?.subtitle &&
        e1?.details == e2?.details &&
        e1?.image == e2?.image &&
        e1?.thumbnail == e2?.thumbnail &&
        e1?.isPublished == e2?.isPublished &&
        e1?.layout == e2?.layout &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.category == e2?.category &&
        e1?.isPublic == e2?.isPublic &&
        e1?.isPinned == e2?.isPinned &&
        e1?.isFeatured == e2?.isFeatured &&
        e1?.parentId == e2?.parentId &&
        e1?.parentRef == e2?.parentRef &&
        listEquality.equals(e1?.children, e2?.children) &&
        listEquality.equals(e1?.childrenRefs, e2?.childrenRefs) &&
        e1?.tileTier == e2?.tileTier &&
        e1?.tileIndex == e2?.tileIndex &&
        listEquality.equals(e1?.tileBlocks, e2?.tileBlocks) &&
        e1?.isContent == e2?.isContent &&
        listEquality.equals(e1?.accessUsers, e2?.accessUsers) &&
        listEquality.equals(e1?.accessGroups, e2?.accessGroups) &&
        listEquality.equals(e1?.adminUsers, e2?.adminUsers) &&
        e1?.tileId == e2?.tileId &&
        e1?.tileType == e2?.tileType &&
        e1?.tileName == e2?.tileName &&
        e1?.tileStatus == e2?.tileStatus &&
        e1?.featuredImage == e2?.featuredImage &&
        e1?.aiComplete == e2?.aiComplete &&
        e1?.userMessage == e2?.userMessage &&
        e1?.sessionIdUser == e2?.sessionIdUser &&
        e1?.isMainDefaultTile == e2?.isMainDefaultTile &&
        e1?.stopStreaming == e2?.stopStreaming &&
        e1?.isWelcomeTile == e2?.isWelcomeTile &&
        e1?.showToAll == e2?.showToAll &&
        e1?.isAdminOnly == e2?.isAdminOnly &&
        e1?.showDate == e2?.showDate &&
        e1?.weekNo == e2?.weekNo &&
        e1?.triggerWeekly == e2?.triggerWeekly &&
        e1?.companyDocId == e2?.companyDocId &&
        e1?.tileToday == e2?.tileToday &&
        e1?.processed == e2?.processed &&
        listEquality.equals(e1?.dailyActivities, e2?.dailyActivities) &&
        e1?.whyChosen == e2?.whyChosen &&
        e1?.showUsersDate == e2?.showUsersDate;
  }

  @override
  int hash(Tilesv2Record? e) => const ListEquality().hash([
        e?.createdTime,
        e?.updatedTime,
        e?.user,
        e?.uid,
        e?.type,
        e?.title,
        e?.subtitle,
        e?.details,
        e?.image,
        e?.thumbnail,
        e?.isPublished,
        e?.layout,
        e?.tags,
        e?.category,
        e?.isPublic,
        e?.isPinned,
        e?.isFeatured,
        e?.parentId,
        e?.parentRef,
        e?.children,
        e?.childrenRefs,
        e?.tileTier,
        e?.tileIndex,
        e?.tileBlocks,
        e?.isContent,
        e?.accessUsers,
        e?.accessGroups,
        e?.adminUsers,
        e?.tileId,
        e?.tileType,
        e?.tileName,
        e?.tileStatus,
        e?.featuredImage,
        e?.aiComplete,
        e?.userMessage,
        e?.sessionIdUser,
        e?.isMainDefaultTile,
        e?.stopStreaming,
        e?.isWelcomeTile,
        e?.showToAll,
        e?.isAdminOnly,
        e?.showDate,
        e?.weekNo,
        e?.triggerWeekly,
        e?.companyDocId,
        e?.tileToday,
        e?.processed,
        e?.dailyActivities,
        e?.whyChosen,
        e?.showUsersDate
      ]);

  @override
  bool isValidKey(Object? o) => o is Tilesv2Record;
}
