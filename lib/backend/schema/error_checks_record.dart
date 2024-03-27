import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ErrorChecksRecord extends FirestoreRecord {
  ErrorChecksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "checkName" field.
  String? _checkName;
  String get checkName => _checkName ?? '';
  bool hasCheckName() => _checkName != null;

  // "checkDescription" field.
  String? _checkDescription;
  String get checkDescription => _checkDescription ?? '';
  bool hasCheckDescription() => _checkDescription != null;

  // "checkDate" field.
  DateTime? _checkDate;
  DateTime? get checkDate => _checkDate;
  bool hasCheckDate() => _checkDate != null;

  // "checkTime" field.
  DateTime? _checkTime;
  DateTime? get checkTime => _checkTime;
  bool hasCheckTime() => _checkTime != null;

  // "checkSession" field.
  String? _checkSession;
  String get checkSession => _checkSession ?? '';
  bool hasCheckSession() => _checkSession != null;

  // "checkStatus" field.
  bool? _checkStatus;
  bool get checkStatus => _checkStatus ?? false;
  bool hasCheckStatus() => _checkStatus != null;

  // "notifyAdmin" field.
  bool? _notifyAdmin;
  bool get notifyAdmin => _notifyAdmin ?? false;
  bool hasNotifyAdmin() => _notifyAdmin != null;

  // "checksList" field.
  List<String>? _checksList;
  List<String> get checksList => _checksList ?? const [];
  bool hasChecksList() => _checksList != null;

  // "resultMessage" field.
  String? _resultMessage;
  String get resultMessage => _resultMessage ?? '';
  bool hasResultMessage() => _resultMessage != null;

  // "warningFlag" field.
  bool? _warningFlag;
  bool get warningFlag => _warningFlag ?? false;
  bool hasWarningFlag() => _warningFlag != null;

  void _initializeFields() {
    _checkName = snapshotData['checkName'] as String?;
    _checkDescription = snapshotData['checkDescription'] as String?;
    _checkDate = snapshotData['checkDate'] as DateTime?;
    _checkTime = snapshotData['checkTime'] as DateTime?;
    _checkSession = snapshotData['checkSession'] as String?;
    _checkStatus = snapshotData['checkStatus'] as bool?;
    _notifyAdmin = snapshotData['notifyAdmin'] as bool?;
    _checksList = getDataList(snapshotData['checksList']);
    _resultMessage = snapshotData['resultMessage'] as String?;
    _warningFlag = snapshotData['warningFlag'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('errorChecks');

  static Stream<ErrorChecksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ErrorChecksRecord.fromSnapshot(s));

  static Future<ErrorChecksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ErrorChecksRecord.fromSnapshot(s));

  static ErrorChecksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ErrorChecksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ErrorChecksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ErrorChecksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ErrorChecksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ErrorChecksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createErrorChecksRecordData({
  String? checkName,
  String? checkDescription,
  DateTime? checkDate,
  DateTime? checkTime,
  String? checkSession,
  bool? checkStatus,
  bool? notifyAdmin,
  String? resultMessage,
  bool? warningFlag,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'checkName': checkName,
      'checkDescription': checkDescription,
      'checkDate': checkDate,
      'checkTime': checkTime,
      'checkSession': checkSession,
      'checkStatus': checkStatus,
      'notifyAdmin': notifyAdmin,
      'resultMessage': resultMessage,
      'warningFlag': warningFlag,
    }.withoutNulls,
  );

  return firestoreData;
}

class ErrorChecksRecordDocumentEquality implements Equality<ErrorChecksRecord> {
  const ErrorChecksRecordDocumentEquality();

  @override
  bool equals(ErrorChecksRecord? e1, ErrorChecksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.checkName == e2?.checkName &&
        e1?.checkDescription == e2?.checkDescription &&
        e1?.checkDate == e2?.checkDate &&
        e1?.checkTime == e2?.checkTime &&
        e1?.checkSession == e2?.checkSession &&
        e1?.checkStatus == e2?.checkStatus &&
        e1?.notifyAdmin == e2?.notifyAdmin &&
        listEquality.equals(e1?.checksList, e2?.checksList) &&
        e1?.resultMessage == e2?.resultMessage &&
        e1?.warningFlag == e2?.warningFlag;
  }

  @override
  int hash(ErrorChecksRecord? e) => const ListEquality().hash([
        e?.checkName,
        e?.checkDescription,
        e?.checkDate,
        e?.checkTime,
        e?.checkSession,
        e?.checkStatus,
        e?.notifyAdmin,
        e?.checksList,
        e?.resultMessage,
        e?.warningFlag
      ]);

  @override
  bool isValidKey(Object? o) => o is ErrorChecksRecord;
}
