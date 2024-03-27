import '../database.dart';

class SummaryEmbeddingTable extends SupabaseTable<SummaryEmbeddingRow> {
  @override
  String get tableName => 'summary_embedding';

  @override
  SummaryEmbeddingRow createRow(Map<String, dynamic> data) =>
      SummaryEmbeddingRow(data);
}

class SummaryEmbeddingRow extends SupabaseDataRow {
  SummaryEmbeddingRow(super.data);

  @override
  SupabaseTable get table => SummaryEmbeddingTable();

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

  String get summaryUuid => getField<String>('summary_uuid')!;
  set summaryUuid(String value) => setField<String>('summary_uuid', value);

  String? get embedding => getField<String>('embedding');
  set embedding(String? value) => setField<String>('embedding', value);

  bool get isEmbedded => getField<bool>('is_embedded')!;
  set isEmbedded(bool value) => setField<bool>('is_embedded', value);
}
