import 'package:jobee_app/core/api_client.dart';
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
}
