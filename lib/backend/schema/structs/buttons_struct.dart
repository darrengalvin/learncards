// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ButtonsStruct extends FFFirebaseStruct {
  ButtonsStruct({
    String? buttonName,
    String? buttonType,
    String? buttonLink,
    String? buttonTitle,
    String? buttonSummary,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _buttonName = buttonName,
        _buttonType = buttonType,
        _buttonLink = buttonLink,
        _buttonTitle = buttonTitle,
        _buttonSummary = buttonSummary,
        super(firestoreUtilData);

  // "buttonName" field.
  String? _buttonName;
  String get buttonName => _buttonName ?? '';
  set buttonName(String? val) => _buttonName = val;
  bool hasButtonName() => _buttonName != null;

  // "buttonType" field.
  String? _buttonType;
  String get buttonType => _buttonType ?? '';
  set buttonType(String? val) => _buttonType = val;
  bool hasButtonType() => _buttonType != null;

  // "buttonLink" field.
  String? _buttonLink;
  String get buttonLink => _buttonLink ?? '';
  set buttonLink(String? val) => _buttonLink = val;
  bool hasButtonLink() => _buttonLink != null;

  // "buttonTitle" field.
  String? _buttonTitle;
  String get buttonTitle => _buttonTitle ?? '';
  set buttonTitle(String? val) => _buttonTitle = val;
  bool hasButtonTitle() => _buttonTitle != null;

  // "buttonSummary" field.
  String? _buttonSummary;
  String get buttonSummary => _buttonSummary ?? '';
  set buttonSummary(String? val) => _buttonSummary = val;
  bool hasButtonSummary() => _buttonSummary != null;

  static ButtonsStruct fromMap(Map<String, dynamic> data) => ButtonsStruct(
        buttonName: data['buttonName'] as String?,
        buttonType: data['buttonType'] as String?,
        buttonLink: data['buttonLink'] as String?,
        buttonTitle: data['buttonTitle'] as String?,
        buttonSummary: data['buttonSummary'] as String?,
      );

  static ButtonsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ButtonsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'buttonName': _buttonName,
        'buttonType': _buttonType,
        'buttonLink': _buttonLink,
        'buttonTitle': _buttonTitle,
        'buttonSummary': _buttonSummary,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'buttonName': serializeParam(
          _buttonName,
          ParamType.String,
        ),
        'buttonType': serializeParam(
          _buttonType,
          ParamType.String,
        ),
        'buttonLink': serializeParam(
          _buttonLink,
          ParamType.String,
        ),
        'buttonTitle': serializeParam(
          _buttonTitle,
          ParamType.String,
        ),
        'buttonSummary': serializeParam(
          _buttonSummary,
          ParamType.String,
        ),
      }.withoutNulls;

  static ButtonsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ButtonsStruct(
        buttonName: deserializeParam(
          data['buttonName'],
          ParamType.String,
          false,
        ),
        buttonType: deserializeParam(
          data['buttonType'],
          ParamType.String,
          false,
        ),
        buttonLink: deserializeParam(
          data['buttonLink'],
          ParamType.String,
          false,
        ),
        buttonTitle: deserializeParam(
          data['buttonTitle'],
          ParamType.String,
          false,
        ),
        buttonSummary: deserializeParam(
          data['buttonSummary'],
          ParamType.String,
          false,
        ),
      );

  static ButtonsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ButtonsStruct(
        buttonName: convertAlgoliaParam(
          data['buttonName'],
          ParamType.String,
          false,
        ),
        buttonType: convertAlgoliaParam(
          data['buttonType'],
          ParamType.String,
          false,
        ),
        buttonLink: convertAlgoliaParam(
          data['buttonLink'],
          ParamType.String,
          false,
        ),
        buttonTitle: convertAlgoliaParam(
          data['buttonTitle'],
          ParamType.String,
          false,
        ),
        buttonSummary: convertAlgoliaParam(
          data['buttonSummary'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ButtonsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ButtonsStruct &&
        buttonName == other.buttonName &&
        buttonType == other.buttonType &&
        buttonLink == other.buttonLink &&
        buttonTitle == other.buttonTitle &&
        buttonSummary == other.buttonSummary;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([buttonName, buttonType, buttonLink, buttonTitle, buttonSummary]);
}

ButtonsStruct createButtonsStruct({
  String? buttonName,
  String? buttonType,
  String? buttonLink,
  String? buttonTitle,
  String? buttonSummary,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ButtonsStruct(
      buttonName: buttonName,
      buttonType: buttonType,
      buttonLink: buttonLink,
      buttonTitle: buttonTitle,
      buttonSummary: buttonSummary,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ButtonsStruct? updateButtonsStruct(
  ButtonsStruct? buttons, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    buttons
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addButtonsStructData(
  Map<String, dynamic> firestoreData,
  ButtonsStruct? buttons,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (buttons == null) {
    return;
  }
  if (buttons.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && buttons.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final buttonsData = getButtonsFirestoreData(buttons, forFieldValue);
  final nestedData = buttonsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = buttons.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getButtonsFirestoreData(
  ButtonsStruct? buttons, [
  bool forFieldValue = false,
]) {
  if (buttons == null) {
    return {};
  }
  final firestoreData = mapToFirestore(buttons.toMap());

  // Add any Firestore field values
  buttons.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getButtonsListFirestoreData(
  List<ButtonsStruct>? buttonss,
) =>
    buttonss?.map((e) => getButtonsFirestoreData(e, true)).toList() ?? [];
