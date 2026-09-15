import 'package:flutter/foundation.dart';

import '../data/database/database_helper.dart';
import '../data/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  UserModel? _currentUser;
  bool _isLoading = false;

  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _currentUser != null;

  Future<bool> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final db = await _databaseHelper.database;

      final existingUsers = await db.query(
        'users',
        where: 'email = ?',
        whereArgs: [email.trim().toLowerCase()],
      );

      if (existingUsers.isNotEmpty) {
        return false;
      }

      final user = UserModel(
        name: name.trim(),
        email: email.trim().toLowerCase(),
        password: password,
        createdAt: DateTime.now(),
      );

      final id = await db.insert(
        'users',
        user.toMap(),
      );

      _currentUser = UserModel(
        id: id,
        name: user.name,
        email: user.email,
        password: user.password,
        createdAt: user.createdAt,
      );

      return true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final db = await _databaseHelper.database;

      final results = await db.query(
        'users',
        where: 'email = ? AND password = ?',
        whereArgs: [
          email.trim().toLowerCase(),
          password,
        ],
        limit: 1,
      );

      if (results.isEmpty) {
        return false;
      }

      _currentUser = UserModel.fromMap(results.first);

      return true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}