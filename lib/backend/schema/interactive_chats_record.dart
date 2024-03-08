import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class InteractiveChatsRecord extends FirestoreRecord {
  InteractiveChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "chatRef" field.
  String? _chatRef;
  String get chatRef => _chatRef ?? '';
  bool hasChatRef() => _chatRef != null;

  // "chatSessionId" field.
  String? _chatSessionId;
  String get chatSessionId => _chatSessionId ?? '';
  bool hasChatSessionId() => _chatSessionId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "optionButtons" field.
  List<String>? _optionButtons;
  List<String> get optionButtons => _optionButtons ?? const [];
  bool hasOptionButtons() => _optionButtons != null;

  // "tileBlockId" field.
  String? _tileBlockId;
  String get tileBlockId => _tileBlockId ?? '';
  bool hasTileBlockId() => _tileBlockId != null;

  // "dateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "linkedChatDocs" field.
  List<String>? _linkedChatDocs;
  List<String> get linkedChatDocs => _linkedChatDocs ?? const [];
  bool hasLinkedChatDocs() => _linkedChatDocs != null;

  // "buttons" field.
  List<ButtonsStruct>? _buttons;
  List<ButtonsStruct> get buttons => _buttons ?? const [];
  bool hasButtons() => _buttons != null;

  // "themeSummary" field.
  String? _themeSummary;
  String get themeSummary => _themeSummary ?? '';
  bool hasThemeSummary() => _themeSummary != null;

  void _initializeFields() {
    _chatRef = snapshotData['chatRef'] as String?;
    _chatSessionId = snapshotData['chatSessionId'] as String?;
    _title = snapshotData['title'] as String?;
    _summary = snapshotData['summary'] as String?;
    _optionButtons = getDataList(snapshotData['optionButtons']);
    _tileBlockId = snapshotData['tileBlockId'] as String?;
    _dateCreated = snapshotData['dateCreated'] as DateTime?;
    _linkedChatDocs = getDataList(snapshotData['linkedChatDocs']);
    _buttons = getStructList(
      snapshotData['buttons'],
      ButtonsStruct.fromMap,
    );
    _themeSummary = snapshotData['themeSummary'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('interactiveChats');

  static Stream<InteractiveChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InteractiveChatsRecord.fromSnapshot(s));

  static Future<InteractiveChatsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => InteractiveChatsRecord.fromSnapshot(s));

  static InteractiveChatsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InteractiveChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InteractiveChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InteractiveChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InteractiveChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InteractiveChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInteractiveChatsRecordData({
  String? chatRef,
  String? chatSessionId,
  String? title,
  String? summary,
  String? tileBlockId,
  DateTime? dateCreated,
  String? themeSummary,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chatRef': chatRef,
      'chatSessionId': chatSessionId,
      'title': title,
      'summary': summary,
      'tileBlockId': tileBlockId,
      'dateCreated': dateCreated,
      'themeSummary': themeSummary,
    }.withoutNulls,
  );

  return firestoreData;
}

class InteractiveChatsRecordDocumentEquality
    implements Equality<InteractiveChatsRecord> {
  const InteractiveChatsRecordDocumentEquality();

  @override
  bool equals(InteractiveChatsRecord? e1, InteractiveChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.chatRef == e2?.chatRef &&
        e1?.chatSessionId == e2?.chatSessionId &&
        e1?.title == e2?.title &&
        e1?.summary == e2?.summary &&
        listEquality.equals(e1?.optionButtons, e2?.optionButtons) &&
        e1?.tileBlockId == e2?.tileBlockId &&
        e1?.dateCreated == e2?.dateCreated &&
        listEquality.equals(e1?.linkedChatDocs, e2?.linkedChatDocs) &&
        listEquality.equals(e1?.buttons, e2?.buttons) &&
        e1?.themeSummary == e2?.themeSummary;
  }

  @override
  int hash(InteractiveChatsRecord? e) => const ListEquality().hash([
        e?.chatRef,
        e?.chatSessionId,
        e?.title,
        e?.summary,
        e?.optionButtons,
        e?.tileBlockId,
        e?.dateCreated,
        e?.linkedChatDocs,
        e?.buttons,
        e?.themeSummary
      ]);

  @override
  bool isValidKey(Object? o) => o is InteractiveChatsRecord;
}
