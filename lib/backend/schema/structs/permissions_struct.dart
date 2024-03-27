// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PermissionsStruct extends FFFirebaseStruct {
  PermissionsStruct({
    String? permissionId,
    String? permissionType,
    bool? isView,
    bool? isEdit,
    bool? isDelete,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _permissionId = permissionId,
        _permissionType = permissionType,
        _isView = isView,
        _isEdit = isEdit,
        _isDelete = isDelete,
        super(firestoreUtilData);

  // "permissionId" field.
  String? _permissionId;
  String get permissionId => _permissionId ?? '';
  set permissionId(String? val) => _permissionId = val;
  bool hasPermissionId() => _permissionId != null;

  // "permissionType" field.
  String? _permissionType;
  String get permissionType => _permissionType ?? '';
  set permissionType(String? val) => _permissionType = val;
  bool hasPermissionType() => _permissionType != null;

  // "isView" field.
  bool? _isView;
  bool get isView => _isView ?? false;
  set isView(bool? val) => _isView = val;
  bool hasIsView() => _isView != null;

  // "isEdit" field.
  bool? _isEdit;
  bool get isEdit => _isEdit ?? false;
  set isEdit(bool? val) => _isEdit = val;
  bool hasIsEdit() => _isEdit != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  set isDelete(bool? val) => _isDelete = val;
  bool hasIsDelete() => _isDelete != null;

  static PermissionsStruct fromMap(Map<String, dynamic> data) =>
      PermissionsStruct(
        permissionId: data['permissionId'] as String?,
        permissionType: data['permissionType'] as String?,
        isView: data['isView'] as bool?,
        isEdit: data['isEdit'] as bool?,
        isDelete: data['isDelete'] as bool?,
      );

  static PermissionsStruct? maybeFromMap(dynamic data) => data is Map
      ? PermissionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'permissionId': _permissionId,
        'permissionType': _permissionType,
        'isView': _isView,
        'isEdit': _isEdit,
        'isDelete': _isDelete,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'permissionId': serializeParam(
          _permissionId,
          ParamType.String,
        ),
        'permissionType': serializeParam(
          _permissionType,
          ParamType.String,
        ),
        'isView': serializeParam(
          _isView,
          ParamType.bool,
        ),
        'isEdit': serializeParam(
          _isEdit,
          ParamType.bool,
        ),
        'isDelete': serializeParam(
          _isDelete,
          ParamType.bool,
        ),
      }.withoutNulls;

  static PermissionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      PermissionsStruct(
        permissionId: deserializeParam(
          data['permissionId'],
          ParamType.String,
          false,
        ),
        permissionType: deserializeParam(
          data['permissionType'],
          ParamType.String,
          false,
        ),
        isView: deserializeParam(
          data['isView'],
          ParamType.bool,
          false,
        ),
        isEdit: deserializeParam(
          data['isEdit'],
          ParamType.bool,
          false,
        ),
        isDelete: deserializeParam(
          data['isDelete'],
          ParamType.bool,
          false,
        ),
      );

  static PermissionsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PermissionsStruct(
        permissionId: convertAlgoliaParam(
          data['permissionId'],
          ParamType.String,
          false,
        ),
        permissionType: convertAlgoliaParam(
          data['permissionType'],
          ParamType.String,
          false,
        ),
        isView: convertAlgoliaParam(
          data['isView'],
          ParamType.bool,
          false,
        ),
        isEdit: convertAlgoliaParam(
          data['isEdit'],
          ParamType.bool,
          false,
        ),
        isDelete: convertAlgoliaParam(
          data['isDelete'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PermissionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PermissionsStruct &&
        permissionId == other.permissionId &&
        permissionType == other.permissionType &&
        isView == other.isView &&
        isEdit == other.isEdit &&
        isDelete == other.isDelete;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([permissionId, permissionType, isView, isEdit, isDelete]);
}

PermissionsStruct createPermissionsStruct({
  String? permissionId,
  String? permissionType,
  bool? isView,
  bool? isEdit,
  bool? isDelete,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PermissionsStruct(
      permissionId: permissionId,
      permissionType: permissionType,
      isView: isView,
      isEdit: isEdit,
      isDelete: isDelete,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PermissionsStruct? updatePermissionsStruct(
  PermissionsStruct? permissions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    permissions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPermissionsStructData(
  Map<String, dynamic> firestoreData,
  PermissionsStruct? permissions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (permissions == null) {
    return;
  }
  if (permissions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && permissions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final permissionsData =
      getPermissionsFirestoreData(permissions, forFieldValue);
  final nestedData =
      permissionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = permissions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPermissionsFirestoreData(
  PermissionsStruct? permissions, [
  bool forFieldValue = false,
]) {
  if (permissions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(permissions.toMap());

  // Add any Firestore field values
  permissions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPermissionsListFirestoreData(
  List<PermissionsStruct>? permissionss,
) =>
    permissionss?.map((e) => getPermissionsFirestoreData(e, true)).toList() ??
    [];
