// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ThreadsStruct extends FFFirebaseStruct {
  ThreadsStruct({
    String? threadId,
    String? threadName,
    String? threadImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _threadId = threadId,
        _threadName = threadName,
        _threadImage = threadImage,
        super(firestoreUtilData);

  // "threadId" field.
  String? _threadId;
  String get threadId => _threadId ?? '';
  set threadId(String? val) => _threadId = val;
  bool hasThreadId() => _threadId != null;

  // "threadName" field.
  String? _threadName;
  String get threadName => _threadName ?? '';
  set threadName(String? val) => _threadName = val;
  bool hasThreadName() => _threadName != null;

  // "threadImage" field.
  String? _threadImage;
  String get threadImage => _threadImage ?? '';
  set threadImage(String? val) => _threadImage = val;
  bool hasThreadImage() => _threadImage != null;

  static ThreadsStruct fromMap(Map<String, dynamic> data) => ThreadsStruct(
        threadId: data['threadId'] as String?,
        threadName: data['threadName'] as String?,
        threadImage: data['threadImage'] as String?,
      );

  static ThreadsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ThreadsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'threadId': _threadId,
        'threadName': _threadName,
        'threadImage': _threadImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'threadId': serializeParam(
          _threadId,
          ParamType.String,
        ),
        'threadName': serializeParam(
          _threadName,
          ParamType.String,
        ),
        'threadImage': serializeParam(
          _threadImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static ThreadsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ThreadsStruct(
        threadId: deserializeParam(
          data['threadId'],
          ParamType.String,
          false,
        ),
        threadName: deserializeParam(
          data['threadName'],
          ParamType.String,
          false,
        ),
        threadImage: deserializeParam(
          data['threadImage'],
          ParamType.String,
          false,
        ),
      );

  static ThreadsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ThreadsStruct(
        threadId: convertAlgoliaParam(
          data['threadId'],
          ParamType.String,
          false,
        ),
        threadName: convertAlgoliaParam(
          data['threadName'],
          ParamType.String,
          false,
        ),
        threadImage: convertAlgoliaParam(
          data['threadImage'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ThreadsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ThreadsStruct &&
        threadId == other.threadId &&
        threadName == other.threadName &&
        threadImage == other.threadImage;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([threadId, threadName, threadImage]);
}

ThreadsStruct createThreadsStruct({
  String? threadId,
  String? threadName,
  String? threadImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ThreadsStruct(
      threadId: threadId,
      threadName: threadName,
      threadImage: threadImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ThreadsStruct? updateThreadsStruct(
  ThreadsStruct? threads, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    threads
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addThreadsStructData(
  Map<String, dynamic> firestoreData,
  ThreadsStruct? threads,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (threads == null) {
    return;
  }
  if (threads.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && threads.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final threadsData = getThreadsFirestoreData(threads, forFieldValue);
  final nestedData = threadsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = threads.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getThreadsFirestoreData(
  ThreadsStruct? threads, [
  bool forFieldValue = false,
]) {
  if (threads == null) {
    return {};
  }
  final firestoreData = mapToFirestore(threads.toMap());

  // Add any Firestore field values
  threads.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getThreadsListFirestoreData(
  List<ThreadsStruct>? threadss,
) =>
    threadss?.map((e) => getThreadsFirestoreData(e, true)).toList() ?? [];
