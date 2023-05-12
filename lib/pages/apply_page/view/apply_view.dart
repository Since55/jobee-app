import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/pages/apply_page/apply_cubit.dart';
import 'package:jobee_app/pages/apply_page/containers/apply_form.dart';
import 'package:jobee_app/widgets/primary_button.dart';

class ApplyView extends StatelessWidget {
  const ApplyView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ApplyCubit>();
    final state = cubit.state;

    if (state.order == null) return const Text('error');

    return Column(
      children: [
        Container(
          width: double.infinity,
          color: AppTheme.colors.primaryColor,
          child: SafeArea(
            bottom: false,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  state.order!.title,
                  style: AppTheme.applyFontWeight(TextStyle(
                    fontSize: 24,
                    color: AppTheme.colors.primaryBgColor,
                    fontWeight: FontWeight.w700,
                  )),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        const ApplyForm(),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: PrimaryButton(
            text: 'send'.tr(),
            disabled: !state.isValid,
            loading: state.isLoading,
            onTap: () => cubit.onApply(context),
          ),
        )
      ],
    );
  }
}
