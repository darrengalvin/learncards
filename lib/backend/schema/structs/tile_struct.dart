// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TileStruct extends FFFirebaseStruct {
  TileStruct({
    String? name,
    String? type,
    int? index,
    int? tier,
    List<String>? layours,
    List<String>? groups,
    String? parent,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _type = type,
        _index = index,
        _tier = tier,
        _layours = layours,
        _groups = groups,
        _parent = parent,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;
  void incrementIndex(int amount) => _index = index + amount;
  bool hasIndex() => _index != null;

  // "tier" field.
  int? _tier;
  int get tier => _tier ?? 0;
  set tier(int? val) => _tier = val;
  void incrementTier(int amount) => _tier = tier + amount;
  bool hasTier() => _tier != null;

  // "layours" field.
  List<String>? _layours;
  List<String> get layours => _layours ?? const [];
  set layours(List<String>? val) => _layours = val;
  void updateLayours(Function(List<String>) updateFn) =>
      updateFn(_layours ??= []);
  bool hasLayours() => _layours != null;

  // "groups" field.
  List<String>? _groups;
  List<String> get groups => _groups ?? const [];
  set groups(List<String>? val) => _groups = val;
  void updateGroups(Function(List<String>) updateFn) =>
      updateFn(_groups ??= []);
  bool hasGroups() => _groups != null;

  // "parent" field.
  String? _parent;
  String get parent => _parent ?? '';
  set parent(String? val) => _parent = val;
  bool hasParent() => _parent != null;

  static TileStruct fromMap(Map<String, dynamic> data) => TileStruct(
        name: data['name'] as String?,
        type: data['type'] as String?,
        index: castToType<int>(data['index']),
        tier: castToType<int>(data['tier']),
        layours: getDataList(data['layours']),
        groups: getDataList(data['groups']),
        parent: data['parent'] as String?,
      );

  static TileStruct? maybeFromMap(dynamic data) =>
      data is Map ? TileStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'type': _type,
        'index': _index,
        'tier': _tier,
        'layours': _layours,
        'groups': _groups,
        'parent': _parent,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
        'tier': serializeParam(
          _tier,
          ParamType.int,
        ),
        'layours': serializeParam(
          _layours,
          ParamType.String,
          true,
        ),
        'groups': serializeParam(
          _groups,
          ParamType.String,
          true,
        ),
        'parent': serializeParam(
          _parent,
          ParamType.String,
        ),
      }.withoutNulls;

  static TileStruct fromSerializableMap(Map<String, dynamic> data) =>
      TileStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
        tier: deserializeParam(
          data['tier'],
          ParamType.int,
          false,
        ),
        layours: deserializeParam<String>(
          data['layours'],
          ParamType.String,
          true,
        ),
        groups: deserializeParam<String>(
          data['groups'],
          ParamType.String,
          true,
        ),
        parent: deserializeParam(
          data['parent'],
          ParamType.String,
          false,
        ),
      );

  static TileStruct fromAlgoliaData(Map<String, dynamic> data) => TileStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        type: convertAlgoliaParam(
          data['type'],
          ParamType.String,
          false,
        ),
        index: convertAlgoliaParam(
          data['index'],
          ParamType.int,
          false,
        ),
        tier: convertAlgoliaParam(
          data['tier'],
          ParamType.int,
          false,
        ),
        layours: convertAlgoliaParam<String>(
          data['layours'],
          ParamType.String,
          true,
        ),
        groups: convertAlgoliaParam<String>(
          data['groups'],
          ParamType.String,
          true,
        ),
        parent: convertAlgoliaParam(
          data['parent'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'TileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TileStruct &&
        name == other.name &&
        type == other.type &&
        index == other.index &&
        tier == other.tier &&
        listEquality.equals(layours, other.layours) &&
        listEquality.equals(groups, other.groups) &&
        parent == other.parent;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, type, index, tier, layours, groups, parent]);
}

TileStruct createTileStruct({
  String? name,
  String? type,
  int? index,
  int? tier,
  String? parent,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TileStruct(
      name: name,
      type: type,
      index: index,
      tier: tier,
      parent: parent,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TileStruct? updateTileStruct(
  TileStruct? tile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTileStructData(
  Map<String, dynamic> firestoreData,
  TileStruct? tile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tile == null) {
    return;
  }
  if (tile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && tile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tileData = getTileFirestoreData(tile, forFieldValue);
  final nestedData = tileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTileFirestoreData(
  TileStruct? tile, [
  bool forFieldValue = false,
]) {
  if (tile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tile.toMap());

  // Add any Firestore field values
  tile.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTileListFirestoreData(
  List<TileStruct>? tiles,
) =>
    tiles?.map((e) => getTileFirestoreData(e, true)).toList() ?? [];
