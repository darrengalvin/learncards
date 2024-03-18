import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SocialcommentsdeeperRecord extends FirestoreRecord {
  SocialcommentsdeeperRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "timeposted" field.
  DateTime? _timeposted;
  DateTime? get timeposted => _timeposted;
  bool hasTimeposted() => _timeposted != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "postid" field.
  DocumentReference? _postid;
  DocumentReference? get postid => _postid;
  bool hasPostid() => _postid != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "like" field.
  List<DocumentReference>? _like;
  List<DocumentReference> get like => _like ?? const [];
  bool hasLike() => _like != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "usersphoto" field.
  String? _usersphoto;
  String get usersphoto => _usersphoto ?? '';
  bool hasUsersphoto() => _usersphoto != null;

  // "memberlevel" field.
  String? _memberlevel;
  String get memberlevel => _memberlevel ?? '';
  bool hasMemberlevel() => _memberlevel != null;

  // "posterphoto" field.
  String? _posterphoto;
  String get posterphoto => _posterphoto ?? '';
  bool hasPosterphoto() => _posterphoto != null;

  // "tonotify" field.
  List<DocumentReference>? _tonotify;
  List<DocumentReference> get tonotify => _tonotify ?? const [];
  bool hasTonotify() => _tonotify != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timeposted = snapshotData['timeposted'] as DateTime?;
    _comment = snapshotData['comment'] as String?;
    _postid = snapshotData['postid'] as DocumentReference?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _like = getDataList(snapshotData['like']);
    _username = snapshotData['username'] as String?;
    _usersphoto = snapshotData['usersphoto'] as String?;
    _memberlevel = snapshotData['memberlevel'] as String?;
    _posterphoto = snapshotData['posterphoto'] as String?;
    _tonotify = getDataList(snapshotData['tonotify']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('socialcommentsdeeper')
          : FirebaseFirestore.instance.collectionGroup('socialcommentsdeeper');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('socialcommentsdeeper').doc(id);

  static Stream<SocialcommentsdeeperRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => SocialcommentsdeeperRecord.fromSnapshot(s));

  static Future<SocialcommentsdeeperRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SocialcommentsdeeperRecord.fromSnapshot(s));

  static SocialcommentsdeeperRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SocialcommentsdeeperRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SocialcommentsdeeperRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SocialcommentsdeeperRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SocialcommentsdeeperRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SocialcommentsdeeperRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSocialcommentsdeeperRecordData({
  DateTime? timeposted,
  String? comment,
  DocumentReference? postid,
  DocumentReference? uid,
  String? username,
  String? usersphoto,
  String? memberlevel,
  String? posterphoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timeposted': timeposted,
      'comment': comment,
      'postid': postid,
      'uid': uid,
      'username': username,
      'usersphoto': usersphoto,
      'memberlevel': memberlevel,
      'posterphoto': posterphoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class SocialcommentsdeeperRecordDocumentEquality
    implements Equality<SocialcommentsdeeperRecord> {
  const SocialcommentsdeeperRecordDocumentEquality();

  @override
  bool equals(SocialcommentsdeeperRecord? e1, SocialcommentsdeeperRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timeposted == e2?.timeposted &&
        e1?.comment == e2?.comment &&
        e1?.postid == e2?.postid &&
        e1?.uid == e2?.uid &&
        listEquality.equals(e1?.like, e2?.like) &&
        e1?.username == e2?.username &&
        e1?.usersphoto == e2?.usersphoto &&
        e1?.memberlevel == e2?.memberlevel &&
        e1?.posterphoto == e2?.posterphoto &&
        listEquality.equals(e1?.tonotify, e2?.tonotify);
  }

  @override
  int hash(SocialcommentsdeeperRecord? e) => const ListEquality().hash([
        e?.timeposted,
        e?.comment,
        e?.postid,
        e?.uid,
        e?.like,
        e?.username,
        e?.usersphoto,
        e?.memberlevel,
        e?.posterphoto,
        e?.tonotify
      ]);

  @override
  bool isValidKey(Object? o) => o is SocialcommentsdeeperRecord;
}
