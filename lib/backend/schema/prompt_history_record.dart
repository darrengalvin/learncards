import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromptHistoryRecord extends FirestoreRecord {
  PromptHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "prompt" field.
  String? _prompt;
  String get prompt => _prompt ?? '';
  bool hasPrompt() => _prompt != null;

  // "dateChanged" field.
  String? _dateChanged;
  String get dateChanged => _dateChanged ?? '';
  bool hasDateChanged() => _dateChanged != null;

  // "companyId" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  // "changedBy" field.
  String? _changedBy;
  String get changedBy => _changedBy ?? '';
  bool hasChangedBy() => _changedBy != null;

  void _initializeFields() {
    _prompt = snapshotData['prompt'] as String?;
    _dateChanged = snapshotData['dateChanged'] as String?;
    _companyId = snapshotData['companyId'] as String?;
    _changedBy = snapshotData['changedBy'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promptHistory');

  static Stream<PromptHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromptHistoryRecord.fromSnapshot(s));

  static Future<PromptHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromptHistoryRecord.fromSnapshot(s));

  static PromptHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromptHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromptHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromptHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromptHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromptHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromptHistoryRecordData({
  String? prompt,
  String? dateChanged,
  String? companyId,
  String? changedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'prompt': prompt,
      'dateChanged': dateChanged,
      'companyId': companyId,
      'changedBy': changedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromptHistoryRecordDocumentEquality
    implements Equality<PromptHistoryRecord> {
  const PromptHistoryRecordDocumentEquality();

  @override
  bool equals(PromptHistoryRecord? e1, PromptHistoryRecord? e2) {
    return e1?.prompt == e2?.prompt &&
        e1?.dateChanged == e2?.dateChanged &&
        e1?.companyId == e2?.companyId &&
        e1?.changedBy == e2?.changedBy;
  }

  @override
  int hash(PromptHistoryRecord? e) => const ListEquality()
      .hash([e?.prompt, e?.dateChanged, e?.companyId, e?.changedBy]);

  @override
  bool isValidKey(Object? o) => o is PromptHistoryRecord;
}
