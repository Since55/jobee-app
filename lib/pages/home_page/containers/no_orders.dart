import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/widgets/content_box.dart';

class NoOrders extends StatelessWidget {
  const NoOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentBox(
      child: Center(
        child: Text(
          'no_orders'.tr(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppTheme.colors.primaryBgColor,
          ),
        ),
      ),
    );
  }
}
