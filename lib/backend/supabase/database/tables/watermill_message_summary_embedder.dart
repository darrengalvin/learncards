import '../database.dart';

class WatermillMessageSummaryEmbedderTable
    extends SupabaseTable<WatermillMessageSummaryEmbedderRow> {
  @override
  String get tableName => 'watermill_message_summary_embedder';

  @override
  WatermillMessageSummaryEmbedderRow createRow(Map<String, dynamic> data) =>
      WatermillMessageSummaryEmbedderRow(data);
}

class WatermillMessageSummaryEmbedderRow extends SupabaseDataRow {
  WatermillMessageSummaryEmbedderRow(super.data);

  @override
  SupabaseTable get table => WatermillMessageSummaryEmbedderTable();

  int get offset => getField<int>('offset')!;
  set offset(int value) => setField<int>('offset', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  dynamic get payload => getField<dynamic>('payload');
  set payload(dynamic value) => setField<dynamic>('payload', value);

  dynamic get metadata => getField<dynamic>('metadata');
  set metadata(dynamic value) => setField<dynamic>('metadata', value);

  String get transactionId => getField<String>('transaction_id')!;
  set transactionId(String value) => setField<String>('transaction_id', value);
}
