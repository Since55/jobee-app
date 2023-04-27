import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobee_app/api/auth_api.dart';
import 'package:jobee_app/cubits/auth/auth_cubit.dart';
import 'package:jobee_app/cubits/provider.dart';
import 'package:jobee_app/pages/account_page/account_page.dart';

class LoginState {
  final bool isLoggingIn;
  final bool isValid;

  LoginState({
    this.isValid = false,
    this.isLoggingIn = false,
  });

  LoginState copyWith({
    bool? isValid,
    bool? isLoggingIn,
  }) {
    return LoginState(
      isValid: isValid ?? this.isValid,
      isLoggingIn: isLoggingIn ?? this.isLoggingIn,
    );
  }
}

class LoginCubit extends Cubit<LoginState> {
  final email = TextEditingController();
  final password = TextEditingController();
  final _authCubit = AppBlocProvider.find<AuthCubit>();

  LoginCubit() : super(LoginState());

  void validate() {
    final isValid = email.text.isNotEmpty && password.text.isNotEmpty;

    emit(state.copyWith(isValid: isValid));
  }

  Future<void> login(BuildContext context) async {
    emit(state.copyWith(isLoggingIn: true));
    try {
      final user = await AuthApi.login(email.text, password.text);
      if (user != null) {
        await _authCubit.auth(user);
        if (context.mounted) context.go(AccountPage.path);
      }
    } finally {
      emit(state.copyWith(isLoggingIn: false));
    }
  }
}
