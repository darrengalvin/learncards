import '../database.dart';

class DocumentCollectionTable extends SupabaseTable<DocumentCollectionRow> {
  @override
  String get tableName => 'document_collection';

  @override
  DocumentCollectionRow createRow(Map<String, dynamic> data) =>
      DocumentCollectionRow(data);
}

class DocumentCollectionRow extends SupabaseDataRow {
  DocumentCollectionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DocumentCollectionTable();

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get description => getField<String>('description')!;
  set description(String value) => setField<String>('description', value);

  dynamic? get metadata => getField<dynamic>('metadata');
  set metadata(dynamic? value) => setField<dynamic>('metadata', value);

  String get tableNameField => getField<String>('table_name')!;
  set tableNameField(String value) => setField<String>('table_name', value);

  String get embeddingModelName => getField<String>('embedding_model_name')!;
  set embeddingModelName(String value) =>
      setField<String>('embedding_model_name', value);

  int get embeddingDimensions => getField<int>('embedding_dimensions')!;
  set embeddingDimensions(int value) =>
      setField<int>('embedding_dimensions', value);

  bool get isAutoEmbedded => getField<bool>('is_auto_embedded')!;
  set isAutoEmbedded(bool value) => setField<bool>('is_auto_embedded', value);

  String get distanceFunction => getField<String>('distance_function')!;
  set distanceFunction(String value) =>
      setField<String>('distance_function', value);

  bool get isNormalized => getField<bool>('is_normalized')!;
  set isNormalized(bool value) => setField<bool>('is_normalized', value);

  bool get isIndexed => getField<bool>('is_indexed')!;
  set isIndexed(bool value) => setField<bool>('is_indexed', value);

  String get indexType => getField<String>('index_type')!;
  set indexType(String value) => setField<String>('index_type', value);

  int get listCount => getField<int>('list_count')!;
  set listCount(int value) => setField<int>('list_count', value);

  int get probeCount => getField<int>('probe_count')!;
  set probeCount(int value) => setField<int>('probe_count', value);

  int? get documentCount => getField<int>('document_count');
  set documentCount(int? value) => setField<int>('document_count', value);

  int? get documentEmbeddedCount => getField<int>('document_embedded_count');
  set documentEmbeddedCount(int? value) =>
      setField<int>('document_embedded_count', value);
}
