import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobee_app/cubits/auth/auth_cubit.dart';
import 'package:jobee_app/cubits/provider.dart';
import 'package:jobee_app/pages/account_page/account_page.dart';
import 'package:jobee_app/pages/home_page/home_page.dart';
import 'package:jobee_app/pages/login_page/login_page.dart';
import 'package:jobee_app/pages/main_page/main_page.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final shellNavigatorKey = GlobalKey<NavigatorState>();

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
      opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
      child: child,
    );
  }
}
