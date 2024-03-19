import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TypesRecord extends FirestoreRecord {
  TypesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "show" field.
  bool? _show;
  bool get show => _show ?? false;
  bool hasShow() => _show != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _type = snapshotData['type'] as String?;
    _show = snapshotData['show'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('types');

  static Stream<TypesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TypesRecord.fromSnapshot(s));

  static Future<TypesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TypesRecord.fromSnapshot(s));

  static TypesRecord fromSnapshot(DocumentSnapshot snapshot) => TypesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TypesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TypesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TypesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TypesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTypesRecordData({
  int? id,
  String? type,
  bool? show,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'type': type,
      'show': show,
    }.withoutNulls,
  );

  return firestoreData;
}

class TypesRecordDocumentEquality implements Equality<TypesRecord> {
  const TypesRecordDocumentEquality();

  @override
  bool equals(TypesRecord? e1, TypesRecord? e2) {
    return e1?.id == e2?.id && e1?.type == e2?.type && e1?.show == e2?.show;
  }

  @override
  int hash(TypesRecord? e) =>
      const ListEquality().hash([e?.id, e?.type, e?.show]);

  @override
  bool isValidKey(Object? o) => o is TypesRecord;
}
