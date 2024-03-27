// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TileNavStruct extends FFFirebaseStruct {
  TileNavStruct({
    String? tier0Id,
    String? tier1Id,
    String? tier2Id,
    String? tier3Id,
    String? tier4Id,
    List<String>? userData,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tier0Id = tier0Id,
        _tier1Id = tier1Id,
        _tier2Id = tier2Id,
        _tier3Id = tier3Id,
        _tier4Id = tier4Id,
        _userData = userData,
        super(firestoreUtilData);

  // "tier0_id" field.
  String? _tier0Id;
  String get tier0Id => _tier0Id ?? '';
  set tier0Id(String? val) => _tier0Id = val;
  bool hasTier0Id() => _tier0Id != null;

  // "tier1_id" field.
  String? _tier1Id;
  String get tier1Id => _tier1Id ?? '';
  set tier1Id(String? val) => _tier1Id = val;
  bool hasTier1Id() => _tier1Id != null;

  // "tier2_id" field.
  String? _tier2Id;
  String get tier2Id => _tier2Id ?? '';
  set tier2Id(String? val) => _tier2Id = val;
  bool hasTier2Id() => _tier2Id != null;

  // "tier3_id" field.
  String? _tier3Id;
  String get tier3Id => _tier3Id ?? '';
  set tier3Id(String? val) => _tier3Id = val;
  bool hasTier3Id() => _tier3Id != null;

  // "tier4_id" field.
  String? _tier4Id;
  String get tier4Id => _tier4Id ?? '';
  set tier4Id(String? val) => _tier4Id = val;
  bool hasTier4Id() => _tier4Id != null;

  // "userData" field.
  List<String>? _userData;
  List<String> get userData => _userData ?? const [];
  set userData(List<String>? val) => _userData = val;
  void updateUserData(Function(List<String>) updateFn) =>
      updateFn(_userData ??= []);
  bool hasUserData() => _userData != null;

  static TileNavStruct fromMap(Map<String, dynamic> data) => TileNavStruct(
        tier0Id: data['tier0_id'] as String?,
        tier1Id: data['tier1_id'] as String?,
        tier2Id: data['tier2_id'] as String?,
        tier3Id: data['tier3_id'] as String?,
        tier4Id: data['tier4_id'] as String?,
        userData: getDataList(data['userData']),
      );

  static TileNavStruct? maybeFromMap(dynamic data) =>
      data is Map ? TileNavStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'tier0_id': _tier0Id,
        'tier1_id': _tier1Id,
        'tier2_id': _tier2Id,
        'tier3_id': _tier3Id,
        'tier4_id': _tier4Id,
        'userData': _userData,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tier0_id': serializeParam(
          _tier0Id,
          ParamType.String,
        ),
        'tier1_id': serializeParam(
          _tier1Id,
          ParamType.String,
        ),
        'tier2_id': serializeParam(
          _tier2Id,
          ParamType.String,
        ),
        'tier3_id': serializeParam(
          _tier3Id,
          ParamType.String,
        ),
        'tier4_id': serializeParam(
          _tier4Id,
          ParamType.String,
        ),
        'userData': serializeParam(
          _userData,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static TileNavStruct fromSerializableMap(Map<String, dynamic> data) =>
      TileNavStruct(
        tier0Id: deserializeParam(
          data['tier0_id'],
          ParamType.String,
          false,
        ),
        tier1Id: deserializeParam(
          data['tier1_id'],
          ParamType.String,
          false,
        ),
        tier2Id: deserializeParam(
          data['tier2_id'],
          ParamType.String,
          false,
        ),
        tier3Id: deserializeParam(
          data['tier3_id'],
          ParamType.String,
          false,
        ),
        tier4Id: deserializeParam(
          data['tier4_id'],
          ParamType.String,
          false,
        ),
        userData: deserializeParam<String>(
          data['userData'],
          ParamType.String,
          true,
        ),
      );

  static TileNavStruct fromAlgoliaData(Map<String, dynamic> data) =>
      TileNavStruct(
        tier0Id: convertAlgoliaParam(
          data['tier0_id'],
          ParamType.String,
          false,
        ),
        tier1Id: convertAlgoliaParam(
          data['tier1_id'],
          ParamType.String,
          false,
        ),
        tier2Id: convertAlgoliaParam(
          data['tier2_id'],
          ParamType.String,
          false,
        ),
        tier3Id: convertAlgoliaParam(
          data['tier3_id'],
          ParamType.String,
          false,
        ),
        tier4Id: convertAlgoliaParam(
          data['tier4_id'],
          ParamType.String,
          false,
        ),
        userData: convertAlgoliaParam<String>(
          data['userData'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'TileNavStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TileNavStruct &&
        tier0Id == other.tier0Id &&
        tier1Id == other.tier1Id &&
        tier2Id == other.tier2Id &&
        tier3Id == other.tier3Id &&
        tier4Id == other.tier4Id &&
        listEquality.equals(userData, other.userData);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([tier0Id, tier1Id, tier2Id, tier3Id, tier4Id, userData]);
}

TileNavStruct createTileNavStruct({
  String? tier0Id,
  String? tier1Id,
  String? tier2Id,
  String? tier3Id,
  String? tier4Id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TileNavStruct(
      tier0Id: tier0Id,
      tier1Id: tier1Id,
      tier2Id: tier2Id,
      tier3Id: tier3Id,
      tier4Id: tier4Id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TileNavStruct? updateTileNavStruct(
  TileNavStruct? tileNav, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tileNav
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTileNavStructData(
  Map<String, dynamic> firestoreData,
  TileNavStruct? tileNav,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tileNav == null) {
    return;
  }
  if (tileNav.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tileNav.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tileNavData = getTileNavFirestoreData(tileNav, forFieldValue);
  final nestedData = tileNavData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tileNav.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTileNavFirestoreData(
  TileNavStruct? tileNav, [
  bool forFieldValue = false,
]) {
  if (tileNav == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tileNav.toMap());

  // Add any Firestore field values
  tileNav.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTileNavListFirestoreData(
  List<TileNavStruct>? tileNavs,
) =>
    tileNavs?.map((e) => getTileNavFirestoreData(e, true)).toList() ?? [];
