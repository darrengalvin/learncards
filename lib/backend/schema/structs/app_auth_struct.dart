// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppAuthStruct extends FFFirebaseStruct {
  AppAuthStruct({
    DateTime? createdTime,
    DateTime? updatedTime,
    String? type,
    String? status,
    DocumentReference? user,
    String? uid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdTime = createdTime,
        _updatedTime = updatedTime,
        _type = type,
        _status = status,
        _user = user,
        _uid = uid,
        super(firestoreUtilData);

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;
  bool hasCreatedTime() => _createdTime != null;

  // "updatedTime" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  set updatedTime(DateTime? val) => _updatedTime = val;
  bool hasUpdatedTime() => _updatedTime != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;
  bool hasUser() => _user != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;
  bool hasUid() => _uid != null;

  static AppAuthStruct fromMap(Map<String, dynamic> data) => AppAuthStruct(
        createdTime: data['createdTime'] as DateTime?,
        updatedTime: data['updatedTime'] as DateTime?,
        type: data['type'] as String?,
        status: data['status'] as String?,
        user: data['user'] as DocumentReference?,
        uid: data['uid'] as String?,
      );

  static AppAuthStruct? maybeFromMap(dynamic data) =>
      data is Map ? AppAuthStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'createdTime': _createdTime,
        'updatedTime': _updatedTime,
        'type': _type,
        'status': _status,
        'user': _user,
        'uid': _uid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'createdTime': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'updatedTime': serializeParam(
          _updatedTime,
          ParamType.DateTime,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
      }.withoutNulls;

  static AppAuthStruct fromSerializableMap(Map<String, dynamic> data) =>
      AppAuthStruct(
        createdTime: deserializeParam(
          data['createdTime'],
          ParamType.DateTime,
          false,
        ),
        updatedTime: deserializeParam(
          data['updatedTime'],
          ParamType.DateTime,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
      );

  static AppAuthStruct fromAlgoliaData(Map<String, dynamic> data) =>
      AppAuthStruct(
        createdTime: convertAlgoliaParam(
          data['createdTime'],
          ParamType.DateTime,
          false,
        ),
        updatedTime: convertAlgoliaParam(
          data['updatedTime'],
          ParamType.DateTime,
          false,
        ),
        type: convertAlgoliaParam(
          data['type'],
          ParamType.String,
          false,
        ),
        status: convertAlgoliaParam(
          data['status'],
          ParamType.String,
          false,
        ),
        user: convertAlgoliaParam(
          data['user'],
          ParamType.DocumentReference,
          false,
        ),
        uid: convertAlgoliaParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'AppAuthStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppAuthStruct &&
        createdTime == other.createdTime &&
        updatedTime == other.updatedTime &&
        type == other.type &&
        status == other.status &&
        user == other.user &&
        uid == other.uid;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([createdTime, updatedTime, type, status, user, uid]);
}

AppAuthStruct createAppAuthStruct({
  DateTime? createdTime,
  DateTime? updatedTime,
  String? type,
  String? status,
  DocumentReference? user,
  String? uid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AppAuthStruct(
      createdTime: createdTime,
      updatedTime: updatedTime,
      type: type,
      status: status,
      user: user,
      uid: uid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AppAuthStruct? updateAppAuthStruct(
  AppAuthStruct? appAuth, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    appAuth
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAppAuthStructData(
  Map<String, dynamic> firestoreData,
  AppAuthStruct? appAuth,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (appAuth == null) {
    return;
  }
  if (appAuth.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && appAuth.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final appAuthData = getAppAuthFirestoreData(appAuth, forFieldValue);
  final nestedData = appAuthData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = appAuth.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAppAuthFirestoreData(
  AppAuthStruct? appAuth, [
  bool forFieldValue = false,
]) {
  if (appAuth == null) {
    return {};
  }
  final firestoreData = mapToFirestore(appAuth.toMap());

  // Add any Firestore field values
  appAuth.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAppAuthListFirestoreData(
  List<AppAuthStruct>? appAuths,
) =>
    appAuths?.map((e) => getAppAuthFirestoreData(e, true)).toList() ?? [];
