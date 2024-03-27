import '../database.dart';

class WatermillMessageSummarizerTable
    extends SupabaseTable<WatermillMessageSummarizerRow> {
  @override
  String get tableName => 'watermill_message_summarizer';

  @override
  WatermillMessageSummarizerRow createRow(Map<String, dynamic> data) =>
      WatermillMessageSummarizerRow(data);
}

class WatermillMessageSummarizerRow extends SupabaseDataRow {
  WatermillMessageSummarizerRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WatermillMessageSummarizerTable();

  int get offset => getField<int>('offset')!;
  set offset(int value) => setField<int>('offset', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  dynamic? get payload => getField<dynamic>('payload');
  set payload(dynamic? value) => setField<dynamic>('payload', value);

  dynamic? get metadata => getField<dynamic>('metadata');
  set metadata(dynamic? value) => setField<dynamic>('metadata', value);

  String get transactionId => getField<String>('transaction_id')!;
  set transactionId(String value) => setField<String>('transaction_id', value);
}
