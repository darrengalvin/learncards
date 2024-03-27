import '../database.dart';

class WatermillOffsetsDocumentEmbedderTable
    extends SupabaseTable<WatermillOffsetsDocumentEmbedderRow> {
  @override
  String get tableName => 'watermill_offsets_document_embedder';

  @override
  WatermillOffsetsDocumentEmbedderRow createRow(Map<String, dynamic> data) =>
      WatermillOffsetsDocumentEmbedderRow(data);
}

class WatermillOffsetsDocumentEmbedderRow extends SupabaseDataRow {
  WatermillOffsetsDocumentEmbedderRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WatermillOffsetsDocumentEmbedderTable();

  String get consumerGroup => getField<String>('consumer_group')!;
  set consumerGroup(String value) => setField<String>('consumer_group', value);

  int? get offsetAcked => getField<int>('offset_acked');
  set offsetAcked(int? value) => setField<int>('offset_acked', value);

  String get lastProcessedTransactionId =>
      getField<String>('last_processed_transaction_id')!;
  set lastProcessedTransactionId(String value) =>
      setField<String>('last_processed_transaction_id', value);
}
