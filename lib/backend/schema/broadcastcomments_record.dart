import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class BroadcastcommentsRecord extends FirestoreRecord {
  BroadcastcommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "userimage" field.
  String? _userimage;
  String get userimage => _userimage ?? '';
  bool hasUserimage() => _userimage != null;

  // "imagecomment" field.
  String? _imagecomment;
  String get imagecomment => _imagecomment ?? '';
  bool hasImagecomment() => _imagecomment != null;

  // "videocomment" field.
  String? _videocomment;
  String get videocomment => _videocomment ?? '';
  bool hasVideocomment() => _videocomment != null;

  // "broadcastrefid" field.
  DocumentReference? _broadcastrefid;
  DocumentReference? get broadcastrefid => _broadcastrefid;
  bool hasBroadcastrefid() => _broadcastrefid != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _url = snapshotData['url'] as String?;
    _description = snapshotData['description'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _comment = snapshotData['comment'] as String?;
    _userimage = snapshotData['userimage'] as String?;
    _imagecomment = snapshotData['imagecomment'] as String?;
    _videocomment = snapshotData['videocomment'] as String?;
    _broadcastrefid = snapshotData['broadcastrefid'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('broadcastcomments')
          : FirebaseFirestore.instance.collectionGroup('broadcastcomments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('broadcastcomments').doc(id);

  static Stream<BroadcastcommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BroadcastcommentsRecord.fromSnapshot(s));

  static Future<BroadcastcommentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BroadcastcommentsRecord.fromSnapshot(s));

  static BroadcastcommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BroadcastcommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BroadcastcommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BroadcastcommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BroadcastcommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BroadcastcommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBroadcastcommentsRecordData({
  DocumentReference? uid,
  String? name,
  String? url,
  String? description,
  DateTime? time,
  String? comment,
  String? userimage,
  String? imagecomment,
  String? videocomment,
  DocumentReference? broadcastrefid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'name': name,
      'url': url,
      'description': description,
      'time': time,
      'comment': comment,
      'userimage': userimage,
      'imagecomment': imagecomment,
      'videocomment': videocomment,
      'broadcastrefid': broadcastrefid,
    }.withoutNulls,
  );

  return firestoreData;
}

class BroadcastcommentsRecordDocumentEquality
    implements Equality<BroadcastcommentsRecord> {
  const BroadcastcommentsRecordDocumentEquality();

  @override
  bool equals(BroadcastcommentsRecord? e1, BroadcastcommentsRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.name == e2?.name &&
        e1?.url == e2?.url &&
        e1?.description == e2?.description &&
        e1?.time == e2?.time &&
        e1?.comment == e2?.comment &&
        e1?.userimage == e2?.userimage &&
        e1?.imagecomment == e2?.imagecomment &&
        e1?.videocomment == e2?.videocomment &&
        e1?.broadcastrefid == e2?.broadcastrefid;
  }

  @override
  int hash(BroadcastcommentsRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.name,
        e?.url,
        e?.description,
        e?.time,
        e?.comment,
        e?.userimage,
        e?.imagecomment,
        e?.videocomment,
        e?.broadcastrefid
      ]);

  @override
  bool isValidKey(Object? o) => o is BroadcastcommentsRecord;
}
