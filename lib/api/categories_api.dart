import 'package:jobee_app/core/api_client.dart';
import 'package:jobee_app/models/category.dart';

class CategoriesApi {
  static Future<List<Category>> getCategories() async {
    final result = await ApiClient.client
        .from('categories')
        .select('*')
        .withConverter<List<Category>>(
          (data) => (data as List)
              .map((e) => Category.fromMap(e as Map<String, dynamic>))
              .toList(),
        );

    return result;
  }
}
