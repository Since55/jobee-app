import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jobee_app/core/app_locale.dart';
import 'package:jobee_app/core/app_router.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/setup.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SetupApp(
      builder: (context) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          localizationsDelegates: AppLocale.localizationsDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: AppTheme.buildTheme(context),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
