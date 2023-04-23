import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/cubits/auth/auth_cubit.dart';
import 'package:jobee_app/utils/bloc_utils.dart';

class AppBlocProvider {
  static final BlocBox _box = BlocBox();

  static List<BlocProvider> get appProviders => [
        BlocProvider<AuthCubit>(
          lazy: false,
          create: (_) => _box.add(AuthCubit()),
        ),
      ];

  static List<BlocProvider> get homeProviders => [];

  static T find<T extends BlocBase>() => _box.find<T>();
}
