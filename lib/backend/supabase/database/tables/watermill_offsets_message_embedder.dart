import '../database.dart';

class WatermillOffsetsMessageEmbedderTable
    extends SupabaseTable<WatermillOffsetsMessageEmbedderRow> {
  @override
  String get tableName => 'watermill_offsets_message_embedder';

  @override
  WatermillOffsetsMessageEmbedderRow createRow(Map<String, dynamic> data) =>
      WatermillOffsetsMessageEmbedderRow(data);
}

class WatermillOffsetsMessageEmbedderRow extends SupabaseDataRow {
  WatermillOffsetsMessageEmbedderRow(super.data);

  @override
  SupabaseTable get table => WatermillOffsetsMessageEmbedderTable();

  String get consumerGroup => getField<String>('consumer_group')!;
  set consumerGroup(String value) => setField<String>('consumer_group', value);

  int? get offsetAcked => getField<int>('offset_acked');
  set offsetAcked(int? value) => setField<int>('offset_acked', value);

  String get lastProcessedTransactionId =>
      getField<String>('last_processed_transaction_id')!;
  set lastProcessedTransactionId(String value) =>
      setField<String>('last_processed_transaction_id', value);
}
