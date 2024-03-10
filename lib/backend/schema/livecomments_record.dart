import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class LivecommentsRecord extends FirestoreRecord {
  LivecommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "videoid" field.
  DocumentReference? _videoid;
  DocumentReference? get videoid => _videoid;
  bool hasVideoid() => _videoid != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "muxurl" field.
  String? _muxurl;
  String get muxurl => _muxurl ?? '';
  bool hasMuxurl() => _muxurl != null;

  // "nameencode" field.
  String? _nameencode;
  String get nameencode => _nameencode ?? '';
  bool hasNameencode() => _nameencode != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  // "videoencode" field.
  String? _videoencode;
  String get videoencode => _videoencode ?? '';
  bool hasVideoencode() => _videoencode != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "userimage" field.
  String? _userimage;
  String get userimage => _userimage ?? '';
  bool hasUserimage() => _userimage != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "broadcastID" field.
  DocumentReference? _broadcastID;
  DocumentReference? get broadcastID => _broadcastID;
  bool hasBroadcastID() => _broadcastID != null;

  void _initializeFields() {
    _videoid = snapshotData['videoid'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
    _muxurl = snapshotData['muxurl'] as String?;
    _nameencode = snapshotData['nameencode'] as String?;
    _comments = snapshotData['comments'] as String?;
    _videoencode = snapshotData['videoencode'] as String?;
    _username = snapshotData['username'] as String?;
    _userimage = snapshotData['userimage'] as String?;
    _video = snapshotData['video'] as String?;
    _image = snapshotData['image'] as String?;
    _broadcastID = snapshotData['broadcastID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('livecomments');

  static Stream<LivecommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LivecommentsRecord.fromSnapshot(s));

  static Future<LivecommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LivecommentsRecord.fromSnapshot(s));

  static LivecommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LivecommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LivecommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LivecommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LivecommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LivecommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLivecommentsRecordData({
  DocumentReference? videoid,
  DocumentReference? user,
  DateTime? time,
  String? muxurl,
  String? nameencode,
  String? comments,
  String? videoencode,
  String? username,
  String? userimage,
  String? video,
  String? image,
  DocumentReference? broadcastID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'videoid': videoid,
      'user': user,
      'time': time,
      'muxurl': muxurl,
      'nameencode': nameencode,
      'comments': comments,
      'videoencode': videoencode,
      'username': username,
      'userimage': userimage,
      'video': video,
      'image': image,
      'broadcastID': broadcastID,
    }.withoutNulls,
  );

  return firestoreData;
}

class LivecommentsRecordDocumentEquality
    implements Equality<LivecommentsRecord> {
  const LivecommentsRecordDocumentEquality();

  @override
  bool equals(LivecommentsRecord? e1, LivecommentsRecord? e2) {
    return e1?.videoid == e2?.videoid &&
        e1?.user == e2?.user &&
        e1?.time == e2?.time &&
        e1?.muxurl == e2?.muxurl &&
        e1?.nameencode == e2?.nameencode &&
        e1?.comments == e2?.comments &&
        e1?.videoencode == e2?.videoencode &&
        e1?.username == e2?.username &&
        e1?.userimage == e2?.userimage &&
        e1?.video == e2?.video &&
        e1?.image == e2?.image &&
        e1?.broadcastID == e2?.broadcastID;
  }

  @override
  int hash(LivecommentsRecord? e) => const ListEquality().hash([
        e?.videoid,
        e?.user,
        e?.time,
        e?.muxurl,
        e?.nameencode,
        e?.comments,
        e?.videoencode,
        e?.username,
        e?.userimage,
        e?.video,
        e?.image,
        e?.broadcastID
      ]);

  @override
  bool isValidKey(Object? o) => o is LivecommentsRecord;
}
