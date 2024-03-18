import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BroadcastsRecord extends FirestoreRecord {
  BroadcastsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "is_live" field.
  bool? _isLive;
  bool get isLive => _isLive ?? false;
  bool hasIsLive() => _isLive != null;

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

  // "whosonline" field.
  List<String>? _whosonline;
  List<String> get whosonline => _whosonline ?? const [];
  bool hasWhosonline() => _whosonline != null;

  // "online" field.
  List<DocumentReference>? _online;
  List<DocumentReference> get online => _online ?? const [];
  bool hasOnline() => _online != null;

  // "audience" field.
  List<String>? _audience;
  List<String> get audience => _audience ?? const [];
  bool hasAudience() => _audience != null;

  // "replay" field.
  String? _replay;
  String get replay => _replay ?? '';
  bool hasReplay() => _replay != null;

  // "notify" field.
  List<DocumentReference>? _notify;
  List<DocumentReference> get notify => _notify ?? const [];
  bool hasNotify() => _notify != null;

  // "linkedSocialPost" field.
  DocumentReference? _linkedSocialPost;
  DocumentReference? get linkedSocialPost => _linkedSocialPost;
  bool hasLinkedSocialPost() => _linkedSocialPost != null;

  void _initializeFields() {
    _isLive = snapshotData['is_live'] as bool?;
    _name = snapshotData['name'] as String?;
    _url = snapshotData['url'] as String?;
    _description = snapshotData['description'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _whosonline = getDataList(snapshotData['whosonline']);
    _online = getDataList(snapshotData['online']);
    _audience = getDataList(snapshotData['audience']);
    _replay = snapshotData['replay'] as String?;
    _notify = getDataList(snapshotData['notify']);
    _linkedSocialPost = snapshotData['linkedSocialPost'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('broadcasts');

  static Stream<BroadcastsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BroadcastsRecord.fromSnapshot(s));

  static Future<BroadcastsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BroadcastsRecord.fromSnapshot(s));

  static BroadcastsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BroadcastsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BroadcastsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BroadcastsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BroadcastsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BroadcastsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBroadcastsRecordData({
  bool? isLive,
  String? name,
  String? url,
  String? description,
  DateTime? time,
  String? replay,
  DocumentReference? linkedSocialPost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'is_live': isLive,
      'name': name,
      'url': url,
      'description': description,
      'time': time,
      'replay': replay,
      'linkedSocialPost': linkedSocialPost,
    }.withoutNulls,
  );

  return firestoreData;
}

class BroadcastsRecordDocumentEquality implements Equality<BroadcastsRecord> {
  const BroadcastsRecordDocumentEquality();

  @override
  bool equals(BroadcastsRecord? e1, BroadcastsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.isLive == e2?.isLive &&
        e1?.name == e2?.name &&
        e1?.url == e2?.url &&
        e1?.description == e2?.description &&
        e1?.time == e2?.time &&
        listEquality.equals(e1?.whosonline, e2?.whosonline) &&
        listEquality.equals(e1?.online, e2?.online) &&
        listEquality.equals(e1?.audience, e2?.audience) &&
        e1?.replay == e2?.replay &&
        listEquality.equals(e1?.notify, e2?.notify) &&
        e1?.linkedSocialPost == e2?.linkedSocialPost;
  }

  @override
  int hash(BroadcastsRecord? e) => const ListEquality().hash([
        e?.isLive,
        e?.name,
        e?.url,
        e?.description,
        e?.time,
        e?.whosonline,
        e?.online,
        e?.audience,
        e?.replay,
        e?.notify,
        e?.linkedSocialPost
      ]);

  @override
  bool isValidKey(Object? o) => o is BroadcastsRecord;
}
