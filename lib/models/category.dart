class Category {
  final int id;
  final String title;
  final String description;
  final String? image;
  final bool isPublic;
  final int userId;

  Category({
    required this.id,
    required this.title,
    required this.description,
    this.image,
    required this.isPublic,
    required this.userId,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    image: json['image'],
    isPublic: json['isPublic'] ?? false,
    userId: json['UserId'],
  );
}
