import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://exyqyhptzagxajahvmjr.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV4eXF5aHB0emFneGFqYWh2bWpyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODU1NDEwNDQsImV4cCI6MjAwMTExNzA0NH0._8Vm5eg8tGTT2NwSlvcqumbM5TGrwYxCXLq_AM7pAhk';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
