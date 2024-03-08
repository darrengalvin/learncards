// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BlockItemValueStruct extends FFFirebaseStruct {
  BlockItemValueStruct({
    String? textBlock,
    String? video,
    String? image,
    String? document,
    String? anotherTile,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _textBlock = textBlock,
        _video = video,
        _image = image,
        _document = document,
        _anotherTile = anotherTile,
        super(firestoreUtilData);

  // "textBlock" field.
  String? _textBlock;
  String get textBlock => _textBlock ?? '';
  set textBlock(String? val) => _textBlock = val;
  bool hasTextBlock() => _textBlock != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  set video(String? val) => _video = val;
  bool hasVideo() => _video != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "document" field.
  String? _document;
  String get document => _document ?? '';
  set document(String? val) => _document = val;
  bool hasDocument() => _document != null;

  // "anotherTile" field.
  String? _anotherTile;
  String get anotherTile => _anotherTile ?? '';
  set anotherTile(String? val) => _anotherTile = val;
  bool hasAnotherTile() => _anotherTile != null;

  static BlockItemValueStruct fromMap(Map<String, dynamic> data) =>
      BlockItemValueStruct(
        textBlock: data['textBlock'] as String?,
        video: data['video'] as String?,
        image: data['image'] as String?,
        document: data['document'] as String?,
        anotherTile: data['anotherTile'] as String?,
      );

  static BlockItemValueStruct? maybeFromMap(dynamic data) => data is Map
      ? BlockItemValueStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'textBlock': _textBlock,
        'video': _video,
        'image': _image,
        'document': _document,
        'anotherTile': _anotherTile,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'textBlock': serializeParam(
          _textBlock,
          ParamType.String,
        ),
        'video': serializeParam(
          _video,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'document': serializeParam(
          _document,
          ParamType.String,
        ),
        'anotherTile': serializeParam(
          _anotherTile,
          ParamType.String,
        ),
      }.withoutNulls;

  static BlockItemValueStruct fromSerializableMap(Map<String, dynamic> data) =>
      BlockItemValueStruct(
        textBlock: deserializeParam(
          data['textBlock'],
          ParamType.String,
          false,
        ),
        video: deserializeParam(
          data['video'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        document: deserializeParam(
          data['document'],
          ParamType.String,
          false,
        ),
        anotherTile: deserializeParam(
          data['anotherTile'],
          ParamType.String,
          false,
        ),
      );

  static BlockItemValueStruct fromAlgoliaData(Map<String, dynamic> data) =>
      BlockItemValueStruct(
        textBlock: convertAlgoliaParam(
          data['textBlock'],
          ParamType.String,
          false,
        ),
        video: convertAlgoliaParam(
          data['video'],
          ParamType.String,
          false,
        ),
        image: convertAlgoliaParam(
          data['image'],
          ParamType.String,
          false,
        ),
        document: convertAlgoliaParam(
          data['document'],
          ParamType.String,
          false,
        ),
        anotherTile: convertAlgoliaParam(
          data['anotherTile'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'BlockItemValueStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BlockItemValueStruct &&
        textBlock == other.textBlock &&
        video == other.video &&
        image == other.image &&
        document == other.document &&
        anotherTile == other.anotherTile;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([textBlock, video, image, document, anotherTile]);
}

BlockItemValueStruct createBlockItemValueStruct({
  String? textBlock,
  String? video,
  String? image,
  String? document,
  String? anotherTile,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BlockItemValueStruct(
      textBlock: textBlock,
      video: video,
      image: image,
      document: document,
      anotherTile: anotherTile,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BlockItemValueStruct? updateBlockItemValueStruct(
  BlockItemValueStruct? blockItemValue, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    blockItemValue
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBlockItemValueStructData(
  Map<String, dynamic> firestoreData,
  BlockItemValueStruct? blockItemValue,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (blockItemValue == null) {
    return;
  }
  if (blockItemValue.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && blockItemValue.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final blockItemValueData =
      getBlockItemValueFirestoreData(blockItemValue, forFieldValue);
  final nestedData =
      blockItemValueData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = blockItemValue.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBlockItemValueFirestoreData(
  BlockItemValueStruct? blockItemValue, [
  bool forFieldValue = false,
]) {
  if (blockItemValue == null) {
    return {};
  }
  final firestoreData = mapToFirestore(blockItemValue.toMap());

  // Add any Firestore field values
  blockItemValue.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBlockItemValueListFirestoreData(
  List<BlockItemValueStruct>? blockItemValues,
) =>
    blockItemValues
        ?.map((e) => getBlockItemValueFirestoreData(e, true))
        .toList() ??
    [];
