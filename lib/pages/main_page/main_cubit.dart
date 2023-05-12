import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobee_app/pages/account_page/account_page.dart';
import 'package:jobee_app/pages/home_page/home_page.dart';
import 'package:jobee_app/pages/user_orders/user_orders_page.dart';

class MainState {
  final int currentPageIdx;

  const MainState({
    this.currentPageIdx = 0,
  });

  MainState copyWith({
    int? currentPageIdx,
  }) {
    return MainState(
      currentPageIdx: currentPageIdx ?? this.currentPageIdx,
    );
  }
}

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());

  static const _routes = [
    HomePage.path,
    UserOrdersPage.path,
    AccountPage.path,
  ];

  void onChangePage(BuildContext context, int idx) {
    emit(state.copyWith(currentPageIdx: idx));
    context.go(_routes[idx]);
  }
}
