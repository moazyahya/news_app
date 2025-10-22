import 'package:flutter/material.dart';
import 'package:news_app/enums/category_enum.dart';

class categoryProvider extends ChangeNotifier {
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
