import '../database.dart';

class MembershipsTable extends SupabaseTable<MembershipsRow> {
  @override
  String get tableName => 'memberships';

  @override
  MembershipsRow createRow(Map<String, dynamic> data) => MembershipsRow(data);
}

class MembershipsRow extends SupabaseDataRow {
  MembershipsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MembershipsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get retailer => getField<String>('retailer');
  set retailer(String? value) => setField<String>('retailer', value);

  String? get number => getField<String>('number');
  set number(String? value) => setField<String>('number', value);
}
