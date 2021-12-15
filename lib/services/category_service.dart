import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:cupboard/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryService extends ChangeNotifier {

 final storage = const FlutterSecureStorage();
  final List<CategoryModel> categorylist = [];
  late CategoryModel selectedCategory;
  bool isLoading = true;
  bool isSaving  = false;

  CategoryService() {
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

  Future saveOrUpdateCategory(CategoryModel category) async {
    isSaving = true;
    notifyListeners();

    if(category.idcategory == null){
      await saveCategory(category);
    }else{
      await updateCategory(category);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String?> saveCategory(CategoryModel category) async {

    final url = Uri.parse('https://10.0.2.2:5001/api/Categories');
    final token = await storage.read(key: 'token');

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization' : 'Bearer $token'
    };

    final resp = await http.post(url, headers: requestHeaders, body: jsonEncode(category.toJson()));
    final decodeData = json.decode(resp.body);
    category.idcategory = decodeData['name'];

    categorylist.add(category);

    notifyListeners();
    return category.idcategory;

  }

  Future<String?> updateCategory(CategoryModel category) async {
    isSaving = true;

    final url = Uri.parse('https://10.0.2.2:5001/api/Categories/${category.idcategory}');
    final token = await storage.read(key: 'token');

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization' : 'Bearer $token'
    };
    
    await http.put(url, headers: requestHeaders, body: jsonEncode(category.toJson()),);
    

    final index = categorylist.indexWhere((element) => element.idcategory == category.idcategory);
    categorylist[index] = category;

    notifyListeners();
    isSaving = false;
    return category.idcategory;

  }

  Future<String> deleteCategory(String idcategory) async {
    final url = Uri.parse('https://10.0.2.2:5001/api/Categories/$idcategory');
    final token = await storage.read(key: 'token');

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization' : 'Bearer $token'
    };

    await http.delete(url, headers: requestHeaders);
    
    notifyListeners();
    categorylist.clear();
    loadCategories();
    return idcategory;
  }
}
