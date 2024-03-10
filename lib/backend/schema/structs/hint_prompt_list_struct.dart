// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class HintPromptListStruct extends FFFirebaseStruct {
  HintPromptListStruct({
    String? title,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _description = description,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  static HintPromptListStruct fromMap(Map<String, dynamic> data) =>
      HintPromptListStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
      );

  static HintPromptListStruct? maybeFromMap(dynamic data) => data is Map
      ? HintPromptListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static HintPromptListStruct fromSerializableMap(Map<String, dynamic> data) =>
      HintPromptListStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  static HintPromptListStruct fromAlgoliaData(Map<String, dynamic> data) =>
      HintPromptListStruct(
        title: convertAlgoliaParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: convertAlgoliaParam(
          data['description'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'HintPromptListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HintPromptListStruct &&
        title == other.title &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([title, description]);
}

HintPromptListStruct createHintPromptListStruct({
  String? title,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HintPromptListStruct(
      title: title,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HintPromptListStruct? updateHintPromptListStruct(
  HintPromptListStruct? hintPromptList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    hintPromptList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHintPromptListStructData(
  Map<String, dynamic> firestoreData,
  HintPromptListStruct? hintPromptList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (hintPromptList == null) {
    return;
  }
  if (hintPromptList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && hintPromptList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final hintPromptListData =
      getHintPromptListFirestoreData(hintPromptList, forFieldValue);
  final nestedData =
      hintPromptListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = hintPromptList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHintPromptListFirestoreData(
  HintPromptListStruct? hintPromptList, [
  bool forFieldValue = false,
]) {
  if (hintPromptList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(hintPromptList.toMap());

  // Add any Firestore field values
  hintPromptList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHintPromptListListFirestoreData(
  List<HintPromptListStruct>? hintPromptLists,
) =>
    hintPromptLists
        ?.map((e) => getHintPromptListFirestoreData(e, true))
        .toList() ??
    [];
