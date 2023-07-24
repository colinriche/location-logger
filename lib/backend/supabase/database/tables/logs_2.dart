import '../database.dart';

class Logs2Table extends SupabaseTable<Logs2Row> {
  @override
  String get tableName => 'logs-2';

  @override
  Logs2Row createRow(Map<String, dynamic> data) => Logs2Row(data);
}

class Logs2Row extends SupabaseDataRow {
  Logs2Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => Logs2Table();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get gps => getField<String>('gps');
  set gps(String? value) => setField<String>('gps', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get entryExit => getField<String>('entry_exit');
  set entryExit(String? value) => setField<String>('entry_exit', value);

  String? get info => getField<String>('info');
  set info(String? value) => setField<String>('info', value);

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  bool? get withGPS => getField<bool>('withGPS');
  set withGPS(bool? value) => setField<bool>('withGPS', value);
}
