import 'package:jobee_app/core/api_client.dart';
import 'package:jobee_app/models/category.dart';
import 'package:jobee_app/models/order.dart';

class OrderApi {
  static Future<List<Order>> getRecentOrders() async {
    final result = await ApiClient.client
        .from('orders')
        .select('*')
        .eq('active', true)
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

    final result = await orders
        .eq('active', true)
        .order('created_at')
        .withConverter<List<Order>>(
          (data) => (data as List)
              .map((e) => Order.fromMap(e as Map<String, dynamic>))
              .toList(),
        );

    return result;
  }

  static Future<List<Order>> getUserOrders() async {
    final result = await ApiClient.client
        .from('orders')
        .select('*')
        .eq('user_id', ApiClient.client.auth.currentUser?.id)
        .order('created_at')
        .withConverter<List<Order>>(
          (data) => (data as List)
              .map((e) => Order.fromMap(e as Map<String, dynamic>))
              .toList(),
        );

    return result;
  }

  static Future<void> createOrder(Order order) async {
    await ApiClient.client.from('orders').insert(order.toMap());
  }

  static Future<Order> getOrder(int orderId) async {
    final result =
        await ApiClient.client.from('orders').select('*').eq('id', orderId);

    return Order.fromMap((result as List).first as Map<String, dynamic>);
  }

  static Future<void> toggleOrderStatus(int orderId, bool status) async {
    await ApiClient.client
        .from('orders')
        .update({'active': status}).eq('id', orderId);
  }
}
