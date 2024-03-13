import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersonlineliveRecord extends FirestoreRecord {
  UsersonlineliveRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('usersonlinelive')
          : FirebaseFirestore.instance.collectionGroup('usersonlinelive');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('usersonlinelive').doc(id);

  static Stream<UsersonlineliveRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersonlineliveRecord.fromSnapshot(s));

  static Future<UsersonlineliveRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersonlineliveRecord.fromSnapshot(s));

  static UsersonlineliveRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersonlineliveRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersonlineliveRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersonlineliveRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersonlineliveRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersonlineliveRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersonlineliveRecordData({
  DocumentReference? uid,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersonlineliveRecordDocumentEquality
    implements Equality<UsersonlineliveRecord> {
  const UsersonlineliveRecordDocumentEquality();

  @override
  bool equals(UsersonlineliveRecord? e1, UsersonlineliveRecord? e2) {
    return e1?.uid == e2?.uid && e1?.name == e2?.name;
  }

  @override
  int hash(UsersonlineliveRecord? e) =>
      const ListEquality().hash([e?.uid, e?.name]);

  @override
  bool isValidKey(Object? o) => o is UsersonlineliveRecord;
}
