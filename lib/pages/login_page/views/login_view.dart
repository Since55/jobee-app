import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/pages/login_page/containers/login_form.dart';
import 'package:jobee_app/pages/register_page/register_page.dart';
import 'package:jobee_app/widgets/material_inkwell.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          const SizedBox(height: 32),
          const SizedBox(height: 32),
          const Center(child: LoginForm()),
          MaterialInkWell(
            onTap: () => context.goNamed(RegisterPage.path),
            borderRadius: BorderRadius.circular(100),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            splashColor: AppTheme.colors.primaryColor,
            child: Text(
              'register'.tr(),
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
