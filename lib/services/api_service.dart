import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prostock/core/api.dart';
import '../models/user.dart';
import '../models/product.dart';
import '../models/category.dart';
import '../models/order.dart';
import '../models/history.dart';

class ApiService {
  static const String baseUrl = "http://<VOTRE_IP>:3000"; // ou ngrok URL

  // Auth
  static Future<void> logout() async {
    // This is a client-side only logout since the server might not have a logout endpoint
    // If your backend has a logout endpoint, you can uncomment the following:
    /*
    final response = await http.post(
      Uri.parse("$baseUrl/auth/logout"),
      headers: {'Content-Type': 'application/json'},
    );
    
    if (response.statusCode != 200) {
      throw Exception('Failed to logout');
    }
    */
  }

  static Future<User> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/auth/login"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data['user']);
    } else {
      throw Exception(jsonDecode(response.body)['error']);
    }
  }

  static Future<User> register(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse("$baseUrl/auth/register"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return User.fromJson(data['user']);
    } else {
      throw Exception(jsonDecode(response.body)['error']);
    }
  }

  // Products
  static Future<List<Product>> getProducts(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/products"),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      final List jsonData = jsonDecode(response.body);
      return jsonData.map((p) => Product.fromJson(p)).toList();
    } else {
      throw Exception('Erreur récupération produits');
    }
  }

  // Categories
  static Future<List<Category>> getCategories(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/categories"),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      final List jsonData = jsonDecode(response.body);
      return jsonData.map((c) => Category.fromJson(c)).toList();
    } else {
      throw Exception('Erreur récupération catégories');
    }
  }

  // Orders
  static Future<List<Order>> getOrders(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/orders/user"),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      final List jsonData = jsonDecode(response.body);
      return jsonData.map((o) => Order.fromJson(o)).toList();
    } else {
      throw Exception('Erreur récupération commandes');
    }
  }

  // History
  static Future<List<History>> getHistory(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/history"),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      final List jsonData = jsonDecode(response.body);
      return jsonData.map((h) => History.fromJson(h)).toList();
    } else {
      throw Exception('Erreur récupération historique');
    }
  }

  static Future<void> updateProfile(Map<String, dynamic> data, String token) async {
    final response = await http.put(
      Uri.parse("$baseUrl/auth/profile"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(data),
    );
    if (response.statusCode != 200) {
      throw Exception('Erreur mise à jour profil');
    }
  }

  // Update product stock
  static Future<bool> updateProductStock(String token, String productId, int newQuantity) async {
    final response = await http.put(
      Uri.parse("$baseUrl/products/$productId/stock"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode({'quantity': newQuantity}),
    );
    
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Erreur lors de la mise à jour du stock');
    }
  }

  static Future<User> fetchUserProfile(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/auth/profile"),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data['user']);
    } else {
      throw Exception('Erreur récupération profil');
    }
  }
}
