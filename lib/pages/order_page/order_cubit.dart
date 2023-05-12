import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobee_app/api/applications_api.dart';
import 'package:jobee_app/api/auth_api.dart';
import 'package:jobee_app/api/order_api.dart';
import 'package:jobee_app/cubits/auth/auth_cubit.dart';
import 'package:jobee_app/cubits/provider.dart';
import 'package:jobee_app/models/application.dart';
import 'package:jobee_app/models/arguments.dart';
import 'package:jobee_app/models/order.dart';
import 'package:jobee_app/models/user.dart';
import 'package:jobee_app/pages/apply_page/apply_page.dart';

class OrderState {
  final String? orderId;
  final Order? order;
  final UserData? author;
  final List<Application>? applications;

  OrderState({
    this.author,
    this.applications,
    this.orderId,
    this.order,
  });

  OrderState copyWith({
    Order? order,
    String? orderId,
    UserData? author,
    List<Application>? applications,
  }) {
    return OrderState(
      order: order ?? this.order,
      author: author ?? this.author,
      orderId: orderId ?? this.orderId,
      applications: applications ?? this.applications,
    );
  }
}

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(String orderId) : super(OrderState(orderId: orderId));
  final _authCubit = AppBlocProvider.find<AuthCubit>();

  bool get isAuthor =>
      _authCubit.state.userData?.userId == state.author?.userId;

  void init() {
    getOrder().then((_) {
      getAuthor();
      getApplications();
    });
  }

  Future<void> getOrder() async {
    final order = await OrderApi.getOrder(int.parse(state.orderId!));
    emit(state.copyWith(order: order));
  }

  Future<void> getApplications() async {
    final applications =
        await ApplicationsApi.getOrderApplications(state.order!);
    emit(state.copyWith(applications: applications));
  }

  Future<void> getAuthor() async {
    if (state.order?.userId == null) return;

    final author = await AuthApi.getUser(state.order!.userId);
    emit(state.copyWith(author: author));
  }

  void onApply(BuildContext context) {
    context.goNamed(
      ApplyPage.path,
      extra: ApplyArgs(state.order!),
      params: {'orderId': state.orderId!},
    );
  }

  // Close and reopen order
  Future<void> toggleOrder() async {
    final newOrder = state.order!.copyWith(active: !state.order!.active);

    await OrderApi.toggleOrderStatus(newOrder.id, newOrder.active);

    emit(state.copyWith(order: newOrder));
  }
}
