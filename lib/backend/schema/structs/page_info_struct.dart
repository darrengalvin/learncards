// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PageInfoStruct extends FFFirebaseStruct {
  PageInfoStruct({
    String? title,
    String? description,
    String? themeIntro,
    String? themeDescription,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _description = description,
        _themeIntro = themeIntro,
        _themeDescription = themeDescription,
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

  // "themeIntro" field.
  String? _themeIntro;
  String get themeIntro => _themeIntro ?? '';
  set themeIntro(String? val) => _themeIntro = val;
  bool hasThemeIntro() => _themeIntro != null;

  // "themeDescription" field.
  String? _themeDescription;
  String get themeDescription => _themeDescription ?? '';
  set themeDescription(String? val) => _themeDescription = val;
  bool hasThemeDescription() => _themeDescription != null;

  static PageInfoStruct fromMap(Map<String, dynamic> data) => PageInfoStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        themeIntro: data['themeIntro'] as String?,
        themeDescription: data['themeDescription'] as String?,
      );

  static PageInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? PageInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'themeIntro': _themeIntro,
        'themeDescription': _themeDescription,
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
        'themeIntro': serializeParam(
          _themeIntro,
          ParamType.String,
        ),
        'themeDescription': serializeParam(
          _themeDescription,
          ParamType.String,
        ),
      }.withoutNulls;

  static PageInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      PageInfoStruct(
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
        themeIntro: deserializeParam(
          data['themeIntro'],
          ParamType.String,
          false,
        ),
        themeDescription: deserializeParam(
          data['themeDescription'],
          ParamType.String,
          false,
        ),
      );

  static PageInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PageInfoStruct(
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
        themeIntro: convertAlgoliaParam(
          data['themeIntro'],
          ParamType.String,
          false,
        ),
        themeDescription: convertAlgoliaParam(
          data['themeDescription'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PageInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PageInfoStruct &&
        title == other.title &&
        description == other.description &&
        themeIntro == other.themeIntro &&
        themeDescription == other.themeDescription;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([title, description, themeIntro, themeDescription]);
}

PageInfoStruct createPageInfoStruct({
  String? title,
  String? description,
  String? themeIntro,
  String? themeDescription,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PageInfoStruct(
      title: title,
      description: description,
      themeIntro: themeIntro,
      themeDescription: themeDescription,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PageInfoStruct? updatePageInfoStruct(
  PageInfoStruct? pageInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pageInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPageInfoStructData(
  Map<String, dynamic> firestoreData,
  PageInfoStruct? pageInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pageInfo == null) {
    return;
  }
  if (pageInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pageInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pageInfoData = getPageInfoFirestoreData(pageInfo, forFieldValue);
  final nestedData = pageInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pageInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPageInfoFirestoreData(
  PageInfoStruct? pageInfo, [
  bool forFieldValue = false,
]) {
  if (pageInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pageInfo.toMap());

  // Add any Firestore field values
  pageInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPageInfoListFirestoreData(
  List<PageInfoStruct>? pageInfos,
) =>
    pageInfos?.map((e) => getPageInfoFirestoreData(e, true)).toList() ?? [];
