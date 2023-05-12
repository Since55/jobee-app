import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/pages/home_page/containers/no_orders.dart';
import 'package:jobee_app/pages/orders_page/containers/orders_list.dart';
import 'package:jobee_app/pages/user_orders/user_orders_cubit.dart';
import 'package:jobee_app/widgets/content_box.dart';
import 'package:jobee_app/widgets/loader.dart';

class UserOrdersList extends StatelessWidget {
  const UserOrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<UserOrdersCubit>();
    final orders = cubit.state.userOrders;

    if (orders == null) return const Loader();
    if (orders.isEmpty) return const NoOrders();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ContentBox(
        child: OrdersList(cubit.state.userOrders!),
      ),
    );
  }
}
