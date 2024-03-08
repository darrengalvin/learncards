import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class AppEntriesRecord extends FirestoreRecord {
  AppEntriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "isai" field.
  bool? _isai;
  bool get isai => _isai ?? false;
  bool hasIsai() => _isai != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "reply" field.
  String? _reply;
  String get reply => _reply ?? '';
  bool hasReply() => _reply != null;

  // "dateposted" field.
  DateTime? _dateposted;
  DateTime? get dateposted => _dateposted;
  bool hasDateposted() => _dateposted != null;

  // "tileblockref" field.
  DocumentReference? _tileblockref;
  DocumentReference? get tileblockref => _tileblockref;
  bool hasTileblockref() => _tileblockref != null;

  // "questionnotshown" field.
  String? _questionnotshown;
  String get questionnotshown => _questionnotshown ?? '';
  bool hasQuestionnotshown() => _questionnotshown != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _isai = snapshotData['isai'] as bool?;
    _video = snapshotData['video'] as String?;
    _image = snapshotData['image'] as String?;
    _question = snapshotData['question'] as String?;
    _reply = snapshotData['reply'] as String?;
    _dateposted = snapshotData['dateposted'] as DateTime?;
    _tileblockref = snapshotData['tileblockref'] as DocumentReference?;
    _questionnotshown = snapshotData['questionnotshown'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appEntries');

  static Stream<AppEntriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppEntriesRecord.fromSnapshot(s));

  static Future<AppEntriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppEntriesRecord.fromSnapshot(s));

  static AppEntriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppEntriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppEntriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppEntriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppEntriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppEntriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppEntriesRecordData({
  DocumentReference? uid,
  bool? isai,
  String? video,
  String? image,
  String? question,
  String? reply,
  DateTime? dateposted,
  DocumentReference? tileblockref,
  String? questionnotshown,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'isai': isai,
      'video': video,
      'image': image,
      'question': question,
      'reply': reply,
      'dateposted': dateposted,
      'tileblockref': tileblockref,
      'questionnotshown': questionnotshown,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppEntriesRecordDocumentEquality implements Equality<AppEntriesRecord> {
  const AppEntriesRecordDocumentEquality();

  @override
  bool equals(AppEntriesRecord? e1, AppEntriesRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.isai == e2?.isai &&
        e1?.video == e2?.video &&
        e1?.image == e2?.image &&
        e1?.question == e2?.question &&
        e1?.reply == e2?.reply &&
        e1?.dateposted == e2?.dateposted &&
        e1?.tileblockref == e2?.tileblockref &&
        e1?.questionnotshown == e2?.questionnotshown;
  }

  @override
  int hash(AppEntriesRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.isai,
        e?.video,
        e?.image,
        e?.question,
        e?.reply,
        e?.dateposted,
        e?.tileblockref,
        e?.questionnotshown
      ]);

  @override
  bool isValidKey(Object? o) => o is AppEntriesRecord;
}
