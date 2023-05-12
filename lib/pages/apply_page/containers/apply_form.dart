import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/pages/apply_page/apply_cubit.dart';
import 'package:jobee_app/widgets/content_box.dart';
import 'package:jobee_app/widgets/primary_text_field.dart';

class ApplyForm extends StatelessWidget {
  const ApplyForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ApplyCubit>();

    return Form(
      onChanged: cubit.validate,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ContentBox(
          child: Column(
            children: [
              const SizedBox(height: 16),
              PrimaryTextField(
                controller: cubit.priceController,
                hint: 'offer_price'.tr(),
                keyboardType: TextInputType.number,
                formatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(height: 16),
              PrimaryTextField(
                controller: cubit.contactsController,
                hint: 'how_to_contact_you'.tr(),
              ),
              const SizedBox(height: 16),
              PrimaryTextField(
                controller: cubit.textController,
                maxLines: 8,
                maxLength: 500,
                hint: 'add_information'.tr(),
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
