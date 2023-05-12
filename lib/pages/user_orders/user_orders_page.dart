import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/pages/user_orders/user_orders_cubit.dart';
import 'package:jobee_app/pages/user_orders/views/user_orders_view.dart';

class UserOrdersPage extends StatelessWidget {
  static const path = '/user-orders';
  const UserOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserOrdersCubit()..init(),
      child: const Scaffold(body: UserOrdersView()),
    );
  }
}
