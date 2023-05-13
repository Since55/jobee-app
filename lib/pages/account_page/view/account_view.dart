import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/pages/account_page/account_cubit.dart';
import 'package:jobee_app/widgets/content_box.dart';
import 'package:jobee_app/widgets/loader.dart';
import 'package:jobee_app/widgets/primary_button.dart';
import 'package:jobee_app/widgets/primary_text_field.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AccountCubit>();
    final user = cubit.state.user;

    if (user == null) return const Loader();

    final format = DateFormat('dd.MM.yyy');

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ContentBox(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'account'.tr(),
                      style: TextStyle(
                        color: AppTheme.colors.primaryBgColor,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(height: 16),
                    PrimaryTextField(
                      enabled: false,
                      controller: TextEditingController(text: user.email),
                    ),
                    const SizedBox(height: 8),
                    PrimaryTextField(
                      enabled: false,
                      controller: TextEditingController(text: user.name),
                    ),
                    const SizedBox(height: 8),
                    PrimaryTextField(
                      enabled: false,
                      controller: TextEditingController(text: user.phone),
                    ),
                    const SizedBox(height: 8),
                    PrimaryTextField(
                      enabled: false,
                      controller: TextEditingController(
                        text: format.format(user.createdAt!),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              onTap: cubit.logout,
              text: 'logout'.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
