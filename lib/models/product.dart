class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final int quantity;
  final String image;
  final DateTime createdAtStock;
  final int? lastModifiedBy;
  final DateTime lastModifiedAt;
  final int userId;
  final int categoryId;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.image,
    required this.createdAtStock,
    this.lastModifiedBy,
    required this.lastModifiedAt,
    required this.userId,
    required this.categoryId,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    price: (json['price'] as num).toDouble(),
    quantity: json['quantity'],
    image: json['image'],
    createdAtStock: DateTime.parse(json['createdAtStock']),
    lastModifiedBy: json['lastModifiedBy'],
    lastModifiedAt: DateTime.parse(json['lastModifiedAt']),
    userId: json['UserId'],
    categoryId: json['CategoryId'],
  );

  Product copyWith({
    int? id,
    String? title,
    String? description,
    double? price,
    int? quantity,
    String? image,
    DateTime? createdAtStock,
    int? lastModifiedBy,
    DateTime? lastModifiedAt,
    int? userId,
    int? categoryId,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      image: image ?? this.image,
      createdAtStock: createdAtStock ?? this.createdAtStock,
      lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
      lastModifiedAt: lastModifiedAt ?? this.lastModifiedAt,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
    );
  }
}
