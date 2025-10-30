import 'package:flutter/material.dart';
import '../models/history.dart';
import '../services/api_service.dart';

class HistoryProvider extends ChangeNotifier {
  List<History> _history = [];

  List<History> get history => _history;

  Future<void> fetchHistory(String token) async {
    try {
      _history = await ApiService.getHistory(token);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
