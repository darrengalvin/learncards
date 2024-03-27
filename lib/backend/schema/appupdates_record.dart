import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppupdatesRecord extends FirestoreRecord {
  AppupdatesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "item" field.
  List<String>? _item;
  List<String> get item => _item ?? const [];
  bool hasItem() => _item != null;

  // "version" field.
  int? _version;
  int get version => _version ?? 0;
  bool hasVersion() => _version != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  void _initializeFields() {
    _item = getDataList(snapshotData['item']);
    _version = castToType<int>(snapshotData['version']);
    _date = snapshotData['date'] as DateTime?;
    _video = snapshotData['video'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appupdates');

  static Stream<AppupdatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppupdatesRecord.fromSnapshot(s));

  static Future<AppupdatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppupdatesRecord.fromSnapshot(s));

  static AppupdatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppupdatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppupdatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppupdatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppupdatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppupdatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppupdatesRecordData({
  int? version,
  DateTime? date,
  String? video,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'version': version,
      'date': date,
      'video': video,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppupdatesRecordDocumentEquality implements Equality<AppupdatesRecord> {
  const AppupdatesRecordDocumentEquality();

  @override
  bool equals(AppupdatesRecord? e1, AppupdatesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.item, e2?.item) &&
        e1?.version == e2?.version &&
        e1?.date == e2?.date &&
        e1?.video == e2?.video;
  }

  @override
  int hash(AppupdatesRecord? e) =>
      const ListEquality().hash([e?.item, e?.version, e?.date, e?.video]);

  @override
  bool isValidKey(Object? o) => o is AppupdatesRecord;
}
