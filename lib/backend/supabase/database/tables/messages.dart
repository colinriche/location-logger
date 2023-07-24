import '../database.dart';

class MessagesTable extends SupabaseTable<MessagesRow> {
  @override
  String get tableName => 'messages';

  @override
  MessagesRow createRow(Map<String, dynamic> data) => MessagesRow(data);
}

class MessagesRow extends SupabaseDataRow {
  MessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MessagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get recipient => getField<String>('recipient');
  set recipient(String? value) => setField<String>('recipient', value);

  String? get gps => getField<String>('gps');
  set gps(String? value) => setField<String>('gps', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  bool? get withGPS => getField<bool>('with GPS');
  set withGPS(bool? value) => setField<bool>('with GPS', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  bool? get msgOut => getField<bool>('msgOut');
  set msgOut(bool? value) => setField<bool>('msgOut', value);
}
