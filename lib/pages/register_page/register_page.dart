import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/pages/register_page/register_cubit.dart';
import 'package:jobee_app/pages/register_page/views/register_view.dart';

class RegisterPage extends StatelessWidget {
  static const path = 'register';

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(body: RegisterView()),
    );
  }
}
