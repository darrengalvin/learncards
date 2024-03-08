import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class BugreportingRecord extends FirestoreRecord {
  BugreportingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "issue" field.
  String? _issue;
  String get issue => _issue ?? '';
  bool hasIssue() => _issue != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "suggestion" field.
  String? _suggestion;
  String get suggestion => _suggestion ?? '';
  bool hasSuggestion() => _suggestion != null;

  // "replicate" field.
  String? _replicate;
  String get replicate => _replicate ?? '';
  bool hasReplicate() => _replicate != null;

  // "whichpage" field.
  String? _whichpage;
  String get whichpage => _whichpage ?? '';
  bool hasWhichpage() => _whichpage != null;

  // "whichapp" field.
  String? _whichapp;
  String get whichapp => _whichapp ?? '';
  bool hasWhichapp() => _whichapp != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _issue = snapshotData['issue'] as String?;
    _image = snapshotData['image'] as String?;
    _video = snapshotData['video'] as String?;
    _reason = snapshotData['reason'] as String?;
    _suggestion = snapshotData['suggestion'] as String?;
    _replicate = snapshotData['replicate'] as String?;
    _whichpage = snapshotData['whichpage'] as String?;
    _whichapp = snapshotData['whichapp'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bugreporting');

  static Stream<BugreportingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BugreportingRecord.fromSnapshot(s));

  static Future<BugreportingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BugreportingRecord.fromSnapshot(s));

  static BugreportingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BugreportingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BugreportingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BugreportingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BugreportingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BugreportingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBugreportingRecordData({
  DocumentReference? uid,
  String? type,
  String? issue,
  String? image,
  String? video,
  String? reason,
  String? suggestion,
  String? replicate,
  String? whichpage,
  String? whichapp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'type': type,
      'issue': issue,
      'image': image,
      'video': video,
      'reason': reason,
      'suggestion': suggestion,
      'replicate': replicate,
      'whichpage': whichpage,
      'whichapp': whichapp,
    }.withoutNulls,
  );

  return firestoreData;
}

class BugreportingRecordDocumentEquality
    implements Equality<BugreportingRecord> {
  const BugreportingRecordDocumentEquality();

  @override
  bool equals(BugreportingRecord? e1, BugreportingRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.type == e2?.type &&
        e1?.issue == e2?.issue &&
        e1?.image == e2?.image &&
        e1?.video == e2?.video &&
        e1?.reason == e2?.reason &&
        e1?.suggestion == e2?.suggestion &&
        e1?.replicate == e2?.replicate &&
        e1?.whichpage == e2?.whichpage &&
        e1?.whichapp == e2?.whichapp;
  }

  @override
  int hash(BugreportingRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.type,
        e?.issue,
        e?.image,
        e?.video,
        e?.reason,
        e?.suggestion,
        e?.replicate,
        e?.whichpage,
        e?.whichapp
      ]);

  @override
  bool isValidKey(Object? o) => o is BugreportingRecord;
}
