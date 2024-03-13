import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class FlowiseChatsRecord extends FirestoreRecord {
  FlowiseChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "block_type" field.
  String? _blockType;
  String get blockType => _blockType ?? '';
  bool hasBlockType() => _blockType != null;

  // "block_name" field.
  String? _blockName;
  String get blockName => _blockName ?? '';
  bool hasBlockName() => _blockName != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "session_id" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  bool hasSessionId() => _sessionId != null;

  // "tile_id" field.
  String? _tileId;
  String get tileId => _tileId ?? '';
  bool hasTileId() => _tileId != null;

  // "block_id" field.
  List<String>? _blockId;
  List<String> get blockId => _blockId ?? const [];
  bool hasBlockId() => _blockId != null;

  // "thread_id" field.
  String? _threadId;
  String get threadId => _threadId ?? '';
  bool hasThreadId() => _threadId != null;

  // "buttonTrigger" field.
  String? _buttonTrigger;
  String get buttonTrigger => _buttonTrigger ?? '';
  bool hasButtonTrigger() => _buttonTrigger != null;

  // "learnCardId" field.
  String? _learnCardId;
  String get learnCardId => _learnCardId ?? '';
  bool hasLearnCardId() => _learnCardId != null;

  // "isSystemMessage" field.
  bool? _isSystemMessage;
  bool get isSystemMessage => _isSystemMessage ?? false;
  bool hasIsSystemMessage() => _isSystemMessage != null;

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "chatType" field.
  String? _chatType;
  String get chatType => _chatType ?? '';
  bool hasChatType() => _chatType != null;

  // "companyDocId" field.
  String? _companyDocId;
  String get companyDocId => _companyDocId ?? '';
  bool hasCompanyDocId() => _companyDocId != null;

  // "threadDetails" field.
  ThreadsStruct? _threadDetails;
  ThreadsStruct get threadDetails => _threadDetails ?? ThreadsStruct();
  bool hasThreadDetails() => _threadDetails != null;

  // "showToAll" field.
  bool? _showToAll;
  bool get showToAll => _showToAll ?? false;
  bool hasShowToAll() => _showToAll != null;

  // "showToMembersId" field.
  List<String>? _showToMembersId;
  List<String> get showToMembersId => _showToMembersId ?? const [];
  bool hasShowToMembersId() => _showToMembersId != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _role = snapshotData['role'] as String?;
    _text = snapshotData['text'] as String?;
    _blockType = snapshotData['block_type'] as String?;
    _blockName = snapshotData['block_name'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _sessionId = snapshotData['session_id'] as String?;
    _tileId = snapshotData['tile_id'] as String?;
    _blockId = getDataList(snapshotData['block_id']);
    _threadId = snapshotData['thread_id'] as String?;
    _buttonTrigger = snapshotData['buttonTrigger'] as String?;
    _learnCardId = snapshotData['learnCardId'] as String?;
    _isSystemMessage = snapshotData['isSystemMessage'] as bool?;
    _companyName = snapshotData['companyName'] as String?;
    _chatType = snapshotData['chatType'] as String?;
    _companyDocId = snapshotData['companyDocId'] as String?;
    _threadDetails = ThreadsStruct.maybeFromMap(snapshotData['threadDetails']);
    _showToAll = snapshotData['showToAll'] as bool?;
    _showToMembersId = getDataList(snapshotData['showToMembersId']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('flowiseChats');

  static Stream<FlowiseChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FlowiseChatsRecord.fromSnapshot(s));

  static Future<FlowiseChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FlowiseChatsRecord.fromSnapshot(s));

  static FlowiseChatsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FlowiseChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FlowiseChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FlowiseChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FlowiseChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FlowiseChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFlowiseChatsRecordData({
  String? userId,
  DocumentReference? userRef,
  String? role,
  String? text,
  String? blockType,
  String? blockName,
  DateTime? createdTime,
  String? sessionId,
  String? tileId,
  String? threadId,
  String? buttonTrigger,
  String? learnCardId,
  bool? isSystemMessage,
  String? companyName,
  String? chatType,
  String? companyDocId,
  ThreadsStruct? threadDetails,
  bool? showToAll,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'user_ref': userRef,
      'role': role,
      'text': text,
      'block_type': blockType,
      'block_name': blockName,
      'created_time': createdTime,
      'session_id': sessionId,
      'tile_id': tileId,
      'thread_id': threadId,
      'buttonTrigger': buttonTrigger,
      'learnCardId': learnCardId,
      'isSystemMessage': isSystemMessage,
      'companyName': companyName,
      'chatType': chatType,
      'companyDocId': companyDocId,
      'threadDetails': ThreadsStruct().toMap(),
      'showToAll': showToAll,
    }.withoutNulls,
  );

  // Handle nested data for "threadDetails" field.
  addThreadsStructData(firestoreData, threadDetails, 'threadDetails');

  return firestoreData;
}

class FlowiseChatsRecordDocumentEquality
    implements Equality<FlowiseChatsRecord> {
  const FlowiseChatsRecordDocumentEquality();

  @override
  bool equals(FlowiseChatsRecord? e1, FlowiseChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userId == e2?.userId &&
        e1?.userRef == e2?.userRef &&
        e1?.role == e2?.role &&
        e1?.text == e2?.text &&
        e1?.blockType == e2?.blockType &&
        e1?.blockName == e2?.blockName &&
        e1?.createdTime == e2?.createdTime &&
        e1?.sessionId == e2?.sessionId &&
        e1?.tileId == e2?.tileId &&
        listEquality.equals(e1?.blockId, e2?.blockId) &&
        e1?.threadId == e2?.threadId &&
        e1?.buttonTrigger == e2?.buttonTrigger &&
        e1?.learnCardId == e2?.learnCardId &&
        e1?.isSystemMessage == e2?.isSystemMessage &&
        e1?.companyName == e2?.companyName &&
        e1?.chatType == e2?.chatType &&
        e1?.companyDocId == e2?.companyDocId &&
        e1?.threadDetails == e2?.threadDetails &&
        e1?.showToAll == e2?.showToAll &&
        listEquality.equals(e1?.showToMembersId, e2?.showToMembersId);
  }

  @override
  int hash(FlowiseChatsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.userRef,
        e?.role,
        e?.text,
        e?.blockType,
        e?.blockName,
        e?.createdTime,
        e?.sessionId,
        e?.tileId,
        e?.blockId,
        e?.threadId,
        e?.buttonTrigger,
        e?.learnCardId,
        e?.isSystemMessage,
        e?.companyName,
        e?.chatType,
        e?.companyDocId,
        e?.threadDetails,
        e?.showToAll,
        e?.showToMembersId
      ]);

  @override
  bool isValidKey(Object? o) => o is FlowiseChatsRecord;
}
