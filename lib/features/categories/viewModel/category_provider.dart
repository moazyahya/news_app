import 'package:flutter/material.dart';
import 'package:news_app/features/categories/data/enums/category_enum.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryEnum? selectedCategory;

  setSelectedCategory(CategoryEnum category) {
    selectedCategory = category;
    notifyListeners();
  }

  emptyCategory() {
    selectedCategory = null;
    notifyListeners();
  }
}
