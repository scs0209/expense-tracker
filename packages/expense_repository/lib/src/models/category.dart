import 'package:flutter/material.dart';

import '../entities/category_entity.dart';

class Category {
  String categoryId;
  String name;
  int totalExpenses;
  int iconCodePoint;
  String iconFontFamily;
  int color;

  Category({
    required this.categoryId,
    required this.name,
    required this.totalExpenses,
    required this.iconCodePoint,
    required this.iconFontFamily,
    required this.color,
  });

  static final empty = Category(
    categoryId: '',
    name: "",
    totalExpenses: 0,
    iconCodePoint: Icons.person.codePoint,
    iconFontFamily: Icons.person.fontFamily!,
    color: 0,
  );

  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
      totalExpenses: totalExpenses,
      iconCodePoint: iconCodePoint,
      iconFontFamily: iconFontFamily,
      color: color,
    );
  }

  static Category fromEntity(CategoryEntity entity) {
    return Category(
      categoryId: entity.categoryId,
      name: entity.name,
      totalExpenses: entity.totalExpenses,
      iconCodePoint: entity.iconCodePoint,
      iconFontFamily: entity.iconFontFamily,
      color: entity.color,
    );
  }

  IconData get icon => IconData(iconCodePoint, fontFamily: iconFontFamily);
}
