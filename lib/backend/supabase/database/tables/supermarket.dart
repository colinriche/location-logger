import '../database.dart';

class SupermarketTable extends SupabaseTable<SupermarketRow> {
  @override
  String get tableName => 'supermarket';

  @override
  SupermarketRow createRow(Map<String, dynamic> data) => SupermarketRow(data);
}

class SupermarketRow extends SupabaseDataRow {
  SupermarketRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SupermarketTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get location => getField<String>('location')!;
  set location(String value) => setField<String>('location', value);
}
