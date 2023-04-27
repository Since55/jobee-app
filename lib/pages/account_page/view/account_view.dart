import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/pages/account_page/account_cubit.dart';
import 'package:jobee_app/widgets/primary_button.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AccountCubit>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Spacer(),
          PrimaryButton(
            onTap: cubit.logout,
            text: 'logout'.tr(),
          ),
        ],
      ),
    );
  }
}