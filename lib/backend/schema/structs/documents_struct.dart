// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocumentsStruct extends FFFirebaseStruct {
  DocumentsStruct({
    String? documentTitle,
    String? documentDescription,
    String? documentLink,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _documentTitle = documentTitle,
        _documentDescription = documentDescription,
        _documentLink = documentLink,
        super(firestoreUtilData);

  // "documentTitle" field.
  String? _documentTitle;
  String get documentTitle => _documentTitle ?? '';
  set documentTitle(String? val) => _documentTitle = val;
  bool hasDocumentTitle() => _documentTitle != null;

  // "documentDescription" field.
  String? _documentDescription;
  String get documentDescription => _documentDescription ?? '';
  set documentDescription(String? val) => _documentDescription = val;
  bool hasDocumentDescription() => _documentDescription != null;

  // "documentLink" field.
  String? _documentLink;
  String get documentLink => _documentLink ?? '';
  set documentLink(String? val) => _documentLink = val;
  bool hasDocumentLink() => _documentLink != null;

  static DocumentsStruct fromMap(Map<String, dynamic> data) => DocumentsStruct(
        documentTitle: data['documentTitle'] as String?,
        documentDescription: data['documentDescription'] as String?,
        documentLink: data['documentLink'] as String?,
      );

  static DocumentsStruct? maybeFromMap(dynamic data) => data is Map
      ? DocumentsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'documentTitle': _documentTitle,
        'documentDescription': _documentDescription,
        'documentLink': _documentLink,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'documentTitle': serializeParam(
          _documentTitle,
          ParamType.String,
        ),
        'documentDescription': serializeParam(
          _documentDescription,
          ParamType.String,
        ),
        'documentLink': serializeParam(
          _documentLink,
          ParamType.String,
        ),
      }.withoutNulls;

  static DocumentsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DocumentsStruct(
        documentTitle: deserializeParam(
          data['documentTitle'],
          ParamType.String,
          false,
        ),
        documentDescription: deserializeParam(
          data['documentDescription'],
          ParamType.String,
          false,
        ),
        documentLink: deserializeParam(
          data['documentLink'],
          ParamType.String,
          false,
        ),
      );

  static DocumentsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DocumentsStruct(
        documentTitle: convertAlgoliaParam(
          data['documentTitle'],
          ParamType.String,
          false,
        ),
        documentDescription: convertAlgoliaParam(
          data['documentDescription'],
          ParamType.String,
          false,
        ),
        documentLink: convertAlgoliaParam(
          data['documentLink'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DocumentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DocumentsStruct &&
        documentTitle == other.documentTitle &&
        documentDescription == other.documentDescription &&
        documentLink == other.documentLink;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([documentTitle, documentDescription, documentLink]);
}

DocumentsStruct createDocumentsStruct({
  String? documentTitle,
  String? documentDescription,
  String? documentLink,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DocumentsStruct(
      documentTitle: documentTitle,
      documentDescription: documentDescription,
      documentLink: documentLink,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DocumentsStruct? updateDocumentsStruct(
  DocumentsStruct? documents, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    documents
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDocumentsStructData(
  Map<String, dynamic> firestoreData,
  DocumentsStruct? documents,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (documents == null) {
    return;
  }
  if (documents.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && documents.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final documentsData = getDocumentsFirestoreData(documents, forFieldValue);
  final nestedData = documentsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = documents.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDocumentsFirestoreData(
  DocumentsStruct? documents, [
  bool forFieldValue = false,
]) {
  if (documents == null) {
    return {};
  }
  final firestoreData = mapToFirestore(documents.toMap());

  // Add any Firestore field values
  documents.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDocumentsListFirestoreData(
  List<DocumentsStruct>? documentss,
) =>
    documentss?.map((e) => getDocumentsFirestoreData(e, true)).toList() ?? [];
