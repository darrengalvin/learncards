import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SocialFeedsCommentNewRecord extends FirestoreRecord {
  SocialFeedsCommentNewRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "postId" field.
  int? _postId;
  int get postId => _postId ?? 0;
  bool hasPostId() => _postId != null;

  // "timePosted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  void _initializeFields() {
    _postId = castToType<int>(snapshotData['postId']);
    _timePosted = snapshotData['timePosted'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('socialFeedsCommentNew');

  static Stream<SocialFeedsCommentNewRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => SocialFeedsCommentNewRecord.fromSnapshot(s));

  static Future<SocialFeedsCommentNewRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SocialFeedsCommentNewRecord.fromSnapshot(s));

  static SocialFeedsCommentNewRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SocialFeedsCommentNewRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SocialFeedsCommentNewRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SocialFeedsCommentNewRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SocialFeedsCommentNewRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SocialFeedsCommentNewRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSocialFeedsCommentNewRecordData({
  int? postId,
  DateTime? timePosted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postId': postId,
      'timePosted': timePosted,
    }.withoutNulls,
  );

  return firestoreData;
}

class SocialFeedsCommentNewRecordDocumentEquality
    implements Equality<SocialFeedsCommentNewRecord> {
  const SocialFeedsCommentNewRecordDocumentEquality();

  @override
  bool equals(
      SocialFeedsCommentNewRecord? e1, SocialFeedsCommentNewRecord? e2) {
    return e1?.postId == e2?.postId && e1?.timePosted == e2?.timePosted;
  }

  @override
  int hash(SocialFeedsCommentNewRecord? e) =>
      const ListEquality().hash([e?.postId, e?.timePosted]);

  @override
  bool isValidKey(Object? o) => o is SocialFeedsCommentNewRecord;
}
