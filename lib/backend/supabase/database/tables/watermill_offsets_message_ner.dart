import '../database.dart';

class WatermillOffsetsMessageNerTable
    extends SupabaseTable<WatermillOffsetsMessageNerRow> {
  @override
  String get tableName => 'watermill_offsets_message_ner';

  @override
  WatermillOffsetsMessageNerRow createRow(Map<String, dynamic> data) =>
      WatermillOffsetsMessageNerRow(data);
}

class WatermillOffsetsMessageNerRow extends SupabaseDataRow {
  WatermillOffsetsMessageNerRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WatermillOffsetsMessageNerTable();

  String get consumerGroup => getField<String>('consumer_group')!;
  set consumerGroup(String value) => setField<String>('consumer_group', value);

  int? get offsetAcked => getField<int>('offset_acked');
  set offsetAcked(int? value) => setField<int>('offset_acked', value);

  String get lastProcessedTransactionId =>
      getField<String>('last_processed_transaction_id')!;
  set lastProcessedTransactionId(String value) =>
      setField<String>('last_processed_transaction_id', value);
}
