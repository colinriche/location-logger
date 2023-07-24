import '../database.dart';

class PolygonsTable extends SupabaseTable<PolygonsRow> {
  @override
  String get tableName => 'polygons';

  @override
  PolygonsRow createRow(Map<String, dynamic> data) => PolygonsRow(data);
}

class PolygonsRow extends SupabaseDataRow {
  PolygonsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PolygonsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get about => getField<String>('about');
  set about(String? value) => setField<String>('about', value);

  dynamic? get latlng => getField<dynamic>('latlng');
  set latlng(dynamic? value) => setField<dynamic>('latlng', value);
}
