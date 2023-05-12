import 'package:jobee_app/models/category.dart';
import 'package:jobee_app/models/order.dart';

class OrdersArgs {
  final Category? category;
  final String? query;

  OrdersArgs({this.category, this.query});
}

class ApplyArgs {
  final Order order;

  ApplyArgs(this.order);

}
