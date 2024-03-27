import '../database.dart';

class MessageTable extends SupabaseTable<MessageRow> {
  @override
  String get tableName => 'message';

  @override
  MessageRow createRow(Map<String, dynamic> data) => MessageRow(data);
}

class MessageRow extends SupabaseDataRow {
  MessageRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MessageTable();

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  DateTime? get deletedAt => getField<DateTime>('deleted_at');
  set deletedAt(DateTime? value) => setField<DateTime>('deleted_at', value);

  String get sessionId => getField<String>('session_id')!;
  set sessionId(String value) => setField<String>('session_id', value);

  String get role => getField<String>('role')!;
  set role(String value) => setField<String>('role', value);

  String get content => getField<String>('content')!;
  set content(String value) => setField<String>('content', value);

  int get tokenCount => getField<int>('token_count')!;
  set tokenCount(int value) => setField<int>('token_count', value);

  dynamic? get metadata => getField<dynamic>('metadata');
  set metadata(dynamic? value) => setField<dynamic>('metadata', value);
}
