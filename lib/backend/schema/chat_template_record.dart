import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatTemplateRecord extends FirestoreRecord {
  ChatTemplateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "idNumber" field.
  int? _idNumber;
  int get idNumber => _idNumber ?? 0;
  bool hasIdNumber() => _idNumber != null;

  // "userMessage" field.
  String? _userMessage;
  String get userMessage => _userMessage ?? '';
  bool hasUserMessage() => _userMessage != null;

  // "chatTemplateName" field.
  String? _chatTemplateName;
  String get chatTemplateName => _chatTemplateName ?? '';
  bool hasChatTemplateName() => _chatTemplateName != null;

  // "aiPrompt" field.
  String? _aiPrompt;
  String get aiPrompt => _aiPrompt ?? '';
  bool hasAiPrompt() => _aiPrompt != null;

  void _initializeFields() {
    _idNumber = castToType<int>(snapshotData['idNumber']);
    _userMessage = snapshotData['userMessage'] as String?;
    _chatTemplateName = snapshotData['chatTemplateName'] as String?;
    _aiPrompt = snapshotData['aiPrompt'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat_template');

  static Stream<ChatTemplateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatTemplateRecord.fromSnapshot(s));

  static Future<ChatTemplateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatTemplateRecord.fromSnapshot(s));

  static ChatTemplateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatTemplateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatTemplateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatTemplateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatTemplateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatTemplateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatTemplateRecordData({
  int? idNumber,
  String? userMessage,
  String? chatTemplateName,
  String? aiPrompt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idNumber': idNumber,
      'userMessage': userMessage,
      'chatTemplateName': chatTemplateName,
      'aiPrompt': aiPrompt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatTemplateRecordDocumentEquality
    implements Equality<ChatTemplateRecord> {
  const ChatTemplateRecordDocumentEquality();

  @override
  bool equals(ChatTemplateRecord? e1, ChatTemplateRecord? e2) {
    return e1?.idNumber == e2?.idNumber &&
        e1?.userMessage == e2?.userMessage &&
        e1?.chatTemplateName == e2?.chatTemplateName &&
        e1?.aiPrompt == e2?.aiPrompt;
  }

  @override
  int hash(ChatTemplateRecord? e) => const ListEquality()
      .hash([e?.idNumber, e?.userMessage, e?.chatTemplateName, e?.aiPrompt]);

  @override
  bool isValidKey(Object? o) => o is ChatTemplateRecord;
}
