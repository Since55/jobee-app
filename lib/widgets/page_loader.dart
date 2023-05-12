import 'package:flutter/material.dart';
import 'package:jobee_app/widgets/loader.dart';

class PageLoader extends StatelessWidget {
  final bool show;
  final Widget child;

  const PageLoader({
    required this.show,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: show ? const Center(child: Loader()) : child,
    );
  }
}
