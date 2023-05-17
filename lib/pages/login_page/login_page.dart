import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/pages/login_page/login_cubit.dart';
import 'package:jobee_app/pages/login_page/views/login_view.dart';

class LoginPage extends StatelessWidget {
  static const path = 'login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const Scaffold(body: LoginView()),
    );
  }
}
