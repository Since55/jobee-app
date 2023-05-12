import 'package:jobee_app/core/api_client.dart';
import 'package:jobee_app/models/category.dart';
import 'package:jobee_app/models/order.dart';

class OrderApi {
  static Future<List<Order>> getRecentOrders() async {
    final result = await ApiClient.client
        .from('orders')
        .select('*')
        .order('created_at')
        .range(0, 10)
        .withConverter<List<Order>>(
          (data) => (data as List)
              .map((e) => Order.fromMap(e as Map<String, dynamic>))
              .toList(),
        );

    return result;
  }

  static Future<List<Order>> getOrdersWithFilter({
    Category? category,
    String? query,
  }) async {
    var orders = ApiClient.client.from('orders').select('*');

    if (category != null) {
      orders = orders.eq('category_id', category.id);
    }
    if (query != null && query.isNotEmpty) {
      orders = orders.textSearch('title', query);
    }

    final result = await orders.order('created_at').withConverter<List<Order>>(
          (data) => (data as List)
              .map((e) => Order.fromMap(e as Map<String, dynamic>))
              .toList(),
        );

    return result;
  }

  static Future<Order> getOrder(int orderId) async {
    final result =
        await ApiClient.client.from('orders').select('*').eq('id', orderId);

    return Order.fromMap((result as List).first as Map<String, dynamic>);
  }
}
