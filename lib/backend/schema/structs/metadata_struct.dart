// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MetadataStruct extends FFFirebaseStruct {
  MetadataStruct({
    String? tileId,
    String? blockId,
    String? blockName,
    String? blockType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tileId = tileId,
        _blockId = blockId,
        _blockName = blockName,
        _blockType = blockType,
        super(firestoreUtilData);

  // "tile_id" field.
  String? _tileId;
  String get tileId => _tileId ?? '';
  set tileId(String? val) => _tileId = val;
  bool hasTileId() => _tileId != null;

  // "block_id" field.
  String? _blockId;
  String get blockId => _blockId ?? '';
  set blockId(String? val) => _blockId = val;
  bool hasBlockId() => _blockId != null;

  // "block_name" field.
  String? _blockName;
  String get blockName => _blockName ?? '';
  set blockName(String? val) => _blockName = val;
  bool hasBlockName() => _blockName != null;

  // "block_type" field.
  String? _blockType;
  String get blockType => _blockType ?? '';
  set blockType(String? val) => _blockType = val;
  bool hasBlockType() => _blockType != null;

  static MetadataStruct fromMap(Map<String, dynamic> data) => MetadataStruct(
        tileId: data['tile_id'] as String?,
        blockId: data['block_id'] as String?,
        blockName: data['block_name'] as String?,
        blockType: data['block_type'] as String?,
      );

  static MetadataStruct? maybeFromMap(dynamic data) =>
      data is Map ? MetadataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'tile_id': _tileId,
        'block_id': _blockId,
        'block_name': _blockName,
        'block_type': _blockType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tile_id': serializeParam(
          _tileId,
          ParamType.String,
        ),
        'block_id': serializeParam(
          _blockId,
          ParamType.String,
        ),
        'block_name': serializeParam(
          _blockName,
          ParamType.String,
        ),
        'block_type': serializeParam(
          _blockType,
          ParamType.String,
        ),
      }.withoutNulls;

  static MetadataStruct fromSerializableMap(Map<String, dynamic> data) =>
      MetadataStruct(
        tileId: deserializeParam(
          data['tile_id'],
          ParamType.String,
          false,
        ),
        blockId: deserializeParam(
          data['block_id'],
          ParamType.String,
          false,
        ),
        blockName: deserializeParam(
          data['block_name'],
          ParamType.String,
          false,
        ),
        blockType: deserializeParam(
          data['block_type'],
          ParamType.String,
          false,
        ),
      );

  static MetadataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      MetadataStruct(
        tileId: convertAlgoliaParam(
          data['tile_id'],
          ParamType.String,
          false,
        ),
        blockId: convertAlgoliaParam(
          data['block_id'],
          ParamType.String,
          false,
        ),
        blockName: convertAlgoliaParam(
          data['block_name'],
          ParamType.String,
          false,
        ),
        blockType: convertAlgoliaParam(
          data['block_type'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'MetadataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MetadataStruct &&
        tileId == other.tileId &&
        blockId == other.blockId &&
        blockName == other.blockName &&
        blockType == other.blockType;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([tileId, blockId, blockName, blockType]);
}

MetadataStruct createMetadataStruct({
  String? tileId,
  String? blockId,
  String? blockName,
  String? blockType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MetadataStruct(
      tileId: tileId,
      blockId: blockId,
      blockName: blockName,
      blockType: blockType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MetadataStruct? updateMetadataStruct(
  MetadataStruct? metadata, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    metadata
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMetadataStructData(
  Map<String, dynamic> firestoreData,
  MetadataStruct? metadata,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (metadata == null) {
    return;
  }
  if (metadata.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && metadata.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final metadataData = getMetadataFirestoreData(metadata, forFieldValue);
  final nestedData = metadataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = metadata.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMetadataFirestoreData(
  MetadataStruct? metadata, [
  bool forFieldValue = false,
]) {
  if (metadata == null) {
    return {};
  }
  final firestoreData = mapToFirestore(metadata.toMap());

  // Add any Firestore field values
  metadata.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMetadataListFirestoreData(
  List<MetadataStruct>? metadatas,
) =>
    metadatas?.map((e) => getMetadataFirestoreData(e, true)).toList() ?? [];
