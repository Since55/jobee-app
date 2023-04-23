import 'package:jobee_app/core/app_env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApiClient {
  static final client = Supabase.instance.client;

  static Future<void> init() async {
    await Supabase.initialize(
      url: AppEnv.supabaseApi,
      anonKey: AppEnv.supabaseAnonKey,
    );
  }
}
