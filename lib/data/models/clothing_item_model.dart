class ClothingItemModel {
  final int? id;
  final int userId;
  final String name;
  final String category;
  final String? color;
  final String? imagePath;
  final DateTime createdAt;

  ClothingItemModel({
    this.id,
    required this.userId,
    required this.name,
    required this.category,
    this.color,
    this.imagePath,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'category': category,
      'color': color,
      'image_path': imagePath,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory ClothingItemModel.fromMap(Map<String, dynamic> map) {
    return ClothingItemModel(
      id: map['id'],
      userId: map['user_id'],
      name: map['name'],
      category: map['category'],
      color: map['color'],
      imagePath: map['image_path'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }
}