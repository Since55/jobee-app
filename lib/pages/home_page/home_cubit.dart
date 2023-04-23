import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/api/categories.dart';
import 'package:jobee_app/models/category.dart';

class HomeState {
  final List<Category>? categories;

  HomeState({
    this.categories,
  });

  HomeState copyWith({
    List<Category>? categories,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
    );
  }
}

class HomeCubit extends Cubit<HomeState> {
  final searchController = TextEditingController();

  HomeCubit() : super(HomeState());

  void init() {
    getCategories();
  }

  Future<void> getCategories() async {
    final categories = await CategoriesApi.getCategories();
    emit(state.copyWith(categories: categories));
  }
}
