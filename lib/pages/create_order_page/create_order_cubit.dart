import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/api/categories_api.dart';
import 'package:jobee_app/models/category.dart';

class CreateOrderState {
  final List<Category>? categories;
  final Category? selectedCategory;
  final DateTime? deadline;
  final bool isValid;

  CreateOrderState({
    this.categories,
    this.deadline,
    this.isValid = false,
    this.selectedCategory,
  });

  CreateOrderState removeDeadline() {
    return CreateOrderState(
      deadline: null,
      categories: categories,
      isValid: isValid,
      selectedCategory: selectedCategory,
    );
  }

  CreateOrderState copyWith({
    List<Category>? categories,
    Category? selectedCategory,
    DateTime? deadline,
    bool? isValid,
  }) {
    return CreateOrderState(
      categories: categories ?? this.categories,
      isValid: isValid ?? this.isValid,
      deadline: deadline ?? this.deadline,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

class CreateOrderCubit extends Cubit<CreateOrderState> {
  final deadlineCtrl = TextEditingController();
  final locationCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final titleCtrl = TextEditingController();

  CreateOrderCubit() : super(CreateOrderState());

  void init() {
    getCategories();
  }

  void validate() {
    final hasTitle = titleCtrl.text.isNotEmpty;
    final hasCategory = state.selectedCategory != null;
    final hasDescription = descriptionCtrl.text.isNotEmpty;
    final isValid = hasTitle && hasCategory && hasDescription;
    emit(state.copyWith(isValid: isValid));
  }

  Future<void> getCategories() async {
    final categories = await CategoriesApi.getCategories();
    emit(state.copyWith(categories: categories));
  }

  void onChangeCategory(Category? category) {
    emit(state.copyWith(selectedCategory: category));
  }

  Future<void> onSelectDeadline(BuildContext context) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    // ignore: use_build_context_synchronously
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null && time != null) {
      final dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );

      final format = DateFormat('dd:MM:yyyy, HH:mm');
      deadlineCtrl.text = format.format(dateTime);
      emit(state.copyWith(deadline: dateTime));
    }
  }

  void onRemoveDeadline() {
    deadlineCtrl.clear();
    emit(state.removeDeadline());
  }
}
