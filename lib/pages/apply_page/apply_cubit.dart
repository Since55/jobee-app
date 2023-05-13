import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobee_app/api/applications_api.dart';
import 'package:jobee_app/cubits/auth/auth_cubit.dart';
import 'package:jobee_app/cubits/provider.dart';
import 'package:jobee_app/models/application.dart';
import 'package:jobee_app/models/arguments.dart';
import 'package:jobee_app/models/order.dart';

class ApplyState {
  final Order? order;
  final bool isValid;
  final bool isLoading;

  ApplyState({
    this.order,
    this.isValid = false,
    this.isLoading = false,
  });

  ApplyState copyWith({
    Order? order,
    bool? isValid,
    bool? isLoading,
  }) {
    return ApplyState(
      order: order ?? this.order,
      isValid: isValid ?? this.isValid,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class ApplyCubit extends Cubit<ApplyState> {
  final textController = TextEditingController();
  final contactsController = TextEditingController();
  final priceController = TextEditingController();
  final _authCubit = AppBlocProvider.find<AuthCubit>();

  ApplyCubit() : super(ApplyState());

  void init(ApplyArgs args) {
    emit(state.copyWith(order: args.order));
  }

  void validate() {
    final isValid = contactsController.text.isNotEmpty;

    emit(state.copyWith(isValid: isValid));
  }

  Application _createApplication() {
    return Application(
      userName: _authCubit.state.userData?.name ?? '',
      orderId: state.order!.id!,
      text: textController.text,
      forUserId: state.order!.userId,
      contacts: contactsController.text,
      price: num.tryParse(priceController.text),
      userId: _authCubit.state.userData!.userId,
    );
  }

  Future<void> onApply(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    try {
      await ApplicationsApi.createApplication(_createApplication());
      if (context.mounted) context.pop();
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
