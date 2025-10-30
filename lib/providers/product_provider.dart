import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts(String token) async {
    try {
      _products = await ApiService.getProducts(token);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateStock(String token, String productId, int newQuantity) async {
    try {
      bool success = await ApiService.updateProductStock(token, productId, newQuantity);
      if (success) {
        // Update the local product list
        final index = _products.indexWhere((p) => p.id == productId);
        if (index != -1) {
          _products[index] = _products[index].copyWith(quantity: newQuantity);
          notifyListeners();
        }
      }
      return success;
    } catch (e) {
      rethrow;
    }
  }
}
