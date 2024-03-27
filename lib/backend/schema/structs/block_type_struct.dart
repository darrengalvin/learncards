// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlockTypeStruct extends FFFirebaseStruct {
  BlockTypeStruct({
    String? type,
    List<String>? options,
    String? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _options = options,
        _data = data,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  set options(List<String>? val) => _options = val;
  void updateOptions(Function(List<String>) updateFn) =>
      updateFn(_options ??= []);
  bool hasOptions() => _options != null;

  // "data" field.
  String? _data;
  String get data => _data ?? '';
  set data(String? val) => _data = val;
  bool hasData() => _data != null;

  static BlockTypeStruct fromMap(Map<String, dynamic> data) => BlockTypeStruct(
        type: data['type'] as String?,
        options: getDataList(data['options']),
        data: data['data'] as String?,
      );

  static BlockTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? BlockTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'options': _options,
        'data': _data,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'options': serializeParam(
          _options,
          ParamType.String,
          true,
        ),
        'data': serializeParam(
          _data,
          ParamType.String,
        ),
      }.withoutNulls;

  static BlockTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      BlockTypeStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        options: deserializeParam<String>(
          data['options'],
          ParamType.String,
          true,
        ),
        data: deserializeParam(
          data['data'],
          ParamType.String,
          false,
        ),
      );

  static BlockTypeStruct fromAlgoliaData(Map<String, dynamic> data) =>
      BlockTypeStruct(
        type: convertAlgoliaParam(
          data['type'],
          ParamType.String,
          false,
        ),
        options: convertAlgoliaParam<String>(
          data['options'],
          ParamType.String,
          true,
        ),
        data: convertAlgoliaParam(
          data['data'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'BlockTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BlockTypeStruct &&
        type == other.type &&
        listEquality.equals(options, other.options) &&
        data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([type, options, data]);
}

BlockTypeStruct createBlockTypeStruct({
  String? type,
  String? data,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BlockTypeStruct(
      type: type,
      data: data,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BlockTypeStruct? updateBlockTypeStruct(
  BlockTypeStruct? blockType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    blockType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBlockTypeStructData(
  Map<String, dynamic> firestoreData,
  BlockTypeStruct? blockType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (blockType == null) {
    return;
  }
  if (blockType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && blockType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final blockTypeData = getBlockTypeFirestoreData(blockType, forFieldValue);
  final nestedData = blockTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = blockType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBlockTypeFirestoreData(
  BlockTypeStruct? blockType, [
  bool forFieldValue = false,
]) {
  if (blockType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(blockType.toMap());

  // Add any Firestore field values
  blockType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBlockTypeListFirestoreData(
  List<BlockTypeStruct>? blockTypes,
) =>
    blockTypes?.map((e) => getBlockTypeFirestoreData(e, true)).toList() ?? [];
