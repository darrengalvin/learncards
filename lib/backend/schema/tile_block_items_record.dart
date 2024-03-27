import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TileBlockItemsRecord extends FirestoreRecord {
  TileBlockItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "positionId" field.
  int? _positionId;
  int get positionId => _positionId ?? 0;
  bool hasPositionId() => _positionId != null;

  // "blockId" field.
  String? _blockId;
  String get blockId => _blockId ?? '';
  bool hasBlockId() => _blockId != null;

  // "blockItemValue" field.
  BlockItemValueStruct? _blockItemValue;
  BlockItemValueStruct get blockItemValue =>
      _blockItemValue ?? BlockItemValueStruct();
  bool hasBlockItemValue() => _blockItemValue != null;

  // "theText" field.
  TextSettingsStruct? _theText;
  TextSettingsStruct get theText => _theText ?? TextSettingsStruct();
  bool hasTheText() => _theText != null;

  // "paddingBetween" field.
  int? _paddingBetween;
  int get paddingBetween => _paddingBetween ?? 0;
  bool hasPaddingBetween() => _paddingBetween != null;

  // "theImage" field.
  ImageSettingsStruct? _theImage;
  ImageSettingsStruct get theImage => _theImage ?? ImageSettingsStruct();
  bool hasTheImage() => _theImage != null;

  // "theVideo" field.
  VideoSettingsStruct? _theVideo;
  VideoSettingsStruct get theVideo => _theVideo ?? VideoSettingsStruct();
  bool hasTheVideo() => _theVideo != null;

  // "theHtml" field.
  String? _theHtml;
  String get theHtml => _theHtml ?? '';
  bool hasTheHtml() => _theHtml != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _positionId = castToType<int>(snapshotData['positionId']);
    _blockId = snapshotData['blockId'] as String?;
    _blockItemValue =
        BlockItemValueStruct.maybeFromMap(snapshotData['blockItemValue']);
    _theText = TextSettingsStruct.maybeFromMap(snapshotData['theText']);
    _paddingBetween = castToType<int>(snapshotData['paddingBetween']);
    _theImage = ImageSettingsStruct.maybeFromMap(snapshotData['theImage']);
    _theVideo = VideoSettingsStruct.maybeFromMap(snapshotData['theVideo']);
    _theHtml = snapshotData['theHtml'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TileBlockItems');

  static Stream<TileBlockItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TileBlockItemsRecord.fromSnapshot(s));

  static Future<TileBlockItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TileBlockItemsRecord.fromSnapshot(s));

  static TileBlockItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TileBlockItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TileBlockItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TileBlockItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TileBlockItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TileBlockItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTileBlockItemsRecordData({
  String? type,
  int? positionId,
  String? blockId,
  BlockItemValueStruct? blockItemValue,
  TextSettingsStruct? theText,
  int? paddingBetween,
  ImageSettingsStruct? theImage,
  VideoSettingsStruct? theVideo,
  String? theHtml,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'positionId': positionId,
      'blockId': blockId,
      'blockItemValue': BlockItemValueStruct().toMap(),
      'theText': TextSettingsStruct().toMap(),
      'paddingBetween': paddingBetween,
      'theImage': ImageSettingsStruct().toMap(),
      'theVideo': VideoSettingsStruct().toMap(),
      'theHtml': theHtml,
    }.withoutNulls,
  );

  // Handle nested data for "blockItemValue" field.
  addBlockItemValueStructData(firestoreData, blockItemValue, 'blockItemValue');

  // Handle nested data for "theText" field.
  addTextSettingsStructData(firestoreData, theText, 'theText');

  // Handle nested data for "theImage" field.
  addImageSettingsStructData(firestoreData, theImage, 'theImage');

  // Handle nested data for "theVideo" field.
  addVideoSettingsStructData(firestoreData, theVideo, 'theVideo');

  return firestoreData;
}

class TileBlockItemsRecordDocumentEquality
    implements Equality<TileBlockItemsRecord> {
  const TileBlockItemsRecordDocumentEquality();

  @override
  bool equals(TileBlockItemsRecord? e1, TileBlockItemsRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.positionId == e2?.positionId &&
        e1?.blockId == e2?.blockId &&
        e1?.blockItemValue == e2?.blockItemValue &&
        e1?.theText == e2?.theText &&
        e1?.paddingBetween == e2?.paddingBetween &&
        e1?.theImage == e2?.theImage &&
        e1?.theVideo == e2?.theVideo &&
        e1?.theHtml == e2?.theHtml;
  }

  @override
  int hash(TileBlockItemsRecord? e) => const ListEquality().hash([
        e?.type,
        e?.positionId,
        e?.blockId,
        e?.blockItemValue,
        e?.theText,
        e?.paddingBetween,
        e?.theImage,
        e?.theVideo,
        e?.theHtml
      ]);

  @override
  bool isValidKey(Object? o) => o is TileBlockItemsRecord;
}
