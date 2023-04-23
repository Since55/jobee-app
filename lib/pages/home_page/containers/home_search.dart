import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/widgets/material_inkwell.dart';
import 'package:jobee_app/widgets/primary_text_field.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.colors.primaryColor,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(26),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(height: 48),
            Text(
              'find_your_order'.tr(),
              style: AppTheme.applyFontWeight(TextStyle(
                fontSize: 24,
                color: AppTheme.colors.primaryBgColor,
                fontWeight: FontWeight.w700,
              )),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: PrimaryTextField(
                  hint: '${'search'.tr()}...',
                  padding: const EdgeInsets.only(left: 16),
                  suffix: Container(
                    margin: const EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.colors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: MaterialInkWell(
                      onTap: () {},
                      padding: const EdgeInsets.all(8),
                      borderRadius: BorderRadius.circular(100),
                      child: const Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
