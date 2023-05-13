import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/cubits/auth/auth_cubit.dart';
import 'package:jobee_app/cubits/auth/auth_state.dart';
import 'package:jobee_app/cubits/provider.dart';
import 'package:jobee_app/models/user.dart';
import 'package:jobee_app/utils/bloc_utils.dart';

class AccountState {
  final UserData? user;

  AccountState({this.user});

  AccountState copyWith({
    UserData? user,
  }) {
    return AccountState(
      user: user ?? this.user,
    );
  }
}

class AccountCubit extends Cubit<AccountState> with BlocStateProviderMixin {
  final _authCubit = AppBlocProvider.find<AuthCubit>();

  AccountCubit() : super(AccountState());

  void init() {
    emit(state.copyWith(user: _authCubit.state.userData));
    listenBlocState(_authCubit, _fromAuthState);
  }

  void _fromAuthState(AppAuthState state) {
    emit(this.state.copyWith(user: state.userData));
  }

  Future<void> logout() async {
    await _authCubit.logout();
  }
}
