import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;
  String? _token;

  User? get user => _user;
  String? get token => _token;

  bool get isAuthenticated => _user != null && _token != null;

  Future<void> login(String email, String password) async {
    try {
      final user = await ApiService.login(email, password);
      _user = user;
      _token =
          "<token récupéré côté backend>"; // tu peux gérer via stockage local si besoin
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    try {
      final user = await ApiService.register(
        firstName,
        lastName,
        email,
        password,
      );
      _user = user;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void logout() {
    _user = null;
    _token = null;
    notifyListeners();
  }
}
