// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChecksCompletedStruct extends FFFirebaseStruct {
  ChecksCompletedStruct({
    String? checkName,
    String? checkDescription,
    bool? checkPassed,
    String? checkCategory,
    DateTime? dateChecked,
    DateTime? timeChecked,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _checkName = checkName,
        _checkDescription = checkDescription,
        _checkPassed = checkPassed,
        _checkCategory = checkCategory,
        _dateChecked = dateChecked,
        _timeChecked = timeChecked,
        super(firestoreUtilData);

  // "checkName" field.
  String? _checkName;
  String get checkName => _checkName ?? '';
  set checkName(String? val) => _checkName = val;
  bool hasCheckName() => _checkName != null;

  // "checkDescription" field.
  String? _checkDescription;
  String get checkDescription => _checkDescription ?? '';
  set checkDescription(String? val) => _checkDescription = val;
  bool hasCheckDescription() => _checkDescription != null;

  // "checkPassed" field.
  bool? _checkPassed;
  bool get checkPassed => _checkPassed ?? false;
  set checkPassed(bool? val) => _checkPassed = val;
  bool hasCheckPassed() => _checkPassed != null;

  // "checkCategory" field.
  String? _checkCategory;
  String get checkCategory => _checkCategory ?? '';
  set checkCategory(String? val) => _checkCategory = val;
  bool hasCheckCategory() => _checkCategory != null;

  // "dateChecked" field.
  DateTime? _dateChecked;
  DateTime? get dateChecked => _dateChecked;
  set dateChecked(DateTime? val) => _dateChecked = val;
  bool hasDateChecked() => _dateChecked != null;

  // "timeChecked" field.
  DateTime? _timeChecked;
  DateTime? get timeChecked => _timeChecked;
  set timeChecked(DateTime? val) => _timeChecked = val;
  bool hasTimeChecked() => _timeChecked != null;

  static ChecksCompletedStruct fromMap(Map<String, dynamic> data) =>
      ChecksCompletedStruct(
        checkName: data['checkName'] as String?,
        checkDescription: data['checkDescription'] as String?,
        checkPassed: data['checkPassed'] as bool?,
        checkCategory: data['checkCategory'] as String?,
        dateChecked: data['dateChecked'] as DateTime?,
        timeChecked: data['timeChecked'] as DateTime?,
      );

  static ChecksCompletedStruct? maybeFromMap(dynamic data) => data is Map
      ? ChecksCompletedStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'checkName': _checkName,
        'checkDescription': _checkDescription,
        'checkPassed': _checkPassed,
        'checkCategory': _checkCategory,
        'dateChecked': _dateChecked,
        'timeChecked': _timeChecked,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'checkName': serializeParam(
          _checkName,
          ParamType.String,
        ),
        'checkDescription': serializeParam(
          _checkDescription,
          ParamType.String,
        ),
        'checkPassed': serializeParam(
          _checkPassed,
          ParamType.bool,
        ),
        'checkCategory': serializeParam(
          _checkCategory,
          ParamType.String,
        ),
        'dateChecked': serializeParam(
          _dateChecked,
          ParamType.DateTime,
        ),
        'timeChecked': serializeParam(
          _timeChecked,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static ChecksCompletedStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChecksCompletedStruct(
        checkName: deserializeParam(
          data['checkName'],
          ParamType.String,
          false,
        ),
        checkDescription: deserializeParam(
          data['checkDescription'],
          ParamType.String,
          false,
        ),
        checkPassed: deserializeParam(
          data['checkPassed'],
          ParamType.bool,
          false,
        ),
        checkCategory: deserializeParam(
          data['checkCategory'],
          ParamType.String,
          false,
        ),
        dateChecked: deserializeParam(
          data['dateChecked'],
          ParamType.DateTime,
          false,
        ),
        timeChecked: deserializeParam(
          data['timeChecked'],
          ParamType.DateTime,
          false,
        ),
      );

  static ChecksCompletedStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ChecksCompletedStruct(
        checkName: convertAlgoliaParam(
          data['checkName'],
          ParamType.String,
          false,
        ),
        checkDescription: convertAlgoliaParam(
          data['checkDescription'],
          ParamType.String,
          false,
        ),
        checkPassed: convertAlgoliaParam(
          data['checkPassed'],
          ParamType.bool,
          false,
        ),
        checkCategory: convertAlgoliaParam(
          data['checkCategory'],
          ParamType.String,
          false,
        ),
        dateChecked: convertAlgoliaParam(
          data['dateChecked'],
          ParamType.DateTime,
          false,
        ),
        timeChecked: convertAlgoliaParam(
          data['timeChecked'],
          ParamType.DateTime,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ChecksCompletedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChecksCompletedStruct &&
        checkName == other.checkName &&
        checkDescription == other.checkDescription &&
        checkPassed == other.checkPassed &&
        checkCategory == other.checkCategory &&
        dateChecked == other.dateChecked &&
        timeChecked == other.timeChecked;
  }

  @override
  int get hashCode => const ListEquality().hash([
        checkName,
        checkDescription,
        checkPassed,
        checkCategory,
        dateChecked,
        timeChecked
      ]);
}

ChecksCompletedStruct createChecksCompletedStruct({
  String? checkName,
  String? checkDescription,
  bool? checkPassed,
  String? checkCategory,
  DateTime? dateChecked,
  DateTime? timeChecked,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChecksCompletedStruct(
      checkName: checkName,
      checkDescription: checkDescription,
      checkPassed: checkPassed,
      checkCategory: checkCategory,
      dateChecked: dateChecked,
      timeChecked: timeChecked,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChecksCompletedStruct? updateChecksCompletedStruct(
  ChecksCompletedStruct? checksCompleted, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    checksCompleted
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChecksCompletedStructData(
  Map<String, dynamic> firestoreData,
  ChecksCompletedStruct? checksCompleted,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (checksCompleted == null) {
    return;
  }
  if (checksCompleted.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && checksCompleted.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final checksCompletedData =
      getChecksCompletedFirestoreData(checksCompleted, forFieldValue);
  final nestedData =
      checksCompletedData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = checksCompleted.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChecksCompletedFirestoreData(
  ChecksCompletedStruct? checksCompleted, [
  bool forFieldValue = false,
]) {
  if (checksCompleted == null) {
    return {};
  }
  final firestoreData = mapToFirestore(checksCompleted.toMap());

  // Add any Firestore field values
  checksCompleted.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChecksCompletedListFirestoreData(
  List<ChecksCompletedStruct>? checksCompleteds,
) =>
    checksCompleteds
        ?.map((e) => getChecksCompletedFirestoreData(e, true))
        .toList() ??
    [];
