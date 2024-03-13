import '../database.dart';

class BunMigrationsTable extends SupabaseTable<BunMigrationsRow> {
  @override
  String get tableName => 'bun_migrations';

  @override
  BunMigrationsRow createRow(Map<String, dynamic> data) =>
      BunMigrationsRow(data);
}

class BunMigrationsRow extends SupabaseDataRow {
  BunMigrationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BunMigrationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get groupId => getField<int>('group_id');
  set groupId(int? value) => setField<int>('group_id', value);

  DateTime get migratedAt => getField<DateTime>('migrated_at')!;
  set migratedAt(DateTime value) => setField<DateTime>('migrated_at', value);
}
