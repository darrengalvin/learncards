import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnalyticsRecord extends FirestoreRecord {
  AnalyticsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "tile" field.
  DocumentReference? _tile;
  DocumentReference? get tile => _tile;
  bool hasTile() => _tile != null;

  // "action" field.
  String? _action;
  String get action => _action ?? '';
  bool hasAction() => _action != null;

  // "timespent" field.
  int? _timespent;
  int get timespent => _timespent ?? 0;
  bool hasTimespent() => _timespent != null;

  // "analytics" field.
  AnalyticSessionStruct? _analytics;
  AnalyticSessionStruct get analytics => _analytics ?? AnalyticSessionStruct();
  bool hasAnalytics() => _analytics != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _tile = snapshotData['tile'] as DocumentReference?;
    _action = snapshotData['action'] as String?;
    _timespent = castToType<int>(snapshotData['timespent']);
    _analytics = AnalyticSessionStruct.maybeFromMap(snapshotData['analytics']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('analytics');

  static Stream<AnalyticsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnalyticsRecord.fromSnapshot(s));

  static Future<AnalyticsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnalyticsRecord.fromSnapshot(s));

  static AnalyticsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnalyticsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnalyticsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnalyticsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnalyticsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnalyticsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnalyticsRecordData({
  DocumentReference? user,
  DateTime? date,
  DocumentReference? tile,
  String? action,
  int? timespent,
  AnalyticSessionStruct? analytics,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'date': date,
      'tile': tile,
      'action': action,
      'timespent': timespent,
      'analytics': AnalyticSessionStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "analytics" field.
  addAnalyticSessionStructData(firestoreData, analytics, 'analytics');

  return firestoreData;
}

class AnalyticsRecordDocumentEquality implements Equality<AnalyticsRecord> {
  const AnalyticsRecordDocumentEquality();

  @override
  bool equals(AnalyticsRecord? e1, AnalyticsRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.date == e2?.date &&
        e1?.tile == e2?.tile &&
        e1?.action == e2?.action &&
        e1?.timespent == e2?.timespent &&
        e1?.analytics == e2?.analytics;
  }

  @override
  int hash(AnalyticsRecord? e) => const ListEquality()
      .hash([e?.user, e?.date, e?.tile, e?.action, e?.timespent, e?.analytics]);

  @override
  bool isValidKey(Object? o) => o is AnalyticsRecord;
}
