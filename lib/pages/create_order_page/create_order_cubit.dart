import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobee_app/api/categories_api.dart';
import 'package:jobee_app/api/order_api.dart';
import 'package:jobee_app/cubits/auth/auth_cubit.dart';
import 'package:jobee_app/cubits/provider.dart';
import 'package:jobee_app/models/category.dart';
import 'package:jobee_app/models/order.dart';

class CreateOrderState {
  final List<Category>? categories;
  final Category? selectedCategory;
  final DateTime? deadline;
  final bool isValid;
  final bool isLoading;

  CreateOrderState({
    this.categories,
    this.deadline,
    this.isValid = false,
    this.isLoading = false,
    this.selectedCategory,
  });

  CreateOrderState removeDeadline() {
    return CreateOrderState(
      deadline: null,
      categories: categories,
      isValid: isValid,
      isLoading: isLoading,
      selectedCategory: selectedCategory,
    );
  }

  CreateOrderState copyWith({
    List<Category>? categories,
    Category? selectedCategory,
    DateTime? deadline,
    bool? isValid,
    bool? isLoading,
  }) {
    return CreateOrderState(
      categories: categories ?? this.categories,
      isValid: isValid ?? this.isValid,
      isLoading: isLoading ?? this.isLoading,
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
    final hasLocation = locationCtrl.text.isNotEmpty;

    final isValid = hasTitle && hasCategory && hasDescription && hasLocation;
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

  Order _createOrder() {
    final user = AppBlocProvider.find<AuthCubit>().state.userData;

    return Order(
      categoryId: state.selectedCategory!.id,
      createdAt: DateTime.now(),
      description: descriptionCtrl.text,
      icon: state.selectedCategory!.icon,
      location: locationCtrl.text,
      title: titleCtrl.text,
      userId: user!.userId,
      userName: user.name!,
      deadline: state.deadline,
      price: num.parse(priceCtrl.text),
    );
  }

  Future<void> onCreate(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    try {
      await OrderApi.createOrder(_createOrder());
      if (context.mounted) context.pop();
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
