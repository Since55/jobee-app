import 'package:jobee_app/core/api_client.dart';
import 'package:jobee_app/models/application.dart';
import 'package:jobee_app/models/order.dart';

class ApplicationsApi {
  static const _tableName = 'applications';

  static Future<void> createApplication(Application application) async {
    await ApiClient.client.from(_tableName).insert(application.toMap());
  }

  static Future<List<Application>> getOrderApplications(Order order) async {
    final result = await ApiClient.client
        .from(_tableName)
        .select('*')
        .eq('order_id', order.id)
        .withConverter<List<Application>>(
          (data) => (data as List)
              .map((e) => Application.fromMap(e as Map<String, dynamic>))
              .toList(),
        );

    return result;
  }

  static Future<List<Application>> getApplicationsForCurrentUser() async {
    final result = await ApiClient.client
        .from(_tableName)
        .select('*')
        .eq('for_user_id', ApiClient.client.auth.currentUser)
        .withConverter<List<Application>>(
          (data) => (data as List)
              .map((e) => Application.fromMap(e as Map<String, dynamic>))
              .toList(),
        );

    return result;
  }

  static Future<List<Application>> getApplicationsFromCurrentUser() async {
    final result = await ApiClient.client
        .from(_tableName)
        .select('*')
        .eq('user_id', ApiClient.client.auth.currentUser)
        .withConverter<List<Application>>(
          (data) => (data as List)
              .map((e) => Application.fromMap(e as Map<String, dynamic>))
              .toList(),
        );

    return result;
  }
}
