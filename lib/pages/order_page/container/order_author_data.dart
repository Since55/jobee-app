import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/pages/order_page/order_cubit.dart';
import 'package:jobee_app/widgets/applications_list.dart';
import 'package:jobee_app/widgets/content_box.dart';
import 'package:jobee_app/widgets/loader.dart';
import 'package:jobee_app/widgets/no_applications.dart';
import 'package:jobee_app/widgets/primary_button.dart';

class OrderAuthorData extends StatelessWidget {
  const OrderAuthorData({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<OrderCubit>();
    final order = cubit.state.order;
    final applications = cubit.state.applications;

    if (applications == null) return const Loader();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryButton(
          onTap: cubit.toggleOrder,
          text: order!.active ? 'close_order'.tr() : 'reopen_order'.tr(),
        ),
        const SizedBox(height: 32),
        if (applications.isEmpty)
          const NoApplications()
        else ...[
          Text(
            'applications'.tr(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ContentBox(
            padding: const EdgeInsets.all(16.0),
            child: ApplicationsList(
              cubit.state.applications!,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ]
      ],
    );
  }
}
