import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/api.dart';

class ProductService {
  final Dio _dio = Dio();

  Future<List<dynamic>> getProducts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await _dio.get(
        '$baseUrl/products',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return response.data;
    } on DioException catch (e) {
      print(e.response?.data);
      return [];
    }
  }

  Future<Map<String, dynamic>> updateStock({
    required int productId,
    required int newQuantity,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await _dio.put(
        '$baseUrl/products/$productId',
        data: {'quantity': newQuantity},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return {'success': true, 'data': response.data};
    } on DioException catch (e) {
      return {
        'success': false,
        'message': e.response?.data['error'] ?? 'Erreur mise à jour',
      };
    }
  }
}
