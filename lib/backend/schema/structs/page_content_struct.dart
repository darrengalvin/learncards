// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PageContentStruct extends FFFirebaseStruct {
  PageContentStruct({
    String? pageContent,
    MetadataStruct? metadata,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pageContent = pageContent,
        _metadata = metadata,
        super(firestoreUtilData);

  // "pageContent" field.
  String? _pageContent;
  String get pageContent => _pageContent ?? '';
  set pageContent(String? val) => _pageContent = val;
  bool hasPageContent() => _pageContent != null;

  // "metadata" field.
  MetadataStruct? _metadata;
  MetadataStruct get metadata => _metadata ?? MetadataStruct();
  set metadata(MetadataStruct? val) => _metadata = val;
  void updateMetadata(Function(MetadataStruct) updateFn) =>
      updateFn(_metadata ??= MetadataStruct());
  bool hasMetadata() => _metadata != null;

  static PageContentStruct fromMap(Map<String, dynamic> data) =>
      PageContentStruct(
        pageContent: data['pageContent'] as String?,
        metadata: MetadataStruct.maybeFromMap(data['metadata']),
      );

  static PageContentStruct? maybeFromMap(dynamic data) => data is Map
      ? PageContentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'pageContent': _pageContent,
        'metadata': _metadata?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pageContent': serializeParam(
          _pageContent,
          ParamType.String,
        ),
        'metadata': serializeParam(
          _metadata,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static PageContentStruct fromSerializableMap(Map<String, dynamic> data) =>
      PageContentStruct(
        pageContent: deserializeParam(
          data['pageContent'],
          ParamType.String,
          false,
        ),
        metadata: deserializeStructParam(
          data['metadata'],
          ParamType.DataStruct,
          false,
          structBuilder: MetadataStruct.fromSerializableMap,
        ),
      );

  static PageContentStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PageContentStruct(
        pageContent: convertAlgoliaParam(
          data['pageContent'],
          ParamType.String,
          false,
        ),
        metadata: convertAlgoliaParam(
          data['metadata'],
          ParamType.DataStruct,
          false,
          structBuilder: MetadataStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PageContentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PageContentStruct &&
        pageContent == other.pageContent &&
        metadata == other.metadata;
  }

  @override
  int get hashCode => const ListEquality().hash([pageContent, metadata]);
}

PageContentStruct createPageContentStruct({
  String? pageContent,
  MetadataStruct? metadata,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PageContentStruct(
      pageContent: pageContent,
      metadata: metadata ?? (clearUnsetFields ? MetadataStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PageContentStruct? updatePageContentStruct(
  PageContentStruct? pageContentStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pageContentStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPageContentStructData(
  Map<String, dynamic> firestoreData,
  PageContentStruct? pageContentStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pageContentStruct == null) {
    return;
  }
  if (pageContentStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pageContentStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pageContentStructData =
      getPageContentFirestoreData(pageContentStruct, forFieldValue);
  final nestedData =
      pageContentStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pageContentStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPageContentFirestoreData(
  PageContentStruct? pageContentStruct, [
  bool forFieldValue = false,
]) {
  if (pageContentStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pageContentStruct.toMap());

  // Handle nested data for "metadata" field.
  addMetadataStructData(
    firestoreData,
    pageContentStruct.hasMetadata() ? pageContentStruct.metadata : null,
    'metadata',
    forFieldValue,
  );

  // Add any Firestore field values
  pageContentStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPageContentListFirestoreData(
  List<PageContentStruct>? pageContentStructs,
) =>
    pageContentStructs
        ?.map((e) => getPageContentFirestoreData(e, true))
        .toList() ??
    [];
