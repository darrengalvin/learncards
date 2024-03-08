import '../database.dart';

class SummaryTable extends SupabaseTable<SummaryRow> {
  @override
  String get tableName => 'summary';

  @override
  SummaryRow createRow(Map<String, dynamic> data) => SummaryRow(data);
}

class SummaryRow extends SupabaseDataRow {
  SummaryRow(super.data);

  @override
  SupabaseTable get table => SummaryTable();

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

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  dynamic get metadata => getField<dynamic>('metadata');
  set metadata(dynamic value) => setField<dynamic>('metadata', value);

  int get tokenCount => getField<int>('token_count')!;
  set tokenCount(int value) => setField<int>('token_count', value);

  String get summaryPointUuid => getField<String>('summary_point_uuid')!;
  set summaryPointUuid(String value) =>
      setField<String>('summary_point_uuid', value);
}
