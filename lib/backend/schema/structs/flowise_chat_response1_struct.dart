// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FlowiseChatResponse1Struct extends FFFirebaseStruct {
  FlowiseChatResponse1Struct({
    String? text,
    List<PageContentStruct>? sourceDocuments,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        _sourceDocuments = sourceDocuments,
        super(firestoreUtilData);

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  // "sourceDocuments" field.
  List<PageContentStruct>? _sourceDocuments;
  List<PageContentStruct> get sourceDocuments => _sourceDocuments ?? const [];
  set sourceDocuments(List<PageContentStruct>? val) => _sourceDocuments = val;
  void updateSourceDocuments(Function(List<PageContentStruct>) updateFn) =>
      updateFn(_sourceDocuments ??= []);
  bool hasSourceDocuments() => _sourceDocuments != null;

  static FlowiseChatResponse1Struct fromMap(Map<String, dynamic> data) =>
      FlowiseChatResponse1Struct(
        text: data['text'] as String?,
        sourceDocuments: getStructList(
          data['sourceDocuments'],
          PageContentStruct.fromMap,
        ),
      );

  static FlowiseChatResponse1Struct? maybeFromMap(dynamic data) => data is Map
      ? FlowiseChatResponse1Struct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'sourceDocuments': _sourceDocuments?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'sourceDocuments': serializeParam(
          _sourceDocuments,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static FlowiseChatResponse1Struct fromSerializableMap(
          Map<String, dynamic> data) =>
      FlowiseChatResponse1Struct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        sourceDocuments: deserializeStructParam<PageContentStruct>(
          data['sourceDocuments'],
          ParamType.DataStruct,
          true,
          structBuilder: PageContentStruct.fromSerializableMap,
        ),
      );

  static FlowiseChatResponse1Struct fromAlgoliaData(
          Map<String, dynamic> data) =>
      FlowiseChatResponse1Struct(
        text: convertAlgoliaParam(
          data['text'],
          ParamType.String,
          false,
        ),
        sourceDocuments: convertAlgoliaParam<PageContentStruct>(
          data['sourceDocuments'],
          ParamType.DataStruct,
          true,
          structBuilder: PageContentStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'FlowiseChatResponse1Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FlowiseChatResponse1Struct &&
        text == other.text &&
        listEquality.equals(sourceDocuments, other.sourceDocuments);
  }

  @override
  int get hashCode => const ListEquality().hash([text, sourceDocuments]);
}

FlowiseChatResponse1Struct createFlowiseChatResponse1Struct({
  String? text,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FlowiseChatResponse1Struct(
      text: text,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FlowiseChatResponse1Struct? updateFlowiseChatResponse1Struct(
  FlowiseChatResponse1Struct? flowiseChatResponse1, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    flowiseChatResponse1
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFlowiseChatResponse1StructData(
  Map<String, dynamic> firestoreData,
  FlowiseChatResponse1Struct? flowiseChatResponse1,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (flowiseChatResponse1 == null) {
    return;
  }
  if (flowiseChatResponse1.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && flowiseChatResponse1.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final flowiseChatResponse1Data =
      getFlowiseChatResponse1FirestoreData(flowiseChatResponse1, forFieldValue);
  final nestedData =
      flowiseChatResponse1Data.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      flowiseChatResponse1.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFlowiseChatResponse1FirestoreData(
  FlowiseChatResponse1Struct? flowiseChatResponse1, [
  bool forFieldValue = false,
]) {
  if (flowiseChatResponse1 == null) {
    return {};
  }
  final firestoreData = mapToFirestore(flowiseChatResponse1.toMap());

  // Add any Firestore field values
  flowiseChatResponse1.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFlowiseChatResponse1ListFirestoreData(
  List<FlowiseChatResponse1Struct>? flowiseChatResponse1s,
) =>
    flowiseChatResponse1s
        ?.map((e) => getFlowiseChatResponse1FirestoreData(e, true))
        .toList() ??
    [];
