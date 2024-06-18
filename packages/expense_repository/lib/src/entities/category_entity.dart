class CategoryEntity {
  String categoryId;
  String name;
  int totalExpenses;
  int iconCodePoint;
  String iconFontFamily;
  String color;

  CategoryEntity({
    required this.categoryId,
    required this.name,
    required this.totalExpenses,
    required this.iconCodePoint,
    required this.iconFontFamily,
    required this.color,
  });

  Map<String, Object?> toDocument() {
    return {
      'categoryId': categoryId,
      'name': name,
      'totalExpenses': totalExpenses,
      'iconCodePoint': iconCodePoint,
      'iconFontFamily': iconFontFamily,
      'color': color,
    };
  }

  static CategoryEntity fromDocument(Map<String, dynamic> doc) {
    return CategoryEntity(
      categoryId: doc['categoryId'],
      name: doc['name'],
      totalExpenses: doc['totalExpenses'],
      iconCodePoint: doc['iconCodePoint'],
      iconFontFamily: doc['iconFontFamily'],
      color: doc['color'],
    );
  }
}
