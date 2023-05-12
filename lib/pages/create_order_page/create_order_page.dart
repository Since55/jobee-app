import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/pages/create_order_page/create_order_cubit.dart';
import 'package:jobee_app/pages/create_order_page/views/create_order_view.dart';

class CreateOrderPage extends StatelessWidget {
  static const path = 'create-order';

  const CreateOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateOrderCubit()..init(),
      child: const Scaffold(
        body: CreateOrderView(),
      ),
    );
  }
}
