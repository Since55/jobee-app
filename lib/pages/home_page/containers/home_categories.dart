import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/pages/home_page/containers/home_categories_list.dart';
import 'package:jobee_app/pages/home_page/home_cubit.dart';
import 'package:jobee_app/widgets/loader.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  Widget _buildCategories(BuildContext context) {
    final categories = context.select((HomeCubit c) => c.state.categories);

    if (categories == null) return const Center(child: Loader());

    return HomeCategoriesList(categories);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppTheme.colors.secondaryBgColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'categories'.tr(),
              style: AppTheme.applyFontWeight(TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppTheme.colors.primaryBgColor,
              )),
            ),
          ),
          const SizedBox(height: 4),
          _buildCategories(context),
        ],
      ),
    );
  }
}
