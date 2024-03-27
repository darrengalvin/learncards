// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyDataForAiStruct extends FFFirebaseStruct {
  CompanyDataForAiStruct({
    String? companyName,
    String? companySummary,
    String? companyIndustry,
    String? ownerName,
    String? thisWeeksTopic,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _companyName = companyName,
        _companySummary = companySummary,
        _companyIndustry = companyIndustry,
        _ownerName = ownerName,
        _thisWeeksTopic = thisWeeksTopic,
        super(firestoreUtilData);

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  set companyName(String? val) => _companyName = val;
  bool hasCompanyName() => _companyName != null;

  // "companySummary" field.
  String? _companySummary;
  String get companySummary => _companySummary ?? '';
  set companySummary(String? val) => _companySummary = val;
  bool hasCompanySummary() => _companySummary != null;

  // "companyIndustry" field.
  String? _companyIndustry;
  String get companyIndustry => _companyIndustry ?? '';
  set companyIndustry(String? val) => _companyIndustry = val;
  bool hasCompanyIndustry() => _companyIndustry != null;

  // "ownerName" field.
  String? _ownerName;
  String get ownerName => _ownerName ?? '';
  set ownerName(String? val) => _ownerName = val;
  bool hasOwnerName() => _ownerName != null;

  // "thisWeeksTopic" field.
  String? _thisWeeksTopic;
  String get thisWeeksTopic => _thisWeeksTopic ?? '';
  set thisWeeksTopic(String? val) => _thisWeeksTopic = val;
  bool hasThisWeeksTopic() => _thisWeeksTopic != null;

  static CompanyDataForAiStruct fromMap(Map<String, dynamic> data) =>
      CompanyDataForAiStruct(
        companyName: data['companyName'] as String?,
        companySummary: data['companySummary'] as String?,
        companyIndustry: data['companyIndustry'] as String?,
        ownerName: data['ownerName'] as String?,
        thisWeeksTopic: data['thisWeeksTopic'] as String?,
      );

  static CompanyDataForAiStruct? maybeFromMap(dynamic data) => data is Map
      ? CompanyDataForAiStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'companyName': _companyName,
        'companySummary': _companySummary,
        'companyIndustry': _companyIndustry,
        'ownerName': _ownerName,
        'thisWeeksTopic': _thisWeeksTopic,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'companyName': serializeParam(
          _companyName,
          ParamType.String,
        ),
        'companySummary': serializeParam(
          _companySummary,
          ParamType.String,
        ),
        'companyIndustry': serializeParam(
          _companyIndustry,
          ParamType.String,
        ),
        'ownerName': serializeParam(
          _ownerName,
          ParamType.String,
        ),
        'thisWeeksTopic': serializeParam(
          _thisWeeksTopic,
          ParamType.String,
        ),
      }.withoutNulls;

  static CompanyDataForAiStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CompanyDataForAiStruct(
        companyName: deserializeParam(
          data['companyName'],
          ParamType.String,
          false,
        ),
        companySummary: deserializeParam(
          data['companySummary'],
          ParamType.String,
          false,
        ),
        companyIndustry: deserializeParam(
          data['companyIndustry'],
          ParamType.String,
          false,
        ),
        ownerName: deserializeParam(
          data['ownerName'],
          ParamType.String,
          false,
        ),
        thisWeeksTopic: deserializeParam(
          data['thisWeeksTopic'],
          ParamType.String,
          false,
        ),
      );

  static CompanyDataForAiStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CompanyDataForAiStruct(
        companyName: convertAlgoliaParam(
          data['companyName'],
          ParamType.String,
          false,
        ),
        companySummary: convertAlgoliaParam(
          data['companySummary'],
          ParamType.String,
          false,
        ),
        companyIndustry: convertAlgoliaParam(
          data['companyIndustry'],
          ParamType.String,
          false,
        ),
        ownerName: convertAlgoliaParam(
          data['ownerName'],
          ParamType.String,
          false,
        ),
        thisWeeksTopic: convertAlgoliaParam(
          data['thisWeeksTopic'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CompanyDataForAiStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CompanyDataForAiStruct &&
        companyName == other.companyName &&
        companySummary == other.companySummary &&
        companyIndustry == other.companyIndustry &&
        ownerName == other.ownerName &&
        thisWeeksTopic == other.thisWeeksTopic;
  }

  @override
  int get hashCode => const ListEquality().hash([
        companyName,
        companySummary,
        companyIndustry,
        ownerName,
        thisWeeksTopic
      ]);
}

CompanyDataForAiStruct createCompanyDataForAiStruct({
  String? companyName,
  String? companySummary,
  String? companyIndustry,
  String? ownerName,
  String? thisWeeksTopic,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CompanyDataForAiStruct(
      companyName: companyName,
      companySummary: companySummary,
      companyIndustry: companyIndustry,
      ownerName: ownerName,
      thisWeeksTopic: thisWeeksTopic,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CompanyDataForAiStruct? updateCompanyDataForAiStruct(
  CompanyDataForAiStruct? companyDataForAi, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    companyDataForAi
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCompanyDataForAiStructData(
  Map<String, dynamic> firestoreData,
  CompanyDataForAiStruct? companyDataForAi,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (companyDataForAi == null) {
    return;
  }
  if (companyDataForAi.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && companyDataForAi.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final companyDataForAiData =
      getCompanyDataForAiFirestoreData(companyDataForAi, forFieldValue);
  final nestedData =
      companyDataForAiData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = companyDataForAi.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCompanyDataForAiFirestoreData(
  CompanyDataForAiStruct? companyDataForAi, [
  bool forFieldValue = false,
]) {
  if (companyDataForAi == null) {
    return {};
  }
  final firestoreData = mapToFirestore(companyDataForAi.toMap());

  // Add any Firestore field values
  companyDataForAi.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCompanyDataForAiListFirestoreData(
  List<CompanyDataForAiStruct>? companyDataForAis,
) =>
    companyDataForAis
        ?.map((e) => getCompanyDataForAiFirestoreData(e, true))
        .toList() ??
    [];
