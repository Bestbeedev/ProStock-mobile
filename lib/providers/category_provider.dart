import 'package:flutter/material.dart';
import '../models/category.dart';
import '../services/api_service.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  Future<void> fetchCategories(String token) async {
    try {
      _categories = await ApiService.getCategories(token);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
