import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TileBlocksRecord extends FirestoreRecord {
  TileBlocksRecord._(
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

  // "block_index" field.
  int? _blockIndex;
  int get blockIndex => _blockIndex ?? 0;
  bool hasBlockIndex() => _blockIndex != null;

  // "block_name" field.
  String? _blockName;
  String get blockName => _blockName ?? '';
  bool hasBlockName() => _blockName != null;

  // "block_status" field.
  String? _blockStatus;
  String get blockStatus => _blockStatus ?? '';
  bool hasBlockStatus() => _blockStatus != null;

  // "tile_id" field.
  String? _tileId;
  String get tileId => _tileId ?? '';
  bool hasTileId() => _tileId != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "thumbnail" field.
  String? _thumbnail;
  String get thumbnail => _thumbnail ?? '';
  bool hasThumbnail() => _thumbnail != null;

  // "isDefaultTheme" field.
  bool? _isDefaultTheme;
  bool get isDefaultTheme => _isDefaultTheme ?? false;
  bool hasIsDefaultTheme() => _isDefaultTheme != null;

  // "block_layout" field.
  String? _blockLayout;
  String get blockLayout => _blockLayout ?? '';
  bool hasBlockLayout() => _blockLayout != null;

  // "block_title" field.
  String? _blockTitle;
  String get blockTitle => _blockTitle ?? '';
  bool hasBlockTitle() => _blockTitle != null;

  // "block_subtitle" field.
  String? _blockSubtitle;
  String get blockSubtitle => _blockSubtitle ?? '';
  bool hasBlockSubtitle() => _blockSubtitle != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "audio_gallery" field.
  List<String>? _audioGallery;
  List<String> get audioGallery => _audioGallery ?? const [];
  bool hasAudioGallery() => _audioGallery != null;

  // "video_gallery" field.
  List<String>? _videoGallery;
  List<String> get videoGallery => _videoGallery ?? const [];
  bool hasVideoGallery() => _videoGallery != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "textList" field.
  List<String>? _textList;
  List<String> get textList => _textList ?? const [];
  bool hasTextList() => _textList != null;

  // "image_gallery" field.
  List<String>? _imageGallery;
  List<String> get imageGallery => _imageGallery ?? const [];
  bool hasImageGallery() => _imageGallery != null;

  // "header" field.
  String? _header;
  String get header => _header ?? '';
  bool hasHeader() => _header != null;

  // "subtitle" field.
  String? _subtitle;
  String get subtitle => _subtitle ?? '';
  bool hasSubtitle() => _subtitle != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "fontSettings" field.
  FontSettingsStruct? _fontSettings;
  FontSettingsStruct get fontSettings => _fontSettings ?? FontSettingsStruct();
  bool hasFontSettings() => _fontSettings != null;

  // "imageW" field.
  int? _imageW;
  int get imageW => _imageW ?? 0;
  bool hasImageW() => _imageW != null;

  // "imageH" field.
  int? _imageH;
  int get imageH => _imageH ?? 0;
  bool hasImageH() => _imageH != null;

  // "documents" field.
  DocumentsStruct? _documents;
  DocumentsStruct get documents => _documents ?? DocumentsStruct();
  bool hasDocuments() => _documents != null;

  // "htmlContent" field.
  String? _htmlContent;
  String get htmlContent => _htmlContent ?? '';
  bool hasHtmlContent() => _htmlContent != null;

  // "OriginalTileName" field.
  String? _originalTileName;
  String get originalTileName => _originalTileName ?? '';
  bool hasOriginalTileName() => _originalTileName != null;

  // "toDoNextSuggestions" field.
  List<String>? _toDoNextSuggestions;
  List<String> get toDoNextSuggestions => _toDoNextSuggestions ?? const [];
  bool hasToDoNextSuggestions() => _toDoNextSuggestions != null;

  // "aiBlock" field.
  bool? _aiBlock;
  bool get aiBlock => _aiBlock ?? false;
  bool hasAiBlock() => _aiBlock != null;

  // "learningActivityIds" field.
  List<String>? _learningActivityIds;
  List<String> get learningActivityIds => _learningActivityIds ?? const [];
  bool hasLearningActivityIds() => _learningActivityIds != null;

  // "activityType" field.
  String? _activityType;
  String get activityType => _activityType ?? '';
  bool hasActivityType() => _activityType != null;

  // "sessionId" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  bool hasSessionId() => _sessionId != null;

  // "topic" field.
  String? _topic;
  String get topic => _topic ?? '';
  bool hasTopic() => _topic != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "awaitingContent" field.
  bool? _awaitingContent;
  bool get awaitingContent => _awaitingContent ?? false;
  bool hasAwaitingContent() => _awaitingContent != null;

  // "processed" field.
  bool? _processed;
  bool get processed => _processed ?? false;
  bool hasProcessed() => _processed != null;

  // "stopStreaming" field.
  bool? _stopStreaming;
  bool get stopStreaming => _stopStreaming ?? false;
  bool hasStopStreaming() => _stopStreaming != null;

  // "blockVideo" field.
  VideoStruct? _blockVideo;
  VideoStruct get blockVideo => _blockVideo ?? VideoStruct();
  bool hasBlockVideo() => _blockVideo != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _uid = snapshotData['uid'] as String?;
    _blockId = snapshotData['block_id'] as String?;
    _blockType = snapshotData['block_type'] as String?;
    _blockIndex = castToType<int>(snapshotData['block_index']);
    _blockName = snapshotData['block_name'] as String?;
    _blockStatus = snapshotData['block_status'] as String?;
    _tileId = snapshotData['tile_id'] as String?;
    _image = snapshotData['image'] as String?;
    _thumbnail = snapshotData['thumbnail'] as String?;
    _isDefaultTheme = snapshotData['isDefaultTheme'] as bool?;
    _blockLayout = snapshotData['block_layout'] as String?;
    _blockTitle = snapshotData['block_title'] as String?;
    _blockSubtitle = snapshotData['block_subtitle'] as String?;
    _video = snapshotData['video'] as String?;
    _audio = snapshotData['audio'] as String?;
    _audioGallery = getDataList(snapshotData['audio_gallery']);
    _videoGallery = getDataList(snapshotData['video_gallery']);
    _text = snapshotData['text'] as String?;
    _textList = getDataList(snapshotData['textList']);
    _imageGallery = getDataList(snapshotData['image_gallery']);
    _header = snapshotData['header'] as String?;
    _subtitle = snapshotData['subtitle'] as String?;
    _title = snapshotData['title'] as String?;
    _fontSettings =
        FontSettingsStruct.maybeFromMap(snapshotData['fontSettings']);
    _imageW = castToType<int>(snapshotData['imageW']);
    _imageH = castToType<int>(snapshotData['imageH']);
    _documents = DocumentsStruct.maybeFromMap(snapshotData['documents']);
    _htmlContent = snapshotData['htmlContent'] as String?;
    _originalTileName = snapshotData['OriginalTileName'] as String?;
    _toDoNextSuggestions = getDataList(snapshotData['toDoNextSuggestions']);
    _aiBlock = snapshotData['aiBlock'] as bool?;
    _learningActivityIds = getDataList(snapshotData['learningActivityIds']);
    _activityType = snapshotData['activityType'] as String?;
    _sessionId = snapshotData['sessionId'] as String?;
    _topic = snapshotData['topic'] as String?;
    _subject = snapshotData['subject'] as String?;
    _awaitingContent = snapshotData['awaitingContent'] as bool?;
    _processed = snapshotData['processed'] as bool?;
    _stopStreaming = snapshotData['stopStreaming'] as bool?;
    _blockVideo = VideoStruct.maybeFromMap(snapshotData['blockVideo']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tile_blocks');

  static Stream<TileBlocksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TileBlocksRecord.fromSnapshot(s));

  static Future<TileBlocksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TileBlocksRecord.fromSnapshot(s));

  static TileBlocksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TileBlocksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TileBlocksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TileBlocksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TileBlocksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TileBlocksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTileBlocksRecordData({
  DateTime? createdTime,
  DateTime? updatedTime,
  DocumentReference? user,
  String? uid,
  String? blockId,
  String? blockType,
  int? blockIndex,
  String? blockName,
  String? blockStatus,
  String? tileId,
  String? image,
  String? thumbnail,
  bool? isDefaultTheme,
  String? blockLayout,
  String? blockTitle,
  String? blockSubtitle,
  String? video,
  String? audio,
  String? text,
  String? header,
  String? subtitle,
  String? title,
  FontSettingsStruct? fontSettings,
  int? imageW,
  int? imageH,
  DocumentsStruct? documents,
  String? htmlContent,
  String? originalTileName,
  bool? aiBlock,
  String? activityType,
  String? sessionId,
  String? topic,
  String? subject,
  bool? awaitingContent,
  bool? processed,
  bool? stopStreaming,
  VideoStruct? blockVideo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'updated_time': updatedTime,
      'user': user,
      'uid': uid,
      'block_id': blockId,
      'block_type': blockType,
      'block_index': blockIndex,
      'block_name': blockName,
      'block_status': blockStatus,
      'tile_id': tileId,
      'image': image,
      'thumbnail': thumbnail,
      'isDefaultTheme': isDefaultTheme,
      'block_layout': blockLayout,
      'block_title': blockTitle,
      'block_subtitle': blockSubtitle,
      'video': video,
      'audio': audio,
      'text': text,
      'header': header,
      'subtitle': subtitle,
      'title': title,
      'fontSettings': FontSettingsStruct().toMap(),
      'imageW': imageW,
      'imageH': imageH,
      'documents': DocumentsStruct().toMap(),
      'htmlContent': htmlContent,
      'OriginalTileName': originalTileName,
      'aiBlock': aiBlock,
      'activityType': activityType,
      'sessionId': sessionId,
      'topic': topic,
      'subject': subject,
      'awaitingContent': awaitingContent,
      'processed': processed,
      'stopStreaming': stopStreaming,
      'blockVideo': VideoStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "fontSettings" field.
  addFontSettingsStructData(firestoreData, fontSettings, 'fontSettings');

  // Handle nested data for "documents" field.
  addDocumentsStructData(firestoreData, documents, 'documents');

  // Handle nested data for "blockVideo" field.
  addVideoStructData(firestoreData, blockVideo, 'blockVideo');

  return firestoreData;
}

class TileBlocksRecordDocumentEquality implements Equality<TileBlocksRecord> {
  const TileBlocksRecordDocumentEquality();

  @override
  bool equals(TileBlocksRecord? e1, TileBlocksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.user == e2?.user &&
        e1?.uid == e2?.uid &&
        e1?.blockId == e2?.blockId &&
        e1?.blockType == e2?.blockType &&
        e1?.blockIndex == e2?.blockIndex &&
        e1?.blockName == e2?.blockName &&
        e1?.blockStatus == e2?.blockStatus &&
        e1?.tileId == e2?.tileId &&
        e1?.image == e2?.image &&
        e1?.thumbnail == e2?.thumbnail &&
        e1?.isDefaultTheme == e2?.isDefaultTheme &&
        e1?.blockLayout == e2?.blockLayout &&
        e1?.blockTitle == e2?.blockTitle &&
        e1?.blockSubtitle == e2?.blockSubtitle &&
        e1?.video == e2?.video &&
        e1?.audio == e2?.audio &&
        listEquality.equals(e1?.audioGallery, e2?.audioGallery) &&
        listEquality.equals(e1?.videoGallery, e2?.videoGallery) &&
        e1?.text == e2?.text &&
        listEquality.equals(e1?.textList, e2?.textList) &&
        listEquality.equals(e1?.imageGallery, e2?.imageGallery) &&
        e1?.header == e2?.header &&
        e1?.subtitle == e2?.subtitle &&
        e1?.title == e2?.title &&
        e1?.fontSettings == e2?.fontSettings &&
        e1?.imageW == e2?.imageW &&
        e1?.imageH == e2?.imageH &&
        e1?.documents == e2?.documents &&
        e1?.htmlContent == e2?.htmlContent &&
        e1?.originalTileName == e2?.originalTileName &&
        listEquality.equals(e1?.toDoNextSuggestions, e2?.toDoNextSuggestions) &&
        e1?.aiBlock == e2?.aiBlock &&
        listEquality.equals(e1?.learningActivityIds, e2?.learningActivityIds) &&
        e1?.activityType == e2?.activityType &&
        e1?.sessionId == e2?.sessionId &&
        e1?.topic == e2?.topic &&
        e1?.subject == e2?.subject &&
        e1?.awaitingContent == e2?.awaitingContent &&
        e1?.processed == e2?.processed &&
        e1?.stopStreaming == e2?.stopStreaming &&
        e1?.blockVideo == e2?.blockVideo;
  }

  @override
  int hash(TileBlocksRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.updatedTime,
        e?.user,
        e?.uid,
        e?.blockId,
        e?.blockType,
        e?.blockIndex,
        e?.blockName,
        e?.blockStatus,
        e?.tileId,
        e?.image,
        e?.thumbnail,
        e?.isDefaultTheme,
        e?.blockLayout,
        e?.blockTitle,
        e?.blockSubtitle,
        e?.video,
        e?.audio,
        e?.audioGallery,
        e?.videoGallery,
        e?.text,
        e?.textList,
        e?.imageGallery,
        e?.header,
        e?.subtitle,
        e?.title,
        e?.fontSettings,
        e?.imageW,
        e?.imageH,
        e?.documents,
        e?.htmlContent,
        e?.originalTileName,
        e?.toDoNextSuggestions,
        e?.aiBlock,
        e?.learningActivityIds,
        e?.activityType,
        e?.sessionId,
        e?.topic,
        e?.subject,
        e?.awaitingContent,
        e?.processed,
        e?.stopStreaming,
        e?.blockVideo
      ]);

  @override
  bool isValidKey(Object? o) => o is TileBlocksRecord;
}
