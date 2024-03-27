import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EnquiriesRecord extends FirestoreRecord {
  EnquiriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "enquiry" field.
  String? _enquiry;
  String get enquiry => _enquiry ?? '';
  bool hasEnquiry() => _enquiry != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "phonenumber" field.
  String? _phonenumber;
  String get phonenumber => _phonenumber ?? '';
  bool hasPhonenumber() => _phonenumber != null;

  // "datesent" field.
  DateTime? _datesent;
  DateTime? get datesent => _datesent;
  bool hasDatesent() => _datesent != null;

  // "level" field.
  String? _level;
  String get level => _level ?? '';
  bool hasLevel() => _level != null;

  // "userpic" field.
  String? _userpic;
  String get userpic => _userpic ?? '';
  bool hasUserpic() => _userpic != null;

  void _initializeFields() {
    _enquiry = snapshotData['enquiry'] as String?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _username = snapshotData['username'] as String?;
    _phonenumber = snapshotData['phonenumber'] as String?;
    _datesent = snapshotData['datesent'] as DateTime?;
    _level = snapshotData['level'] as String?;
    _userpic = snapshotData['userpic'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('enquiries');

  static Stream<EnquiriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EnquiriesRecord.fromSnapshot(s));

  static Future<EnquiriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EnquiriesRecord.fromSnapshot(s));

  static EnquiriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EnquiriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EnquiriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EnquiriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EnquiriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EnquiriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEnquiriesRecordData({
  String? enquiry,
  DocumentReference? uid,
  String? username,
  String? phonenumber,
  DateTime? datesent,
  String? level,
  String? userpic,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'enquiry': enquiry,
      'uid': uid,
      'username': username,
      'phonenumber': phonenumber,
      'datesent': datesent,
      'level': level,
      'userpic': userpic,
    }.withoutNulls,
  );

  return firestoreData;
}

class EnquiriesRecordDocumentEquality implements Equality<EnquiriesRecord> {
  const EnquiriesRecordDocumentEquality();

  @override
  bool equals(EnquiriesRecord? e1, EnquiriesRecord? e2) {
    return e1?.enquiry == e2?.enquiry &&
        e1?.uid == e2?.uid &&
        e1?.username == e2?.username &&
        e1?.phonenumber == e2?.phonenumber &&
        e1?.datesent == e2?.datesent &&
        e1?.level == e2?.level &&
        e1?.userpic == e2?.userpic;
  }

  @override
  int hash(EnquiriesRecord? e) => const ListEquality().hash([
        e?.enquiry,
        e?.uid,
        e?.username,
        e?.phonenumber,
        e?.datesent,
        e?.level,
        e?.userpic
      ]);

  @override
  bool isValidKey(Object? o) => o is EnquiriesRecord;
}
