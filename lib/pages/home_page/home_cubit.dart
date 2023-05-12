import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobee_app/api/categories_api.dart';
import 'package:jobee_app/api/order_api.dart';
import 'package:jobee_app/models/arguments.dart';
import 'package:jobee_app/models/category.dart';
import 'package:jobee_app/models/order.dart';
import 'package:jobee_app/pages/orders_page/orders_page.dart';

class HomeState {
  final List<Category>? categories;
  final List<Order>? recentOrders;

  HomeState({
    this.categories,
    this.recentOrders,
  });

  HomeState copyWith({
    List<Category>? categories,
    List<Order>? recentOrders,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      recentOrders: recentOrders ?? this.recentOrders,
    );
  }
}

class HomeCubit extends Cubit<HomeState> {
  final searchController = TextEditingController();

  HomeCubit() : super(HomeState());

  void init() {
    getCategories();
    getOrders();
  }

  void onSearch(BuildContext context) {
    if (searchController.text.isNotEmpty) {
      context.goNamed(OrdersPage.path,
          extra: OrdersArgs(query: searchController.text));
    }
  }

  Future<void> getCategories() async {
    final categories = await CategoriesApi.getCategories();
    emit(state.copyWith(categories: categories));
  }

  Future<void> getOrders() async {
    final orders = await OrderApi.getRecentOrders();
    emit(state.copyWith(recentOrders: orders));
  }
}
