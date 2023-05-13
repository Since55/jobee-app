import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/pages/login_page/login_cubit.dart';
import 'package:jobee_app/widgets/primary_button.dart';
import 'package:jobee_app/widgets/primary_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<LoginCubit>();
    final state = cubit.state;

    return Form(
      onChanged: cubit.validate,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.colors.secondaryBgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'login'.tr(),
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppTheme.colors.primaryBgColor,
              ),
            ),
            const SizedBox(height: 16),
            PrimaryTextField(
              controller: cubit.email,
              hint: 'email'.tr(),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 8),
            PrimaryTextField(
              obscure: true,
              controller: cubit.password,
              hint: 'password'.tr(),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 130,
                child: PrimaryButton(
                  text: 'log_in'.tr(),
                  disabled: !state.isValid,
                  loading: state.isLoggingIn,
                  onTap: () => cubit.login(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
