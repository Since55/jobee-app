import 'package:jobee_app/core/api_client.dart';
import 'package:jobee_app/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthApi {
  static Future<User?> login(String email, String password) async {
    final response = await ApiClient.client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    return response.user;
  }

  static Future<UserData?> getUser(String userId) async {
    final response =
        await ApiClient.client.from('users').select('*').eq('user_id', userId);
    // .withConverter(
    //   (data) => UserData.fromMap(data as Map<String, dynamic>),
    // );

    return UserData.fromMap((response as List).first as Map<String, dynamic>);
  }

  static Future<void> logout() async {
    await ApiClient.client.auth.signOut();
  }
}
