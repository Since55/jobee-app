import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/models/arguments.dart';
import 'package:jobee_app/pages/orders_page/orders_cubit.dart';
import 'package:jobee_app/pages/orders_page/views/orders_view.dart';

class OrdersPage extends StatelessWidget {
  static const path = 'all-orders';

  final OrdersArgs? args;

  const OrdersPage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit()..init(args),
      child: const Scaffold(body: OrdersView()),
    );
  }
}
