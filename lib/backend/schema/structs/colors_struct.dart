// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ColorsStruct extends FFFirebaseStruct {
  ColorsStruct({
    Color? primaryColor,
    Color? secondaryColor,
    Color? teritoryColor,
    Color? primaryTextColor,
    Color? secondaryTextColor,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _primaryColor = primaryColor,
        _secondaryColor = secondaryColor,
        _teritoryColor = teritoryColor,
        _primaryTextColor = primaryTextColor,
        _secondaryTextColor = secondaryTextColor,
        super(firestoreUtilData);

  // "primaryColor" field.
  Color? _primaryColor;
  Color? get primaryColor => _primaryColor;
  set primaryColor(Color? val) => _primaryColor = val;
  bool hasPrimaryColor() => _primaryColor != null;

  // "secondaryColor" field.
  Color? _secondaryColor;
  Color? get secondaryColor => _secondaryColor;
  set secondaryColor(Color? val) => _secondaryColor = val;
  bool hasSecondaryColor() => _secondaryColor != null;

  // "teritoryColor" field.
  Color? _teritoryColor;
  Color? get teritoryColor => _teritoryColor;
  set teritoryColor(Color? val) => _teritoryColor = val;
  bool hasTeritoryColor() => _teritoryColor != null;

  // "primaryTextColor" field.
  Color? _primaryTextColor;
  Color? get primaryTextColor => _primaryTextColor;
  set primaryTextColor(Color? val) => _primaryTextColor = val;
  bool hasPrimaryTextColor() => _primaryTextColor != null;

  // "secondaryTextColor" field.
  Color? _secondaryTextColor;
  Color? get secondaryTextColor => _secondaryTextColor;
  set secondaryTextColor(Color? val) => _secondaryTextColor = val;
  bool hasSecondaryTextColor() => _secondaryTextColor != null;

  static ColorsStruct fromMap(Map<String, dynamic> data) => ColorsStruct(
        primaryColor: getSchemaColor(data['primaryColor']),
        secondaryColor: getSchemaColor(data['secondaryColor']),
        teritoryColor: getSchemaColor(data['teritoryColor']),
        primaryTextColor: getSchemaColor(data['primaryTextColor']),
        secondaryTextColor: getSchemaColor(data['secondaryTextColor']),
      );

  static ColorsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ColorsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'primaryColor': _primaryColor,
        'secondaryColor': _secondaryColor,
        'teritoryColor': _teritoryColor,
        'primaryTextColor': _primaryTextColor,
        'secondaryTextColor': _secondaryTextColor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'primaryColor': serializeParam(
          _primaryColor,
          ParamType.Color,
        ),
        'secondaryColor': serializeParam(
          _secondaryColor,
          ParamType.Color,
        ),
        'teritoryColor': serializeParam(
          _teritoryColor,
          ParamType.Color,
        ),
        'primaryTextColor': serializeParam(
          _primaryTextColor,
          ParamType.Color,
        ),
        'secondaryTextColor': serializeParam(
          _secondaryTextColor,
          ParamType.Color,
        ),
      }.withoutNulls;

  static ColorsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ColorsStruct(
        primaryColor: deserializeParam(
          data['primaryColor'],
          ParamType.Color,
          false,
        ),
        secondaryColor: deserializeParam(
          data['secondaryColor'],
          ParamType.Color,
          false,
        ),
        teritoryColor: deserializeParam(
          data['teritoryColor'],
          ParamType.Color,
          false,
        ),
        primaryTextColor: deserializeParam(
          data['primaryTextColor'],
          ParamType.Color,
          false,
        ),
        secondaryTextColor: deserializeParam(
          data['secondaryTextColor'],
          ParamType.Color,
          false,
        ),
      );

  static ColorsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ColorsStruct(
        primaryColor: convertAlgoliaParam(
          data['primaryColor'],
          ParamType.Color,
          false,
        ),
        secondaryColor: convertAlgoliaParam(
          data['secondaryColor'],
          ParamType.Color,
          false,
        ),
        teritoryColor: convertAlgoliaParam(
          data['teritoryColor'],
          ParamType.Color,
          false,
        ),
        primaryTextColor: convertAlgoliaParam(
          data['primaryTextColor'],
          ParamType.Color,
          false,
        ),
        secondaryTextColor: convertAlgoliaParam(
          data['secondaryTextColor'],
          ParamType.Color,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ColorsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ColorsStruct &&
        primaryColor == other.primaryColor &&
        secondaryColor == other.secondaryColor &&
        teritoryColor == other.teritoryColor &&
        primaryTextColor == other.primaryTextColor &&
        secondaryTextColor == other.secondaryTextColor;
  }

  @override
  int get hashCode => const ListEquality().hash([
        primaryColor,
        secondaryColor,
        teritoryColor,
        primaryTextColor,
        secondaryTextColor
      ]);
}

ColorsStruct createColorsStruct({
  Color? primaryColor,
  Color? secondaryColor,
  Color? teritoryColor,
  Color? primaryTextColor,
  Color? secondaryTextColor,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ColorsStruct(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      teritoryColor: teritoryColor,
      primaryTextColor: primaryTextColor,
      secondaryTextColor: secondaryTextColor,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ColorsStruct? updateColorsStruct(
  ColorsStruct? colors, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    colors
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addColorsStructData(
  Map<String, dynamic> firestoreData,
  ColorsStruct? colors,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (colors == null) {
    return;
  }
  if (colors.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && colors.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final colorsData = getColorsFirestoreData(colors, forFieldValue);
  final nestedData = colorsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = colors.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getColorsFirestoreData(
  ColorsStruct? colors, [
  bool forFieldValue = false,
]) {
  if (colors == null) {
    return {};
  }
  final firestoreData = mapToFirestore(colors.toMap());

  // Add any Firestore field values
  colors.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getColorsListFirestoreData(
  List<ColorsStruct>? colorss,
) =>
    colorss?.map((e) => getColorsFirestoreData(e, true)).toList() ?? [];
