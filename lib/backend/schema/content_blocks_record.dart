import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContentBlocksRecord extends FirestoreRecord {
  ContentBlocksRecord._(
    super.reference,
    super.data,
  ) {
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

  // "block_id" field.
  String? _blockId;
  String get blockId => _blockId ?? '';
  bool hasBlockId() => _blockId != null;

  // "block_type" field.
  String? _blockType;
  String get blockType => _blockType ?? '';
  bool hasBlockType() => _blockType != null;

  // "isPublished" field.
  bool? _isPublished;
  bool get isPublished => _isPublished ?? false;
  bool hasIsPublished() => _isPublished != null;

  // "isHidden" field.
  bool? _isHidden;
  bool get isHidden => _isHidden ?? false;
  bool hasIsHidden() => _isHidden != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "videos" field.
  List<String>? _videos;
  List<String> get videos => _videos ?? const [];
  bool hasVideos() => _videos != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "textList" field.
  List<String>? _textList;
  List<String> get textList => _textList ?? const [];
  bool hasTextList() => _textList != null;

  // "links" field.
  List<String>? _links;
  List<String> get links => _links ?? const [];
  bool hasLinks() => _links != null;

  // "link_type" field.
  String? _linkType;
  String get linkType => _linkType ?? '';
  bool hasLinkType() => _linkType != null;

  // "textType" field.
  String? _textType;
  String get textType => _textType ?? '';
  bool hasTextType() => _textType != null;

  // "image_type" field.
  String? _imageType;
  String get imageType => _imageType ?? '';
  bool hasImageType() => _imageType != null;

  // "video_type" field.
  String? _videoType;
  String get videoType => _videoType ?? '';
  bool hasVideoType() => _videoType != null;

  // "textList_type" field.
  String? _textListType;
  String get textListType => _textListType ?? '';
  bool hasTextListType() => _textListType != null;

  // "access_users" field.
  List<String>? _accessUsers;
  List<String> get accessUsers => _accessUsers ?? const [];
  bool hasAccessUsers() => _accessUsers != null;

  // "access_groups" field.
  List<String>? _accessGroups;
  List<String> get accessGroups => _accessGroups ?? const [];
  bool hasAccessGroups() => _accessGroups != null;

  // "edit_users" field.
  List<String>? _editUsers;
  List<String> get editUsers => _editUsers ?? const [];
  bool hasEditUsers() => _editUsers != null;

  // "edit_groups" field.
  List<String>? _editGroups;
  List<String> get editGroups => _editGroups ?? const [];
  bool hasEditGroups() => _editGroups != null;

  // "create_users" field.
  List<String>? _createUsers;
  List<String> get createUsers => _createUsers ?? const [];
  bool hasCreateUsers() => _createUsers != null;

  // "create_groups" field.
  List<String>? _createGroups;
  List<String> get createGroups => _createGroups ?? const [];
  bool hasCreateGroups() => _createGroups != null;

  // "delete_users" field.
  List<String>? _deleteUsers;
  List<String> get deleteUsers => _deleteUsers ?? const [];
  bool hasDeleteUsers() => _deleteUsers != null;

  // "delete_groups" field.
  List<String>? _deleteGroups;
  List<String> get deleteGroups => _deleteGroups ?? const [];
  bool hasDeleteGroups() => _deleteGroups != null;

  // "isPurchase" field.
  bool? _isPurchase;
  bool get isPurchase => _isPurchase ?? false;
  bool hasIsPurchase() => _isPurchase != null;

  // "purchasePrice" field.
  int? _purchasePrice;
  int get purchasePrice => _purchasePrice ?? 0;
  bool hasPurchasePrice() => _purchasePrice != null;

  // "purchaseGroups" field.
  List<String>? _purchaseGroups;
  List<String> get purchaseGroups => _purchaseGroups ?? const [];
  bool hasPurchaseGroups() => _purchaseGroups != null;

  // "block_index" field.
  int? _blockIndex;
  int get blockIndex => _blockIndex ?? 0;
  bool hasBlockIndex() => _blockIndex != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _uid = snapshotData['uid'] as String?;
    _blockId = snapshotData['block_id'] as String?;
    _blockType = snapshotData['block_type'] as String?;
    _isPublished = snapshotData['isPublished'] as bool?;
    _isHidden = snapshotData['isHidden'] as bool?;
    _tags = getDataList(snapshotData['tags']);
    _images = getDataList(snapshotData['images']);
    _videos = getDataList(snapshotData['videos']);
    _text = snapshotData['text'] as String?;
    _textList = getDataList(snapshotData['textList']);
    _links = getDataList(snapshotData['links']);
    _linkType = snapshotData['link_type'] as String?;
    _textType = snapshotData['textType'] as String?;
    _imageType = snapshotData['image_type'] as String?;
    _videoType = snapshotData['video_type'] as String?;
    _textListType = snapshotData['textList_type'] as String?;
    _accessUsers = getDataList(snapshotData['access_users']);
    _accessGroups = getDataList(snapshotData['access_groups']);
    _editUsers = getDataList(snapshotData['edit_users']);
    _editGroups = getDataList(snapshotData['edit_groups']);
    _createUsers = getDataList(snapshotData['create_users']);
    _createGroups = getDataList(snapshotData['create_groups']);
    _deleteUsers = getDataList(snapshotData['delete_users']);
    _deleteGroups = getDataList(snapshotData['delete_groups']);
    _isPurchase = snapshotData['isPurchase'] as bool?;
    _purchasePrice = castToType<int>(snapshotData['purchasePrice']);
    _purchaseGroups = getDataList(snapshotData['purchaseGroups']);
    _blockIndex = castToType<int>(snapshotData['block_index']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('content_blocks')
          : FirebaseFirestore.instance.collectionGroup('content_blocks');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('content_blocks').doc(id);

  static Stream<ContentBlocksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContentBlocksRecord.fromSnapshot(s));

  static Future<ContentBlocksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContentBlocksRecord.fromSnapshot(s));

  static ContentBlocksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContentBlocksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContentBlocksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContentBlocksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContentBlocksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContentBlocksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContentBlocksRecordData({
  DateTime? createdTime,
  DateTime? updatedTime,
  DocumentReference? user,
  String? uid,
  String? blockId,
  String? blockType,
  bool? isPublished,
  bool? isHidden,
  String? text,
  String? linkType,
  String? textType,
  String? imageType,
  String? videoType,
  String? textListType,
  bool? isPurchase,
  int? purchasePrice,
  int? blockIndex,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'updated_time': updatedTime,
      'user': user,
      'uid': uid,
      'block_id': blockId,
      'block_type': blockType,
      'isPublished': isPublished,
      'isHidden': isHidden,
      'text': text,
      'link_type': linkType,
      'textType': textType,
      'image_type': imageType,
      'video_type': videoType,
      'textList_type': textListType,
      'isPurchase': isPurchase,
      'purchasePrice': purchasePrice,
      'block_index': blockIndex,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContentBlocksRecordDocumentEquality
    implements Equality<ContentBlocksRecord> {
  const ContentBlocksRecordDocumentEquality();

  @override
  bool equals(ContentBlocksRecord? e1, ContentBlocksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.user == e2?.user &&
        e1?.uid == e2?.uid &&
        e1?.blockId == e2?.blockId &&
        e1?.blockType == e2?.blockType &&
        e1?.isPublished == e2?.isPublished &&
        e1?.isHidden == e2?.isHidden &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        listEquality.equals(e1?.images, e2?.images) &&
        listEquality.equals(e1?.videos, e2?.videos) &&
        e1?.text == e2?.text &&
        listEquality.equals(e1?.textList, e2?.textList) &&
        listEquality.equals(e1?.links, e2?.links) &&
        e1?.linkType == e2?.linkType &&
        e1?.textType == e2?.textType &&
        e1?.imageType == e2?.imageType &&
        e1?.videoType == e2?.videoType &&
        e1?.textListType == e2?.textListType &&
        listEquality.equals(e1?.accessUsers, e2?.accessUsers) &&
        listEquality.equals(e1?.accessGroups, e2?.accessGroups) &&
        listEquality.equals(e1?.editUsers, e2?.editUsers) &&
        listEquality.equals(e1?.editGroups, e2?.editGroups) &&
        listEquality.equals(e1?.createUsers, e2?.createUsers) &&
        listEquality.equals(e1?.createGroups, e2?.createGroups) &&
        listEquality.equals(e1?.deleteUsers, e2?.deleteUsers) &&
        listEquality.equals(e1?.deleteGroups, e2?.deleteGroups) &&
        e1?.isPurchase == e2?.isPurchase &&
        e1?.purchasePrice == e2?.purchasePrice &&
        listEquality.equals(e1?.purchaseGroups, e2?.purchaseGroups) &&
        e1?.blockIndex == e2?.blockIndex;
  }

  @override
  int hash(ContentBlocksRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.updatedTime,
        e?.user,
        e?.uid,
        e?.blockId,
        e?.blockType,
        e?.isPublished,
        e?.isHidden,
        e?.tags,
        e?.images,
        e?.videos,
        e?.text,
        e?.textList,
        e?.links,
        e?.linkType,
        e?.textType,
        e?.imageType,
        e?.videoType,
        e?.textListType,
        e?.accessUsers,
        e?.accessGroups,
        e?.editUsers,
        e?.editGroups,
        e?.createUsers,
        e?.createGroups,
        e?.deleteUsers,
        e?.deleteGroups,
        e?.isPurchase,
        e?.purchasePrice,
        e?.purchaseGroups,
        e?.blockIndex
      ]);

  @override
  bool isValidKey(Object? o) => o is ContentBlocksRecord;
}
