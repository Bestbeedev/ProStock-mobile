import 'package:flutter/material.dart';
import 'package:prostock/models/user.dart';
import 'api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool _isLoggedIn = false;
  String? _token;

  User? get user => _user;
  bool get isLoggedIn => _isLoggedIn;
  String? get token => _token;

  Future<void> login(String email, String password) async {
    _user = await ApiService.login(email, password);
    _isLoggedIn = true;
    _token = _user?.token;
    await _saveToken(_token);
    await fetchUserProfile();
    notifyListeners();
  }

  Future<void> register(String firstName, String lastName, String email, String password) async {
    _user = await ApiService.register(firstName, lastName, email, password);
    _isLoggedIn = true;
    _token = _user?.token;
    await _saveToken(_token);
    await fetchUserProfile();
    notifyListeners();
  }

  Future<void> logout() async {
    try {
      await ApiService.logout();
    } finally {
      _isLoggedIn = false;
      _user = null;
      _token = null;
      await _removeToken();
      notifyListeners();
    }
  }

  Future<void> fetchUserProfile() async {
    if (_token == null) return;

    try {
      _user = await ApiService.fetchUserProfile(_token!);
      notifyListeners();
    } catch (e) {
      await _removeToken();
      rethrow;
    }
  }

  Future<void> _saveToken(String? token) async {
    if (token == null) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<void> _removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('auth_token')) {
      return false;
    }

    _token = prefs.getString('auth_token');
    if (_token != null) {
      try {
        await fetchUserProfile();
        _isLoggedIn = true;
        notifyListeners();
        return true;
      } catch (e) {
        await _removeToken();
        return false;
      }
    }
    return false;
  }
}
