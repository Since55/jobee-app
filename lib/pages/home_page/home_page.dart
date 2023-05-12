import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/pages/home_page/home_cubit.dart';
import 'package:jobee_app/pages/home_page/views/home_view.dart';
import 'package:jobee_app/pages/home_page/widgets/create_order_button.dart';

class HomePage extends StatelessWidget {
  static const path = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..init(),
      child: const Scaffold(
        floatingActionButton: CreateOrderButton(),
        body: HomeView(),
      ),
    );
  }
}
