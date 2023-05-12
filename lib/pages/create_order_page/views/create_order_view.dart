import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/pages/create_order_page/containers/create_order_form.dart';
import 'package:jobee_app/pages/create_order_page/create_order_cubit.dart';
import 'package:jobee_app/widgets/content_box.dart';
import 'package:jobee_app/widgets/primary_button.dart';

class CreateOrderView extends StatelessWidget {
  const CreateOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CreateOrderCubit>();
    final state = cubit.state;

    return Column(
      children: [
        ContentBox(
          borderRadius: BorderRadius.circular(0),
          width: double.infinity,
          color: AppTheme.colors.primaryColor,
          child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                ContentBox(
                  child: Text(
                    'create_order'.tr(),
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
        const Expanded(child: CreateOrderForm()),
        Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 0),
          child: PrimaryButton(
            disabled: !state.isValid,
            text: 'create'.tr(),
          ),
        )
      ],
    );
  }
}
