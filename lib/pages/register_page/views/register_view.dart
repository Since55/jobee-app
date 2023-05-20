import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/pages/register_page/containers/register_form.dart';
import 'package:jobee_app/pages/register_page/register_cubit.dart';
import 'package:jobee_app/widgets/primary_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<RegisterCubit>();

    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.colors.primaryColor,
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                const SizedBox(height: 48),
                Text(
                  'JoBee',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: AppTheme.colors.primaryBgColor,
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
        const RegisterForm(),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 0),
          child: PrimaryButton(
            text: 'register'.tr(),
            loading: cubit.state.isLoading,
            disabled: !cubit.state.isValid,
            onTap: () => cubit.onRegister(context),
          ),
        )
      ],
    );
  }
}
