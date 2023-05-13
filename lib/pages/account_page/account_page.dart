import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/pages/account_page/account_cubit.dart';
import 'package:jobee_app/pages/account_page/view/account_view.dart';

class AccountPage extends StatelessWidget {
  static const path = '/account';
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit()..init(),
      child: const AccountView(),
    );
  }
}
