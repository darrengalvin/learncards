import '../database.dart';

class WatermillOffsetsMessageSummaryEmbedderTable
    extends SupabaseTable<WatermillOffsetsMessageSummaryEmbedderRow> {
  @override
  String get tableName => 'watermill_offsets_message_summary_embedder';

  @override
  WatermillOffsetsMessageSummaryEmbedderRow createRow(
          Map<String, dynamic> data) =>
      WatermillOffsetsMessageSummaryEmbedderRow(data);
}

class WatermillOffsetsMessageSummaryEmbedderRow extends SupabaseDataRow {
  WatermillOffsetsMessageSummaryEmbedderRow(Map<String, dynamic> data)
      : super(data);

  @override
  SupabaseTable get table => WatermillOffsetsMessageSummaryEmbedderTable();

  String get consumerGroup => getField<String>('consumer_group')!;
  set consumerGroup(String value) => setField<String>('consumer_group', value);

  int? get offsetAcked => getField<int>('offset_acked');
  set offsetAcked(int? value) => setField<int>('offset_acked', value);

  String get lastProcessedTransactionId =>
      getField<String>('last_processed_transaction_id')!;
  set lastProcessedTransactionId(String value) =>
      setField<String>('last_processed_transaction_id', value);
}
