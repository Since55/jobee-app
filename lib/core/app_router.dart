import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobee_app/cubits/auth/auth_cubit.dart';
import 'package:jobee_app/models/arguments.dart';
import 'package:jobee_app/pages/account_page/account_page.dart';
import 'package:jobee_app/pages/apply_page/apply_page.dart';
import 'package:jobee_app/pages/home_page/home_page.dart';
import 'package:jobee_app/pages/login_page/login_page.dart';
import 'package:jobee_app/pages/main_page/main_page.dart';
import 'package:jobee_app/pages/order_page/order_page.dart';
import 'package:jobee_app/pages/orders_page/orders_page.dart';
import 'package:jobee_app/pages/user_orders/user_orders_page.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final shellNavigatorKey = GlobalKey<NavigatorState>();

  static Widget _authRoute(BuildContext context, Widget route) {
    final auth = context.watch<AuthCubit>();

    if (auth.state.isAuthorized) return route;

    return const LoginPage();
  }

  static final router = GoRouter(
    initialLocation: HomePage.path,
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) => MainPage(child),
        routes: [
          GoRoute(
            path: HomePage.path,
            pageBuilder: (context, state) => const CustomTransitionPage(
              child: HomePage(),
              transitionsBuilder: _fadeTransition,
            ),
            routes: [
              GoRoute(
                name: OrderPage.path,
                path: '${OrderPage.path}:orderId',
                builder: (context, state) =>
                    OrderPage(state.params['orderId'] as String),
                routes: [
                  GoRoute(
                    name: ApplyPage.path,
                    path: ApplyPage.path,
                    builder: (context, state) => _authRoute(
                      context,
                      ApplyPage(state.extra as ApplyArgs),
                    ),
                  ),
                ],
              ),
              GoRoute(
                name: OrdersPage.path,
                path: OrdersPage.path,
                builder: (context, state) =>
                    OrdersPage(args: state.extra as OrdersArgs?),
              ),
            ],
          ),
          GoRoute(
            path: UserOrdersPage.path,
            pageBuilder: (context, state) => CustomTransitionPage(
              child: _authRoute(
                context,
                const UserOrdersPage(),
              ),
              transitionsBuilder: _fadeTransition,
            ),
          ),
          GoRoute(
            path: AccountPage.path,
            pageBuilder: (context, state) => const CustomTransitionPage(
              child: AccountPage(),
              transitionsBuilder: _fadeTransition,
            ),
          ),
        ],
      ),
    ],
  );

  static Widget _fadeTransition(
      BuildContext ctx, Animation<double> animation, _, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
