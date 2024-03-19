import '../database.dart';

class WatermillOffsetsMessageSummarizerTable
    extends SupabaseTable<WatermillOffsetsMessageSummarizerRow> {
  @override
  String get tableName => 'watermill_offsets_message_summarizer';

  @override
  WatermillOffsetsMessageSummarizerRow createRow(Map<String, dynamic> data) =>
      WatermillOffsetsMessageSummarizerRow(data);
}

class WatermillOffsetsMessageSummarizerRow extends SupabaseDataRow {
  WatermillOffsetsMessageSummarizerRow(super.data);

  @override
  SupabaseTable get table => WatermillOffsetsMessageSummarizerTable();

  String get consumerGroup => getField<String>('consumer_group')!;
  set consumerGroup(String value) => setField<String>('consumer_group', value);

  int? get offsetAcked => getField<int>('offset_acked');
  set offsetAcked(int? value) => setField<int>('offset_acked', value);

  String get lastProcessedTransactionId =>
      getField<String>('last_processed_transaction_id')!;
  set lastProcessedTransactionId(String value) =>
      setField<String>('last_processed_transaction_id', value);
}
