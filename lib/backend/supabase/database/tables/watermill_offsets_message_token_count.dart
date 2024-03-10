import '../database.dart';

class WatermillOffsetsMessageTokenCountTable
    extends SupabaseTable<WatermillOffsetsMessageTokenCountRow> {
  @override
  String get tableName => 'watermill_offsets_message_token_count';

  @override
  WatermillOffsetsMessageTokenCountRow createRow(Map<String, dynamic> data) =>
      WatermillOffsetsMessageTokenCountRow(data);
}

class WatermillOffsetsMessageTokenCountRow extends SupabaseDataRow {
  WatermillOffsetsMessageTokenCountRow(super.data);

  @override
  SupabaseTable get table => WatermillOffsetsMessageTokenCountTable();

  String get consumerGroup => getField<String>('consumer_group')!;
  set consumerGroup(String value) => setField<String>('consumer_group', value);

  int? get offsetAcked => getField<int>('offset_acked');
  set offsetAcked(int? value) => setField<int>('offset_acked', value);

  String get lastProcessedTransactionId =>
      getField<String>('last_processed_transaction_id')!;
  set lastProcessedTransactionId(String value) =>
      setField<String>('last_processed_transaction_id', value);
}
