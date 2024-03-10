import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class LearnCardEntryCommentsRecord extends FirestoreRecord {
  LearnCardEntryCommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "associatedLearnCard" field.
  String? _associatedLearnCard;
  String get associatedLearnCard => _associatedLearnCard ?? '';
  bool hasAssociatedLearnCard() => _associatedLearnCard != null;

  // "commentDetails" field.
  String? _commentDetails;
  String get commentDetails => _commentDetails ?? '';
  bool hasCommentDetails() => _commentDetails != null;

  // "commentedBy" field.
  String? _commentedBy;
  String get commentedBy => _commentedBy ?? '';
  bool hasCommentedBy() => _commentedBy != null;

  // "commentLikes" field.
  String? _commentLikes;
  String get commentLikes => _commentLikes ?? '';
  bool hasCommentLikes() => _commentLikes != null;

  // "associatedLearnCardEntry" field.
  String? _associatedLearnCardEntry;
  String get associatedLearnCardEntry => _associatedLearnCardEntry ?? '';
  bool hasAssociatedLearnCardEntry() => _associatedLearnCardEntry != null;

  // "commentTime" field.
  DateTime? _commentTime;
  DateTime? get commentTime => _commentTime;
  bool hasCommentTime() => _commentTime != null;

  // "private" field.
  bool? _private;
  bool get private => _private ?? false;
  bool hasPrivate() => _private != null;

  void _initializeFields() {
    _associatedLearnCard = snapshotData['associatedLearnCard'] as String?;
    _commentDetails = snapshotData['commentDetails'] as String?;
    _commentedBy = snapshotData['commentedBy'] as String?;
    _commentLikes = snapshotData['commentLikes'] as String?;
    _associatedLearnCardEntry =
        snapshotData['associatedLearnCardEntry'] as String?;
    _commentTime = snapshotData['commentTime'] as DateTime?;
    _private = snapshotData['private'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('learnCardEntryComments');

  static Stream<LearnCardEntryCommentsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => LearnCardEntryCommentsRecord.fromSnapshot(s));

  static Future<LearnCardEntryCommentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => LearnCardEntryCommentsRecord.fromSnapshot(s));

  static LearnCardEntryCommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LearnCardEntryCommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LearnCardEntryCommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LearnCardEntryCommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LearnCardEntryCommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LearnCardEntryCommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLearnCardEntryCommentsRecordData({
  String? associatedLearnCard,
  String? commentDetails,
  String? commentedBy,
  String? commentLikes,
  String? associatedLearnCardEntry,
  DateTime? commentTime,
  bool? private,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'associatedLearnCard': associatedLearnCard,
      'commentDetails': commentDetails,
      'commentedBy': commentedBy,
      'commentLikes': commentLikes,
      'associatedLearnCardEntry': associatedLearnCardEntry,
      'commentTime': commentTime,
      'private': private,
    }.withoutNulls,
  );

  return firestoreData;
}

class LearnCardEntryCommentsRecordDocumentEquality
    implements Equality<LearnCardEntryCommentsRecord> {
  const LearnCardEntryCommentsRecordDocumentEquality();

  @override
  bool equals(
      LearnCardEntryCommentsRecord? e1, LearnCardEntryCommentsRecord? e2) {
    return e1?.associatedLearnCard == e2?.associatedLearnCard &&
        e1?.commentDetails == e2?.commentDetails &&
        e1?.commentedBy == e2?.commentedBy &&
        e1?.commentLikes == e2?.commentLikes &&
        e1?.associatedLearnCardEntry == e2?.associatedLearnCardEntry &&
        e1?.commentTime == e2?.commentTime &&
        e1?.private == e2?.private;
  }

  @override
  int hash(LearnCardEntryCommentsRecord? e) => const ListEquality().hash([
        e?.associatedLearnCard,
        e?.commentDetails,
        e?.commentedBy,
        e?.commentLikes,
        e?.associatedLearnCardEntry,
        e?.commentTime,
        e?.private
      ]);

  @override
  bool isValidKey(Object? o) => o is LearnCardEntryCommentsRecord;
}
