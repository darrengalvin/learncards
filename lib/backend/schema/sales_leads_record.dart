import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class SalesLeadsRecord extends FirestoreRecord {
  SalesLeadsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "contact_type" field.
  String? _contactType;
  String get contactType => _contactType ?? '';
  bool hasContactType() => _contactType != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _email = snapshotData['email'] as String?;
    _businessName = snapshotData['business_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _address = snapshotData['address'] as String?;
    _website = snapshotData['website'] as String?;
    _contactType = snapshotData['contact_type'] as String?;
    _status = snapshotData['status'] as String?;
    _notes = snapshotData['notes'] as String?;
    _tags = getDataList(snapshotData['tags']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('salesLeads');

  static Stream<SalesLeadsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SalesLeadsRecord.fromSnapshot(s));

  static Future<SalesLeadsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SalesLeadsRecord.fromSnapshot(s));

  static SalesLeadsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SalesLeadsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SalesLeadsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SalesLeadsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SalesLeadsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SalesLeadsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSalesLeadsRecordData({
  String? name,
  String? email,
  String? businessName,
  String? phoneNumber,
  String? address,
  String? website,
  String? contactType,
  String? status,
  String? notes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'email': email,
      'business_name': businessName,
      'phone_number': phoneNumber,
      'address': address,
      'website': website,
      'contact_type': contactType,
      'status': status,
      'notes': notes,
    }.withoutNulls,
  );

  return firestoreData;
}

class SalesLeadsRecordDocumentEquality implements Equality<SalesLeadsRecord> {
  const SalesLeadsRecordDocumentEquality();

  @override
  bool equals(SalesLeadsRecord? e1, SalesLeadsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.email == e2?.email &&
        e1?.businessName == e2?.businessName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.address == e2?.address &&
        e1?.website == e2?.website &&
        e1?.contactType == e2?.contactType &&
        e1?.status == e2?.status &&
        e1?.notes == e2?.notes &&
        listEquality.equals(e1?.tags, e2?.tags);
  }

  @override
  int hash(SalesLeadsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.email,
        e?.businessName,
        e?.phoneNumber,
        e?.address,
        e?.website,
        e?.contactType,
        e?.status,
        e?.notes,
        e?.tags
      ]);

  @override
  bool isValidKey(Object? o) => o is SalesLeadsRecord;
}
