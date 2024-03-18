import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AccesspendingRecord extends FirestoreRecord {
  AccesspendingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "bodycontent" field.
  String? _bodycontent;
  String get bodycontent => _bodycontent ?? '';
  bool hasBodycontent() => _bodycontent != null;

  // "memberlevel" field.
  List<String>? _memberlevel;
  List<String> get memberlevel => _memberlevel ?? const [];
  bool hasMemberlevel() => _memberlevel != null;

  // "users" field.
  DocumentReference? _users;
  DocumentReference? get users => _users;
  bool hasUsers() => _users != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _video = snapshotData['video'] as String?;
    _image = snapshotData['image'] as String?;
    _bodycontent = snapshotData['bodycontent'] as String?;
    _memberlevel = getDataList(snapshotData['memberlevel']);
    _users = snapshotData['users'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('accesspending');

  static Stream<AccesspendingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AccesspendingRecord.fromSnapshot(s));

  static Future<AccesspendingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AccesspendingRecord.fromSnapshot(s));

  static AccesspendingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AccesspendingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AccesspendingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AccesspendingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AccesspendingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AccesspendingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAccesspendingRecordData({
  String? title,
  String? video,
  String? image,
  String? bodycontent,
  DocumentReference? users,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'video': video,
      'image': image,
      'bodycontent': bodycontent,
      'users': users,
    }.withoutNulls,
  );

  return firestoreData;
}

class AccesspendingRecordDocumentEquality
    implements Equality<AccesspendingRecord> {
  const AccesspendingRecordDocumentEquality();

  @override
  bool equals(AccesspendingRecord? e1, AccesspendingRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.video == e2?.video &&
        e1?.image == e2?.image &&
        e1?.bodycontent == e2?.bodycontent &&
        listEquality.equals(e1?.memberlevel, e2?.memberlevel) &&
        e1?.users == e2?.users;
  }

  @override
  int hash(AccesspendingRecord? e) => const ListEquality().hash(
      [e?.title, e?.video, e?.image, e?.bodycontent, e?.memberlevel, e?.users]);

  @override
  bool isValidKey(Object? o) => o is AccesspendingRecord;
}
