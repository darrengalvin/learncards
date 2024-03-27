import '../database.dart';

class MessageEmbeddingTable extends SupabaseTable<MessageEmbeddingRow> {
  @override
  String get tableName => 'message_embedding';

  @override
  MessageEmbeddingRow createRow(Map<String, dynamic> data) =>
      MessageEmbeddingRow(data);
}

class MessageEmbeddingRow extends SupabaseDataRow {
  MessageEmbeddingRow(super.data);

  @override
  SupabaseTable get table => MessageEmbeddingTable();

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  DateTime? get deletedAt => getField<DateTime>('deleted_at');
  set deletedAt(DateTime? value) => setField<DateTime>('deleted_at', value);

  String get sessionId => getField<String>('session_id')!;
  set sessionId(String value) => setField<String>('session_id', value);

  String get messageUuid => getField<String>('message_uuid')!;
  set messageUuid(String value) => setField<String>('message_uuid', value);

  String? get embedding => getField<String>('embedding');
  set embedding(String? value) => setField<String>('embedding', value);

  bool get isEmbedded => getField<bool>('is_embedded')!;
  set isEmbedded(bool value) => setField<bool>('is_embedded', value);
}
