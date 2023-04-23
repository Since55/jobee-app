import 'package:flutter/material.dart';

/// Wrap with [MaterialInkWell] content of container,
/// that need InkWell effect
class MaterialInkWell extends StatelessWidget {
  final Color? color;
  final Color? splashColor;
  final Widget? child;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const MaterialInkWell({
    super.key,
    this.color,
    this.onTap,
    this.child,
    this.padding,
    this.borderRadius,
    this.splashColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.transparent,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        splashColor: splashColor,
        highlightColor: splashColor?.withOpacity(.2),
        borderRadius: borderRadius,
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}
