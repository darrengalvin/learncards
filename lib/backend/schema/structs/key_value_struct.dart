// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KeyValueStruct extends FFFirebaseStruct {
  KeyValueStruct({
    String? keu,
    String? value,
    List<String>? valueList,
    String? valueType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _keu = keu,
        _value = value,
        _valueList = valueList,
        _valueType = valueType,
        super(firestoreUtilData);

  // "keu" field.
  String? _keu;
  String get keu => _keu ?? '';
  set keu(String? val) => _keu = val;
  bool hasKeu() => _keu != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;
  bool hasValue() => _value != null;

  // "valueList" field.
  List<String>? _valueList;
  List<String> get valueList => _valueList ?? const [];
  set valueList(List<String>? val) => _valueList = val;
  void updateValueList(Function(List<String>) updateFn) =>
      updateFn(_valueList ??= []);
  bool hasValueList() => _valueList != null;

  // "valueType" field.
  String? _valueType;
  String get valueType => _valueType ?? '';
  set valueType(String? val) => _valueType = val;
  bool hasValueType() => _valueType != null;

  static KeyValueStruct fromMap(Map<String, dynamic> data) => KeyValueStruct(
        keu: data['keu'] as String?,
        value: data['value'] as String?,
        valueList: getDataList(data['valueList']),
        valueType: data['valueType'] as String?,
      );

  static KeyValueStruct? maybeFromMap(dynamic data) =>
      data is Map ? KeyValueStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'keu': _keu,
        'value': _value,
        'valueList': _valueList,
        'valueType': _valueType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'keu': serializeParam(
          _keu,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
        'valueList': serializeParam(
          _valueList,
          ParamType.String,
          true,
        ),
        'valueType': serializeParam(
          _valueType,
          ParamType.String,
        ),
      }.withoutNulls;

  static KeyValueStruct fromSerializableMap(Map<String, dynamic> data) =>
      KeyValueStruct(
        keu: deserializeParam(
          data['keu'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
        valueList: deserializeParam<String>(
          data['valueList'],
          ParamType.String,
          true,
        ),
        valueType: deserializeParam(
          data['valueType'],
          ParamType.String,
          false,
        ),
      );

  static KeyValueStruct fromAlgoliaData(Map<String, dynamic> data) =>
      KeyValueStruct(
        keu: convertAlgoliaParam(
          data['keu'],
          ParamType.String,
          false,
        ),
        value: convertAlgoliaParam(
          data['value'],
          ParamType.String,
          false,
        ),
        valueList: convertAlgoliaParam<String>(
          data['valueList'],
          ParamType.String,
          true,
        ),
        valueType: convertAlgoliaParam(
          data['valueType'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'KeyValueStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is KeyValueStruct &&
        keu == other.keu &&
        value == other.value &&
        listEquality.equals(valueList, other.valueList) &&
        valueType == other.valueType;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([keu, value, valueList, valueType]);
}

KeyValueStruct createKeyValueStruct({
  String? keu,
  String? value,
  String? valueType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    KeyValueStruct(
      keu: keu,
      value: value,
      valueType: valueType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

KeyValueStruct? updateKeyValueStruct(
  KeyValueStruct? keyValue, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    keyValue
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addKeyValueStructData(
  Map<String, dynamic> firestoreData,
  KeyValueStruct? keyValue,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (keyValue == null) {
    return;
  }
  if (keyValue.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && keyValue.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final keyValueData = getKeyValueFirestoreData(keyValue, forFieldValue);
  final nestedData = keyValueData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = keyValue.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getKeyValueFirestoreData(
  KeyValueStruct? keyValue, [
  bool forFieldValue = false,
]) {
  if (keyValue == null) {
    return {};
  }
  final firestoreData = mapToFirestore(keyValue.toMap());

  // Add any Firestore field values
  keyValue.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getKeyValueListFirestoreData(
  List<KeyValueStruct>? keyValues,
) =>
    keyValues?.map((e) => getKeyValueFirestoreData(e, true)).toList() ?? [];
