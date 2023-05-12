import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/api/order_api.dart';
import 'package:jobee_app/models/arguments.dart';

import 'package:jobee_app/models/category.dart';
import 'package:jobee_app/models/order.dart';

class OrdersState {
  final List<Order>? orders;
  final Category? category;

  const OrdersState({
    this.orders,
    this.category,
  });

  OrdersState copyWith({
    List<Order>? orders,
    Category? category,
  }) {
    return OrdersState(
      orders: orders ?? this.orders,
      category: category ?? this.category,
    );
  }
}

class OrdersCubit extends Cubit<OrdersState> {
  final search = TextEditingController();

  OrdersCubit() : super(const OrdersState());

  void init(OrdersArgs? args) {
    if (args != null) {
      search.text = args.query ?? '';
      emit(state.copyWith(category: args.category));
    }

    getOrders();
  }

  Future<void> getOrders() async {
    final orders = await OrderApi.getOrdersWithFilter(
      category: state.category,
      query: search.text,
    );

    emit(state.copyWith(orders: orders));
  }
}
