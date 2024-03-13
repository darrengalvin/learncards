// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserDataForAiStruct extends FFFirebaseStruct {
  UserDataForAiStruct({
    String? userName,
    String? learningStyle,
    String? jobRole,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userName = userName,
        _learningStyle = learningStyle,
        _jobRole = jobRole,
        super(firestoreUtilData);

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;
  bool hasUserName() => _userName != null;

  // "learningStyle" field.
  String? _learningStyle;
  String get learningStyle => _learningStyle ?? '';
  set learningStyle(String? val) => _learningStyle = val;
  bool hasLearningStyle() => _learningStyle != null;

  // "jobRole" field.
  String? _jobRole;
  String get jobRole => _jobRole ?? '';
  set jobRole(String? val) => _jobRole = val;
  bool hasJobRole() => _jobRole != null;

  static UserDataForAiStruct fromMap(Map<String, dynamic> data) =>
      UserDataForAiStruct(
        userName: data['userName'] as String?,
        learningStyle: data['learningStyle'] as String?,
        jobRole: data['jobRole'] as String?,
      );

  static UserDataForAiStruct? maybeFromMap(dynamic data) => data is Map
      ? UserDataForAiStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userName': _userName,
        'learningStyle': _learningStyle,
        'jobRole': _jobRole,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'learningStyle': serializeParam(
          _learningStyle,
          ParamType.String,
        ),
        'jobRole': serializeParam(
          _jobRole,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserDataForAiStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserDataForAiStruct(
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        learningStyle: deserializeParam(
          data['learningStyle'],
          ParamType.String,
          false,
        ),
        jobRole: deserializeParam(
          data['jobRole'],
          ParamType.String,
          false,
        ),
      );

  static UserDataForAiStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserDataForAiStruct(
        userName: convertAlgoliaParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        learningStyle: convertAlgoliaParam(
          data['learningStyle'],
          ParamType.String,
          false,
        ),
        jobRole: convertAlgoliaParam(
          data['jobRole'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserDataForAiStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserDataForAiStruct &&
        userName == other.userName &&
        learningStyle == other.learningStyle &&
        jobRole == other.jobRole;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([userName, learningStyle, jobRole]);
}

UserDataForAiStruct createUserDataForAiStruct({
  String? userName,
  String? learningStyle,
  String? jobRole,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserDataForAiStruct(
      userName: userName,
      learningStyle: learningStyle,
      jobRole: jobRole,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserDataForAiStruct? updateUserDataForAiStruct(
  UserDataForAiStruct? userDataForAi, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userDataForAi
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserDataForAiStructData(
  Map<String, dynamic> firestoreData,
  UserDataForAiStruct? userDataForAi,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userDataForAi == null) {
    return;
  }
  if (userDataForAi.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userDataForAi.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userDataForAiData =
      getUserDataForAiFirestoreData(userDataForAi, forFieldValue);
  final nestedData =
      userDataForAiData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userDataForAi.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserDataForAiFirestoreData(
  UserDataForAiStruct? userDataForAi, [
  bool forFieldValue = false,
]) {
  if (userDataForAi == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userDataForAi.toMap());

  // Add any Firestore field values
  userDataForAi.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserDataForAiListFirestoreData(
  List<UserDataForAiStruct>? userDataForAis,
) =>
    userDataForAis
        ?.map((e) => getUserDataForAiFirestoreData(e, true))
        .toList() ??
    [];
