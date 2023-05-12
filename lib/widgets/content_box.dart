import 'package:flutter/material.dart';
import 'package:jobee_app/core/app_theme.dart';

class ContentBox extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double? width;
  final BorderRadius? borderRadius;

  const ContentBox({
    this.child,
    this.color,
    this.width,
    this.borderRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        color: color ?? AppTheme.colors.secondaryBgColor,
      ),
      child: child,
    );
  }
}
