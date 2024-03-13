// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FlowiseStreamingDetailsStruct extends FFFirebaseStruct {
  FlowiseStreamingDetailsStruct({
    String? message,
    String? role,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _message = message,
        _role = role,
        super(firestoreUtilData);

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;
  bool hasMessage() => _message != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;
  bool hasRole() => _role != null;

  static FlowiseStreamingDetailsStruct fromMap(Map<String, dynamic> data) =>
      FlowiseStreamingDetailsStruct(
        message: data['message'] as String?,
        role: data['role'] as String?,
      );

  static FlowiseStreamingDetailsStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? FlowiseStreamingDetailsStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'role': _role,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
      }.withoutNulls;

  static FlowiseStreamingDetailsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FlowiseStreamingDetailsStruct(
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
      );

  static FlowiseStreamingDetailsStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      FlowiseStreamingDetailsStruct(
        message: convertAlgoliaParam(
          data['message'],
          ParamType.String,
          false,
        ),
        role: convertAlgoliaParam(
          data['role'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'FlowiseStreamingDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FlowiseStreamingDetailsStruct &&
        message == other.message &&
        role == other.role;
  }

  @override
  int get hashCode => const ListEquality().hash([message, role]);
}

FlowiseStreamingDetailsStruct createFlowiseStreamingDetailsStruct({
  String? message,
  String? role,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FlowiseStreamingDetailsStruct(
      message: message,
      role: role,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FlowiseStreamingDetailsStruct? updateFlowiseStreamingDetailsStruct(
  FlowiseStreamingDetailsStruct? flowiseStreamingDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    flowiseStreamingDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFlowiseStreamingDetailsStructData(
  Map<String, dynamic> firestoreData,
  FlowiseStreamingDetailsStruct? flowiseStreamingDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (flowiseStreamingDetails == null) {
    return;
  }
  if (flowiseStreamingDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      flowiseStreamingDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final flowiseStreamingDetailsData = getFlowiseStreamingDetailsFirestoreData(
      flowiseStreamingDetails, forFieldValue);
  final nestedData =
      flowiseStreamingDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      flowiseStreamingDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFlowiseStreamingDetailsFirestoreData(
  FlowiseStreamingDetailsStruct? flowiseStreamingDetails, [
  bool forFieldValue = false,
]) {
  if (flowiseStreamingDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(flowiseStreamingDetails.toMap());

  // Add any Firestore field values
  flowiseStreamingDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFlowiseStreamingDetailsListFirestoreData(
  List<FlowiseStreamingDetailsStruct>? flowiseStreamingDetailss,
) =>
    flowiseStreamingDetailss
        ?.map((e) => getFlowiseStreamingDetailsFirestoreData(e, true))
        .toList() ??
    [];
