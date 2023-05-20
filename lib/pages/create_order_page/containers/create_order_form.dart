import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/models/category.dart';
import 'package:jobee_app/pages/create_order_page/create_order_cubit.dart';
import 'package:jobee_app/widgets/content_box.dart';
import 'package:jobee_app/widgets/loader.dart';
import 'package:jobee_app/widgets/primary_text_field.dart';

class CreateOrderForm extends StatelessWidget {
  const CreateOrderForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CreateOrderCubit>();

    return Form(
      onChanged: cubit.validate,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: ContentBox(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  PrimaryTextField(
                    controller: cubit.priceCtrl,
                    hint: 'price'.tr(),
                    prefix: const Text('₴'),
                    keyboardType: TextInputType.number,
                    formatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  const SizedBox(height: 8),
                  PrimaryTextField(
                    controller: cubit.titleCtrl,
                    hint: 'title'.tr(),
                  ),
                  const SizedBox(height: 8),
                  PrimaryTextField(
                    controller: cubit.locationCtrl,
                    hint: 'location'.tr(),
                  ),
                  const SizedBox(height: 8),
                  const CategoryPicker(),
                  const SizedBox(height: 8),
                  PrimaryTextField(
                    controller: cubit.deadlineCtrl,
                    keyboardType: TextInputType.none,
                    formatters: [FilteringTextInputFormatter.deny('*')],
                    onTap: () => cubit.onSelectDeadline(context),
                    hint: 'deadline'.tr(),
                    suffix: GestureDetector(
                      onTap: cubit.onRemoveDeadline,
                      child: const Icon(Icons.close),
                    ),
                    enabled: false,
                  ),
                  const SizedBox(height: 8),
                  PrimaryTextField(
                    controller: cubit.descriptionCtrl,
                    hint: 'description'.tr(),
                    maxLines: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryPicker extends StatelessWidget {
  const CategoryPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CreateOrderCubit>();
    final state = cubit.state;
    final categories = state.categories;
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.colors.primaryBgColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: categories == null
          ? Row(
              children: const [
                SizedBox(
                  width: 42,
                  height: 42,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Loader(),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: DropdownButton<Category>(
                    value: state.selectedCategory,
                    elevation: 16,
                    isExpanded: true,
                    hint: Text('category'.tr()),
                    underline:
                        Container(height: 0, color: Colors.deepPurpleAccent),
                    onChanged: cubit.onChangeCategory,
                    items: categories
                        .map(
                          (c) => DropdownMenuItem<Category>(
                            value: c,
                            child: Row(
                              children: [
                                SvgPicture.network(c.icon),
                                const SizedBox(width: 8),
                                Text(
                                  c.localizedName,
                                  style: TextStyle(
                                    color: AppTheme.colors.secondaryBgColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
    );
  }
}
