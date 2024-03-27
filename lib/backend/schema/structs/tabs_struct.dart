// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TabsStruct extends FFFirebaseStruct {
  TabsStruct({
    String? location,
    String? name,
    int? position,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _location = location,
        _name = name,
        _position = position,
        super(firestoreUtilData);

  // "location" field.
  String? _location;
  String get location => _location ?? 'aiMenu';
  set location(String? val) => _location = val;
  bool hasLocation() => _location != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '1';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "position" field.
  int? _position;
  int get position => _position ?? 1;
  set position(int? val) => _position = val;
  void incrementPosition(int amount) => _position = position + amount;
  bool hasPosition() => _position != null;

  static TabsStruct fromMap(Map<String, dynamic> data) => TabsStruct(
        location: data['location'] as String?,
        name: data['name'] as String?,
        position: castToType<int>(data['position']),
      );

  static TabsStruct? maybeFromMap(dynamic data) =>
      data is Map ? TabsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'location': _location,
        'name': _name,
        'position': _position,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'position': serializeParam(
          _position,
          ParamType.int,
        ),
      }.withoutNulls;

  static TabsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TabsStruct(
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        position: deserializeParam(
          data['position'],
          ParamType.int,
          false,
        ),
      );

  static TabsStruct fromAlgoliaData(Map<String, dynamic> data) => TabsStruct(
        location: convertAlgoliaParam(
          data['location'],
          ParamType.String,
          false,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        position: convertAlgoliaParam(
          data['position'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'TabsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TabsStruct &&
        location == other.location &&
        name == other.name &&
        position == other.position;
  }

  @override
  int get hashCode => const ListEquality().hash([location, name, position]);
}

TabsStruct createTabsStruct({
  String? location,
  String? name,
  int? position,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TabsStruct(
      location: location,
      name: name,
      position: position,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TabsStruct? updateTabsStruct(
  TabsStruct? tabs, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tabs
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTabsStructData(
  Map<String, dynamic> firestoreData,
  TabsStruct? tabs,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tabs == null) {
    return;
  }
  if (tabs.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && tabs.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tabsData = getTabsFirestoreData(tabs, forFieldValue);
  final nestedData = tabsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tabs.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTabsFirestoreData(
  TabsStruct? tabs, [
  bool forFieldValue = false,
]) {
  if (tabs == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tabs.toMap());

  // Add any Firestore field values
  tabs.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTabsListFirestoreData(
  List<TabsStruct>? tabss,
) =>
    tabss?.map((e) => getTabsFirestoreData(e, true)).toList() ?? [];
