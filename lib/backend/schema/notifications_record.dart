import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Community" field.
  List<DocumentReference>? _community;
  List<DocumentReference> get community => _community ?? const [];
  bool hasCommunity() => _community != null;

  // "iMAB" field.
  List<DocumentReference>? _iMAB;
  List<DocumentReference> get iMAB => _iMAB ?? const [];
  bool hasIMAB() => _iMAB != null;

  // "fiftyk" field.
  List<DocumentReference>? _fiftyk;
  List<DocumentReference> get fiftyk => _fiftyk ?? const [];
  bool hasFiftyk() => _fiftyk != null;

  // "onehundredk" field.
  List<DocumentReference>? _onehundredk;
  List<DocumentReference> get onehundredk => _onehundredk ?? const [];
  bool hasOnehundredk() => _onehundredk != null;

  // "twofiftyk" field.
  List<DocumentReference>? _twofiftyk;
  List<DocumentReference> get twofiftyk => _twofiftyk ?? const [];
  bool hasTwofiftyk() => _twofiftyk != null;

  // "starter" field.
  List<DocumentReference>? _starter;
  List<DocumentReference> get starter => _starter ?? const [];
  bool hasStarter() => _starter != null;

  void _initializeFields() {
    _community = getDataList(snapshotData['Community']);
    _iMAB = getDataList(snapshotData['iMAB']);
    _fiftyk = getDataList(snapshotData['fiftyk']);
    _onehundredk = getDataList(snapshotData['onehundredk']);
    _twofiftyk = getDataList(snapshotData['twofiftyk']);
    _starter = getDataList(snapshotData['starter']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.community, e2?.community) &&
        listEquality.equals(e1?.iMAB, e2?.iMAB) &&
        listEquality.equals(e1?.fiftyk, e2?.fiftyk) &&
        listEquality.equals(e1?.onehundredk, e2?.onehundredk) &&
        listEquality.equals(e1?.twofiftyk, e2?.twofiftyk) &&
        listEquality.equals(e1?.starter, e2?.starter);
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.community,
        e?.iMAB,
        e?.fiftyk,
        e?.onehundredk,
        e?.twofiftyk,
        e?.starter
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
