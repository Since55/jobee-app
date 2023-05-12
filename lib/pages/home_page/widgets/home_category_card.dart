import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobee_app/core/app_theme.dart';

import 'package:jobee_app/models/category.dart';
import 'package:jobee_app/widgets/material_inkwell.dart';

class HomeCategoryCard extends StatelessWidget {
  final Category category;
  final void Function() onTap;

  const HomeCategoryCard({
    super.key,
    required this.onTap,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialInkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          SvgPicture.network(category.icon, width: 56, height: 56),
          const SizedBox(height: 8),
          Text(
            category.localizedName,
            style: TextStyle(
              color: AppTheme.colors.primaryBgColor,
            ),
          ),
        ],
      ),
    );
  }
}
