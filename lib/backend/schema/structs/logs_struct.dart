// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LogsStruct extends FFFirebaseStruct {
  LogsStruct({
    String? logDetail,
    DateTime? logTime,
    String? logResult,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _logDetail = logDetail,
        _logTime = logTime,
        _logResult = logResult,
        super(firestoreUtilData);

  // "logDetail" field.
  String? _logDetail;
  String get logDetail => _logDetail ?? '';
  set logDetail(String? val) => _logDetail = val;
  bool hasLogDetail() => _logDetail != null;

  // "logTime" field.
  DateTime? _logTime;
  DateTime? get logTime => _logTime;
  set logTime(DateTime? val) => _logTime = val;
  bool hasLogTime() => _logTime != null;

  // "logResult" field.
  String? _logResult;
  String get logResult => _logResult ?? '';
  set logResult(String? val) => _logResult = val;
  bool hasLogResult() => _logResult != null;

  static LogsStruct fromMap(Map<String, dynamic> data) => LogsStruct(
        logDetail: data['logDetail'] as String?,
        logTime: data['logTime'] as DateTime?,
        logResult: data['logResult'] as String?,
      );

  static LogsStruct? maybeFromMap(dynamic data) =>
      data is Map ? LogsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'logDetail': _logDetail,
        'logTime': _logTime,
        'logResult': _logResult,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'logDetail': serializeParam(
          _logDetail,
          ParamType.String,
        ),
        'logTime': serializeParam(
          _logTime,
          ParamType.DateTime,
        ),
        'logResult': serializeParam(
          _logResult,
          ParamType.String,
        ),
      }.withoutNulls;

  static LogsStruct fromSerializableMap(Map<String, dynamic> data) =>
      LogsStruct(
        logDetail: deserializeParam(
          data['logDetail'],
          ParamType.String,
          false,
        ),
        logTime: deserializeParam(
          data['logTime'],
          ParamType.DateTime,
          false,
        ),
        logResult: deserializeParam(
          data['logResult'],
          ParamType.String,
          false,
        ),
      );

  static LogsStruct fromAlgoliaData(Map<String, dynamic> data) => LogsStruct(
        logDetail: convertAlgoliaParam(
          data['logDetail'],
          ParamType.String,
          false,
        ),
        logTime: convertAlgoliaParam(
          data['logTime'],
          ParamType.DateTime,
          false,
        ),
        logResult: convertAlgoliaParam(
          data['logResult'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'LogsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LogsStruct &&
        logDetail == other.logDetail &&
        logTime == other.logTime &&
        logResult == other.logResult;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([logDetail, logTime, logResult]);
}

LogsStruct createLogsStruct({
  String? logDetail,
  DateTime? logTime,
  String? logResult,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LogsStruct(
      logDetail: logDetail,
      logTime: logTime,
      logResult: logResult,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LogsStruct? updateLogsStruct(
  LogsStruct? logs, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    logs
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLogsStructData(
  Map<String, dynamic> firestoreData,
  LogsStruct? logs,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (logs == null) {
    return;
  }
  if (logs.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && logs.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final logsData = getLogsFirestoreData(logs, forFieldValue);
  final nestedData = logsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = logs.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLogsFirestoreData(
  LogsStruct? logs, [
  bool forFieldValue = false,
]) {
  if (logs == null) {
    return {};
  }
  final firestoreData = mapToFirestore(logs.toMap());

  // Add any Firestore field values
  logs.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLogsListFirestoreData(
  List<LogsStruct>? logss,
) =>
    logss?.map((e) => getLogsFirestoreData(e, true)).toList() ?? [];
