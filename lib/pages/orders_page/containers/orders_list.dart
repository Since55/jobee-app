import 'package:flutter/material.dart';
import 'package:jobee_app/models/order.dart';
import 'package:jobee_app/pages/home_page/widgets/order_card.dart';

class OrdersList extends StatelessWidget {
  final List<Order> orders;

  const OrdersList(this.orders, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: orders.length,
      itemBuilder: (context, index) => OrderCard(orders[index]),
    );
  }
}
