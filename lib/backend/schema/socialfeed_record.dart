import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SocialfeedRecord extends FirestoreRecord {
  SocialfeedRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "random" field.
  String? _random;
  String get random => _random ?? '';
  bool hasRandom() => _random != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "postcount" field.
  int? _postcount;
  int get postcount => _postcount ?? 0;
  bool hasPostcount() => _postcount != null;

  // "linkedtile" field.
  DocumentReference? _linkedtile;
  DocumentReference? get linkedtile => _linkedtile;
  bool hasLinkedtile() => _linkedtile != null;

  // "socialfeedref" field.
  DocumentReference? _socialfeedref;
  DocumentReference? get socialfeedref => _socialfeedref;
  bool hasSocialfeedref() => _socialfeedref != null;

  void _initializeFields() {
    _category = snapshotData['category'] as String?;
    _users = getDataList(snapshotData['users']);
    _random = snapshotData['random'] as String?;
    _name = snapshotData['name'] as String?;
    _summary = snapshotData['summary'] as String?;
    _postcount = castToType<int>(snapshotData['postcount']);
    _linkedtile = snapshotData['linkedtile'] as DocumentReference?;
    _socialfeedref = snapshotData['socialfeedref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('socialfeed');

  static Stream<SocialfeedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SocialfeedRecord.fromSnapshot(s));

  static Future<SocialfeedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SocialfeedRecord.fromSnapshot(s));

  static SocialfeedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SocialfeedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SocialfeedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SocialfeedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SocialfeedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SocialfeedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSocialfeedRecordData({
  String? category,
  String? random,
  String? name,
  String? summary,
  int? postcount,
  DocumentReference? linkedtile,
  DocumentReference? socialfeedref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
      'random': random,
      'name': name,
      'summary': summary,
      'postcount': postcount,
      'linkedtile': linkedtile,
      'socialfeedref': socialfeedref,
    }.withoutNulls,
  );

  return firestoreData;
}

class SocialfeedRecordDocumentEquality implements Equality<SocialfeedRecord> {
  const SocialfeedRecordDocumentEquality();

  @override
  bool equals(SocialfeedRecord? e1, SocialfeedRecord? e2) {
    const listEquality = ListEquality();
    return e1?.category == e2?.category &&
        listEquality.equals(e1?.users, e2?.users) &&
        e1?.random == e2?.random &&
        e1?.name == e2?.name &&
        e1?.summary == e2?.summary &&
        e1?.postcount == e2?.postcount &&
        e1?.linkedtile == e2?.linkedtile &&
        e1?.socialfeedref == e2?.socialfeedref;
  }

  @override
  int hash(SocialfeedRecord? e) => const ListEquality().hash([
        e?.category,
        e?.users,
        e?.random,
        e?.name,
        e?.summary,
        e?.postcount,
        e?.linkedtile,
        e?.socialfeedref
      ]);

  @override
  bool isValidKey(Object? o) => o is SocialfeedRecord;
}
