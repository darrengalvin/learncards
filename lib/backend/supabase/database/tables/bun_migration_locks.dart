import '../database.dart';

class BunMigrationLocksTable extends SupabaseTable<BunMigrationLocksRow> {
  @override
  String get tableName => 'bun_migration_locks';

  @override
  BunMigrationLocksRow createRow(Map<String, dynamic> data) =>
      BunMigrationLocksRow(data);
}

class BunMigrationLocksRow extends SupabaseDataRow {
  BunMigrationLocksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BunMigrationLocksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get tableNameField => getField<String>('table_name');
  set tableNameField(String? value) => setField<String>('table_name', value);
}
