import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/core/app_locale.dart';
import 'package:jobee_app/cubits/provider.dart';

class SetupApp extends StatelessWidget {
  final Widget Function(BuildContext) builder;

  const SetupApp({super.key, required this.builder});

  Widget _buildApp(BuildContext context) {
    return builder(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppLocale.localizeApp(
      app: MultiBlocProvider(
        providers: AppBlocProvider.appProviders,
        child: Builder(builder: _buildApp),
      ),
    );
  }
}
