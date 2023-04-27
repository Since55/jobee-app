import 'package:jobee_app/core/api_client.dart';
import 'package:jobee_app/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppAuthState {
  final UserData? userData;
  User? get authUser => ApiClient.client.auth.currentUser;

  AppAuthState({this.userData});

  bool get isAuthorized => authUser != null;

  AppAuthState copyWith({
    UserData? userData,
  }) {
    return AppAuthState(
      userData: userData ?? this.userData,
    );
  }
}
