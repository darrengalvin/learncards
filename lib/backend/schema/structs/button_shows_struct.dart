// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ButtonShowsStruct extends FFFirebaseStruct {
  ButtonShowsStruct({
    String? buttonName,
    bool? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _buttonName = buttonName,
        _value = value,
        super(firestoreUtilData);

  // "buttonName" field.
  String? _buttonName;
  String get buttonName => _buttonName ?? '';
  set buttonName(String? val) => _buttonName = val;
  bool hasButtonName() => _buttonName != null;

  // "value" field.
  bool? _value;
  bool get value => _value ?? false;
  set value(bool? val) => _value = val;
  bool hasValue() => _value != null;

  static ButtonShowsStruct fromMap(Map<String, dynamic> data) =>
      ButtonShowsStruct(
        buttonName: data['buttonName'] as String?,
        value: data['value'] as bool?,
      );

  static ButtonShowsStruct? maybeFromMap(dynamic data) => data is Map
      ? ButtonShowsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'buttonName': _buttonName,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'buttonName': serializeParam(
          _buttonName,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ButtonShowsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ButtonShowsStruct(
        buttonName: deserializeParam(
          data['buttonName'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.bool,
          false,
        ),
      );

  static ButtonShowsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ButtonShowsStruct(
        buttonName: convertAlgoliaParam(
          data['buttonName'],
          ParamType.String,
          false,
        ),
        value: convertAlgoliaParam(
          data['value'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ButtonShowsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ButtonShowsStruct &&
        buttonName == other.buttonName &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([buttonName, value]);
}

ButtonShowsStruct createButtonShowsStruct({
  String? buttonName,
  bool? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ButtonShowsStruct(
      buttonName: buttonName,
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ButtonShowsStruct? updateButtonShowsStruct(
  ButtonShowsStruct? buttonShows, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    buttonShows
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addButtonShowsStructData(
  Map<String, dynamic> firestoreData,
  ButtonShowsStruct? buttonShows,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (buttonShows == null) {
    return;
  }
  if (buttonShows.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && buttonShows.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final buttonShowsData =
      getButtonShowsFirestoreData(buttonShows, forFieldValue);
  final nestedData =
      buttonShowsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = buttonShows.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getButtonShowsFirestoreData(
  ButtonShowsStruct? buttonShows, [
  bool forFieldValue = false,
]) {
  if (buttonShows == null) {
    return {};
  }
  final firestoreData = mapToFirestore(buttonShows.toMap());

  // Add any Firestore field values
  buttonShows.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getButtonShowsListFirestoreData(
  List<ButtonShowsStruct>? buttonShowss,
) =>
    buttonShowss?.map((e) => getButtonShowsFirestoreData(e, true)).toList() ??
    [];
