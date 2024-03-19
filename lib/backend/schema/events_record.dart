import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "datetime" field.
  DateTime? _datetime;
  DateTime? get datetime => _datetime;
  bool hasDatetime() => _datetime != null;

  // "tiles" field.
  List<String>? _tiles;
  List<String> get tiles => _tiles ?? const [];
  bool hasTiles() => _tiles != null;

  // "eventtype" field.
  String? _eventtype;
  String get eventtype => _eventtype ?? '';
  bool hasEventtype() => _eventtype != null;

  // "memberlevel" field.
  List<String>? _memberlevel;
  List<String> get memberlevel => _memberlevel ?? const [];
  bool hasMemberlevel() => _memberlevel != null;

  // "tileref" field.
  List<DocumentReference>? _tileref;
  List<DocumentReference> get tileref => _tileref ?? const [];
  bool hasTileref() => _tileref != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _location = snapshotData['location'] as String?;
    _datetime = snapshotData['datetime'] as DateTime?;
    _tiles = getDataList(snapshotData['tiles']);
    _eventtype = snapshotData['eventtype'] as String?;
    _memberlevel = getDataList(snapshotData['memberlevel']);
    _tileref = getDataList(snapshotData['tileref']);
    _summary = snapshotData['summary'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? title,
  String? location,
  DateTime? datetime,
  String? eventtype,
  String? summary,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'location': location,
      'datetime': datetime,
      'eventtype': eventtype,
      'summary': summary,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.location == e2?.location &&
        e1?.datetime == e2?.datetime &&
        listEquality.equals(e1?.tiles, e2?.tiles) &&
        e1?.eventtype == e2?.eventtype &&
        listEquality.equals(e1?.memberlevel, e2?.memberlevel) &&
        listEquality.equals(e1?.tileref, e2?.tileref) &&
        e1?.summary == e2?.summary;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.location,
        e?.datetime,
        e?.tiles,
        e?.eventtype,
        e?.memberlevel,
        e?.tileref,
        e?.summary
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
