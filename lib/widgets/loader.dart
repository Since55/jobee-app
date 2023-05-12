import 'package:flutter/material.dart';
import 'package:jobee_app/core/app_theme.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: AppTheme.colors.secondaryBgColor,
    );
  }
}
