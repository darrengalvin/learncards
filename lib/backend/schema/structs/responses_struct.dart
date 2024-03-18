// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponsesStruct extends FFFirebaseStruct {
  ResponsesStruct({
    String? input,
    String? reply,
    String? question,
    String? answer,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _input = input,
        _reply = reply,
        _question = question,
        _answer = answer,
        super(firestoreUtilData);

  // "input" field.
  String? _input;
  String get input => _input ?? '';
  set input(String? val) => _input = val;
  bool hasInput() => _input != null;

  // "reply" field.
  String? _reply;
  String get reply => _reply ?? '';
  set reply(String? val) => _reply = val;
  bool hasReply() => _reply != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;
  bool hasQuestion() => _question != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  set answer(String? val) => _answer = val;
  bool hasAnswer() => _answer != null;

  static ResponsesStruct fromMap(Map<String, dynamic> data) => ResponsesStruct(
        input: data['input'] as String?,
        reply: data['reply'] as String?,
        question: data['question'] as String?,
        answer: data['answer'] as String?,
      );

  static ResponsesStruct? maybeFromMap(dynamic data) => data is Map
      ? ResponsesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'input': _input,
        'reply': _reply,
        'question': _question,
        'answer': _answer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'input': serializeParam(
          _input,
          ParamType.String,
        ),
        'reply': serializeParam(
          _reply,
          ParamType.String,
        ),
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'answer': serializeParam(
          _answer,
          ParamType.String,
        ),
      }.withoutNulls;

  static ResponsesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResponsesStruct(
        input: deserializeParam(
          data['input'],
          ParamType.String,
          false,
        ),
        reply: deserializeParam(
          data['reply'],
          ParamType.String,
          false,
        ),
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        answer: deserializeParam(
          data['answer'],
          ParamType.String,
          false,
        ),
      );

  static ResponsesStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ResponsesStruct(
        input: convertAlgoliaParam(
          data['input'],
          ParamType.String,
          false,
        ),
        reply: convertAlgoliaParam(
          data['reply'],
          ParamType.String,
          false,
        ),
        question: convertAlgoliaParam(
          data['question'],
          ParamType.String,
          false,
        ),
        answer: convertAlgoliaParam(
          data['answer'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ResponsesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ResponsesStruct &&
        input == other.input &&
        reply == other.reply &&
        question == other.question &&
        answer == other.answer;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([input, reply, question, answer]);
}

ResponsesStruct createResponsesStruct({
  String? input,
  String? reply,
  String? question,
  String? answer,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ResponsesStruct(
      input: input,
      reply: reply,
      question: question,
      answer: answer,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ResponsesStruct? updateResponsesStruct(
  ResponsesStruct? responses, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    responses
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addResponsesStructData(
  Map<String, dynamic> firestoreData,
  ResponsesStruct? responses,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (responses == null) {
    return;
  }
  if (responses.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && responses.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final responsesData = getResponsesFirestoreData(responses, forFieldValue);
  final nestedData = responsesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = responses.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getResponsesFirestoreData(
  ResponsesStruct? responses, [
  bool forFieldValue = false,
]) {
  if (responses == null) {
    return {};
  }
  final firestoreData = mapToFirestore(responses.toMap());

  // Add any Firestore field values
  responses.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getResponsesListFirestoreData(
  List<ResponsesStruct>? responsess,
) =>
    responsess?.map((e) => getResponsesFirestoreData(e, true)).toList() ?? [];
