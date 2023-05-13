import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobee_app/api/auth_api.dart';
import 'package:jobee_app/cubits/auth/auth_cubit.dart';
import 'package:jobee_app/cubits/provider.dart';
import 'package:jobee_app/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterState {
  final bool isLoading;
  final bool isValid;

  RegisterState({
    this.isValid = false,
    this.isLoading = false,
  });

  RegisterState copyWith({
    bool? isLoading,
    bool? isValid,
  }) {
    return RegisterState(
      isValid: isValid ?? this.isValid,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class RegisterCubit extends Cubit<RegisterState> {
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final _authCubit = AppBlocProvider.find<AuthCubit>();

  RegisterCubit() : super(RegisterState());

  void validate() {
    final isValid = [
      nameCtrl.text,
      phoneCtrl.text,
      emailCtrl.text,
      passwordCtrl.text,
    ].every((c) => c.isNotEmpty);

    emit(state.copyWith(isValid: isValid));
  }

  UserData _createUser(User user) {
    return UserData(
      userId: user.id,
      name: nameCtrl.text,
      phone: phoneCtrl.text,
      email: emailCtrl.text,
      createdAt: DateTime.tryParse(user.createdAt),
    );
  }

  Future<void> onRegister(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = await AuthApi.register(
        emailCtrl.text,
        passwordCtrl.text,
      );
      if (user == null) return;
      await AuthApi.login(emailCtrl.text, passwordCtrl.text);
      await AuthApi.createUser(_createUser(user));
      await _authCubit.auth(user);

      if (context.mounted) {
        context.pop();
      }
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
