import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/pages/orders_page/orders_cubit.dart';
import 'package:jobee_app/widgets/content_box.dart';
import 'package:jobee_app/widgets/loader.dart';
import 'package:jobee_app/widgets/material_inkwell.dart';
import 'package:jobee_app/widgets/primary_text_field.dart';

import '../containers/orders_list.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  Widget _buildOrders(BuildContext context) {
    final cubit = context.read<OrdersCubit>();
    final orders = cubit.state.orders;

    return Column(
      children: [
        ContentBox(
          width: double.infinity,
          borderRadius: BorderRadius.circular(0),
          color: AppTheme.colors.primaryColor,
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: PrimaryTextField(
                  controller: cubit.search,
                  hint: '${'search'.tr()}...',
                  padding: const EdgeInsets.only(left: 16),
                  suffix: Container(
                    margin: const EdgeInsets.all(4),
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
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ContentBox(child: OrdersList(orders!)),
          ),
        ),
      ],
    );
  }

  Widget _buildChild(BuildContext context) {
    final orders = context.select((OrdersCubit c) => c.state.orders);
    if (orders != null) {
      return _buildOrders(context);
    }

    return const Center(child: Loader());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _buildChild(context),
    );
  }
}
