import '../database.dart';

class RestaurantsTable extends SupabaseTable<RestaurantsRow> {
  @override
  String get tableName => 'restaurants';

  @override
  RestaurantsRow createRow(Map<String, dynamic> data) => RestaurantsRow(data);
}

class RestaurantsRow extends SupabaseDataRow {
  RestaurantsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RestaurantsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get location => getField<String>('location')!;
  set location(String value) => setField<String>('location', value);
}
