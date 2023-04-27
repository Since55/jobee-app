import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/cubits/auth/auth_cubit.dart';
import 'package:jobee_app/pages/account_page/account_cubit.dart';
import 'package:jobee_app/pages/account_page/view/account_view.dart';
import 'package:jobee_app/pages/login_page/login_page.dart';

class AccountPage extends StatelessWidget {
  static const path = '/account';
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.select((AuthCubit c) => c.state.isAuthorized);
    if (!isLoggedIn) return const LoginPage();

    return BlocProvider(
      create: (context) => AccountCubit(),
      child: const AccountView(),
    );
  }
}
