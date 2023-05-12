import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/pages/create_order_page/create_order_page.dart';

class CreateOrderButton extends StatelessWidget {
  const CreateOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.goNamed(CreateOrderPage.path),
      tooltip: 'create_order'.tr(),
      backgroundColor: AppTheme.colors.primaryColor,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
