import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:cupboard/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesService extends ChangeNotifier {
  final String _baseUrl = 'localhost:5001';
  final List<Category> categories = [];
  bool isLoading = true;

  CategoriesService() {
    loadProducts();
  }

  Future<List<Category>> loadProducts() async {

    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'categories.json');
    final response = await http.get(url);

    final Map<String, dynamic> categoriesMap = json.decode(response.body);

    categoriesMap.forEach((key, value) {
      final tempCategory = Category.fromMap(value);
      tempCategory.idcategory = key;
      categories.add(tempCategory);
    });

    isLoading = false;
    notifyListeners();

    return categories;
  }
}
