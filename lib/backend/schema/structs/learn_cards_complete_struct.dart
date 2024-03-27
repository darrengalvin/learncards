// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LearnCardsCompleteStruct extends FFFirebaseStruct {
  LearnCardsCompleteStruct({
    String? learncardId,
    int? threadCount,
    double? timeOnLearnCard,
    List<String>? chatThreads,
    String? learnCardTitle,
    DateTime? completedDateTime,
    DateTime? startedDateTime,
    bool? feedbackProvided,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _learncardId = learncardId,
        _threadCount = threadCount,
        _timeOnLearnCard = timeOnLearnCard,
        _chatThreads = chatThreads,
        _learnCardTitle = learnCardTitle,
        _completedDateTime = completedDateTime,
        _startedDateTime = startedDateTime,
        _feedbackProvided = feedbackProvided,
        super(firestoreUtilData);

  // "learncardId" field.
  String? _learncardId;
  String get learncardId => _learncardId ?? '';
  set learncardId(String? val) => _learncardId = val;
  bool hasLearncardId() => _learncardId != null;

  // "threadCount" field.
  int? _threadCount;
  int get threadCount => _threadCount ?? 0;
  set threadCount(int? val) => _threadCount = val;
  void incrementThreadCount(int amount) => _threadCount = threadCount + amount;
  bool hasThreadCount() => _threadCount != null;

  // "timeOnLearnCard" field.
  double? _timeOnLearnCard;
  double get timeOnLearnCard => _timeOnLearnCard ?? 0.0;
  set timeOnLearnCard(double? val) => _timeOnLearnCard = val;
  void incrementTimeOnLearnCard(double amount) =>
      _timeOnLearnCard = timeOnLearnCard + amount;
  bool hasTimeOnLearnCard() => _timeOnLearnCard != null;

  // "chatThreads" field.
  List<String>? _chatThreads;
  List<String> get chatThreads => _chatThreads ?? const [];
  set chatThreads(List<String>? val) => _chatThreads = val;
  void updateChatThreads(Function(List<String>) updateFn) =>
      updateFn(_chatThreads ??= []);
  bool hasChatThreads() => _chatThreads != null;

  // "learnCardTitle" field.
  String? _learnCardTitle;
  String get learnCardTitle => _learnCardTitle ?? '';
  set learnCardTitle(String? val) => _learnCardTitle = val;
  bool hasLearnCardTitle() => _learnCardTitle != null;

  // "completedDateTime" field.
  DateTime? _completedDateTime;
  DateTime? get completedDateTime => _completedDateTime;
  set completedDateTime(DateTime? val) => _completedDateTime = val;
  bool hasCompletedDateTime() => _completedDateTime != null;

  // "startedDateTime" field.
  DateTime? _startedDateTime;
  DateTime? get startedDateTime => _startedDateTime;
  set startedDateTime(DateTime? val) => _startedDateTime = val;
  bool hasStartedDateTime() => _startedDateTime != null;

  // "feedbackProvided" field.
  bool? _feedbackProvided;
  bool get feedbackProvided => _feedbackProvided ?? false;
  set feedbackProvided(bool? val) => _feedbackProvided = val;
  bool hasFeedbackProvided() => _feedbackProvided != null;

  static LearnCardsCompleteStruct fromMap(Map<String, dynamic> data) =>
      LearnCardsCompleteStruct(
        learncardId: data['learncardId'] as String?,
        threadCount: castToType<int>(data['threadCount']),
        timeOnLearnCard: castToType<double>(data['timeOnLearnCard']),
        chatThreads: getDataList(data['chatThreads']),
        learnCardTitle: data['learnCardTitle'] as String?,
        completedDateTime: data['completedDateTime'] as DateTime?,
        startedDateTime: data['startedDateTime'] as DateTime?,
        feedbackProvided: data['feedbackProvided'] as bool?,
      );

  static LearnCardsCompleteStruct? maybeFromMap(dynamic data) => data is Map
      ? LearnCardsCompleteStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'learncardId': _learncardId,
        'threadCount': _threadCount,
        'timeOnLearnCard': _timeOnLearnCard,
        'chatThreads': _chatThreads,
        'learnCardTitle': _learnCardTitle,
        'completedDateTime': _completedDateTime,
        'startedDateTime': _startedDateTime,
        'feedbackProvided': _feedbackProvided,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'learncardId': serializeParam(
          _learncardId,
          ParamType.String,
        ),
        'threadCount': serializeParam(
          _threadCount,
          ParamType.int,
        ),
        'timeOnLearnCard': serializeParam(
          _timeOnLearnCard,
          ParamType.double,
        ),
        'chatThreads': serializeParam(
          _chatThreads,
          ParamType.String,
          true,
        ),
        'learnCardTitle': serializeParam(
          _learnCardTitle,
          ParamType.String,
        ),
        'completedDateTime': serializeParam(
          _completedDateTime,
          ParamType.DateTime,
        ),
        'startedDateTime': serializeParam(
          _startedDateTime,
          ParamType.DateTime,
        ),
        'feedbackProvided': serializeParam(
          _feedbackProvided,
          ParamType.bool,
        ),
      }.withoutNulls;

  static LearnCardsCompleteStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LearnCardsCompleteStruct(
        learncardId: deserializeParam(
          data['learncardId'],
          ParamType.String,
          false,
        ),
        threadCount: deserializeParam(
          data['threadCount'],
          ParamType.int,
          false,
        ),
        timeOnLearnCard: deserializeParam(
          data['timeOnLearnCard'],
          ParamType.double,
          false,
        ),
        chatThreads: deserializeParam<String>(
          data['chatThreads'],
          ParamType.String,
          true,
        ),
        learnCardTitle: deserializeParam(
          data['learnCardTitle'],
          ParamType.String,
          false,
        ),
        completedDateTime: deserializeParam(
          data['completedDateTime'],
          ParamType.DateTime,
          false,
        ),
        startedDateTime: deserializeParam(
          data['startedDateTime'],
          ParamType.DateTime,
          false,
        ),
        feedbackProvided: deserializeParam(
          data['feedbackProvided'],
          ParamType.bool,
          false,
        ),
      );

  static LearnCardsCompleteStruct fromAlgoliaData(Map<String, dynamic> data) =>
      LearnCardsCompleteStruct(
        learncardId: convertAlgoliaParam(
          data['learncardId'],
          ParamType.String,
          false,
        ),
        threadCount: convertAlgoliaParam(
          data['threadCount'],
          ParamType.int,
          false,
        ),
        timeOnLearnCard: convertAlgoliaParam(
          data['timeOnLearnCard'],
          ParamType.double,
          false,
        ),
        chatThreads: convertAlgoliaParam<String>(
          data['chatThreads'],
          ParamType.String,
          true,
        ),
        learnCardTitle: convertAlgoliaParam(
          data['learnCardTitle'],
          ParamType.String,
          false,
        ),
        completedDateTime: convertAlgoliaParam(
          data['completedDateTime'],
          ParamType.DateTime,
          false,
        ),
        startedDateTime: convertAlgoliaParam(
          data['startedDateTime'],
          ParamType.DateTime,
          false,
        ),
        feedbackProvided: convertAlgoliaParam(
          data['feedbackProvided'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'LearnCardsCompleteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LearnCardsCompleteStruct &&
        learncardId == other.learncardId &&
        threadCount == other.threadCount &&
        timeOnLearnCard == other.timeOnLearnCard &&
        listEquality.equals(chatThreads, other.chatThreads) &&
        learnCardTitle == other.learnCardTitle &&
        completedDateTime == other.completedDateTime &&
        startedDateTime == other.startedDateTime &&
        feedbackProvided == other.feedbackProvided;
  }

  @override
  int get hashCode => const ListEquality().hash([
        learncardId,
        threadCount,
        timeOnLearnCard,
        chatThreads,
        learnCardTitle,
        completedDateTime,
        startedDateTime,
        feedbackProvided
      ]);
}

LearnCardsCompleteStruct createLearnCardsCompleteStruct({
  String? learncardId,
  int? threadCount,
  double? timeOnLearnCard,
  String? learnCardTitle,
  DateTime? completedDateTime,
  DateTime? startedDateTime,
  bool? feedbackProvided,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LearnCardsCompleteStruct(
      learncardId: learncardId,
      threadCount: threadCount,
      timeOnLearnCard: timeOnLearnCard,
      learnCardTitle: learnCardTitle,
      completedDateTime: completedDateTime,
      startedDateTime: startedDateTime,
      feedbackProvided: feedbackProvided,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LearnCardsCompleteStruct? updateLearnCardsCompleteStruct(
  LearnCardsCompleteStruct? learnCardsComplete, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    learnCardsComplete
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLearnCardsCompleteStructData(
  Map<String, dynamic> firestoreData,
  LearnCardsCompleteStruct? learnCardsComplete,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (learnCardsComplete == null) {
    return;
  }
  if (learnCardsComplete.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && learnCardsComplete.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final learnCardsCompleteData =
      getLearnCardsCompleteFirestoreData(learnCardsComplete, forFieldValue);
  final nestedData =
      learnCardsCompleteData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      learnCardsComplete.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLearnCardsCompleteFirestoreData(
  LearnCardsCompleteStruct? learnCardsComplete, [
  bool forFieldValue = false,
]) {
  if (learnCardsComplete == null) {
    return {};
  }
  final firestoreData = mapToFirestore(learnCardsComplete.toMap());

  // Add any Firestore field values
  learnCardsComplete.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLearnCardsCompleteListFirestoreData(
  List<LearnCardsCompleteStruct>? learnCardsCompletes,
) =>
    learnCardsCompletes
        ?.map((e) => getLearnCardsCompleteFirestoreData(e, true))
        .toList() ??
    [];
