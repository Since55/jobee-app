import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnv {
  static String get supabaseApi => dotenv.env['SUPABASE_API']!;

  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY']!;
}
