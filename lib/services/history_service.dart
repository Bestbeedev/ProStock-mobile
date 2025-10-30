import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/api.dart';

class HistoryService {
  final Dio _dio = Dio();

  Future<List<dynamic>> getUserHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await _dio.get(
        '$baseUrl/history',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return response.data;
    } on DioException catch (e) {
      print("Erreur historique: ${e.response?.data}");
      return [];
    }
  }
}
