import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/pages/order_page/order_cubit.dart';
import 'package:jobee_app/widgets/content_box.dart';
import 'package:jobee_app/widgets/page_loader.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({super.key});

  @override
  Widget build(BuildContext context) {
    final author = context.select((OrderCubit c) => c.state.author);

    return PageLoader(
      show: author == null,
      child: Builder(builder: (context) {
        return ContentBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'author'.tr(),
                style: TextStyle(
                  color: AppTheme.colors.primaryBgColor,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                runSpacing: 8,
                spacing: 8,
                children: [
                  ContentBox(
                    color: AppTheme.colors.primaryBgColor,
                    child: Text(
                      author!.email,
                    ),
                  ),
                  if (author.name != null)
                    ContentBox(
                      color: AppTheme.colors.primaryBgColor,
                      child: Text(author.name!),
                    ),
                  if (author.phone != null)
                    ContentBox(
                      color: AppTheme.colors.primaryBgColor,
                      child: Text(author.phone!),
                    ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
