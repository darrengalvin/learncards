import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OnboardingformsRecord extends FirestoreRecord {
  OnboardingformsRecord._(
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

  // "wherenow" field.
  String? _wherenow;
  String get wherenow => _wherenow ?? '';
  bool hasWherenow() => _wherenow != null;

  // "studentcount" field.
  int? _studentcount;
  int get studentcount => _studentcount ?? 0;
  bool hasStudentcount() => _studentcount != null;

  // "monthlyto" field.
  String? _monthlyto;
  String get monthlyto => _monthlyto ?? '';
  bool hasMonthlyto() => _monthlyto != null;

  // "businesstype" field.
  String? _businesstype;
  String get businesstype => _businesstype ?? '';
  bool hasBusinesstype() => _businesstype != null;

  // "locationtype" field.
  String? _locationtype;
  String get locationtype => _locationtype ?? '';
  bool hasLocationtype() => _locationtype != null;

  // "goals" field.
  String? _goals;
  String get goals => _goals ?? '';
  bool hasGoals() => _goals != null;

  void _initializeFields() {
    _enquiry = snapshotData['enquiry'] as String?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _username = snapshotData['username'] as String?;
    _phonenumber = snapshotData['phonenumber'] as String?;
    _datesent = snapshotData['datesent'] as DateTime?;
    _level = snapshotData['level'] as String?;
    _userpic = snapshotData['userpic'] as String?;
    _wherenow = snapshotData['wherenow'] as String?;
    _studentcount = castToType<int>(snapshotData['studentcount']);
    _monthlyto = snapshotData['monthlyto'] as String?;
    _businesstype = snapshotData['businesstype'] as String?;
    _locationtype = snapshotData['locationtype'] as String?;
    _goals = snapshotData['goals'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('onboardingforms');

  static Stream<OnboardingformsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OnboardingformsRecord.fromSnapshot(s));

  static Future<OnboardingformsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OnboardingformsRecord.fromSnapshot(s));

  static OnboardingformsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OnboardingformsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OnboardingformsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OnboardingformsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OnboardingformsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OnboardingformsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOnboardingformsRecordData({
  String? enquiry,
  DocumentReference? uid,
  String? username,
  String? phonenumber,
  DateTime? datesent,
  String? level,
  String? userpic,
  String? wherenow,
  int? studentcount,
  String? monthlyto,
  String? businesstype,
  String? locationtype,
  String? goals,
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
      'wherenow': wherenow,
      'studentcount': studentcount,
      'monthlyto': monthlyto,
      'businesstype': businesstype,
      'locationtype': locationtype,
      'goals': goals,
    }.withoutNulls,
  );

  return firestoreData;
}

class OnboardingformsRecordDocumentEquality
    implements Equality<OnboardingformsRecord> {
  const OnboardingformsRecordDocumentEquality();

  @override
  bool equals(OnboardingformsRecord? e1, OnboardingformsRecord? e2) {
    return e1?.enquiry == e2?.enquiry &&
        e1?.uid == e2?.uid &&
        e1?.username == e2?.username &&
        e1?.phonenumber == e2?.phonenumber &&
        e1?.datesent == e2?.datesent &&
        e1?.level == e2?.level &&
        e1?.userpic == e2?.userpic &&
        e1?.wherenow == e2?.wherenow &&
        e1?.studentcount == e2?.studentcount &&
        e1?.monthlyto == e2?.monthlyto &&
        e1?.businesstype == e2?.businesstype &&
        e1?.locationtype == e2?.locationtype &&
        e1?.goals == e2?.goals;
  }

  @override
  int hash(OnboardingformsRecord? e) => const ListEquality().hash([
        e?.enquiry,
        e?.uid,
        e?.username,
        e?.phonenumber,
        e?.datesent,
        e?.level,
        e?.userpic,
        e?.wherenow,
        e?.studentcount,
        e?.monthlyto,
        e?.businesstype,
        e?.locationtype,
        e?.goals
      ]);

  @override
  bool isValidKey(Object? o) => o is OnboardingformsRecord;
}
