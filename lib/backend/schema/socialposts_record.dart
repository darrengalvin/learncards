import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SocialpostsRecord extends FirestoreRecord {
  SocialpostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "comments" field.
  List<DocumentReference>? _comments;
  List<DocumentReference> get comments => _comments ?? const [];
  bool hasComments() => _comments != null;

  // "datetime" field.
  DateTime? _datetime;
  DateTime? get datetime => _datetime;
  bool hasDatetime() => _datetime != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "posterphoto" field.
  String? _posterphoto;
  String get posterphoto => _posterphoto ?? '';
  bool hasPosterphoto() => _posterphoto != null;

  // "posttitle" field.
  String? _posttitle;
  String get posttitle => _posttitle ?? '';
  bool hasPosttitle() => _posttitle != null;

  // "postdescription" field.
  String? _postdescription;
  String get postdescription => _postdescription ?? '';
  bool hasPostdescription() => _postdescription != null;

  // "postuser" field.
  DocumentReference? _postuser;
  DocumentReference? get postuser => _postuser;
  bool hasPostuser() => _postuser != null;

  // "numbercomments" field.
  int? _numbercomments;
  int get numbercomments => _numbercomments ?? 0;
  bool hasNumbercomments() => _numbercomments != null;

  // "postowner" field.
  bool? _postowner;
  bool get postowner => _postowner ?? false;
  bool hasPostowner() => _postowner != null;

  // "reported" field.
  DocumentReference? _reported;
  DocumentReference? get reported => _reported;
  bool hasReported() => _reported != null;

  // "tonotify" field.
  List<DocumentReference>? _tonotify;
  List<DocumentReference> get tonotify => _tonotify ?? const [];
  bool hasTonotify() => _tonotify != null;

  // "tileref" field.
  DocumentReference? _tileref;
  DocumentReference? get tileref => _tileref;
  bool hasTileref() => _tileref != null;

  // "tileblockref" field.
  DocumentReference? _tileblockref;
  DocumentReference? get tileblockref => _tileblockref;
  bool hasTileblockref() => _tileblockref != null;

  // "socialfeedref" field.
  DocumentReference? _socialfeedref;
  DocumentReference? get socialfeedref => _socialfeedref;
  bool hasSocialfeedref() => _socialfeedref != null;

  // "islive" field.
  bool? _islive;
  bool get islive => _islive ?? false;
  bool hasIslive() => _islive != null;

  // "liveurl" field.
  String? _liveurl;
  String get liveurl => _liveurl ?? '';
  bool hasLiveurl() => _liveurl != null;

  // "memberlevel" field.
  List<String>? _memberlevel;
  List<String> get memberlevel => _memberlevel ?? const [];
  bool hasMemberlevel() => _memberlevel != null;

  // "video2" field.
  String? _video2;
  String get video2 => _video2 ?? '';
  bool hasVideo2() => _video2 != null;

  void _initializeFields() {
    _username = snapshotData['username'] as String?;
    _photo = snapshotData['photo'] as String?;
    _video = snapshotData['video'] as String?;
    _comments = getDataList(snapshotData['comments']);
    _datetime = snapshotData['datetime'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _posterphoto = snapshotData['posterphoto'] as String?;
    _posttitle = snapshotData['posttitle'] as String?;
    _postdescription = snapshotData['postdescription'] as String?;
    _postuser = snapshotData['postuser'] as DocumentReference?;
    _numbercomments = castToType<int>(snapshotData['numbercomments']);
    _postowner = snapshotData['postowner'] as bool?;
    _reported = snapshotData['reported'] as DocumentReference?;
    _tonotify = getDataList(snapshotData['tonotify']);
    _tileref = snapshotData['tileref'] as DocumentReference?;
    _tileblockref = snapshotData['tileblockref'] as DocumentReference?;
    _socialfeedref = snapshotData['socialfeedref'] as DocumentReference?;
    _islive = snapshotData['islive'] as bool?;
    _liveurl = snapshotData['liveurl'] as String?;
    _memberlevel = getDataList(snapshotData['memberlevel']);
    _video2 = snapshotData['video2'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('socialposts');

  static Stream<SocialpostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SocialpostsRecord.fromSnapshot(s));

  static Future<SocialpostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SocialpostsRecord.fromSnapshot(s));

  static SocialpostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SocialpostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SocialpostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SocialpostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SocialpostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SocialpostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSocialpostsRecordData({
  String? username,
  String? photo,
  String? video,
  DateTime? datetime,
  String? posterphoto,
  String? posttitle,
  String? postdescription,
  DocumentReference? postuser,
  int? numbercomments,
  bool? postowner,
  DocumentReference? reported,
  DocumentReference? tileref,
  DocumentReference? tileblockref,
  DocumentReference? socialfeedref,
  bool? islive,
  String? liveurl,
  String? video2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'username': username,
      'photo': photo,
      'video': video,
      'datetime': datetime,
      'posterphoto': posterphoto,
      'posttitle': posttitle,
      'postdescription': postdescription,
      'postuser': postuser,
      'numbercomments': numbercomments,
      'postowner': postowner,
      'reported': reported,
      'tileref': tileref,
      'tileblockref': tileblockref,
      'socialfeedref': socialfeedref,
      'islive': islive,
      'liveurl': liveurl,
      'video2': video2,
    }.withoutNulls,
  );

  return firestoreData;
}

class SocialpostsRecordDocumentEquality implements Equality<SocialpostsRecord> {
  const SocialpostsRecordDocumentEquality();

  @override
  bool equals(SocialpostsRecord? e1, SocialpostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.username == e2?.username &&
        e1?.photo == e2?.photo &&
        e1?.video == e2?.video &&
        listEquality.equals(e1?.comments, e2?.comments) &&
        e1?.datetime == e2?.datetime &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.posterphoto == e2?.posterphoto &&
        e1?.posttitle == e2?.posttitle &&
        e1?.postdescription == e2?.postdescription &&
        e1?.postuser == e2?.postuser &&
        e1?.numbercomments == e2?.numbercomments &&
        e1?.postowner == e2?.postowner &&
        e1?.reported == e2?.reported &&
        listEquality.equals(e1?.tonotify, e2?.tonotify) &&
        e1?.tileref == e2?.tileref &&
        e1?.tileblockref == e2?.tileblockref &&
        e1?.socialfeedref == e2?.socialfeedref &&
        e1?.islive == e2?.islive &&
        e1?.liveurl == e2?.liveurl &&
        listEquality.equals(e1?.memberlevel, e2?.memberlevel) &&
        e1?.video2 == e2?.video2;
  }

  @override
  int hash(SocialpostsRecord? e) => const ListEquality().hash([
        e?.username,
        e?.photo,
        e?.video,
        e?.comments,
        e?.datetime,
        e?.likes,
        e?.posterphoto,
        e?.posttitle,
        e?.postdescription,
        e?.postuser,
        e?.numbercomments,
        e?.postowner,
        e?.reported,
        e?.tonotify,
        e?.tileref,
        e?.tileblockref,
        e?.socialfeedref,
        e?.islive,
        e?.liveurl,
        e?.memberlevel,
        e?.video2
      ]);

  @override
  bool isValidKey(Object? o) => o is SocialpostsRecord;
}
