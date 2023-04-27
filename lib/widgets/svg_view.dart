import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgView extends StatelessWidget {
  final double? size;
  final double? width;
  final double? height;
  final String iconName;

  const SvgView(
    this.iconName, {
    this.height,
    this.width,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/$iconName.svg',
      width: width ?? size,
      height: height ?? size,
    );
  }
}
