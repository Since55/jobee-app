import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/cubits/provider.dart';
import 'package:jobee_app/pages/main_page/main_cubit.dart';

class MainPage extends StatelessWidget {
  final Widget child;
  const MainPage(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProvider.homeProviders,
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          final cubit = context.read<MainCubit>();

          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.currentPageIdx,
              onTap: (idx) => cubit.onChangePage(context, idx),
              items: [
                BottomNavigationBarItem(
                  label: 'home',
                  icon: const Icon(Icons.home),
                  backgroundColor: AppTheme.colors.primaryTextColor,
                ),
                BottomNavigationBarItem(
                  label: 'orders',
                  icon: const Icon(Icons.list_alt),
                  backgroundColor: AppTheme.colors.primaryTextColor,
                ),
                BottomNavigationBarItem(
                  label: 'account',
                  icon: const Icon(Icons.account_circle),
                  backgroundColor: AppTheme.colors.primaryTextColor,
                ),
              ],
            ),
            body: child,
          );
        },
      ),
    );
  }
}
