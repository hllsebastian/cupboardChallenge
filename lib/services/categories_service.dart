import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:cupboard/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoriesService extends ChangeNotifier {

 final storage = const FlutterSecureStorage();
  final List<CategoryModel> categorylist = [];
  late CategoryModel selectedCategory;
  bool isLoading = true;
  bool isSaving  = false;

  CategoriesService() {
    loadCategories();
  }

  Future<List<CategoryModel>> loadCategories() async {

    isLoading = true;
    notifyListeners();

    final url = Uri.parse('https://10.0.2.2:5001/api/Categories');
    final token = await storage.read(key: 'token');

    Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization' : 'Bearer $token'
    };

    http.Response resp = await http.get(url, headers: requestHeaders, );

    final List<dynamic> categoryMap = json.decode(resp.body);

    // ignore: avoid_function_literals_in_foreach_calls
    categoryMap.forEach((value) {
      final resCategori = CategoryModel.fromMap(value);
      //resCategori.idcategory = key;
      categorylist.add(resCategori);
    });

    isLoading = false;
    notifyListeners();

    return categorylist;
  }
}
