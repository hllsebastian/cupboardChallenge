import 'dart:convert';
import 'package:cupboard/models/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier{

  final storage = const FlutterSecureStorage();
  final List<ProductsModel> productslist = [];
  late ProductsModel selectedProduct;
  bool isloading = true;
  bool isSaving = false;

  ProductService(){
    loadProduct();
  }

  Future<List<ProductsModel>> loadProduct()async{

    isloading = true;
    notifyListeners();

    final url = Uri.parse('https://10.0.2.2:5001/api/Products');
    final token = await storage.read(key: 'token');

    Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization' : 'Bearer $token'
    };
      
    http.Response resp = await http.get(url, headers: requestHeaders);

    final List<dynamic> productiMap = json.decode(resp.body);

    for (var value in productiMap) {
      final response = ProductsModel.fromMap(value);
      productslist.add(response);
    }

    isloading = false;
    notifyListeners();

    return productslist;

  }

  Future saveOrUpdateProduct(ProductsModel product) async {
    isSaving = true;
    notifyListeners();

    if(product.idProduct == null){
      await saveProduct(product);
    }else{
      updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String?> saveProduct(ProductsModel product) async {

    final url = Uri.parse('https://10.0.2.2:5001/api/Products');
    final token = await storage.read(key: 'token');

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization' : 'Bearer $token'
    };
    final resp = await http.post(url, headers: requestHeaders ,body: jsonEncode(product.toJson()));
    final respuesta = json.decode(resp.body);
    product.idProduct = respuesta['idProduct'];
    //print('respuesta product: $respuesta');

    productslist.add(product);

    notifyListeners();
    return product.idProduct;

  }

  Future<String?> updateProduct(ProductsModel product) async {

    final url = Uri.parse('https://10.0.2.2:5001/api/Products/${product.idProduct}');
    final token = await storage.read(key: 'token');

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization' : 'Bearer $token'
    };
    
   await http.put(url, headers: requestHeaders, body: jsonEncode(product.toJson()),);

    final index = productslist.indexWhere((element) => element.idProduct == product.idProduct);
    productslist[index] = product;

    productslist.clear();
    loadProduct();
    notifyListeners();
    return product.idProduct;

  }

  Future<String> deleteProduct(String idProduct) async {
    final url = Uri.parse('https://10.0.2.2:5001/api/Products/$idProduct');
    final token = await storage.read(key: 'token');

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization' : 'Bearer $token'
    };

    await http.delete(url, headers: requestHeaders);
    notifyListeners();
    productslist.clear();
    loadProduct();
    return idProduct;
  }
  
}