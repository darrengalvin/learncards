// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TextSettingsStruct extends FFFirebaseStruct {
  TextSettingsStruct({
    String? font,
    int? size,
    Color? color,
    String? theText,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _font = font,
        _size = size,
        _color = color,
        _theText = theText,
        super(firestoreUtilData);

  // "font" field.
  String? _font;
  String get font => _font ?? '';
  set font(String? val) => _font = val;
  bool hasFont() => _font != null;

  // "size" field.
  int? _size;
  int get size => _size ?? 0;
  set size(int? val) => _size = val;
  void incrementSize(int amount) => _size = size + amount;
  bool hasSize() => _size != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;
  bool hasColor() => _color != null;

  // "theText" field.
  String? _theText;
  String get theText => _theText ?? '';
  set theText(String? val) => _theText = val;
  bool hasTheText() => _theText != null;

  static TextSettingsStruct fromMap(Map<String, dynamic> data) =>
      TextSettingsStruct(
        font: data['font'] as String?,
        size: castToType<int>(data['size']),
        color: getSchemaColor(data['color']),
        theText: data['theText'] as String?,
      );

  static TextSettingsStruct? maybeFromMap(dynamic data) => data is Map
      ? TextSettingsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'font': _font,
        'size': _size,
        'color': _color,
        'theText': _theText,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'font': serializeParam(
          _font,
          ParamType.String,
        ),
        'size': serializeParam(
          _size,
          ParamType.int,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'theText': serializeParam(
          _theText,
          ParamType.String,
        ),
      }.withoutNulls;

  static TextSettingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TextSettingsStruct(
        font: deserializeParam(
          data['font'],
          ParamType.String,
          false,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.int,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        theText: deserializeParam(
          data['theText'],
          ParamType.String,
          false,
        ),
      );

  static TextSettingsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      TextSettingsStruct(
        font: convertAlgoliaParam(
          data['font'],
          ParamType.String,
          false,
        ),
        size: convertAlgoliaParam(
          data['size'],
          ParamType.int,
          false,
        ),
        color: convertAlgoliaParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        theText: convertAlgoliaParam(
          data['theText'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'TextSettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TextSettingsStruct &&
        font == other.font &&
        size == other.size &&
        color == other.color &&
        theText == other.theText;
  }

  @override
  int get hashCode => const ListEquality().hash([font, size, color, theText]);
}

TextSettingsStruct createTextSettingsStruct({
  String? font,
  int? size,
  Color? color,
  String? theText,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TextSettingsStruct(
      font: font,
      size: size,
      color: color,
      theText: theText,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TextSettingsStruct? updateTextSettingsStruct(
  TextSettingsStruct? textSettings, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    textSettings
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTextSettingsStructData(
  Map<String, dynamic> firestoreData,
  TextSettingsStruct? textSettings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (textSettings == null) {
    return;
  }
  if (textSettings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && textSettings.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final textSettingsData =
      getTextSettingsFirestoreData(textSettings, forFieldValue);
  final nestedData =
      textSettingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = textSettings.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTextSettingsFirestoreData(
  TextSettingsStruct? textSettings, [
  bool forFieldValue = false,
]) {
  if (textSettings == null) {
    return {};
  }
  final firestoreData = mapToFirestore(textSettings.toMap());

  // Add any Firestore field values
  textSettings.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTextSettingsListFirestoreData(
  List<TextSettingsStruct>? textSettingss,
) =>
    textSettingss?.map((e) => getTextSettingsFirestoreData(e, true)).toList() ??
    [];
