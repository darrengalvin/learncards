import '../database.dart';

class WatermillOffsetsMessageSummaryNerTable
    extends SupabaseTable<WatermillOffsetsMessageSummaryNerRow> {
  @override
  String get tableName => 'watermill_offsets_message_summary_ner';

  @override
  WatermillOffsetsMessageSummaryNerRow createRow(Map<String, dynamic> data) =>
      WatermillOffsetsMessageSummaryNerRow(data);
}

class WatermillOffsetsMessageSummaryNerRow extends SupabaseDataRow {
  WatermillOffsetsMessageSummaryNerRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WatermillOffsetsMessageSummaryNerTable();

  String get consumerGroup => getField<String>('consumer_group')!;
  set consumerGroup(String value) => setField<String>('consumer_group', value);

  int? get offsetAcked => getField<int>('offset_acked');
  set offsetAcked(int? value) => setField<int>('offset_acked', value);

  String get lastProcessedTransactionId =>
      getField<String>('last_processed_transaction_id')!;
  set lastProcessedTransactionId(String value) =>
      setField<String>('last_processed_transaction_id', value);
}
