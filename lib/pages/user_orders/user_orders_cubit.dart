import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobee_app/api/applications_api.dart';
import 'package:jobee_app/api/order_api.dart';
import 'package:jobee_app/models/application.dart';
import 'package:jobee_app/models/order.dart';

class UserOrdersState {
  final List<Order>? userOrders;
  final List<Application>? userApplications;

  UserOrdersState({
    this.userOrders,
    this.userApplications,
  });

  UserOrdersState copyWith({
    List<Order>? userOrders,
    List<Application>? userApplications,
  }) {
    return UserOrdersState(
      userOrders: userOrders ?? this.userOrders,
      userApplications: userApplications ?? this.userApplications,
    );
  }
}

class UserOrdersCubit extends Cubit<UserOrdersState> {
  UserOrdersCubit() : super(UserOrdersState());

  void init() {
    getOrders();
    getApplications();
  }

  Future<void> getOrders() async {
    final orders = await OrderApi.getUserOrders();
    emit(state.copyWith(userOrders: orders));
  }

  Future<void> getApplications() async {
    final applications = await ApplicationsApi.getApplicationsFromCurrentUser();
    emit(state.copyWith(userApplications: applications));
  }
}
