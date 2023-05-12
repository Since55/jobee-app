import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/pages/order_page/order_cubit.dart';
import 'package:jobee_app/pages/order_page/views/order_view.dart';

class OrderPage extends StatelessWidget {
  static const path = 'order';

  final String orderId;

  const OrderPage(this.orderId, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(orderId)..init(),
      child: const Scaffold(
        body: OrderView(),
      ),
    );
  }
}
