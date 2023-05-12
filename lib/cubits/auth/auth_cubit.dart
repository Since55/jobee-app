import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/api/auth_api.dart';
import 'package:jobee_app/cubits/auth/auth_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthCubit extends Cubit<AppAuthState> {
  AuthCubit() : super(AppAuthState()) {
    init();
  }

  void init() {
    updateUser();
  }

  Future<void> auth(User auth) async {
    updateUser();
  }

  Future<void> updateUser() async {
    if (state.authUser == null) return;
    final userData = await AuthApi.getUser(state.authUser!.id);
    emit(state.copyWith(userData: userData));
  }

  Future<void> logout() async {
    await AuthApi.logout();
    emit(AppAuthState());
  }
}
