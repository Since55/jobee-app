import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/pages/register_page/register_cubit.dart';
import 'package:jobee_app/widgets/content_box.dart';
import 'package:jobee_app/widgets/primary_text_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return Form(
      onChanged: cubit.validate,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: ContentBox(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                PrimaryTextField(
                  controller: cubit.nameCtrl,
                  hint: 'full_name'.tr(),
                ),
                const SizedBox(height: 8),
                PrimaryTextField(
                  controller: cubit.phoneCtrl,
                  hint: 'phone'.tr(),
                ),
                const SizedBox(height: 8),
                PrimaryTextField(
                  controller: cubit.emailCtrl,
                  hint: 'email'.tr(),
                ),
                const SizedBox(height: 8),
                PrimaryTextField(
                  obscure: true,
                  controller: cubit.passwordCtrl,
                  hint: 'password'.tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
