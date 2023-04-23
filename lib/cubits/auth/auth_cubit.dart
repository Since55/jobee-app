import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/cubits/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());
}
