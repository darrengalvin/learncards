import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoryRecord extends FirestoreRecord {
  HistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tileid" field.
  DocumentReference? _tileid;
  DocumentReference? get tileid => _tileid;
  bool hasTileid() => _tileid != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "datevisited" field.
  DateTime? _datevisited;
  DateTime? get datevisited => _datevisited;
  bool hasDatevisited() => _datevisited != null;

  // "tilename" field.
  String? _tilename;
  String get tilename => _tilename ?? '';
  bool hasTilename() => _tilename != null;

  // "pinned" field.
  bool? _pinned;
  bool get pinned => _pinned ?? false;
  bool hasPinned() => _pinned != null;

  // "showvideoinslider" field.
  bool? _showvideoinslider;
  bool get showvideoinslider => _showvideoinslider ?? false;
  bool hasShowvideoinslider() => _showvideoinslider != null;

  // "showtextblocks" field.
  bool? _showtextblocks;
  bool get showtextblocks => _showtextblocks ?? false;
  bool hasShowtextblocks() => _showtextblocks != null;

  // "showdocs" field.
  bool? _showdocs;
  bool get showdocs => _showdocs ?? false;
  bool hasShowdocs() => _showdocs != null;

  // "showlinks" field.
  bool? _showlinks;
  bool get showlinks => _showlinks ?? false;
  bool hasShowlinks() => _showlinks != null;

  // "showsubtiles" field.
  bool? _showsubtiles;
  bool get showsubtiles => _showsubtiles ?? false;
  bool hasShowsubtiles() => _showsubtiles != null;

  // "showbuttons" field.
  bool? _showbuttons;
  bool get showbuttons => _showbuttons ?? false;
  bool hasShowbuttons() => _showbuttons != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "issub" field.
  bool? _issub;
  bool get issub => _issub ?? false;
  bool hasIssub() => _issub != null;

  // "tileref" field.
  DocumentReference? _tileref;
  DocumentReference? get tileref => _tileref;
  bool hasTileref() => _tileref != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tileid = snapshotData['tileid'] as DocumentReference?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _datevisited = snapshotData['datevisited'] as DateTime?;
    _tilename = snapshotData['tilename'] as String?;
    _pinned = snapshotData['pinned'] as bool?;
    _showvideoinslider = snapshotData['showvideoinslider'] as bool?;
    _showtextblocks = snapshotData['showtextblocks'] as bool?;
    _showdocs = snapshotData['showdocs'] as bool?;
    _showlinks = snapshotData['showlinks'] as bool?;
    _showsubtiles = snapshotData['showsubtiles'] as bool?;
    _showbuttons = snapshotData['showbuttons'] as bool?;
    _id = castToType<int>(snapshotData['id']);
    _issub = snapshotData['issub'] as bool?;
    _tileref = snapshotData['tileref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('history')
          : FirebaseFirestore.instance.collectionGroup('history');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('history').doc(id);

  static Stream<HistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HistoryRecord.fromSnapshot(s));

  static Future<HistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HistoryRecord.fromSnapshot(s));

  static HistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHistoryRecordData({
  DocumentReference? tileid,
  DocumentReference? uid,
  DateTime? datevisited,
  String? tilename,
  bool? pinned,
  bool? showvideoinslider,
  bool? showtextblocks,
  bool? showdocs,
  bool? showlinks,
  bool? showsubtiles,
  bool? showbuttons,
  int? id,
  bool? issub,
  DocumentReference? tileref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tileid': tileid,
      'uid': uid,
      'datevisited': datevisited,
      'tilename': tilename,
      'pinned': pinned,
      'showvideoinslider': showvideoinslider,
      'showtextblocks': showtextblocks,
      'showdocs': showdocs,
      'showlinks': showlinks,
      'showsubtiles': showsubtiles,
      'showbuttons': showbuttons,
      'id': id,
      'issub': issub,
      'tileref': tileref,
    }.withoutNulls,
  );

  return firestoreData;
}

class HistoryRecordDocumentEquality implements Equality<HistoryRecord> {
  const HistoryRecordDocumentEquality();

  @override
  bool equals(HistoryRecord? e1, HistoryRecord? e2) {
    return e1?.tileid == e2?.tileid &&
        e1?.uid == e2?.uid &&
        e1?.datevisited == e2?.datevisited &&
        e1?.tilename == e2?.tilename &&
        e1?.pinned == e2?.pinned &&
        e1?.showvideoinslider == e2?.showvideoinslider &&
        e1?.showtextblocks == e2?.showtextblocks &&
        e1?.showdocs == e2?.showdocs &&
        e1?.showlinks == e2?.showlinks &&
        e1?.showsubtiles == e2?.showsubtiles &&
        e1?.showbuttons == e2?.showbuttons &&
        e1?.id == e2?.id &&
        e1?.issub == e2?.issub &&
        e1?.tileref == e2?.tileref;
  }

  @override
  int hash(HistoryRecord? e) => const ListEquality().hash([
        e?.tileid,
        e?.uid,
        e?.datevisited,
        e?.tilename,
        e?.pinned,
        e?.showvideoinslider,
        e?.showtextblocks,
        e?.showdocs,
        e?.showlinks,
        e?.showsubtiles,
        e?.showbuttons,
        e?.id,
        e?.issub,
        e?.tileref
      ]);

  @override
  bool isValidKey(Object? o) => o is HistoryRecord;
}
