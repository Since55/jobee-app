import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/pages/order_page/container/author_card.dart';
import 'package:jobee_app/pages/order_page/container/order_author_data.dart';
import 'package:jobee_app/pages/order_page/order_cubit.dart';
import 'package:jobee_app/widgets/content_box.dart';
import 'package:jobee_app/widgets/page_loader.dart';
import 'package:jobee_app/widgets/primary_button.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<OrderCubit>();
    final order = cubit.state.order;
    final dateFormat = DateFormat('dd.MM.yyyy, HH:mm');

    return PageLoader(
      show: order == null,
      child: Builder(builder: (context) {
        return SafeArea(
          top: false,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ContentBox(
                        borderRadius: BorderRadius.circular(0),
                        width: double.infinity,
                        color: AppTheme.colors.primaryColor,
                        child: SafeArea(
                          bottom: false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ContentBox(
                                child: Text(
                                  order!.title,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: AppTheme.colors.primaryBgColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                if (order.price != null) ...[
                                  ContentBox(
                                    color: AppTheme.colors.primaryColor,
                                    child: Text(
                                      '${order.price!} ₴',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppTheme.colors.primaryBgColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                ],
                                ContentBox(
                                  child: Text(
                                    '${'published'.tr()} ${dateFormat.format(order.createdAt)}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppTheme.colors.primaryBgColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (order.deadline != null) ...[
                              const SizedBox(height: 8),
                              ContentBox(
                                color: AppTheme.colors.primaryColor,
                                child: Text(
                                  '${'due_by'.tr()} ${dateFormat.format(order.deadline!)}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.colors.primaryBgColor,
                                  ),
                                ),
                              ),
                            ],
                            const SizedBox(height: 8),
                            ContentBox(
                              child: Text(
                                order.description,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppTheme.colors.primaryBgColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            ContentBox(
                              child: Text(
                                order.location,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppTheme.colors.primaryBgColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const AuthorCard(),
                          ],
                        ),
                      ),
                      if (cubit.isAuthor)
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: OrderAuthorData(),
                        ),
                    ],
                  ),
                ),
              ),
              if (!cubit.isAuthor)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16)
                      .copyWith(bottom: 16),
                  child: PrimaryButton(
                    text: 'apply'.tr(),
                    onTap: () => cubit.onApply(context),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
