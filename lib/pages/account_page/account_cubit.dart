import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/cubits/auth/auth_cubit.dart';
import 'package:jobee_app/cubits/provider.dart';

class AccountState {}

class AccountCubit extends Cubit<AccountState> {
  final _authCubit = AppBlocProvider.find<AuthCubit>();

  AccountCubit() : super(AccountState());

  Future<void> logout() async {
    await _authCubit.logout();
  }
}
