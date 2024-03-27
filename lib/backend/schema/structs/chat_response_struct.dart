// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatResponseStruct extends FFFirebaseStruct {
  ChatResponseStruct({
    String? content,
    String? role,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _content = content,
        _role = role,
        super(firestoreUtilData);

  // "content" field.
  String? _content;
  String get content => _content ?? 'contentPRovided';
  set content(String? val) => _content = val;
  bool hasContent() => _content != null;

  // "role" field.
  String? _role;
  String get role => _role ?? 'RoleProvided';
  set role(String? val) => _role = val;
  bool hasRole() => _role != null;

  static ChatResponseStruct fromMap(Map<String, dynamic> data) =>
      ChatResponseStruct(
        content: data['content'] as String?,
        role: data['role'] as String?,
      );

  static ChatResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'content': _content,
        'role': _role,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatResponseStruct(
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
      );

  static ChatResponseStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ChatResponseStruct(
        content: convertAlgoliaParam(
          data['content'],
          ParamType.String,
          false,
        ),
        role: convertAlgoliaParam(
          data['role'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ChatResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatResponseStruct &&
        content == other.content &&
        role == other.role;
  }

  @override
  int get hashCode => const ListEquality().hash([content, role]);
}

ChatResponseStruct createChatResponseStruct({
  String? content,
  String? role,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatResponseStruct(
      content: content,
      role: role,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatResponseStruct? updateChatResponseStruct(
  ChatResponseStruct? chatResponse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatResponse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatResponseStructData(
  Map<String, dynamic> firestoreData,
  ChatResponseStruct? chatResponse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatResponse == null) {
    return;
  }
  if (chatResponse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatResponse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatResponseData =
      getChatResponseFirestoreData(chatResponse, forFieldValue);
  final nestedData =
      chatResponseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatResponse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatResponseFirestoreData(
  ChatResponseStruct? chatResponse, [
  bool forFieldValue = false,
]) {
  if (chatResponse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatResponse.toMap());

  // Add any Firestore field values
  chatResponse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatResponseListFirestoreData(
  List<ChatResponseStruct>? chatResponses,
) =>
    chatResponses?.map((e) => getChatResponseFirestoreData(e, true)).toList() ??
    [];
