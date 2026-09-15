import 'package:flutter/foundation.dart';

import '../data/database/database_helper.dart';
import '../data/models/clothing_item_model.dart';

class WardrobeProvider extends ChangeNotifier {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  List<ClothingItemModel> _items = [];
  bool _isLoading = false;

  List<ClothingItemModel> get items => _items;
  bool get isLoading => _isLoading;

  int get itemCount => _items.length;

  Future<void> loadItems(int userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final db = await _databaseHelper.database;

      final results = await db.query(
        'clothing_items',
        where: 'user_id = ?',
        whereArgs: [userId],
        orderBy: 'created_at DESC',
      );

      _items = results
          .map((map) => ClothingItemModel.fromMap(map))
          .toList();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addItem(
    ClothingItemModel item,
  ) async {
    final db = await _databaseHelper.database;

    final id = await db.insert(
      'clothing_items',
      item.toMap(),
    );

    _items.insert(
      0,
      ClothingItemModel(
        id: id,
        userId: item.userId,
        name: item.name,
        category: item.category,
        color: item.color,
        imagePath: item.imagePath,
        createdAt: item.createdAt,
      ),
    );

    notifyListeners();
  }

  Future<void> deleteItem(int id) async {
    final db = await _databaseHelper.database;

    await db.delete(
      'clothing_items',
      where: 'id = ?',
      whereArgs: [id],
    );

    _items.removeWhere(
      (item) => item.id == id,
    );

    notifyListeners();
  }
}