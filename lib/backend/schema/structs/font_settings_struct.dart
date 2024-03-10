// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FontSettingsStruct extends FFFirebaseStruct {
  FontSettingsStruct({
    String? fontStyle,
    double? fontSizeDouble,
    Color? fontColor,
    String? fontSizeString,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fontStyle = fontStyle,
        _fontSizeDouble = fontSizeDouble,
        _fontColor = fontColor,
        _fontSizeString = fontSizeString,
        super(firestoreUtilData);

  // "fontStyle" field.
  String? _fontStyle;
  String get fontStyle => _fontStyle ?? '';
  set fontStyle(String? val) => _fontStyle = val;
  bool hasFontStyle() => _fontStyle != null;

  // "fontSizeDouble" field.
  double? _fontSizeDouble;
  double get fontSizeDouble => _fontSizeDouble ?? 0.0;
  set fontSizeDouble(double? val) => _fontSizeDouble = val;
  void incrementFontSizeDouble(double amount) =>
      _fontSizeDouble = fontSizeDouble + amount;
  bool hasFontSizeDouble() => _fontSizeDouble != null;

  // "fontColor" field.
  Color? _fontColor;
  Color? get fontColor => _fontColor;
  set fontColor(Color? val) => _fontColor = val;
  bool hasFontColor() => _fontColor != null;

  // "fontSizeString" field.
  String? _fontSizeString;
  String get fontSizeString => _fontSizeString ?? '';
  set fontSizeString(String? val) => _fontSizeString = val;
  bool hasFontSizeString() => _fontSizeString != null;

  static FontSettingsStruct fromMap(Map<String, dynamic> data) =>
      FontSettingsStruct(
        fontStyle: data['fontStyle'] as String?,
        fontSizeDouble: castToType<double>(data['fontSizeDouble']),
        fontColor: getSchemaColor(data['fontColor']),
        fontSizeString: data['fontSizeString'] as String?,
      );

  static FontSettingsStruct? maybeFromMap(dynamic data) => data is Map
      ? FontSettingsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fontStyle': _fontStyle,
        'fontSizeDouble': _fontSizeDouble,
        'fontColor': _fontColor,
        'fontSizeString': _fontSizeString,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fontStyle': serializeParam(
          _fontStyle,
          ParamType.String,
        ),
        'fontSizeDouble': serializeParam(
          _fontSizeDouble,
          ParamType.double,
        ),
        'fontColor': serializeParam(
          _fontColor,
          ParamType.Color,
        ),
        'fontSizeString': serializeParam(
          _fontSizeString,
          ParamType.String,
        ),
      }.withoutNulls;

  static FontSettingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      FontSettingsStruct(
        fontStyle: deserializeParam(
          data['fontStyle'],
          ParamType.String,
          false,
        ),
        fontSizeDouble: deserializeParam(
          data['fontSizeDouble'],
          ParamType.double,
          false,
        ),
        fontColor: deserializeParam(
          data['fontColor'],
          ParamType.Color,
          false,
        ),
        fontSizeString: deserializeParam(
          data['fontSizeString'],
          ParamType.String,
          false,
        ),
      );

  static FontSettingsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      FontSettingsStruct(
        fontStyle: convertAlgoliaParam(
          data['fontStyle'],
          ParamType.String,
          false,
        ),
        fontSizeDouble: convertAlgoliaParam(
          data['fontSizeDouble'],
          ParamType.double,
          false,
        ),
        fontColor: convertAlgoliaParam(
          data['fontColor'],
          ParamType.Color,
          false,
        ),
        fontSizeString: convertAlgoliaParam(
          data['fontSizeString'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'FontSettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FontSettingsStruct &&
        fontStyle == other.fontStyle &&
        fontSizeDouble == other.fontSizeDouble &&
        fontColor == other.fontColor &&
        fontSizeString == other.fontSizeString;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([fontStyle, fontSizeDouble, fontColor, fontSizeString]);
}

FontSettingsStruct createFontSettingsStruct({
  String? fontStyle,
  double? fontSizeDouble,
  Color? fontColor,
  String? fontSizeString,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FontSettingsStruct(
      fontStyle: fontStyle,
      fontSizeDouble: fontSizeDouble,
      fontColor: fontColor,
      fontSizeString: fontSizeString,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FontSettingsStruct? updateFontSettingsStruct(
  FontSettingsStruct? fontSettings, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    fontSettings
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFontSettingsStructData(
  Map<String, dynamic> firestoreData,
  FontSettingsStruct? fontSettings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fontSettings == null) {
    return;
  }
  if (fontSettings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && fontSettings.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fontSettingsData =
      getFontSettingsFirestoreData(fontSettings, forFieldValue);
  final nestedData =
      fontSettingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = fontSettings.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFontSettingsFirestoreData(
  FontSettingsStruct? fontSettings, [
  bool forFieldValue = false,
]) {
  if (fontSettings == null) {
    return {};
  }
  final firestoreData = mapToFirestore(fontSettings.toMap());

  // Add any Firestore field values
  fontSettings.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFontSettingsListFirestoreData(
  List<FontSettingsStruct>? fontSettingss,
) =>
    fontSettingss?.map((e) => getFontSettingsFirestoreData(e, true)).toList() ??
    [];
